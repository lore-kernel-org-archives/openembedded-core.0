Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E70EF7CBDD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 03:08:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBA38Xl2024132
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 9 Dec 2019 19:08:34 -0800 (PST)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 9 Dec 2019 19:08:33 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 9 Dec 2019 19:08:33 -0800
Message-ID: <20191210030833.122689-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] libpam: drop yylex to static force
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
X-List-Received-Date: Tue, 10 Dec 2019 03:08:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since flex was upgraded to 2.6.4, there is a build failure
...
In file included from ../../../Linux-PAM-1.3.1/modules/pam_console/configfile.c:56:
configfile.lex.c:23:15: error: static declaration of '_pc_yylex' follows non-static declaration
   23 | #define yyleng _pc_yyleng
      |               ^~~~~~~~~
configfile.lex.c:1091:28: note: in expansion of macro 'yylex'
 1091 |
      |                            ^
configfile.lex.c:1111:1: note: in expansion of macro 'YY_DECL'
 1111 |  */
      | ^~~
configfile.lex.c:23:15: note: previous declaration of '_pc_yylex' was here
   23 | #define yyleng _pc_yyleng
      |               ^~~~~~~~~
configfile.lex.c:1089:12: note: in expansion of macro 'yylex'
 1089 |
      |            ^
...

Google the world and find a similar fix
https://lists.pld-linux.org/mailman/pipermail/pld-cvs-commit/Week-of-Mon-20170703/465181.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-drop-yylex-to-static-force.patch     | 51 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.3.1.bb     |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-drop-yylex-to-static-force.patch

diff --git a/meta/recipes-extended/pam/libpam/0001-drop-yylex-to-static-force.patch b/meta/recipes-extended/pam/libpam/0001-drop-yylex-to-static-force.patch
new file mode 100644
index 0000000000..1aefa8c761
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/0001-drop-yylex-to-static-force.patch
@@ -0,0 +1,51 @@
+From 53f0fd76d6eb0ba5149d316647f83d3c56d1f9aa Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 9 Dec 2019 18:31:06 -0800
+Subject: [PATCH] drop yylex to static force
+
+Since flex was upgraded to 2.6.4, there is a build failure
+...
+In file included from ../../../Linux-PAM-1.3.1/modules/pam_console/configfile.c:56:
+configfile.lex.c:23:15: error: static declaration of '_pc_yylex' follows non-static declaration
+   23 | #define yyleng _pc_yyleng
+      |               ^~~~~~~~~
+configfile.lex.c:1091:28: note: in expansion of macro 'yylex'
+ 1091 |
+      |                            ^
+configfile.lex.c:1111:1: note: in expansion of macro 'YY_DECL'
+ 1111 |  */
+      | ^~~
+configfile.lex.c:23:15: note: previous declaration of '_pc_yylex' was here
+   23 | #define yyleng _pc_yyleng
+      |               ^~~~~~~~~
+configfile.lex.c:1089:12: note: in expansion of macro 'yylex'
+ 1089 |
+      |            ^
+...
+
+Google the world and find a similar fix
+https://lists.pld-linux.org/mailman/pipermail/pld-cvs-commit/Week-of-Mon-20170703/465181.html
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ modules/pam_console/sed-static | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/pam_console/sed-static b/modules/pam_console/sed-static
+index b9a6fa2..c7a850e 100644
+--- a/modules/pam_console/sed-static
++++ b/modules/pam_console/sed-static
+@@ -13,7 +13,7 @@ sed '
+ /^YY_BUFFER_STATE yy_scan_buffer/s/^/STATIC /
+ /^YY_BUFFER_STATE yy_scan_string/s/^/STATIC /
+ /^void yy_switch_to_buffer/s/^/STATIC /
+-/define YY_DECL int yylex/s/YY_DECL /YY_DECL STATIC /
++#/define YY_DECL int yylex/s/YY_DECL /YY_DECL STATIC /
+ /^int yyparse/s/^/STATIC /
+ /^void yyrestart/s/^/STATIC /
+ ' < $1 > sedtmp.$$ && mv sedtmp.$$ $1
+-- 
+2.21.0
+
diff --git a/meta/recipes-extended/pam/libpam_1.3.1.bb b/meta/recipes-extended/pam/libpam_1.3.1.bb
index 1194933827..440d77babc 100644
--- a/meta/recipes-extended/pam/libpam_1.3.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://pam-security-abstract-securetty-handling.patch \
            file://pam-unix-nullok-secure.patch \
            file://crypt_configure.patch \
+           file://0001-drop-yylex-to-static-force.patch \
           "
 
 SRC_URI[md5sum] = "558ff53b0fc0563ca97f79e911822165"
-- 
2.21.0


