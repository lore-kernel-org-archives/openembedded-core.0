Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 388DE60767
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 00:48:36 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id yy13so179558001pab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 16:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BnNFA1JNVLLXHSzPFOol1fzt/KDFMatRwMzL6+GzRrw=;
	b=j1CC1OyvKeXuZjIfMVdj2ks4qTAnadaYdRICsGgPHDZ2msHoHQy03vE2Ux+JuHvgj6
	RZGDVkytpHGdw3B0SXHKUSFbY6TgV4n5YHS5DHF+YaD1wkCv8MPVU7LKNNe2dbEwp1Mf
	uh6xRT2hq0wXPqnBQoHc8WTeX8z+zhwTDPealr/H4cIrIyt6+tc4Sbn7t3joxqsDJba4
	dCxGcsj7EwcsZzxTKVlh/huo2YwZkzMu6IgQ0J2xlYuQevrJ6HJMqytYAjqw5P42n3o2
	LfukwQV+J+b7c7b2UjvI4w66BXjypGvq8vJgWlPkJ99yNmgcav2tXeak8L7wUhRoHaOy
	iTzQ==
X-Received: by 10.66.219.194 with SMTP id pq2mr155538614pac.107.1452214117677; 
	Thu, 07 Jan 2016 16:48:37 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id o75sm300234pfi.17.2016.01.07.16.48.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 16:48:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 16:48:25 -0800
Message-Id: <1452214113-11697-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
References: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][V2][Jethro, fido 02/10] libxml2: security fix CVE-2015-8317
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
X-List-Received-Date: Fri, 08 Jan 2016 00:48:37 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  1 +
 ...ng-early-on-if-encoding-conversion-failed.patch | 42 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8317-Fail-parsing-early-on-if-encoding-conversion-failed.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 24b98a6..84217bf 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -23,6 +23,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch \
            file://CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch \
            file://CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch \
+           file://CVE-2015-8317-Fail-parsing-early-on-if-encoding-conversion-failed.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-8317-Fail-parsing-early-on-if-encoding-conversion-failed.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-8317-Fail-parsing-early-on-if-encoding-conversion-failed.patch
new file mode 100644
index 0000000..59425cb
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-8317-Fail-parsing-early-on-if-encoding-conversion-failed.patch
@@ -0,0 +1,42 @@
+From 709a952110e98621c9b78c4f26462a9d8333102e Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Mon, 29 Jun 2015 16:10:26 +0800
+Subject: [PATCH] Fail parsing early on if encoding conversion failed
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=751631
+
+If we fail conversing the current input stream while
+processing the encoding declaration of the XMLDecl
+then it's safer to just abort there and not try to
+report further errors.
+
+Upstream-Status: Backport
+
+CVE-2015-8317
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ parser.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/parser.c b/parser.c
+index a3a9568..0edd53b 100644
+--- a/parser.c
++++ b/parser.c
+@@ -10471,7 +10471,11 @@ xmlParseEncodingDecl(xmlParserCtxtPtr ctxt) {
+ 
+             handler = xmlFindCharEncodingHandler((const char *) encoding);
+ 	    if (handler != NULL) {
+-		xmlSwitchToEncoding(ctxt, handler);
++		if (xmlSwitchToEncoding(ctxt, handler) < 0) {
++		    /* failed to convert */
++		    ctxt->errNo = XML_ERR_UNSUPPORTED_ENCODING;
++		    return(NULL);
++		}
+ 	    } else {
+ 		xmlFatalErrMsgStr(ctxt, XML_ERR_UNSUPPORTED_ENCODING,
+ 			"Unsupported encoding %s\n", encoding);
+-- 
+2.3.5
+
-- 
2.3.5


