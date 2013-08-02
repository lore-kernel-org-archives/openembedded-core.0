Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF9F6B0D8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:47:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r72FlOtp007073
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Aug 2013 08:47:25 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Fri, 2 Aug 2013 08:47:24 -0700
Message-ID: <51FBD48C.9080209@windriver.com>
Date: Fri, 2 Aug 2013 10:47:24 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CALaXJ9nQCTk==sDA2UySBBwRd_g_gqvO0F=_r7gK14gQE-rKwQ@mail.gmail.com>
	<loom.20130726T142233-407@post.gmane.org>
	<20130726135617.GA17824@lpalcu-linux>
	<89483D19B008F748B6F04D85F328657A0EE1E1D1@039-SN1MPN1-002.039d.mgd.msft.net>
In-Reply-To: <89483D19B008F748B6F04D85F328657A0EE1E1D1@039-SN1MPN1-002.039d.mgd.msft.net>
Subject: Re: Issue of Yocto multilib sdk
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
X-List-Received-Date: Fri, 02 Aug 2013 15:47:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/2/13 5:10 AM, Sardan Alexandru Cezar-B41700 wrote:
>>
>> There could be several issues here:
>> 1. default library path for 64bit is wrong... You can inspect it by
>> looking at SEARCH_DIR in the linker script. Just run:
>>
>> $CC -o mytest -Wl,-verbose mytest.c
>>
>> Then you can try to set the library path explicitly with -L. See if it
>> works.
>>
>> 2. you don't have the 64bit libraries and it falls back to looking into
>> /lib or /usr/lib which contain the 32bit libraries...
>>
>> Do you have any lib64/ usr/lib64/ in your target sysroot?
>>
>
> [Alex Sardan] Yes, it seems that the 64bit libraries are not being
> installed in the sysroot.
> What is the right way of adding them? I tried adding libgcc to
> MULTILIB_IMAGE_INSTALL but it doesn't do the trick.

By default all libraries end up in 'lib' (no suffix).  When you enable the 
multilib support, the lib directory depends on the multilib you are compiling 
(and installing).

i.e.:
MACHINE = "<some 64bit ppc capable machine>"

require conf/multilib.conf
DEFAULTTUNE = "ppc"
MULTILIBS = "multilib:lib64"
DEFAULTTUNE_virtclass-multilib-lib64 = "ppc64"


If you enable the multilib support, and then build with:

bitbake lib64-core-image-minimal  -- you should see an all 'lib64' 
core-image-minimal (assuming lib64 is your alternative library name)

IMAGE_INSTALL_append = " lib64-bash"

Should switch bash to being the 64-bit version, and install all of the necessary 
libraries -- in addition to the 32-bit items being default.

--Mark

> Thanks,
> Alex
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


