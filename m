Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40C8A7C2DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 02:06:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3F266B4024886
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 14 Apr 2019 19:06:16 -0700
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 14 Apr 2019 19:05:55 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1555039677-16701-1-git-send-email-mingli.yu@windriver.com>
	<23562ca03db97ef41bbb2e6365ecde4bd715438d.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CB3E821.8000102@windriver.com>
Date: Mon, 15 Apr 2019 10:10:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <23562ca03db97ef41bbb2e6365ecde4bd715438d.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.194]
Subject: Re: [PATCH] nettle: fix ptest failure
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
X-List-Received-Date: Mon, 15 Apr 2019 02:06:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年04月13日 05:57, Richard Purdie wrote:
> On Fri, 2019-04-12 at 11:27 +0800, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> Remove dlopen-test.patch which originally used
>> to fix the test dlopen-test, but autually the
>> patch didn't resolve the issue as dlopen-test.patch
>> supposes the file /usr/lib/libnettle.so exists.
>> Instead deploy ${D}${PTEST_PATH}/libnettle.so to
>> fix the dlopen-test failure.
>>
>> Update the initialization for the salt to fix
>> below Segmentation fault and also nettle-pbkdf2-test
>> failure.
>>   # echo -n passwd| nettle-pbkdf2 -i 1 -l 16 salt
>>   [65534.886509] nettle-pbkdf2[708]: segfault at 1f594260 ip
>> 00007f3332256998 sp 00007fff60d44410 error 4 in
>> libnettle.so.6.5[7f3332244000+1d00]
>>   [65534.887525] Code: e8 6d db fe ff 44 01 6d 68 48 83 c4 08 5b 5d 41
>> 5c 41 5d 41 5e 41 5f c3 66 2e 0f 1f 84 00 00 00 00 00 49 89 dc e9 68
>> ff f
>>   Segmentation fault
>>
>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>> ---
>>   ...kdf2.c-change-the-initialization-for-salt.patch | 39
>> ++++++++++++++++++++++
>>   .../nettle/nettle-3.4.1/dlopen-test.patch          | 20 -----------
>>   meta/recipes-support/nettle/nettle_3.4.1.bb        |  9 ++---
>>   3 files changed, 44 insertions(+), 24 deletions(-)
>>   create mode 100644 meta/recipes-support/nettle/nettle-3.4.1/0001-
>> nettle-pbkdf2.c-change-the-initialization-for-salt.patch
>>   delete mode 100644 meta/recipes-support/nettle/nettle-3.4.1/dlopen-
>> test.patch
>>
>> diff --git a/meta/recipes-support/nettle/nettle-3.4.1/0001-nettle-
>> pbkdf2.c-change-the-initialization-for-salt.patch b/meta/recipes-
>> support/nettle/nettle-3.4.1/0001-nettle-pbkdf2.c-change-the-
>> initialization-for-salt.patch
>> new file mode 100644
>> index 0000000..713823e
>> --- /dev/null
>> +++ b/meta/recipes-support/nettle/nettle-3.4.1/0001-nettle-pbkdf2.c-
>> change-the-initialization-for-salt.patch
>> @@ -0,0 +1,39 @@
>> +From 7510ee2877368464ecce7de515ce056e08c75245 Mon Sep 17 00:00:00
>> 2001
>> +From: Mingli Yu <Mingli.Yu@windriver.com>
>> +Date: Fri, 12 Apr 2019 10:30:14 +0800
>> +Subject: [PATCH] nettle-pbkdf2.c: change the initialization for salt
>> +
>> +use malloc and strncpy altogether to replace
>> +strdup for salt initialization to fix below
>> +Segmentation fault:
>> + # echo -n passwd| nettle-pbkdf2 -i 1 -l 16 salt
>> + [65534.886509] nettle-pbkdf2[708]: segfault at 1f594260 ip
>> 00007f3332256998 sp 00007fff60d44410 error 4 in
>> libnettle.so.6.5[7f3332244000+1d00]
>> + [65534.887525] Code: e8 6d db fe ff 44 01 6d 68 48 83 c4 08 5b 5d
>> 41 5c 41 5d 41 5e 41 5f c3 66 2e 0f 1f 84 00 00 00 00 00 49 89 dc e9
>> 68 ff f
>> + Segmentation fault
>> +
>> +Upstream-Status: Submitted[
>> http://lists.lysator.liu.se/pipermail/nettle-bugs/2019/007467.html]
>> +
>> +Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>> +---
>> + tools/nettle-pbkdf2.c | 5 ++++-
>> + 1 file changed, 4 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/tools/nettle-pbkdf2.c b/tools/nettle-pbkdf2.c
>> +index 1f0a301..000acd3 100644
>> +--- a/tools/nettle-pbkdf2.c
>> ++++ b/tools/nettle-pbkdf2.c
>> +@@ -141,7 +141,10 @@ main (int argc, char **argv)
>> +       return EXIT_FAILURE;
>> +     }
>> +
>> +-  salt = strdup (argv[0]);
>> ++  salt = malloc (strlen(argv[0]) + 1);
>> ++  if (! salt)
>> ++     die ("Failed to allocate memory for salt\n");
>> ++  strncpy(salt, argv[0], sizeof(salt) - 1);
>> +   salt_length = strlen(argv[0]);
>> +
>> +   if (hex_salt)
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-support/nettle/nettle-3.4.1/dlopen-
>> test.patch b/meta/recipes-support/nettle/nettle-3.4.1/dlopen-
>> test.patch
>> deleted file mode 100644
>> index c4f0b7e..0000000
>> --- a/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -Replace relative path of libnettle.so with absolute path so the test
>> -program can find it.
>> -Relative paths are not suitable, as the folder strucure for ptest
>> -is different from the one expected by the nettle testsuite.
>> -
>> -Upstream-Status: Inappropriate [embedded specific]
>> -
>> -Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>> -
>> ---- a/testsuite/dlopen-test.c	2016-10-01 00:28:38.000000000
>> -0700
>> -+++ b/testsuite/dlopen-test.c	2017-10-13 11:08:57.227572860
>> -0700
>> -@@ -9,7 +9,7 @@
>> - main (int argc UNUSED, char **argv UNUSED)
>> - {
>> - #if HAVE_LIBDL
>> --  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
>> -+  void *handle = dlopen ("/usr/lib/libnettle.so", RTLD_NOW);
>> -   int (*get_version)(void);
>> -   if (!handle)
>> -     {
>> diff --git a/meta/recipes-support/nettle/nettle_3.4.1.bb
>> b/meta/recipes-support/nettle/nettle_3.4.1.bb
>> index dd49c30..612e058 100644
>> --- a/meta/recipes-support/nettle/nettle_3.4.1.bb
>> +++ b/meta/recipes-support/nettle/nettle_3.4.1.bb
>> @@ -14,12 +14,9 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
>>              file://Add-target-to-only-build-tests-not-run-them.patch
>> \
>>              file://run-ptest \
>>              file://check-header-files-of-openssl-only-if-
>> enable_.patch \
>> +           file://0001-nettle-pbkdf2.c-change-the-initialization-
>> for-salt.patch \
>>              "
>>
>> -SRC_URI_append_class-target = "\
>> -            file://dlopen-test.patch \
>> -            "
>> -
>>   SRC_URI[md5sum] = "9bdebb0e2f638d3b9d91f7fc264b70c1"
>>   SRC_URI[sha256sum] =
>> "f941cf1535cd5d1819be5ccae5babef01f6db611f9b5a777bae9c7604b8a92ad"
>>
>> @@ -47,6 +44,10 @@ do_install_ptest() {
>>           # tools can be found in PATH, not in ../tools/
>>           sed -i -e 's|../tools/||' ${D}${PTEST_PATH}/testsuite/*-test
>>           install ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
>> +        # libnettle.so is needed for dlopen-test
>> +        if [ -f ${D}${libdir}/libnettle.so.6.* ]; then
>> +            cp ${D}${libdir}/libnettle.so.6.*
>> ${D}${PTEST_PATH}/libnettle.so
>> +        fi
>>   }
>>
>>   BBCLASSEXTEND = "native nativesdk"
>
> This commit has multiple issues. Firstly upstream rejected the patch.

Hi RP,

This patch actually contains two parts to fix two ptest issues 
respectively, the one which is rejected by upstream is used to fix 
Segmentation fault. Anyway, I will check the upstream comments to find 
better solution.

> Secondly adding in this library like this has caused nettle-ptest to
> provide the SONAME which then led to nettle-ptest being included in

And another has added ${D}${PTEST_PATH}/libnettle.so for nettle-ptest to 
fix the below ptest issue. Anyway, I will look into it.
| dlopen failed: ../libnettle.so: cannot open shared object file: No 
such file or directory
| ./run-ptest: line 8:  7607 Aborted                 "./$f"
| FAIL: dlopen-test

> various images, e.g.:
>
> http://git.yoctoproject.org/cgit.cgi/poky-buildhistory/tree/images/qemux86/glibc/core-image-sato/installed-package-names.txt?h=poky/warrior/qemux86#n604
>
> which then led to nettle being spread all over the 2.7 rc1 QA report:
>
> https://autobuilder.yocto.io/pub/releases/yocto-2.7.rc1/testresults/testresult-report.txt
>
> I'm going to revert this.
>
> Cheers,
>
> Richard
>
>

