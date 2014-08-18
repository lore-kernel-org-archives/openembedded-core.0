Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4563E617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:30:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7I6UrRP001508
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:30:53 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 17 Aug 2014 23:30:53 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 14:26:31 +0800
Message-ID: <a181226a852b3dbe8131a658144b0689c6022b93.1408343136.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408343136.git.Chong.Lu@windriver.com>
References: <cover.1408343136.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] librsvg: disable Bsymbolic if it is not supported on some hosts
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
X-List-Received-Date: Mon, 18 Aug 2014 06:30:55 -0000
Content-Type: text/plain

When trying to build on my Centos 5.5 machine, got below error:
| checking for gdk-pixbuf-query-loaders... /home/build/clu1/build/qemux86_standard_glibc-std/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/gdk-pixbuf-query-loaders
| checking if gcc  supports "-Wl,-Bsymbolic-functions" flag...
| configure: error: -Bsymbolic requested but not supported by ld. Use --disable-Bsymbolic to disable
| Configure failed. The contents of all config.log files follows to aid debugging
| ERROR: oe_runconf failed

Set --enable-Bsymbolic=auto to disable it when it is not suppported.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.40.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
index 34d8ca1..d288d4b 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
@@ -20,7 +20,7 @@ SRC_URI += "file://gtk-option.patch \
 SRC_URI[archive.md5sum] = "acdecdb9f08f3bf662a68bf7dafb8b82"
 SRC_URI[archive.sha256sum] = "48049b643294636df7de1a4b997414d699666f5dc44776945c218a257d2a291c"
 
-EXTRA_OECONF = "--disable-introspection --disable-vala"
+EXTRA_OECONF = "--disable-introspection --disable-vala --enable-Bsymbolic=auto"
 
 PACKAGECONFIG ??= "gdkpixbuf"
 # The gdk-pixbuf loader
-- 
1.9.1


