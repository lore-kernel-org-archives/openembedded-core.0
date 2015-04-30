Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EE6B16AC38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 05:43:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3U5hSH2023799
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Apr 2015 22:43:28 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 29 Apr 2015 22:43:28 -0700
Message-ID: <5541C0FE.1000706@windriver.com>
Date: Thu, 30 Apr 2015 13:43:26 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1427262046.git.liezhi.yang@windriver.com>	
	<78a8e0beb1dd78a8461b994816267ec8848b2ca7.1427262046.git.liezhi.yang@windriver.com>
	<1429601943.26983.74.camel@linuxfoundation.org>
In-Reply-To: <1429601943.26983.74.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libarchive: set CLEANBROKEN
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
X-List-Received-Date: Thu, 30 Apr 2015 05:43:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/21/2015 03:39 PM, Richard Purdie wrote:
> On Tue, 2015-03-24 at 22:41 -0700, Robert Yang wrote:
>> Errors when rebuild:
>> checking for xml2-config... /path/to/tmp/sysroots/qemux86-64/usr/bin/crossscripts/xml2-config
>> checking for xmlInitParser in -lxml2... no
>> configure: error: in `/path/to/tmp/work/core2-64-poky-linux/libarchive/3.1.2-r0/libarchive-3.1.2':
>> configure: error: Missing xml2 library
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../libarchive/libarchive_3.1.2.bb                 |    2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
>> index 96e2d50..2ac8c5e 100644
>> --- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
>> +++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
>> @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b4e3ffd607d6686c6cb2f63394370841"
>>
>>   DEPENDS = "e2fsprogs-native"
>>
>> +CLEANBROKEN = "1"
>> +
>>   PACKAGECONFIG ?= "libxml2 zlib bz2"
>>
>>   PACKAGECONFIG_append_class-target = "\
>
> I just looked into this I will explain why this worries me. We patch
> libarchive to remove the reference to xml2-config in SRC_URI. For this
> error to appear, the patch must have been removed.
>
> The question is therefore why does it get removed and why isn't that an
> error? Does the CVE patch get removed too?
>
> FWIW, "bitbake libarchive -c configure -f" does not reproduce the error
> and the clean broken is therefore a workaround/hack.
>
> Actually, I just found what does break it is "bitbake libarchive -C
> unpack". Why? Running "make clean" triggers configure to run again since
> after unpack, the configure timestamp is more recent that config.status.
>
> So to fix this, we just need to touch config.status (if it exists)
> before running make clean. We should probably do this in the autotools
> class.

Hi RP,

When the error happens, more than one do_patch and do_configure runs nearly
at the same time:

$ ls -lt ../temp/log.do_patch* --full-time
lrwxrwxrwx 1 lyang1 users   17 2015-04-29 19:43:45.654157649 -0700 
../temp/log.do_patch -> log.do_patch.9045
-rw-r--r-- 1 lyang1 users 2867 2015-04-29 19:43:45.614157776 -0700 
../temp/log.do_patch.22016
-rw-r--r-- 1 lyang1 users 4324 2015-04-29 19:43:45.386158500 -0700 
../temp/log.do_patch.9045
-rw-r--r-- 1 lyang1 users 2867 2015-04-29 19:43:45.378158526 -0700 
../temp/log.do_patch.13113

$ ls -lt ../temp/log.do_configure* --full-time
-rw-r--r-- 1 lyang1 users 15114 2015-04-29 19:43:45.670157600 -0700 
../temp/log.do_configure.30582
lrwxrwxrwx 1 lyang1 users    22 2015-04-29 19:43:45.630157725 -0700 
../temp/log.do_configure -> log.do_configure.30582
-rw-r--r-- 1 lyang1 users 16397 2015-04-29 19:43:45.626157739 -0700 
../temp/log.do_configure.22478
-rw-r--r-- 1 lyang1 users 27431 2015-04-29 19:43:45.614157776 -0700 
../temp/log.do_configure.8960
-rw-r--r-- 1 lyang1 users 25954 2015-04-29 19:43:45.502158132 -0700 
../temp/log.do_configure.15184
-rw-r--r-- 1 lyang1 users 25014 2015-04-29 19:43:45.434158347 -0700 
../temp/log.do_configure.1545
-rw-r--r-- 1 lyang1 users 16396 2015-04-29 19:43:45.294158792 -0700 
../temp/log.do_configure.9513

do you have any suggestions, please ?

// Robert

>
> Cheers,
>
> Richard
>
>
>
>
>

