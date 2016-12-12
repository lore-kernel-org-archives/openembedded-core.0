Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B41FD719C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 05:45:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBC5jLIT020138
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2016 21:45:21 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 11 Dec 2016 21:45:21 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Dec 2016 13:42:15 +0800
Message-ID: <20161212054215.20513-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH] glibc: add -fno-builtin-strlen when not using -O2
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
X-List-Received-Date: Mon, 12 Dec 2016 05:45:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The strlen will be inlined when compile with -O, -O1 or -Os,
so there is no symbol for strlen in ld-linux-x86-64.so.2,
causing a fatal error in valgrind:

valgrind: Fatal error at startup: a function redirection
valgrind: which is mandatory for this platform-tool combination
valgrind: cannot be set up. Details of the redirection are:
valgrind:
valgrind: A must-be-redirected function
valgrind: whose name matches the pattern: strlen
valgrind: in an object with soname matching: ld-linux-x86-64.so.2

so add -fno-builtin-strlen when compile with -O, -O1 or -Os.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/glibc/glibc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index e85c704..7f3e0f6 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -16,8 +16,8 @@ python () {
     if opt_effective == "-O0":
         bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN', True), opt_effective))
     if opt_effective in ("-O", "-O1", "-Os"):
-        bb.note("%s doesn't build cleanly with %s, adding -Wno-error to SELECTED_OPTIMIZATION" % (d.getVar('PN', True), opt_effective))
-        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
+        bb.note("%s doesn't build cleanly with %s, adding -Wno-error and -fno-builtin-strlen to SELECTED_OPTIMIZATION" % (d.getVar('PN', True), opt_effective))
+        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error -fno-builtin-strlen")
 }
 
 # siteconfig.bbclass runs configure which needs a working compiler
-- 
2.8.3


