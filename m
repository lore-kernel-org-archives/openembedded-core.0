Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB32C4708E
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:47:24 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.15527.1672847238552390024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 07:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VbwE8yYe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id bk16so20209696wrb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 07:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWnD3gyDeX37uhk82yfzy2No04rwaIzddPLJ8d18DK0=;
        b=VbwE8yYeCNBkCSXOI9tJuiwe90JwQY+h1729msSN1RyA5yfdWlLdK521O8jUDKwAyC
         7N/N46H62DCYXlx/2fI+ppj+vXAxLSLIC4+GN9PO2bQQX8GpkaVwcU5A7i7V52nSwso9
         q1iTy63UJZGxyc8WBI6CNF0aMhwqxxcyX0OfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWnD3gyDeX37uhk82yfzy2No04rwaIzddPLJ8d18DK0=;
        b=PT+Zi3sX4eTYSJwrVMWwQ7bGDTfDB5ONPBy58jeZh4ejGkrG/jCvOaH3BDJGD521C5
         VWDD0AKp35aMNe73WwsJA9lMJxq5Sb7Ao2c2E/vcB4tKgil40T8ZJRSP68URpuRAsGeR
         GouZZbR7lxbg8K5YuwG04NDaShuv5GvtrLv0XbXfbut8ajjpZgXWoozmswaHuI/QiRtI
         skfiTODBnLV22KpchocHM4NdFoWtxAoplI5Dkuu5YoGcsLDCoVBZisa6EwY3aFVZd78H
         ZKwvywA+UHQMF9Y9oUYYFIIhem/I/w1+x6HYG1GK7Q7wxE6c/gkkxE5Kz8l5g/979tWr
         f2/w==
X-Gm-Message-State: AFqh2kru+R6V7eDDUb2ZuE0nOroTC5lySmK7yLJelkOgjc22sJ0tcNWG
	U4/BBqaafJXe89yBnNNkyvK7RD8trY9ZFS2g
X-Google-Smtp-Source: AMrXdXv6uWZIM6FAr9okIIZx2aYGFg+sdZKljJ7xCHZtEkas2gFzwmI4DgHkK1CexnlYMayc+V3Y3Q==
X-Received: by 2002:a5d:5405:0:b0:284:8a24:59e6 with SMTP id g5-20020a5d5405000000b002848a2459e6mr17247143wrv.3.1672847242120;
        Wed, 04 Jan 2023 07:47:22 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fcc2:4e85:26d2:6527])
        by smtp.gmail.com with ESMTPSA id u3-20020adff883000000b002423edd7e50sm34812560wrp.32.2023.01.04.07.47.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 07:47:21 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] recipes/classes: Drop prepend/append usage with PACKAGESPLITFUNCS
Date: Wed,  4 Jan 2023 15:47:14 +0000
Message-Id: <20230104154714.1168535-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
References: <20230104154714.1168535-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 15:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175497

As far as I can tell, none of these uses of PACKAGESPLITFUNCS need append/prepend
operators, the standard += and =+ can work just fine. Since OE-Core is copied a lot,
use the preferred syntax which is also simpler to parse and change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel-module-split.bbclass               | 2 +-
 meta/classes-recipe/kernel.bbclass                            | 2 +-
 meta/classes-recipe/systemd.bbclass                           | 2 +-
 meta/classes-recipe/update-alternatives.bbclass               | 2 +-
 meta/classes-recipe/update-rc.d.bbclass                       | 2 +-
 .../wpa-supplicant/wpa-supplicant_2.10.bb                     | 2 +-
 meta/recipes-devtools/perl/perl_5.36.0.bb                     | 2 +-
 meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
 .../gstreamer/gstreamer1.0-plugins-license.inc                | 2 +-
 .../gstreamer/gstreamer1.0-plugins-packaging.inc              | 4 ++--
 meta/recipes-support/libevent/libevent_2.1.12.bb              | 2 +-
 11 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 08c2e54e860..49437174878 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -35,7 +35,7 @@ do_install:append() {
 }
 
 KERNEL_SPLIT_MODULES ?= "1"
-PACKAGESPLITFUNCS:prepend = "split_kernel_module_packages "
+PACKAGESPLITFUNCS =+ "split_kernel_module_packages "
 
 KERNEL_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-modules"
 
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 553e17bb4ea..c36632b0a7e 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -705,7 +705,7 @@ pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
 	fi
 }
 
