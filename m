Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FE687D8F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 07:53:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3F7riYS003341
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Apr 2019 00:53:44 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 15 Apr 2019 00:53:44 -0700
To: Armin Kuster <akuster808@gmail.com>,
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
References: <1546725901-3285-1-git-send-email-akuster808@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CB439A4.4050607@windriver.com>
Date: Mon, 15 Apr 2019 15:58:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1546725901-3285-1-git-send-email-akuster808@gmail.com>
X-Originating-IP: [128.224.162.194]
Subject: Re: [v2][PATCH] nettle: update to 3.4.1
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
X-List-Received-Date: Mon, 15 Apr 2019 07:53:45 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年01月06日 06:05, Armin Kuster wrote:
> Bug fix only release
>
> Include:
>
>    CVE-2018-16868 gnutls: Bleichenbacher-like side channel leakage in
>    PKCS#1 1.5 verification and padding oracle verification
>
>    CVE-2018-16869 nettle: Leaky data conversion exposing a manager oracle
>
> For full details see:
> http://lists.lysator.liu.se/pipermail/nettle-bugs/2018/007369.html
>
> [V2]
> Add -std=c99 to cflags

When -std=c99 explicitly via cflags, there comes below Segmentation 
fault in runtime.
# echo -n passwd| nettle-pbkdf2 -i 1 -l 16 salt
[65534.886509] nettle-pbkdf2[708]: segfault at 1f594260 ip 
00007f3332256998 sp 00007fff60d44410 error 4 in 
libnettle.so.6.5[7f3332244000+1d00]
[65534.887525] Code: e8 6d db fe ff 44 01 6d 68 48 83 c4 08 5b 5d 41 5c 
41 5d 41 5e 41 5f c3 66 2e 0f 1f 84 00 00 00 00 00 49 89 dc e9 68 ff f
Segmentation fault

# echo -n passwd > /tmp/passwd
# gdb nettle-pbkdf2
GNU gdb (GDB) 8.2.1
Copyright (C) 2018 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later 
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-wrs-linux".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
     <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from nettle-pbkdf2...Reading symbols from 
/usr/bin/.debug/nettle-pbkdf2...done.
done.
(gdb) run -i 1 -l 16 salt < /tmp/passwd
Starting program: /usr/bin/nettle-pbkdf2 -i 1 -l 16 salt < /tmp/passwd

Program received signal SIGSEGV, Segmentation fault.
nettle_sha256_update (ctx=0x7fffffffe5c0, length=<optimized out>,
     data=0x55559260 <error: Cannot access memory at address 0x55559260>)
     at ../nettle-3.4.1/sha256.c:99
99	../nettle-3.4.1/sha256.c: No such file or directory.
(gdb) bt
#0  nettle_sha256_update (ctx=0x7fffffffe5c0, length=<optimized out>,
     data=0x55559260 <error: Cannot access memory at address 0x55559260>)
     at ../nettle-3.4.1/sha256.c:99
#1  0x00007ffff7fa9bb6 in nettle_pbkdf2 
(mac_ctx=mac_ctx@entry=0x7fffffffe4e0,
     update=0x7ffff7fa7cb0 <nettle_hmac_sha256_update>,
     digest=0x7ffff7fa7cc0 <nettle_hmac_sha256_digest>,
     digest_size=digest_size@entry=32, iterations=iterations@entry=1,
     salt_length=salt_length@entry=4,
     salt=0x55559260 <error: Cannot access memory at address 0x55559260>,
     length=16, dst=0x55555555a290 "") at ../nettle-3.4.1/pbkdf2.c:78
#2  0x00007ffff7fa9dd3 in nettle_pbkdf2_hmac_sha256 (
     key_length=<optimized out>, key=<optimized out>, iterations=1,
     salt_length=4,
     salt=0x55559260 <error: Cannot access memory at address 0x55559260>,
     length=16, dst=0x55555555a290 "")
     at ../nettle-3.4.1/pbkdf2-hmac-sha256.c:51
#3  0x000055555555544c in main (argc=<optimized out>, argv=<optimized out>)
     at ../../nettle-3.4.1/tools/nettle-pbkdf2.c:167
(gdb)


