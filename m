Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcyb-0007FT-ST
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:41 +0100
Received: by wwe15 with SMTP id 15so3169077wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:18 -0800 (PST)
Received: by 10.216.203.168 with SMTP id f40mr917776weo.25.1298799017976;
	Sun, 27 Feb 2011 01:30:17 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n18sm1285840wee.16.2011.02.27.01.30.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:17 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:52 +0100
Message-Id: <afb68bee2637775a1e7bbde207b3eea13adba2bb.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 40/50] file: add wrapper to file-native
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:41 -0000

From: Saul Wold <sgw@linux.intel.com>

file-native needs a wrapper to pass the correct path to the magic.mgc file
This was found to be the case when sstate-cache is used because file hardcodes
the path to the magic.mgc file.

[BUGID #775]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/file/file_5.04.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/file/file_5.04.bb b/meta/recipes-devtools/file/file_5.04.bb
index b745137..1f9c78e 100644
--- a/meta/recipes-devtools/file/file_5.04.bb
+++ b/meta/recipes-devtools/file/file_5.04.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03
 
 DEPENDS = "zlib file-native"
 DEPENDS_virtclass-native = "zlib-native"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
            file://stringb-compat.patch \
@@ -30,4 +30,10 @@ do_configure_prepend() {
 
 FILES_${PN} += "${datadir}/misc/*.mgc"
 
+do_install_append_virtclass-native() {
+	create_cmdline_wrapper ${D}/${bindir}/file \
+		--magic-file ${datadir}/misc/magic.mgc
+}
+
+
 BBCLASSEXTEND = "native"
-- 
1.6.6.1



