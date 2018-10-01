Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89A6779AD2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Oct 2018 15:48:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w91FmFYq026418
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Oct 2018 08:48:25 -0700
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 1 Oct 2018 08:47:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: <829f16e68431d6fbeda54d3a16709ab47552589a.camel@linuxfoundation.org>
	<1538408825-13100-1-git-send-email-hongxu.jia@windriver.com>
Message-ID: <578a322d-f85c-298d-b381-b5d79579ba09@windriver.com>
Date: Mon, 1 Oct 2018 23:47:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1538408825-13100-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH V2] openssl: fix ptest case `test_symbol_presence' failed
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
X-List-Received-Date: Mon, 01 Oct 2018 15:48:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Sorry for missing V2 in subject

//Hongxu

On 2018年10月01日 23:47, Hongxu Jia wrote:
> The case in ptest use `nm -Pg libcrypto.so' to check symbol presence,
> if library is stripped or debug split, the case will fail.
>
> The dbg library keeps symbol table, so tweak to check on it.
>
> Use wildcard `libcrypto.so*' rather than `libcrypto.so.1.1' to compat
> the subsequent version upgrade.
>
> The binutils provides `nm', hence add it to ptest runtime depends.
> (Without `nm', the test_symbol_presence will be skipped, that's the
> reason why ptest passed on a small image, and failed on a full image)
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...test_symbol_presence-check-on-dbg-library.patch | 36 ++++++++++++++++++++++
>   meta/recipes-connectivity/openssl/openssl_1.1.1.bb |  6 ++++
>   2 files changed, 42 insertions(+)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-test_symbol_presence-check-on-dbg-library.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-test_symbol_presence-check-on-dbg-library.patch b/meta/recipes-connectivity/openssl/openssl/0001-test_symbol_presence-check-on-dbg-library.patch
> new file mode 100644
> index 0000000..3999aa0
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-test_symbol_presence-check-on-dbg-library.patch
> @@ -0,0 +1,36 @@
> +From 2766dc8af70ced2854a6817e67cbac234c99f91f Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 1 Oct 2018 22:16:53 +0800
> +Subject: [PATCH] test_symbol_presence: check on dbg library
> +
> +The case uses `nm -Pg libcrypto.so' to check symbol presence,
> +if library is stripped or debug splited, the case will fail.
> +
> +The dbg library has the symbol table, so tweak to check on it.
> +
> +Use wildcard `libcrypto.so*' rather than `libcrypto.so.1.1' to compat
> +the subsequent version upgrade.
> +
> +Upstream-Status: Inappropriate [OE Specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + test/recipes/01-test_symbol_presence.t | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/test/recipes/01-test_symbol_presence.t b/test/recipes/01-test_symbol_presence.t
> +index 7f2a2d7..1668cde 100644
> +--- a/test/recipes/01-test_symbol_presence.t
> ++++ b/test/recipes/01-test_symbol_presence.t
> +@@ -32,7 +32,7 @@ note
> + foreach my $libname (@libnames) {
> +  SKIP:
> +     {
> +-        my $shlibpath = bldtop_file("lib" . $libname . ".so");
> ++        my $shlibpath = bldtop_file(".debug/" . "lib" . $libname . ".so*");
> +         *OSTDERR = *STDERR;
> +         *OSTDOUT = *STDOUT;
> +         open STDERR, ">", devnull();
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
> index 73bcb27..74b3417 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
> @@ -13,6 +13,7 @@ DEPENDS = "hostperl-runtime-native"
>   SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>              file://run-ptest \
>              file://openssl-c_rehash.sh \
> +           file://0001-test_symbol_presence-check-on-dbg-library.patch \
>              "
>   
>   SRC_URI_append_class-nativesdk = " \
> @@ -174,6 +175,11 @@ RRECOMMENDS_libcrypto += "openssl-conf"
>   RDEPENDS_${PN}-bin = "perl"
>   RDEPENDS_${PN}-misc = "perl"
>   RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
> +# The ptest case uses `nm -Pg .debug/libcrypto.so*' to check symbol presence
> +RDEPENDS_${PN}-ptest += "${PN}-dbg"
> +INSANE_SKIP_${PN}-ptest ?= "debug-deps"
> +# The binutils provides `nm'
> +RDEPENDS_${PN}-ptest += "binutils"
>   
>   RPROVIDES_openssl-conf = "openssl10-conf"
>   RREPLACES_openssl-conf = "openssl10-conf"



