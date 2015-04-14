Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 169AB73D3B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:07:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3E97GnD010250
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:07:16 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:07:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:07:13 -0700
Message-ID: <37f3a2b97d82fd1cdeda6f0f6a18700f6899f6e7.1429002381.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429002381.git.liezhi.yang@windriver.com>
References: <cover.1429002381.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] gstreamer: change priv_gst_parse_yylex arguments
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
X-List-Received-Date: Tue, 14 Apr 2015 09:07:15 -0000
Content-Type: text/plain

From: Chong Lu <Chong.Lu@windriver.com>

Change priv_gst_parse_yylex to fit new bison version, else we will
get following error:

| grammar.tab.c: In function 'priv_gst_parse_yyparse':
| grammar.tab.c:67:25: error: too few arguments to function 'priv_gst_parse_yylex'
|  #define yylex           priv_gst_parse_yylex
|                          ^

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 ...mer-change-priv_gst_parse_yylex-arguments.patch |   33 ++++++++++++++++++++
 .../gstreamer/gstreamer_0.10.36.bb                 |    1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch
new file mode 100644
index 0000000..bf93cb2
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch
@@ -0,0 +1,33 @@
+gstreamer: change priv_gst_parse_yylex arguments
+
+Change priv_gst_parse_yylex to fit new bison version, else we will
+get following error:
+
+| grammar.tab.c: In function 'priv_gst_parse_yyparse':
+| grammar.tab.c:67:25: error: too few arguments to function 'priv_gst_parse_yylex'
+|  #define yylex           priv_gst_parse_yylex
+|                          ^
+
+Upstream-Status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ gst/parse/grammar.y | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst/parse/grammar.y b/gst/parse/grammar.y
+index 24fc87b..24fe906 100644
+--- a/gst/parse/grammar.y
++++ b/gst/parse/grammar.y
+@@ -36,7 +36,7 @@
+ 
+ typedef void* yyscan_t;
+ 
+-int priv_gst_parse_yylex (void * yylval_param , yyscan_t yyscanner);
++int priv_gst_parse_yylex (yyscan_t yyscanner);
+ int priv_gst_parse_yylex_init (yyscan_t scanner);
+ int priv_gst_parse_yylex_destroy (yyscan_t scanner);
+ struct yy_buffer_state * priv_gst_parse_yy_scan_string (char* , yyscan_t);
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
index f08908a..5b30603 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz
            file://check_fix.patch \
            file://gst-inspect-check-error.patch \
            file://0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch \
+           file://gstreamer-change-priv_gst_parse_yylex-arguments.patch \
 "
 
 SRC_URI[md5sum] = "a0cf7d6877f694a1a2ad2b4d1ecb890b"
-- 
1.7.9.5


