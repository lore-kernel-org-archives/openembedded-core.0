Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 792776C800
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 12:32:48 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8HCk6f4019758; Tue, 17 Sep 2013 13:47:00 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id v_ORboF1H-lE; Tue, 17 Sep 2013 13:47:00 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8HCktS8019777
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 17 Sep 2013 13:46:56 +0100
Message-ID: <1379421154.32201.116.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jackie.huang@windriver.com
Date: Tue, 17 Sep 2013 13:32:34 +0100
In-Reply-To: <1a438ef15a7474ce02b355c6c0ea0ea8b2f2477d.1379395520.git.jackie.huang@windriver.com>
References: <cover.1379395520.git.jackie.huang@windriver.com>
	<1a438ef15a7474ce02b355c6c0ea0ea8b2f2477d.1379395520.git.jackie.huang@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libunistring: remove the test to convert euc-jp in configure
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
X-List-Received-Date: Tue, 17 Sep 2013 12:32:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-17 at 13:31 +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> Remove the test "Test against HP-UX 11.11 bug:
> No converter from EUC-JP to UTF-8 is provided"
> since we don't support HP-UX and if the euc-jp is not
> installed on the host, libunistring will be built without
> iconv support and will cause guild-native configure fail.

This information needs to be in the patch header...

Cheers,

Richard
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  ...conv-m4-remove-the-test-to-convert-euc-jp.patch |   36 ++++++++++++++++++++
>  .../libunistring/libunistring_0.9.3.bb             |    4 ++-
>  2 files changed, 39 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
> 
> diff --git a/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch b/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
> new file mode 100644
> index 0000000..3f0f035
> --- /dev/null
> +++ b/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
> @@ -0,0 +1,36 @@
> +From 8d99a368615656a835f5502326afd31cec2cebfe Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Mon, 16 Sep 2013 18:16:12 +0800
> +Subject: [PATCH] remove the test to convert euc-jp
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + gnulib-m4/iconv.m4 |   11 -----------
> + 1 files changed, 0 insertions(+), 11 deletions(-)
> +
> +diff --git a/gnulib-m4/iconv.m4 b/gnulib-m4/iconv.m4
> +index f46ff14..de0a5e9 100644
> +--- a/gnulib-m4/iconv.m4
> ++++ b/gnulib-m4/iconv.m4
> +@@ -126,17 +126,6 @@ int main ()
> +       }
> +   }
> + #endif
> +-  /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
> +-     provided.  */
> +-  if (/* Try standardized names.  */
> +-      iconv_open ("UTF-8", "EUC-JP") == (iconv_t)(-1)
> +-      /* Try IRIX, OSF/1 names.  */
> +-      && iconv_open ("UTF-8", "eucJP") == (iconv_t)(-1)
> +-      /* Try AIX names.  */
> +-      && iconv_open ("UTF-8", "IBM-eucJP") == (iconv_t)(-1)
> +-      /* Try HP-UX names.  */
> +-      && iconv_open ("utf8", "eucJP") == (iconv_t)(-1))
> +-    return 1;
> +   return 0;
> + }], [am_cv_func_iconv_works=yes], [am_cv_func_iconv_works=no],
> +         [case "$host_os" in
> +--
> +1.7.4
> diff --git a/meta/recipes-support/libunistring/libunistring_0.9.3.bb b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
> index 454a0e6..6cffef4 100644
> --- a/meta/recipes-support/libunistring/libunistring_0.9.3.bb
> +++ b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
> @@ -19,7 +19,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>  
>  SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
>             file://parallelmake.patch \
> -           file://libunistring_fix_for_automake_1.12.patch"
> +           file://libunistring_fix_for_automake_1.12.patch \
> +           file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
> +"
>  
>  SRC_URI[md5sum] = "db8eca3b64163abadf8c40e5cecc261f"
>  SRC_URI[sha256sum] = "610d3ec724fbdaa654afe3cff20b9f4d504be3fd296fded2e0f7f764041006a3"



