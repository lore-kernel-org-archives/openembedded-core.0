Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id E8E3C70101
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:24:28 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 14 Dec 2015 13:24:17 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Dec 2015 13:24:13 +0100
Message-ID: <1450095853-48305-6-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450095853-48305-1-git-send-email-sona.sarmadi@enea.com>
References: <1450095853-48305-1-git-send-email-sona.sarmadi@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH][dizzy 6/6] libxml2: CVE-2015-8241
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
X-List-Received-Date: Mon, 14 Dec 2015 12:24:29 -0000
Content-Type: text/plain

Upstream bug (contains reproducer):
https://bugzilla.gnome.org/show_bug.cgi?id=756263

Upstream patch:
https://git.gnome.org/browse/libxml2/commit/?id=
ab2b9a93ff19cedde7befbf2fcc48c6e352b6cbe

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  1 +
 .../libxml/libxml2/CVE-2015-8241.patch             | 41 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index d5e263b..2dafeb4 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -25,6 +25,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch \
            file://CVE-2015-7942.patch \
            file://CVE-2015-8035.patch \
+           file://CVE-2015-8241.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
new file mode 100644
index 0000000..98b30f0
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
@@ -0,0 +1,41 @@
+From ab2b9a93ff19cedde7befbf2fcc48c6e352b6cbe Mon Sep 17 00:00:00 2001
+From: Hugh Davenport <hugh@allthethings.co.nz>
+Date: Tue, 3 Nov 2015 20:40:49 +0800
+Subject: Avoid extra processing of MarkupDecl when EOF
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=756263
+
+One place where ctxt->instate == XML_PARSER_EOF whic was set up
+by entity detection issues doesn't get noticed, and even overrided
+
+Fixes CVE-2015-8241.
+
+Upstream-Status: Backport
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ parser.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/parser.c b/parser.c
+index d67b300..134afe7 100644
+--- a/parser.c
++++ b/parser.c
+@@ -6972,6 +6972,14 @@ xmlParseMarkupDecl(xmlParserCtxtPtr ctxt) {
+ 	    xmlParsePI(ctxt);
+ 	}
+     }
++
++    /*
++     * detect requirement to exit there and act accordingly
++     * and avoid having instate overriden later on
++     */
++    if (ctxt->instate == XML_PARSER_EOF)
++        return;
++
+     /*
+      * This is only for internal subset. On external entities,
+      * the replacement is done before parsing stage
+-- 
+cgit v0.11.2
+
-- 
1.9.1


