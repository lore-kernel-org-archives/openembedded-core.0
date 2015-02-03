Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 54FD46E66A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:12:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t131CO0x022782
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:12:24 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:12:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 17:12:06 -0800
Message-ID: <197de88eeccccbf0ddfbed1fcd0d7784bcd4a7fe.1422925725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422925725.git.liezhi.yang@windriver.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/21] tar 1.17: fix unknown-configure-option
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
X-List-Received-Date: Tue, 03 Feb 2015 01:12:23 -0000
Content-Type: text/plain

WARNING: QA Issue: tar: configure was passed unrecognised options: --without-posix-acls [unknown-configure-option]

tar 1.17 doesn't support --without-posix-acls, move it from tar.inc to
tar_1.28.bb to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/tar/tar.inc     |    2 --
 meta/recipes-extended/tar/tar_1.28.bb |    3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
index 51d4934..fb5db78 100644
--- a/meta/recipes-extended/tar/tar.inc
+++ b/meta/recipes-extended/tar/tar.inc
@@ -26,8 +26,6 @@ do_install_extra () {
 
 PACKAGES =+ "${PN}-rmt"
 
-PACKAGECONFIG[acl] = "--with-posix-acls, --without-posix-acls, acl,"
-
 FILES_${PN}-rmt = "${base_sbindir}/rmt*"
 
 inherit update-alternatives
diff --git a/meta/recipes-extended/tar/tar_1.28.bb b/meta/recipes-extended/tar/tar_1.28.bb
index a15b4b6..8816000 100644
--- a/meta/recipes-extended/tar/tar_1.28.bb
+++ b/meta/recipes-extended/tar/tar_1.28.bb
@@ -1,5 +1,8 @@
 require tar.inc
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[acl] = "--with-posix-acls, --without-posix-acls, acl,"
+
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-- 
1.7.9.5


