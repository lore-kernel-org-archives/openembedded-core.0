Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B658277CDA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 10:52:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3CAquDI019318
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 03:52:56 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Apr 2017 03:52:55 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Apr 2017 18:52:21 +0800
Message-ID: <1491994341-28659-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gnome-common: add EXTRA_OECONF "--with-autoconf-archive"
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
X-List-Received-Date: Wed, 12 Apr 2017 10:52:55 -0000
Content-Type: text/plain

After updating the autoconf-archive version to 2016.09.16, autoconf-archive
installs the same ax_*.m4 macros that gnome-common installs. So there will
be the conflict occurs.
The option '--with-autoconf-archive' is passed to configure, the macros
are not installed, and gnome-common will not install any M4 macros that
conflict with autoconf-archive.
At the same time, set the RDEPENDS for gnome-common.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/recipes-gnome/gnome/gnome-common_3.18.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb b/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
index 06f3bb3..96817bb 100644
--- a/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
@@ -14,6 +14,9 @@ SRC_URI[archive.sha256sum] = "22569e370ae755e04527b76328befc4c73b62bfd4a572499fd
 EXTRA_AUTORECONF = ""
 DEPENDS = ""
 
+EXTRA_OECONF += " --with-autoconf-archive"
+RDEPENDS_${PN} = "autoconf-archive"
+
 FILES_${PN} += "${datadir}/aclocal"
 FILES_${PN}-dev = ""
 
-- 
1.9.1


