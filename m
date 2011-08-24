Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwIJv-0004zf-5J
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 20:37:01 +0200
Received: by wwe32 with SMTP id 32so1239206wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 11:32:12 -0700 (PDT)
Received: by 10.227.178.131 with SMTP id bm3mr569778wbb.85.1314210732307;
	Wed, 24 Aug 2011 11:32:12 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 8sm1053569wbx.51.2011.08.24.11.32.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Aug 2011 11:32:11 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2011 20:32:01 +0200
Message-Id: <1314210721-29941-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1314210721-29941-1-git-send-email-koen@dominion.thruhere.net>
References: <1314210721-29941-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/2] tcl: fix networking breakage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Aug 2011 18:37:01 -0000

Without providing these site entries tcl networking doesn't work on the target.

Original OE commit:

commit 0c340037644f87054462f62b50cd397c162615b7
Author: Koen Kooi <koen@openembedded.org>
Date:   Wed May 26 13:04:18 2010 +0200

    tcl: add 2 entries to arm-linux site file (possibly only glibc specific, need to check)

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-devtools/tcltk/tcl_8.5.9.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
index 2eabb4d..1b4ae83 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://../license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11
     file://../win/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
     "
 
-PR = "r1"
+PR = "r2"
 
 BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
                 file://tcl-add-soname.patch"
@@ -30,7 +30,9 @@ inherit autotools
 
 DEPENDS_virtclass-native = ""
 
-EXTRA_OECONF = "--enable-threads"
+EXTRA_OECONF = "--enable-threads \
+                tcl_cv_api_getaddrinfo=yes \
+               "
 
 do_configure() {
 	gnu-configize
-- 
1.6.6.1



