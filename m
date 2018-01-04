Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2FCCB71C42
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 08:49:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w048n53O019005
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 4 Jan 2018 00:49:05 -0800
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 4 Jan 2018 00:49:04 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20171221130434.24427-1-alexander.kanavin@linux.intel.com>
	<20171221130434.24427-3-alexander.kanavin@linux.intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <77edf942-1e45-d129-1af5-35809f0c94d6@windriver.com>
Date: Thu, 4 Jan 2018 16:51:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20171221130434.24427-3-alexander.kanavin@linux.intel.com>
X-Originating-IP: [128.224.162.167]
Subject: Re: [PATCH 3/9] json-glib: convert to meson build
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
X-List-Received-Date: Thu, 04 Jan 2018 08:49:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/2017 09:04 PM, Alexander Kanavin wrote:
> Note that meson flags for gobject introspection and gtk-doc
> appear to be non-standardized; going forward we should devise
> a common way to deal with it.
>
> gettext inherit is removed, as there is no equivalent functionality
> in meson; NLS bits are always built and installed.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>   ...ble-gobject-introspection-when-cross-comp.patch | 32 ++++++++++++++++++++++
>   meta/recipes-gnome/json-glib/json-glib_1.2.8.bb    | 23 ++++++++++++++--
>   2 files changed, 53 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
>
> diff --git a/meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable-gobject-introspection-when-cross-comp.patch b/meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
> new file mode 100644
> index 00000000000..849bb9d3165
> --- /dev/null
> +++ b/meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
> @@ -0,0 +1,32 @@
> +From 293452c963188666dae99521294f09a0cf9582e2 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 4 Aug 2017 16:01:11 +0300
> +Subject: [PATCH] Do not disable gobject introspection when cross-compiling.
> +
> +Introspection does work fine for instance in Open Embedded,
> +one of the most prominent cross-compilation frameworks
> +(through qemu emulating target hardware), so let the user
> +decide if he wants the feature or not.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 43cbfd9..8a32f26 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -147,7 +147,7 @@ root_dir = include_directories('.')
> +
> + gnome = import('gnome')
> + gir = find_program('g-ir-scanner', required: false)
> +-build_gir = gir.found() and not meson.is_cross_build() and not get_option('disable_introspection')
> ++build_gir = gir.found() and not get_option('disable_introspection')
> +
> + subdir('json-glib')
> +
> +--
> +2.13.2
> +
> diff --git a/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb b/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
> index 2c5d3817ba7..c53611b0257 100644
> --- a/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
> +++ b/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
> @@ -10,11 +10,30 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
>   
>   DEPENDS = "glib-2.0"
>   
> +SRC_URI_append = " \
> +           file://0001-Do-not-disable-gobject-introspection-when-cross-comp.patch \
> +           "

I removed this patch and the compile succeeded.
Could you please check if this patch is really needed?
If it is, I think we'd better make build to succeed by default anyway.

Best Regards,
Chen Qi

>   SRC_URI[archive.md5sum] = "ff31e7d0594df44318e12facda3d086e"
>   SRC_URI[archive.sha256sum] = "fd55a9037d39e7a10f0db64309f5f0265fa32ec962bf85066087b83a2807f40a"
>   
> -inherit gnomebase gettext lib_package gobject-introspection gtk-doc manpages
> +inherit gnomebase-meson lib_package gobject-introspection gtk-doc manpages
>   
> -PACKAGECONFIG[manpages] = "--enable-man --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog.xml, --disable-man, libxslt-native xmlto-native"
> +GTKDOC_ENABLE_FLAG = "-Denable-gtk-doc=true"
> +GTKDOC_DISABLE_FLAG = "-Denable-gtk-doc=false"
> +
> +GI_ENABLE_FLAG = "-Ddisable_introspection=false"
> +GI_DISABLE_FLAG = "-Ddisable_introspection=true"
> +
> +EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
> +                                                                                    '${GTKDOC_DISABLE_FLAG}', d)} "
> +EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
> +                                                                                    '${GI_DISABLE_FLAG}', d)} "
> +
> +PACKAGECONFIG[manpages] = "-Denable-man=true, -Denable-man=false, libxslt-native xmlto-native"
> +
> +do_install_append() {
> +    # FIXME: these need to be provided via ptest
> +    rm -rf ${D}${datadir}/installed-tests ${D}${libexecdir}
> +}
>   
>   BBCLASSEXTEND = "native nativesdk"



