Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7A21E775EB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 15:11:45 +0000 (UTC)
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Forcepoint Email with ESMTPS id EC56C91A8A6B9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 15:11:42 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	hhmail02.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Thu, 2 Mar 2017 15:11:45 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Mar 2017 15:11:40 +0000
Message-ID: <20170302151140.7465-1-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch][Morty] gmp: Disable assembly for MIPS R6
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
X-List-Received-Date: Thu, 02 Mar 2017 15:11:45 -0000
Content-Type: text/plain

gmplib has some assembly routines. These have not been optimized
for MIPS R6 yet. Add --disable-assembly so that the C implementation
is used.

(From OE-Core rev: b0975809fe43b7506cc30a60245f5e32b275a3ec)

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
Pyro has slightly different mips arch options.
Hence the subtle difference
---
 meta/recipes-support/gmp/gmp_6.1.1.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gmp/gmp_6.1.1.bb b/meta/recipes-support/gmp/gmp_6.1.1.bb
index 303c3ef..c89773a 100644
--- a/meta/recipes-support/gmp/gmp_6.1.1.bb
+++ b/meta/recipes-support/gmp/gmp_6.1.1.bb
@@ -20,7 +20,14 @@ SRC_URI[sha256sum] = "a8109865f2893f1373b0a8ed5ff7429de8db696fc451b1036bd7bdf95b
 
 acpaths = ""
 
-EXTRA_OECONF += " --enable-cxx=detect"
+DISABLE_ASSEMBLY ?= ""
+
+DISABLE_ASSEMBLY_mipsisa32r6 = "--disable-assembly"
+DISABLE_ASSEMBLY_mipsisa32r6el = "--disable-assembly"
+DISABLE_ASSEMBLY_mipsisa64r6 = "--disable-assembly"
+DISABLE_ASSEMBLY_mipsisa64r6el = "--disable-assembly"
+
+EXTRA_OECONF += " --enable-cxx=detect ${DISABLE_ASSEMBLY}"
 
 PACKAGES =+ "libgmpxx"
 FILES_libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
-- 
2.10.2


