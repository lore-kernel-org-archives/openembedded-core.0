Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E22C6DF9D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2013 01:29:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB61TnJ7007342
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Dec 2013 17:29:49 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 5 Dec 2013 17:29:49 -0800
Message-ID: <52A128B8.9050300@windriver.com>
Date: Fri, 6 Dec 2013 09:30:32 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1386232830.git.Qi.Chen@windriver.com>
	<f728bc59095fc51372c8771356ca7fef2ed71bb5.1386232830.git.Qi.Chen@windriver.com>
	<52A1011A.8080809@linux.intel.com>
In-Reply-To: <52A1011A.8080809@linux.intel.com>
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libgcrypt: fix compile error with '-O2' in sysroot path
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
X-List-Received-Date: Fri, 06 Dec 2013 01:29:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2013 06:41 AM, Saul Wold wrote:
> On 12/05/2013 12:55 AM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Characters like '-O2' or '-Ofast' will be replaced by '-O1' when
>> compiling cipher. If we are cross compiling libgcrypt and sysroot
>> contains such characters, we would get compile errors because the
>> sysroot path has been modified.
>>
>> Fix this by adding whitespaces before and after the original matching
>> pattern in the sed command.
>>
>> [YOCTO #5628]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   ...fix-compile-error-with-O2-in-sysroot-path.patch |   46 
>> ++++++++++++++++++++
>>   meta/recipes-support/libgcrypt/libgcrypt.inc       |    3 +-
>>   2 files changed, 48 insertions(+), 1 deletion(-)
>>   create mode 100644 
>> meta/recipes-support/libgcrypt/files/fix-compile-error-with-O2-in-sysroot-path.patch
>>
>> diff --git 
>> a/meta/recipes-support/libgcrypt/files/fix-compile-error-with-O2-in-sysroot-path.patch 
>> b/meta/recipes-support/libgcrypt/files/fix-compile-error-with-O2-in-sysroot-path.patch 
>>
>> new file mode 100644
>> index 0000000..6b1f119
>> --- /dev/null
>> +++ 
>> b/meta/recipes-support/libgcrypt/files/fix-compile-error-with-O2-in-sysroot-path.patch
>> @@ -0,0 +1,46 @@
>> +Upstream-Status: Pending
>> +
>> +libgcrypt: fix building error with '-O2' in sysroot path
>> +
>> +Characters like '-O2' or '-Ofast' will be replaced by '-O1' when 
>> compiling cipher.
>> +If we are cross compiling libgcrypt and sysroot contains such 
>> characters, we would
>> +get compile errors because the sysroot path has been modified.
>> +
>> +Fix this by adding blank spaces before and after the original 
>> matching pattern in the
>> +sed command.
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + cipher/Makefile.am |    2 +-
>> + cipher/Makefile.in |    2 +-
>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/cipher/Makefile.am b/cipher/Makefile.am
>> +index 76cdc96..9a89792 100644
>> +--- a/cipher/Makefile.am
>> ++++ b/cipher/Makefile.am
>> +@@ -69,7 +69,7 @@ rfc2268.c \
>> + camellia.c camellia.h camellia-glue.c
>> +
>> + if ENABLE_O_FLAG_MUNGING
>> +-o_flag_munging = sed -e 's/-O\([2-9s][2-9s]*\)/-O1/' -e 
>> 's/-Ofast/-O1/g'
>> ++o_flag_munging = sed -e 's/ -O\([2-9s][2-9s]*\) / -O1 /' -e 's/ 
>> -Ofast / -O1 /g'
>> + else
>> + o_flag_munging = cat
>> + endif
>> +diff --git a/cipher/Makefile.in b/cipher/Makefile.in
>> +index 1394d15..6080d59 100644
>> +--- a/cipher/Makefile.in
>> ++++ b/cipher/Makefile.in
>
> Why do we need to patch Makefile.in if we are already patching the 
> Makefile.am which will re-generate the Makefile.in
>
> Sau!
>

I thought it would do no harm. And I will send this patch to upstream, 
so it might be a little strange that I only modify the Makefile.am file 
even if Makefile.in has the same problem.

Best Regards,
Chen Qi

>> +@@ -314,7 +314,7 @@ rfc2268.c \
>> + camellia.c camellia.h camellia-glue.c
>> +
>> + @ENABLE_O_FLAG_MUNGING_FALSE@o_flag_munging = cat
>> +-@ENABLE_O_FLAG_MUNGING_TRUE@o_flag_munging = sed -e 
>> 's/-O\([2-9s][2-9s]*\)/-O1/' -e 's/-Ofast/-O1/g'
>> ++@ENABLE_O_FLAG_MUNGING_TRUE@o_flag_munging = sed -e 's/ 
>> -O\([2-9s][2-9s]*\) / -O1 /' -e 's/ -Ofast / -O1 /g'
>> + all: all-am
>> +
>> + .SUFFIXES:
>> +--
>> +1.7.9.5
>> +
>> diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc 
>> b/meta/recipes-support/libgcrypt/libgcrypt.inc
>> index e0dfec2..9383e17 100644
>> --- a/meta/recipes-support/libgcrypt/libgcrypt.inc
>> +++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
>> @@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>>   DEPENDS = "libgpg-error libcap"
>>
>>   SRC_URI = 
>> "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
>> -           file://add-pkgconfig-support.patch"
>> +           file://add-pkgconfig-support.patch \
>> + file://fix-compile-error-with-O2-in-sysroot-path.patch"
>>
>>   inherit autotools binconfig pkgconfig
>>
>>
>
>


