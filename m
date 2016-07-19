Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89B62606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 13:44:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6JDiEBb019300
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 06:44:15 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jul 2016 06:44:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jul 2016 06:44:00 -0700
Message-ID: <e6dc6baf0f850853605319815acc19cb14de189c.1468935802.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1468935802.git.liezhi.yang@windriver.com>
References: <cover.1468935802.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] e2fsprogs: 1.43 -> 1.43.1
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
X-List-Received-Date: Tue, 19 Jul 2016 13:44:15 -0000
Content-Type: text/plain

There is a new confgure option --enable-hardening:

http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.43.1

Enable it by default, for target. The native can't be built with it:
| checking for uuid_generate in -luuid... no
| configure: error: external uuid library not found

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs/{e2fsprogs_1.43.bb => e2fsprogs_1.43.1.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.bb => e2fsprogs_1.43.1.bb} (97%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.1.bb
similarity index 97%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.1.bb
index e82124b..696818d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.1.bb
@@ -1,7 +1,5 @@
 require e2fsprogs.inc
 
-PR = "r1"
-
 SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
             file://quiet-debugfs.patch \
@@ -11,13 +9,15 @@ SRC_URI += "file://acinclude.m4 \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
 "
 
-SRCREV = "d6adf070b0e85f209c0d7f310188b134b5cb7180"
+SRCREV = "48203a389d2d9f45dd0768f0963cb2b3ffbc12df"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
                 --enable-elf-shlibs --disable-libuuid --disable-uuidd \
                 --disable-libblkid --enable-verbose-makecmds"
 
+EXTRA_OECONF_append_class-target = " --enable-hardening"
+
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
 PACKAGECONFIG ??= ""
-- 
2.9.0


