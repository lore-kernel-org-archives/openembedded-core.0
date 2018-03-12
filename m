Return-Path: <xiao.zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EFA447888A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 00:32:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2C0Wv4c014293
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 17:32:58 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 11 Mar 2018 17:32:19 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 11 Mar 2018 17:32:54 -0700
Message-ID: <20180312003256.40039-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 1/3] valgrind: Fix multilib header conflict - valgrind/config.h
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
X-List-Received-Date: Mon, 12 Mar 2018 00:32:59 -0000
Content-Type: text/plain

Header file conflict between 32-bit and 64-bit versions.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.13.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
index 5bd315aff0..9390d30444 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
@@ -58,7 +58,7 @@ COMPATIBLE_HOST_linux-muslx32 = 'null'
 COMPATIBLE_HOST_mipsarchn32 = 'null'
 COMPATIBLE_HOST_mipsarchr6 = 'null'
 
-inherit autotools ptest
+inherit autotools ptest multilib_header
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
 EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS') != '32']}"
@@ -91,6 +91,7 @@ do_configure_prepend () {
 
 do_install_append () {
     install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
+    oe_multilib_header valgrind/config.h
 }
 
 TUNE = "${@strip_mcpu(d)}"
-- 
2.11.0


