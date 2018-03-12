Return-Path: <xiao.zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D78CF788B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 00:33:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2C0XOgx029197
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 17:33:24 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 11 Mar 2018 17:32:46 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 11 Mar 2018 17:32:56 -0700
Message-ID: <20180312003256.40039-3-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180312003256.40039-1-xiao.zhang@windriver.com>
References: <20180312003256.40039-1-xiao.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] libgpg-error: Fix multilib header conflict - pg-error.h and gpgrt.h
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
X-List-Received-Date: Mon, 12 Mar 2018 00:33:24 -0000
Content-Type: text/plain

Header file conflict between 32-bit and 64-bit versions.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.27.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
index b2e2d507c9..b74f079f5d 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "4f93aac6fecb7da2b92871bb9ee33032be6a87b174f54abf8ddf0911a2
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-inherit autotools binconfig-disabled pkgconfig gettext
+inherit autotools binconfig-disabled pkgconfig gettext multilib_header
 CPPFLAGS += "-P"
 do_compile_prepend() {
 	TARGET_FILE=linux-gnu
@@ -53,6 +53,7 @@ do_compile_prepend() {
 do_install_append() {
 	# we don't have common lisp in OE
 	rm -rf "${D}${datadir}/common-lisp/"
+	oe_multilib_header gpg-error.h gpgrt.h
 }
 
 FILES_${PN}-dev += "${bindir}/gpg-error"
-- 
2.11.0