-PACKAGESPLITFUNCS:prepend = "split_kernel_packages "
+PACKAGESPLITFUNCS =+ "split_kernel_packages "
 
 python split_kernel_packages () {
     do_split_packages(d, root='${nonarch_base_libdir}/firmware', file_regex=r'^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index f6564c2b310..ae98043d299 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -205,7 +205,7 @@ python systemd_populate_packages() {
         systemd_check_services()
 }
 
-PACKAGESPLITFUNCS:prepend = "systemd_populate_packages "
+PACKAGESPLITFUNCS =+ "systemd_populate_packages "
 
 python rm_systemd_unitdir (){
     import shutil
diff --git a/meta/classes-recipe/update-alternatives.bbclass b/meta/classes-recipe/update-alternatives.bbclass
index 970d9bcd450..ec81763c897 100644
--- a/meta/classes-recipe/update-alternatives.bbclass
+++ b/meta/classes-recipe/update-alternatives.bbclass
@@ -265,7 +265,7 @@ def update_alternatives_alt_targets(d, pkg):
 
     return updates
 
-PACKAGESPLITFUNCS:prepend = "populate_packages_updatealternatives "
+PACKAGESPLITFUNCS =+ "populate_packages_updatealternatives "
 
 python populate_packages_updatealternatives () {
     if not update_alternatives_enabled(d):
diff --git a/meta/classes-recipe/update-rc.d.bbclass b/meta/classes-recipe/update-rc.d.bbclass
index cb2aaba57c7..a61d2c62ab4 100644
--- a/meta/classes-recipe/update-rc.d.bbclass
+++ b/meta/classes-recipe/update-rc.d.bbclass
@@ -68,7 +68,7 @@ python __anonymous() {
     update_rc_after_parse(d)
 }
 
-PACKAGESPLITFUNCS:prepend = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'populate_packages_updatercd ', '', d)}"
+PACKAGESPLITFUNCS =+ "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'populate_packages_updatercd ', '', d)}"
 PACKAGESPLITFUNCS:remove:class-nativesdk = "populate_packages_updatercd "
 
 populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_postinst"
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 4e27b92bc69..254cfd3f0c3 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -134,4 +134,4 @@ python split_wpa_supplicant_libs () {
         d.setVar('RRECOMMENDS:' + pn + '-plugins', ' '.join(split_packages))
         d.appendVar('RRECOMMENDS:' + pn + '-dbg', ' ' + ' '.join(split_dbg_packages))
 }
-PACKAGESPLITFUNCS:prepend = "split_wpa_supplicant_libs "
+PACKAGESPLITFUNCS += "split_wpa_supplicant_libs "
diff --git a/meta/recipes-devtools/perl/perl_5.36.0.bb b/meta/recipes-devtools/perl/perl_5.36.0.bb
index 2dc558aaa5f..3458e6a5b05 100644
--- a/meta/recipes-devtools/perl/perl_5.36.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
@@ -302,7 +302,7 @@ ALTERNATIVE_LINK_NAME[Thread.3] = "${mandir}/man3/Thread.3"
 ALLOW_EMPTY:${PN}-modules = "1"
 PACKAGES += "${PN}-modules "
 
-PACKAGESPLITFUNCS:prepend = "split_perl_packages "
+PACKAGESPLITFUNCS =+ "split_perl_packages "
 
 python split_perl_packages () {
     libdir = d.expand('${libdir}/perl5/${PV}')
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 93b3b59a914..2535dd403da 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -291,7 +291,7 @@ python mesa_populate_packages() {
     do_split_packages(d, pipe_drivers_root, r'^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
 }
 
-PACKAGESPLITFUNCS:prepend = "mesa_populate_packages "
+PACKAGESPLITFUNCS =+ "mesa_populate_packages "
 
 PACKAGES_DYNAMIC += "^mesa-driver-.*"
 PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
index 6638f135404..03595e7d32a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
@@ -1,7 +1,7 @@
 # This .inc file contains functionality for automatically setting
 # the the license of all plugins according to the GSTREAMER_GPL.
 
-PACKAGESPLITFUNCS:append = " set_gstreamer_license "
+PACKAGESPLITFUNCS += " set_gstreamer_license "
 
 python set_gstreamer_license () {
     import oe.utils
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
index afc7be40c8d..837d5a1a627 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
@@ -9,8 +9,8 @@
 # Dynamically generate packages for all enabled plugins
 PACKAGES_DYNAMIC = "^${PN}-.* ^libgst.*"
 
-PACKAGESPLITFUNCS:prepend = " split_gstreamer10_packages "
-PACKAGESPLITFUNCS:append = " set_gstreamer10_metapkg_rdepends "
+PACKAGESPLITFUNCS =+ " split_gstreamer10_packages "
+PACKAGESPLITFUNCS += " set_gstreamer10_metapkg_rdepends "
 
 python split_gstreamer10_packages () {
     gst_libdir = d.expand('${libdir}/gstreamer-1.0')
diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
index 55a65e6c081..88b81fd56e0 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -41,7 +41,7 @@ PACKAGES_DYNAMIC = "^${PN}-.*$"
 python split_libevent_libs () {
     do_split_packages(d, '${libdir}', r'^libevent_([a-z]*)-.*\.so\..*', '${PN}-%s', '${SUMMARY} (%s)', prepend=True, allow_links=True)
 }
-PACKAGESPLITFUNCS:prepend = "split_libevent_libs "
+PACKAGESPLITFUNCS =+ "split_libevent_libs "
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.37.2


