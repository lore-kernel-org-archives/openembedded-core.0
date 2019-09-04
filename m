Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8257F2E1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 02:43:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x842h9r6003840
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2019 19:43:10 -0700 (PDT)
Received: from [128.224.162.221] (128.224.162.221) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 3 Sep 2019 19:43:09 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1567084550-93704-1-git-send-email-zhe.he@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <7493105c-9a55-7410-1902-d476001088fd@windriver.com>
Date: Wed, 4 Sep 2019 10:43:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567084550-93704-1-git-send-email-zhe.he@windriver.com>
X-Originating-IP: [128.224.162.221]
Subject: Re: [PATCH 1/2] qemu: Add pkg-config handling for libgcrypt
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
X-List-Received-Date: Wed, 04 Sep 2019 02:43:09 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Kindly ping.

Zhe

On 8/29/19 9:15 PM, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> When PACKAGECONFIG libgcrypt is enabled, we would get the following error.
>
> ERROR: /usr/bin/libgcrypt-config should not be used, use an alternative such as pkg-config
>
> In oe-core, libgcrypt has been turned to be configured with pkg-config instead
> of libgcrypt-config, but qemu configure script does not contain pkg-config
> related part for libgcrypt to handle it.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc                |  1 +
>  ...ure-Add-pkg-config-handling-for-libgcrypt.patch | 93 ++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index d2dd2bc..3eeba6e 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -22,6 +22,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://0007-apic-fixup-fallthrough-to-PIC.patch \
>             file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
>             file://0009-Fix-webkitgtk-builds.patch \
> +           file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
>             "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  
> diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
> new file mode 100644
> index 0000000..a8ab7da
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
> @@ -0,0 +1,93 @@
> +From 5214dd4461f2090ef0965b4d2518f49927d61cbc Mon Sep 17 00:00:00 2001
> +From: He Zhe <zhe.he@windriver.com>
> +Date: Wed, 28 Aug 2019 19:56:28 +0800
> +Subject: [Qemu-devel] [PATCH] configure: Add pkg-config handling for libgcrypt
> +
> +libgcrypt may also be controlled by pkg-config, this patch adds pkg-config
> +handling for libgcrypt.
> +
> +Upstream-Status: Denied [https://lists.nongnu.org/archive/html/qemu-devel/2019-08/msg06333.html]
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +---
> + configure | 48 ++++++++++++++++++++++++++++++++++++++++--------
> + 1 file changed, 40 insertions(+), 8 deletions(-)
> +
> +diff --git a/configure b/configure
> +index e44e454..0f362a7 100755
> +--- a/configure
> ++++ b/configure
> +@@ -2875,6 +2875,30 @@ has_libgcrypt() {
> +     return 0
> + }
> + 
> ++has_libgcrypt_pkgconfig() {
> ++    if ! has $pkg_config ; then
> ++        return 1
> ++    fi
> ++
> ++    if ! $pkg_config --list-all | grep libgcrypt > /dev/null 2>&1 ; then
> ++        return 1
> ++    fi
> ++
> ++    if test -n "$cross_prefix" ; then
> ++        host=$($pkg_config --variable=host libgcrypt)
> ++        if test "${host%-gnu}-" != "${cross_prefix%-gnu}" ; then
> ++            print_error "host($host) does not match cross_prefix($cross_prefix)"
> ++            return 1
> ++        fi
> ++    fi
> ++
> ++    if ! $pkg_config --atleast-version=1.5.0 libgcrypt ; then
> ++        print_error "libgcrypt version is $($pkg_config --modversion libgcrypt)"
> ++        return 1
> ++    fi
> ++
> ++    return 0
> ++}
> + 
> + if test "$nettle" != "no"; then
> +     pass="no"
> +@@ -2902,7 +2926,14 @@ fi
> + 
> + if test "$gcrypt" != "no"; then
> +     pass="no"
> +-    if has_libgcrypt; then
> ++    if has_libgcrypt_pkgconfig; then
> ++        gcrypt_cflags=$($pkg_config --cflags libgcrypt)
> ++        if test "$static" = "yes" ; then
> ++            gcrypt_libs=$($pkg_config --libs --static libgcrypt)
> ++        else
> ++            gcrypt_libs=$($pkg_config --libs libgcrypt)
> ++        fi
> ++    elif has_libgcrypt; then
> +         gcrypt_cflags=$(libgcrypt-config --cflags)
> +         gcrypt_libs=$(libgcrypt-config --libs)
> +         # Debian has removed -lgpg-error from libgcrypt-config
> +@@ -2912,15 +2943,16 @@ if test "$gcrypt" != "no"; then
> +         then
> +             gcrypt_libs="$gcrypt_libs -lgpg-error"
> +         fi
> ++    fi
> + 
> +-        # Link test to make sure the given libraries work (e.g for static).
> +-        write_c_skeleton
> +-        if compile_prog "" "$gcrypt_libs" ; then
> +-            LIBS="$gcrypt_libs $LIBS"
> +-            QEMU_CFLAGS="$QEMU_CFLAGS $gcrypt_cflags"
> +-            pass="yes"
> +-        fi
> ++    # Link test to make sure the given libraries work (e.g for static).
> ++    write_c_skeleton
> ++    if compile_prog "" "$gcrypt_libs" ; then
> ++	    LIBS="$gcrypt_libs $LIBS"
> ++	    QEMU_CFLAGS="$QEMU_CFLAGS $gcrypt_cflags"
> ++	    pass="yes"
> +     fi
> ++
> +     if test "$pass" = "yes"; then
> +         gcrypt="yes"
> +         cat > $TMPC << EOF
> +-- 
> +2.7.4
> +


