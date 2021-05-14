Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
 by mx.groups.io with SMTP id smtpd.web08.7006.1620988722147902345
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 03:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=d0xzqTkY;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.18, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id hVDLlKw8KHBkXhVDMlN5Ou; Fri, 14 May 2021 11:38:40 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=fI+iIaSe c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=5FLXtPjwQuUA:10 a=-An2I_7KAAAA:8 a=pGLkceISAAAA:8 a=2eS8VoGju3gVZreBA8IA:9
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=0XB2mGHRds2PBwYoOApJJCmgSgmw4NePijAikOY1oWw=; b=d0
	xzqTkYmgTp5IV88SsGWy5T5398oi+sOaqeMRq6PyIenuHpy6Tg9VU3LK1Czgd2FpLTvRbtYe+UFe1
	GeQuOujnXAlXdsHEHAJEb/V/hokcOIY4B5j2tcZGQ1ZCdlYqNcF9lNClDGLqSNIpLf1r+CnyKP3wn
	gdrkSiZKx3pAhNCy3qLgcAo5m/kYFNvmShZ6eJgtRBvd8gm1gJ9ueuUJuit19WN5oWVV89A+EXKKE
	EmcZaQIi8ZO9JKNTsViKR+mm/ibONQwESsXl9mpaKC/KFCBzvHqgZRCDFI9V6w9durseeQpx2emxd
	1VEuN2IhN0c8DH8JuU7qGwFc2CC9WJTQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1lhVDJ-0006h8-Pr; Fri, 14 May 2021 11:38:37 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>,
	Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v3] libnotify: Make gtk+3 dependency optional
Date: Fri, 14 May 2021 11:38:00 +0100
Message-Id: <20210514103800.3222094-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAok7MH6NVP6Z/znMl7Vf4IsiHsn1KvITpjdcOu46t9fyongES/vffCcmFa3qU9DZWAkEhsezNN1P0DZ3pTGWDcul46iByzQlEP0ApF1VlWd4bDOfo2J
 KNf5kFdeo0/UFcOip5DmEU8mRMgNbfwfZJrLuV2rSWRIlpN/T4OySxWjGwaP8PdpRt9jUY6XrY5Vng==
Content-Transfer-Encoding: 8bit

libnotify only requires gtk+3 for its tests. Let's disable them by
default and only enable them if "tests" is in PACKAGECONFIG. If gtk+3 is
not available then we need to declare the dependency on gdk-pixbuf
explicitly.

It looks like the tests genuinely do need some sort of desktop
environment to run, so let's maintain the ANY_OF_DISTRO_FEATURES check
added back in 3edf08b38b0af93cef0933b061349264dc86d54c.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/libnotify/libnotify_0.7.9.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
index bbbd72193e..d2be715ce5 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
@@ -9,15 +9,18 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-DEPENDS = "dbus gtk+3 glib-2.0"
+DEPENDS = "dbus glib-2.0 gdk-pixbuf"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,gtk+3"
 
 GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 inherit gnomebase gtk-doc features_check gobject-introspection
-# depends on gtk+3
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+# depends on gtk+3 if tests are enabled
+ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
 SRC_URI[archive.md5sum] = "ccd9c53364174cc8d13e18a1988faa76"
 SRC_URI[archive.sha256sum] = "66c0517ed16df7af258e83208faaf5069727dfd66995c4bbc51c16954d674761"
-- 
2.30.2