After some investigation, it seems "salt = strdup (argv[0]);" doesn't 
works as expected in tools/nettle-pbkdf2.c when -std=c99 specified.
BTW, it works well if update salt = strdup (argv[0]); to the below logic 
even -std=c99 specified.
++++++++++++++++++++++++
salt = malloc (strlen(argv[0]) + 1);
if (! salt)
    die ("Failed to allocate memory for salt\n");
strncpy(salt, argv[0], sizeof(salt) - 1);
++++++++++++++++++++++++

And "salt = strdup (argv[0]);" works well if no -std=c99 specified.

Thanks,

>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   .../Add-target-to-only-build-tests-not-run-them.patch                | 0
>   .../check-header-files-of-openssl-only-if-enable_.patch              | 0
>   .../nettle/{nettle-3.4 => nettle-3.4.1}/dlopen-test.patch            | 0
>   meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/run-ptest   | 0
>   meta/recipes-support/nettle/{nettle_3.4.bb => nettle_3.4.1.bb}       | 5 +++--
>   5 files changed, 3 insertions(+), 2 deletions(-)
>   rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/Add-target-to-only-build-tests-not-run-them.patch (100%)
>   rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/check-header-files-of-openssl-only-if-enable_.patch (100%)
>   rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/dlopen-test.patch (100%)
>   rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/run-ptest (100%)
>   rename meta/recipes-support/nettle/{nettle_3.4.bb => nettle_3.4.1.bb} (90%)
>
> diff --git a/meta/recipes-support/nettle/nettle-3.4/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/nettle-3.4.1/Add-target-to-only-build-tests-not-run-them.patch
> similarity index 100%
> rename from meta/recipes-support/nettle/nettle-3.4/Add-target-to-only-build-tests-not-run-them.patch
> rename to meta/recipes-support/nettle/nettle-3.4.1/Add-target-to-only-build-tests-not-run-them.patch
> diff --git a/meta/recipes-support/nettle/nettle-3.4/check-header-files-of-openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle-3.4.1/check-header-files-of-openssl-only-if-enable_.patch
> similarity index 100%
> rename from meta/recipes-support/nettle/nettle-3.4/check-header-files-of-openssl-only-if-enable_.patch
> rename to meta/recipes-support/nettle/nettle-3.4.1/check-header-files-of-openssl-only-if-enable_.patch
> diff --git a/meta/recipes-support/nettle/nettle-3.4/dlopen-test.patch b/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
> similarity index 100%
> rename from meta/recipes-support/nettle/nettle-3.4/dlopen-test.patch
> rename to meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
> diff --git a/meta/recipes-support/nettle/nettle-3.4/run-ptest b/meta/recipes-support/nettle/nettle-3.4.1/run-ptest
> similarity index 100%
> rename from meta/recipes-support/nettle/nettle-3.4/run-ptest
> rename to meta/recipes-support/nettle/nettle-3.4.1/run-ptest
> diff --git a/meta/recipes-support/nettle/nettle_3.4.bb b/meta/recipes-support/nettle/nettle_3.4.1.bb
> similarity index 90%
> rename from meta/recipes-support/nettle/nettle_3.4.bb
> rename to meta/recipes-support/nettle/nettle_3.4.1.bb
> index ca8450e..dd49c30 100644
> --- a/meta/recipes-support/nettle/nettle_3.4.bb
> +++ b/meta/recipes-support/nettle/nettle_3.4.1.bb
> @@ -20,8 +20,8 @@ SRC_URI_append_class-target = "\
>               file://dlopen-test.patch \
>               "
>
> -SRC_URI[md5sum] = "dc0f13028264992f58e67b4e8915f53d"
> -SRC_URI[sha256sum] = "ae7a42df026550b85daca8389b6a60ba6313b0567f374392e54918588a411e94"
> +SRC_URI[md5sum] = "9bdebb0e2f638d3b9d91f7fc264b70c1"
> +SRC_URI[sha256sum] = "f941cf1535cd5d1819be5ccae5babef01f6db611f9b5a777bae9c7604b8a92ad"
>
>   UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
>
> @@ -30,6 +30,7 @@ inherit autotools ptest multilib_header
>   EXTRA_AUTORECONF += "--exclude=aclocal"
>
>   EXTRA_OECONF = "--disable-openssl"
> +CFLAGS_append = " -std=c99"
>
>   do_compile_ptest() {
>           oe_runmake buildtest
>

