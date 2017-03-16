Return-Path: <aborduno@cisco.com>
X-Greylist: delayed 575 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Mar 2017 15:17:13 UTC
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
	by mail.openembedded.org (Postfix) with ESMTP id 54CC77768A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3388; q=dns/txt; s=iport;
	t=1489677436; x=1490887036;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=ExjxrDQ2Wx9jSbTHzLEtKoBz03YI4BEwWTwkg9LwhTY=;
	b=WiHhb7hUng7ei6bgLmbuuOK8xYocgXQBk0zdEuMkmqEN33VdAg5NWo28
	ntMeeLx/eHmcJyIujdAzVLBKIGkvNtPYTc6qsyY22RpsqmiSXroQ1Q+AH
	wJKsJYteWqPDJlOIzRE7A4gISWLbsuLVqb/NO6mAgFG1zAHm6JJ4UPA4+ 4=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0C7AQB3qcpY/40NJK1eGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBg1GBC2CDYYoPkViQaoJGgg+CDoYiAoMGPxgBAgEBAQEBAQFrKIU?=
	=?us-ascii?q?WAQUjFUEQCxgCAiYCAlcGAQwGAgEBiW8NsQiCJopSAQEBAQEBAQEBAQEBAQEBA?=
	=?us-ascii?q?QEhgQuFQ4IFgmqHWoJfAQScRYogBYgZgXuFKIoGSI5jhCIfOIEEOR8VQYUNgUw?=
	=?us-ascii?q?+NYlIAQEB?=
X-IronPort-AV: E=Sophos;i="5.36,173,1486425600"; d="scan'208";a="210784915"
Received: from alln-core-8.cisco.com ([173.36.13.141])
	by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	16 Mar 2017 15:07:39 +0000
Received: from kbp1-dhp-f50810.synapse.com ([10.24.126.223])
	(authenticated bits=0)
	by alln-core-8.cisco.com (8.14.5/8.14.5) with ESMTP id v2GF7Z0m026549
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Thu, 16 Mar 2017 15:07:38 GMT
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1476118955-12401-1-git-send-email-aborduno@cisco.com>
	<1479293265.28508.4.camel@linuxfoundation.org>
From: Andrii Bordunov <aborduno@cisco.com>
Message-ID: <6897ef62-b48d-ca6d-dc03-41d3467bc91a@cisco.com>
Date: Thu, 16 Mar 2017 17:07:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1479293265.28508.4.camel@linuxfoundation.org>
X-Authenticated-User: aborduno
Subject: Re: [PATCH] package.bbclass: allow using EXCLUDE_FROM_SHLIBS for subpackages
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
X-List-Received-Date: Thu, 16 Mar 2017 15:17:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

Sorry, my Python knowledge is quite basic. I'm sure it's possible to 
have a (global?) EXCLUDE_FROM_SHLIBS list holding subpackage names, but 
how it could lead to performance improvement? It would also need some 
check for every subpackage.
Could you please give more details?
And what do you mean under "all packages"? The intent is like opposite, 
to split package operations, not to gather.

As for False parameter to getVar, OK, I just used existing 
EXCLUDE_FROM_SHLIBS example (seems fixed now).

In the meantime tried to make a quick and dirty profiling like following:

   bitbake -c package glibc
   bitbake -c clean glibc
   python -m cProfile -s cumtime /mnt/src/oe/distro/bitbake/bin/bitbake 
-c package glibc > result.txt

Result is below. If got it right, there are 3833 getVar calls with total 
time 0.025 second (including subcalls).
This gives ~6.5 microsecond duration of one call (incl subcalls). Not a lot.
This is only a partial rebuild of one package of course.
Also tried to do all of this with and without my patch, but getVar calls 
number stays exactly the same (w/o modifying glibc recipe, but anyway).

   NOTE: Tasks Summary: Attempted 314 tasks of which 314 didn't need to 
be rerun and all succeeded.
            672869 function calls (667640 primitive calls) in 12.912 seconds
      Ordered by: cumulative time
      ncalls  tottime  percall  cumtime  percall filename:lineno(function)
           1    0.001    0.001   12.913   12.913 bitbake:25(<module>)
           1    0.001    0.001   12.082   12.082 main.py:320(bitbake_main)
           1    0.005    0.005   11.494   11.494 knotty.py:253(main)
         250   11.476    0.046   11.476    0.046 {method 'poll' of 
'_multiprocessing.Connection' objects}
   ...
   4481/4046    0.007    0.000    0.026    0.000 
data_smart.py:666(getVarFlag)
   ...
   3833/3719    0.002    0.000    0.025    0.000 data_smart.py:569(getVar)
   ...
        1338    0.002    0.000    0.003    0.000 
data_smart.py:805(getVarFlags)



Thank you,
Andrii

On 16.11.16 12:47, Richard Purdie wrote:
> On Mon, 2016-10-10 at 20:02 +0300, Andrii Bordunov wrote:
>> Some packages containing shared libraries might be registered
>> as shlib providers when they shouldn't (for example, the lib is for
>> their private use and must not generate any dependency).
>>
>> EXCLUDE_FROM_SHLIBS is targeted at that, but it could be set
>> for entire recipe only.
>>
>> This patch expands EXCLUDE_FROM_SHLIBS usage, so now it's possible
>> to set it in a style similar with RDEPENDS. For example:
>>  EXCLUDE_FROM_SHLIBS_${PN}-ptest = "1"
>>
>> Signed-off-by: Andrii Bordunov <aborduno@cisco.com>
>> ---
>>  meta/classes/package.bbclass | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> My main concern here is actually performance. For a package with many
> sub packages you just added many calls to getVar when that getVar is
> extremely unlikely to find any value. Whilst not hugely slow, that
> operation isn't trivial and hard to fix later.
>
> I'm wondering if we could support the syntax
>
> EXCLUDE_FROM_SHLIBS = "${PN}-ptest"
>
> and then have "1", used in a couple of places as the special value to
> mean all packages?
>
> Also please use False, not 0 as the parameter to getVar.
>
> Cheers,
>
> Richard
>

