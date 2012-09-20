Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TEYiI-0008Ed-KX
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 06:50:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8K4bQ6V004278
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Sep 2012 21:37:27 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 19 Sep 2012 21:37:26 -0700
Message-ID: <505A9D84.5070501@windriver.com>
Date: Thu, 20 Sep 2012 12:37:24 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1345431102.git.wenzong.fan@windriver.com>
	<5a92968e29ead46bff1edf963d1f9cef3732e8b1.1345431102.git.wenzong.fan@windriver.com>
	<50365A14.4050601@linux.intel.com>
In-Reply-To: <50365A14.4050601@linux.intel.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] coreutils: fix do_configure error with long TMPDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Sep 2012 04:50:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/24/2012 12:28 AM, Saul Wold wrote:
> On 08/19/2012 07:55 PM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> By default the 'm4/*' files will be extended with absolute path while
>> autoreconf running, if the length of TMPDIR is too long such as 410
>> which is the maximum value allowed by 'sanity.bbclass', autoreconf
>> will fail with error:
>>
>>      Can't exec "/bin/sh": Argument list too long ...
>>
>> Fix this issue by specific the 'acpaths' to '-I ./m4'.
>>
>> [YOCTO #2766]
>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>>   meta/recipes-core/coreutils/coreutils_8.14.bb |    4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb
>> b/meta/recipes-core/coreutils/coreutils_8.14.bb
>> index 9a714a9..c7c8e13 100644
>> --- a/meta/recipes-core/coreutils/coreutils_8.14.bb
>> +++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
>> @@ -7,7 +7,7 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
>>   LICENSE = "GPLv3+"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
>>
>> file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
>> -PR = "r5"
>> +PR = "r6"
>>   DEPENDS = "gmp libcap"
>>   DEPENDS_virtclass-native = ""
>>
>> @@ -36,6 +36,8 @@ base_bindir_progs = "cat chgrp chmod chown cp date dd echo
>> false kill ln ls mkdi
>>
>>   sbindir_progs= "chroot"
>>
>> +acpaths = "-I ./m4"
>> +
> This is a poor work-around to the problem, and does not give any idea as to what
> your fixing.  Please investigate a proper fix not just a work-around.
>

Hi Saul,

This is because the aclocal's argument list is very long when building
coreutils, it has many arguments (378 m4 files under 'coreutils-8.14/m4'),
when the length of the TMPDIR is short this is OK, but when it is longer,
there would be a argument list too long error.

I think that we have two solutions to fix this problem:
1) Make aclocal accept longer arguments, unfortunately, the native aclocal is
    running on the host, the length of the argument depends on the host's kernel
    (The ARG_MAX which is defined in '/usr/include/linux/limits.h'), so this way
    doesn't work.

2) Make coreutils' acpaths shorter, this is what this patch does, it changes the
    absolute path to the relative path, so it doesn't care the length of the
    TMPDIR anymore.

// Robert

> Thanks
>      Sau!
>
>>   do_install_append() {
>>       for i in df mktemp base64; do mv ${D}${bindir}/$i
>> ${D}${bindir}/$i.${BPN}; done
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


