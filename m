Received: from avasout07.plus.net (avasout07.plus.net [84.93.230.235])
 by mx.groups.io with SMTP id smtpd.web08.14337.1620916604783989169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 07:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=CE09I4ue;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.235, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id hCS6lUWK96wwFhCS8lBnHi; Thu, 13 May 2021 15:36:43 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=TPXet2ta c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=5FLXtPjwQuUA:10 a=-An2I_7KAAAA:8 a=j7PFDQGIlsxaj39JbgMA:9
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=KRhpE9fRJR+BIrIj3vXTbTiuQmugKVBXUxAnB3lwwiw=; b=CE
	09I4ueHHXKyxiT/mbWzne768vhnhJ77Q7bwG886WRawvjBnXnrRD6RxhhcB3+5acsBn0oX1x9Uj7S
	KxUdKmUtbfRxuQTj0tlzzbfUG1ZBsoUGRyrTdfFD3idlS+vFHjEz6ASaLJSgAO1qZ+f28Juda75mB
	XUcKU1HeejE7qeqYQbi3M3gJRCvJt1TS1sRUbKoXe/jruY8UOp1bcLxOMJ8iV1QuNVNpCGG8CseQH
	dkkbLSLT85jR9y61hbocTYUIUSXpC38tgGC+bGXoIJrCFmpQTd0oG6Hgk6rBfa4sh0ZIo5WdsAxy9
	3cFl4npqdCX0xDpwSKUC4w5KNKPu5gGQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1lhCS5-0000Q1-Cu; Thu, 13 May 2021 15:36:37 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] libnotify: Make gtk+3 dependency optional
Date: Thu, 13 May 2021 15:36:32 +0100
Message-Id: <20210513143632.1211604-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBT4/Tcs6gXgY8jB6Y+5UJCiho8Esx6I6DxmeOHzXP9pUmkSRiQ+ly4UhHQtyA8YlxYarhycO7RfsbmorgjXsGXo8k/BR/gntZe/NQXAchef/vGcSbVs
 COS3Fiy2XItJx/cZdI2u8kysM0LE5oYmaxiudR1uPPHSlM+F1Q8gIENcZGqlfOLalirnmymrKALpQg==
Content-Transfer-Encoding: 8bit

libnotify only requires gtk+3 for its tests. Let's disable them by
default.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-gnome/libnotify/libnotify_0.7.9.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
index bbbd72193e..819cb304f7 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
@@ -9,15 +9,16 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-DEPENDS = "dbus gtk+3 glib-2.0"
+DEPENDS = "dbus glib-2.0 gdk-pixbuf"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[gtk+] = "--enable-tests,--disable-tests,,gtk+3"
 
 GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 inherit gnomebase gtk-doc features_check gobject-introspection
-# depends on gtk+3
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI[archive.md5sum] = "ccd9c53364174cc8d13e18a1988faa76"
 SRC_URI[archive.sha256sum] = "66c0517ed16df7af258e83208faaf5069727dfd66995c4bbc51c16954d674761"
-- 
2.30.2

