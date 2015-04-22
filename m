Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4031C605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 17:27:55 +0000 (UTC)
Received: by layy10 with SMTP id y10so180329355lay.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 10:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=44GGXhMXysh7PwLHz8ra2c2AY1hHOJaI1f/IDQHN02I=;
	b=RUvniUwy8hicPYOlAgMf52drhvqrQJLACXeT5QSOXctKKtK2Sc3Qamg/EhtdVr6ohh
	23INlV3J2Ld8aoXSvraHaNQE1yffChvQWdNZSVAITVKENL0DLL/QjrnlGahsgPqIitui
	O7Klwl91gej9NVj0hJFUjEGwF1QwcP8xdzBLn2Nk+nedwLSkaU96xc4XyPfgJ4kWyrA+
	blh2c93e6+cBGo0H1aGQrbI7nPIoMC2gjbXLAHOvkLyawaUzYfyR9ViT5U91BAv8qMHj
	2WE+PwaF8EkbZYDzvB1TV+MkOJVwTydwypJerCreJuO1B4cN2/tJRJ/KZwy1GQrmidPR
	suJA==
X-Gm-Message-State: ALoCoQnKMgmbUNaRQyL9tKQLpuhh8TIC/sIcqd65oGTzqNnW74PH6HtJFdbx9G2XkSRT4ZCX1ty6
X-Received: by 10.152.25.167 with SMTP id d7mr15150621lag.108.1429723675271;
	Wed, 22 Apr 2015 10:27:55 -0700 (PDT)
Received: from ad.chargestorm.se ([212.214.9.162])
	by mx.google.com with ESMTPSA id
	jq15sm1239791lab.27.2015.04.22.10.27.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Apr 2015 10:27:54 -0700 (PDT)
Date: Wed, 22 Apr 2015 19:27:52 +0200
From: Anders Darander <anders@chargestorm.se>
To: Bruno Bottazzini <bruno.bottazzini@intel.com>
Message-ID: <20150422172752.GA5915@ad.chargestorm.se>
Mail-Followup-To: Bruno Bottazzini <bruno.bottazzini@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1429722072-13369-1-git-send-email-bruno.bottazzini@intel.com>
	<1429722072-13369-4-git-send-email-bruno.bottazzini@intel.com>
MIME-Version: 1.0
In-Reply-To: <1429722072-13369-4-git-send-email-bruno.bottazzini@intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] systemd: split modules into packages
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
X-List-Received-Date: Wed, 22 Apr 2015 17:27:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


I'm repeating the comments from my review of the earlier version.

I'm slightly worried as we're changing some of the default
configurations here. And we're suddenly starting to build almost
everything in systemd...

* Bruno Bottazzini <bruno.bottazzini@intel.com> [150422 19:02]:

> if one wants to launch a simple deamon, most modules are not
> required.
> He will be able to save space and exclude unwanted packages
> from the final image.

Missing S-o-B: line. (The same is true for patch 1/3).

> ---
>  meta/recipes-core/systemd/systemd_219.bb | 1075 ++++++++++++++++++++++++++----
>  1 file changed, 943 insertions(+), 132 deletions(-)

> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> index d1303f7..d86068c 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -19,7 +19,7 @@ PROVIDES = "udev"

>  PE = "1"

> -DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
> +DEPENDS = "util-linux intltool-native gperf-native readline libcap libcgroup qemu-native"

>  SECTION = "base/shell"

> @@ -58,23 +58,45 @@ LDFLAGS_append_libc-uclibc = " -lrt"

>  GTKDOC_DOCDIR = "${S}/docs/"

> -PACKAGECONFIG ??= "xz ldconfig \
> +PACKAGECONFIG ??= " \
> +                   gcrypt \
> +                   kmod \
> +                   ldconfig \

I guess we could debate whether to remove xz or not from the default set
of PACKAGECONFIG. Though, if it's removed, it should be mentioned in the
commit log at least, as it's a change of the default configuration.

> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'blkid', 'blkid', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'efi', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'lz4', 'lz4', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'xz', 'xz', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'libidn', 'libidn', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"

> +PACKAGECONFIG[glib] = "--enable-gudev,--disable-gudev,glib-2.0"
> +PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
> +PACKAGECONFIG[blkid] = "--enable-blkid,--disable-blkid,util-linux"
> +PACKAGECONFIG[efi] = "--enable-efi,--disable-efi"
> +PACKAGECONFIG[kmod] = "--enable-kmod,--disable-kmod,kmod"
> +PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,,polkit"
> +PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
> +PACKAGECONFIG[smack] = "--enable-smack,--disable-smack"
> +PACKAGECONFIG[ima] = "--enable-ima,--disable-ima"
> +PACKAGECONFIG[apparmor] = "--enable-apparmor,--disable-apparmor,libapparmor"
> +PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
> +PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
>  PACKAGECONFIG[journal-upload] = "--enable-libcurl,--disable-libcurl,curl"
>  # Sign the journal for anti-tampering
>  PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
>  # regardless of PACKAGECONFIG, libgcrypt is always required to expand
>  # the AM_PATH_LIBGCRYPT autoconf macro
> -DEPENDS += "libgcrypt"

Have you verified that it builds OK if you remove the line above, and
also removes gcrypt from PACKAGECONFIG? If so, the comment above should
also be removed, otherwise the DEPENDS line above should be kept.

>  # Compress the journal
> +PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
>  PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
> +PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,libqrencode"
> +PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
>  PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
>  PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
>  PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
>  PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
> -PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"

Why are you removing the PACKAGECONFIG definition for networkd?

>  PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
>  PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
>  PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
> @@ -97,17 +119,33 @@ rootprefix ?= "${base_prefix}"
>  rootlibdir ?= "${base_libdir}"
>  rootlibexecdir = "${rootprefix}/lib"

> -# The gtk+ tools should get built as a separate recipe e.g. systemd-tools
>  EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
>                   --with-rootlibdir=${rootlibdir} \
> -                 --with-roothomedir=${ROOT_HOME} \
> -                 --disable-coredump \
> +                 --enable-coredump \
>                   --disable-introspection \
> -                 --disable-kdbus \
> +                 --enable-kdbus \

This should probably be a PACKAGECONFIG. I haven't looked at the code,
but is it safe to build kdbus-support into systemd if you're running on
kernels without kdbus support? And the same if you're running on a
kernel with kdbus support, but where the rest of user-space lacks kdbus
support?

As I haven't had time to play with kdbus, this makes me nervous.

> +                 --disable-manpages \
>                   --enable-split-usr \
>                   --without-python \
>                   --with-sysvrcnd-path=${sysconfdir} \
>                   --with-firmware-path=/lib/firmware \
> +                 --enable-libcurl \

Do you have a DEPEND on curl? Otherwise you shouldn't enable it.
(Non-deterministic builds). And instead of enabling it, it should be a
PACKAGECONFIG.

> +                 --enable-ldconfig \
> +                 --enable-backlight \
> +                 --enable-binfmt \
> +                 --enable-bootchart \
> +                 --enable-firstboot \
> +                 --enable-hostnamed \
> +                 --enable-localed \
> +                 --enable-logind \
> +                 --enable-machined \
> +                 --enable-networkd \

Why are we suddenly enabling all modules above? E.g. networkd was a
PACKAGECONFIG earlier. Most (all?) of these ought to be PACKAGECONFIGs
instead. I know that you're splitting these out into separate packages
for installation, but they might increas build time both to being built
themselves, as well as having to build dependencies of them.

> +                 --enable-quotacheck \
> +                 --enable-randomseed \
> +                 --enable-resolved \
> +                 --enable-rfkill \
> +                 --enable-sysusers \
> +                 --enable-vconsole \
>                 "

Maybe some of these also should be PACKAGECONFIGS?


I haven't looked at all of your alternatives configuration yet, to see
if they make sense or not.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

