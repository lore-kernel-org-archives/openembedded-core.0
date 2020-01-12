Return-Path: <crg7475@mailbox.org>
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	by mail.openembedded.org (Postfix) with ESMTP id B1A847FA11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 14:00:18 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 47wddv4Q1nzKmXL
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1578837618; bh=Ml2WiwI454jKxNO
	hNKbg6wISmaUNi1GDcjNv6vmm+64=; b=SOtmHNTE17/OMoC8B1E1jxpVktluBv9
	ZMMqpoRPfsVXbmkb98Iqo4LwDwssmmc1uiiASB/qx0jXYqm5t5TD7K2tpWbg2YA9
	2NfJ4ddsNpvGmCbOOENzMjxd80I/e/GrIcqPudNIiOQE4KvoH0lXO5Runwbq/pd0
	WdBDCIZNUXrHd/kq7KEVRiAximokc8D80Ltqj7WWGM8bMb7Y5nlBRynxhAPcGE/+
	8twz0ZCz89CYe7Gza2isyIKN+0OgG+KKahe9NBpeWbUtIA+3y0QMp5bpilCHm52E
	Od5F5VRoBMnMqh3DRO4SyrU6r+xA9R3makbYbxu84cB37YKxn+azVzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1578837619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=wmCSyTDWyrFzQVLXU9ObyAKEBhn8B6R5U7mzqLvs0SU=;
	b=yOQudXvAV7HXKExnI8HrPOIWlI8eKGJx0X2/UV9UpndTGtHk5vhuP3nhSwREA4ai1Wt1/N
	GsvUqmAksZgr33uoOHCDy6EDrNr0zZsWcwzTS7mGfRbI1A6xinH/2UE+XuMZmuxrL7njq6
	Y+RwTksY39w62O/x7nNLJu6bzXBRb0AvnqCuwMj+8NnE/OtyBwUenUwKfjtnzOypIT+l3H
	960vRMrzlwnM5MzfSAkx6MWyQN0k9P74DWiOYDV7AJyvSs3wmEygju3dqelQ5pv8KuTgkU
	ltxHtuz9OoyDXmTG3EcUVWGNMBC7qyVvjnbIHJT4DqCAFiF6zdN7EsFgmyJCXw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
	[80.241.56.125]) (amavisd-new, port 10030) with ESMTP id pNudZdYzCznl
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:18 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2020 14:59:51 +0100
Message-Id: <20200112135954.23868-9-crg7475@mailbox.org>
In-Reply-To: <20200112135954.23868-1-crg7475@mailbox.org>
References: <20200112135954.23868-1-crg7475@mailbox.org>
Subject: [PATCH 09/12] gstreamer1.0-omx: Transition to meson based build
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
X-List-Received-Date: Sun, 12 Jan 2020 14:00:19 -0000

* Removed autotools/M4 specific bits from recipe.

* gettext, gtk-doc, and valgrind support is no longer present in gst-omx,
  and arguably never really was (because they were present in the "common"
  git submodule that is no longer being used in meson base builds).

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../gstreamer/gstreamer1.0-omx_1.16.1.bb          | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
index cb2f7045a8..89e13937ea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
@@ -16,14 +16,12 @@ S = "${WORKDIR}/gst-omx-${PV}"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
 
-inherit autotools pkgconfig gettext gtk-doc upstream-version-is-even
-
-acpaths = "-I ${S}/common/m4 -I ${S}/m4"
+inherit meson pkgconfig upstream-version-is-even
 
 GSTREAMER_1_0_OMX_TARGET ?= "bellagio"
 GSTREAMER_1_0_OMX_CORE_NAME ?= "${libdir}/libomxil-bellagio.so.0"
 
-EXTRA_OECONF += "--disable-valgrind --with-omx-target=${GSTREAMER_1_0_OMX_TARGET}"
+EXTRA_OEMESON += "-Dtarget=${GSTREAMER_1_0_OMX_TARGET}"
 
 python __anonymous () {
     omx_target = d.getVar("GSTREAMER_1_0_OMX_TARGET")
@@ -37,21 +35,12 @@ python __anonymous () {
         d.setVar("PACKAGE_ARCH", d.getVar("MACHINE_ARCH"))
 }
 
-delete_pkg_m4_file() {
-    # Delete m4 files which we provide patched versions of but will be ignored
-    # if these exist
-	rm -f "${S}/common/m4/pkg.m4"
-	rm -f "${S}/common/m4/gtk-doc.m4"
-}
-do_configure[prefuncs] += "delete_pkg_m4_file"
-
 set_omx_core_name() {
 	sed -i -e "s;^core-name=.*;core-name=${GSTREAMER_1_0_OMX_CORE_NAME};" "${D}${sysconfdir}/xdg/gstomx.conf"
 }
 do_install[postfuncs] += " set_omx_core_name "
 
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
 
 RDEPENDS_${PN} = "libomxil"
-- 
2.17.1


