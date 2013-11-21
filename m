Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 400296148C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 19:45:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rALJj02g025444
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 11:45:01 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 21 Nov 2013 11:45:00 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 13:44:56 -0600
Message-ID: <1385063096-16895-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [dora][PATCH] libsoup: workaround oe-core mips-gcc ICE
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
X-List-Received-Date: Thu, 21 Nov 2013 19:45:02 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

(Note: this is being sent for Yocto Project compliance.  The bug is in the
 dora oe-core version of the compiler, but only if using -O0..  I consider
 it a temporary workaround.)

This error occurs for builds with the oe-core toolchain in debug builds:

    header-parsing.c:1263:1: internal compiler error: in dwarf2out_var_location, at dwarf2out.c:20810
     }
     ^
    ...
    Please submit a full bug report,
    with preprocessed source if appropriate.
    See <http://gcc.gnu.org/bugs.html> for instructions.
    {standard input}: Assembler messages:
    {standard input}: Warning: missing .end at end of assembly
    {standard input}: Error: open CFI at the end of file; missing .cfi_endproc directive
    make[3]: *** [header-parsing.o] Error 1

This happens only with optimization option '-O', so force to use '-O2' for mips
target to workaround this issue. Root cause will be addressed.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
index ef8d439..01ede17 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
@@ -26,3 +26,7 @@ inherit autotools pkgconfig
 
 # glib-networking is needed for SSL, proxies, etc.
 RRECOMMENDS_${PN} = "glib-networking"
+
+# Workaround oe-core mips-gcc internal compiler error with '-O':
+# header-parsing.c:1263:1: internal compiler error: in dwarf2out_var_location, at dwarf2out.c:20810
+CFLAGS_mips += "-O2"
-- 
1.8.1.2.545.g2f19ada


