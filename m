Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E36756FFCE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 09:22:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0J9Mqth012582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 19 Jan 2016 01:22:52 -0800
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jan 2016 01:22:51 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1452152689.git.liezhi.yang@windriver.com>
	<40d0365cec15c63a1f77e9aa43fb4022f62e0f66.1452152689.git.liezhi.yang@windriver.com>
	<1452164226.7598.108.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <569E006A.6010009@windriver.com>
Date: Tue, 19 Jan 2016 17:22:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452164226.7598.108.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/3] run-postinsts: can't be allarch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jan 2016 09:22:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/07/2016 06:57 PM, Richard Purdie wrote:
> On Wed, 2016-01-06 at 23:45 -0800, Robert Yang wrote:
>> The dependencies chain:
>> run-postinsts -> update-rc.d.bbclass -> initscripts -> update
>> -alternatives.
>>
>> The update-alternatives is provided by opkg-utils which is not
>> allarch.
>>
>> This caused a problem:
>> $ bitbake lib32-core-image-minimal
>>
>> Both lib32-opkg-utils and opkg-utils would be built, but opkg-utils
>> shouldn't, this patch can fix the problem.
>>
>> [YOCTO #8879]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../run-postinsts/run-postinsts_1.0.bb             |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> Removing allarch isn't the correct way to fix this, we need to figure
> out what is going wrong and fix multilib.

After more investigations, it seems that there is no easy way to fix
the problem, maybe we need choose not fix it atm. Here is a short summary.

* Problem
   When mutilib is enabled, for example:
   MACHINE ?= "qemux86-64"
   require conf/multilib.conf
   MULTILIBS = "multilib:lib32"
   DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

   $ bitbake core-image-minimal

   We will see that a few 64 bit pkgs will be built, for example, 64 bit
   python, bash, openssl, opkg-utils and, but they shouldn't, since it
   doesn't make any sense to build them since they are not going to be
   installed on the target by default.

* Root Cause
   This is caused by run-postinsts is allarch since:
   $ bitbake lib32-run-postinsts
   run-postinsts (no lib32 since it is an allarch pkg) would be built,
   it depends on non-allarch recipe opkg-utils, and opkg-utils depends
   on others, a simple graph.

   core-image-minimal       ->  run-postinsts           -> opkg-utils
   lib32-core-image-minimal ->  (lib32-)run-postinsts   -> opkg-utils (should be 
lib32)

   We can see that lib32-run-postinsts breaks multilib's dependencies chain,
   and there is no easy way fix the problem AFAIK.

* What I have tried
   - Extend allarch to lib32-allarch, this would changed a lot on allarch,
     and if we extend it, allarch is not really "all arch".

   - Let each recipe provides a lib32allarch-recipe when extend multilib,
     which is used for allarch recipe depends on it, and let bitbake decide
     which to run for example:

     opkg-utils        *provides* lib32allarch-opkg-utils
     lib32-opkg-utils  *provides* lib32allarch-opkg-utils
     And then:
     run-postinsts     *depends*  lib32allarch-opkg-utils

     Both opkg-utils and lib32-opkg-utils provides lib32allarch-opkg-utils,
     then let bitbake choose a proper to build according what you are building,
     (lib32-recipe -> lib32-opkg-utils, recipe -> opkg-utils) this also
     need modify bitbake's PREFERRENCE_PROVIDER policies, which seems not worth,
     so I drop this idea.

Any suggestions is appreciated.

// Robert

>
> Cheers,
>
> Richard
>

