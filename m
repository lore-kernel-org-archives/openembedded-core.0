Received: from avasout01.plus.net (avasout01.plus.net [84.93.230.227])
 by mx.groups.io with SMTP id smtpd.web10.521.1620922531499437468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 09:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=RhINrty0;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.227, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id hDzjl0xDl1iLShDzkleSGC; Thu, 13 May 2021 17:15:30 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=IYUcpVia c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=5FLXtPjwQuUA:10 a=-An2I_7KAAAA:8 a=_n7ZRqGgnMMxvfrYfYIA:9
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=PsSdaBYI1RAy315HuD8iJPEwFoFM+CgbuS5KJvjZ/Fk=; b=Rh
	INrty02wup0vY7Ayt67d24TFsIEhc5+bcbgRDAvNfPk9leG6clSe9BzL7Ivecp5/O6B7FTtq5YNCx
	Jd84Ojlk4Boga659UN1TJ/egCTRuGRadjAEXeSuw+4+hQzXDllLSqkw/TkSLip3tTt+OTqmfvXdWP
	0/bK5QuNPjABV9gNj99v1LfcCOCfIz3ZN1BY1ug79P+McSVqcaZq4oS+z+tnYNmXXfCISuLzckiSE
	fEEpSz2eeC55DNVMo6F/QEaXV6ZOdR12Q45MbhGnXBjtDGZ/NsRR3iYvjqkQZdBsWnw64EE6SpSRK
	KV1SC/7BnSOUm8XdrwMJTMzLgdSaiqrA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1lhDzi-0004hn-17; Thu, 13 May 2021 17:15:26 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH v2] libnotify: Make gtk+3 dependency optional
Date: Thu, 13 May 2021 17:15:24 +0100
Message-Id: <20210513161524.3167085-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDYteJCmFu9xbf9dP/E4tFU+PPiS8GVektOnqDDOuMyMbyT43+xHwvT4ypY/AjbK+GScyG1IESDlno3iD0Aen9xx8qw8oJkq4WcpDPoTU4dn66gPdlTA
 FlfqdMq0jrC4pKRf0oOhIqKV1dDT8BL3EYTpuSyjDGppb/4kMw+HDUuBPeXBFaPNUhj0a1wUtHpXSA==
Content-Transfer-Encoding: 8bit

libnotify only requires gtk+3 for its tests. Let's disable them by
default.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-gnome/libnotify/libnotify_0.7.9.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
index bbbd72193e..0dc3dc3a3c 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
@@ -9,15 +9,16 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-DEPENDS = "dbus gtk+3 glib-2.0"
+DEPENDS = "dbus glib-2.0 gdk-pixbuf"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[gtk+] = "-Dtests=true,-Dtests=false,gtk+3"
 
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

