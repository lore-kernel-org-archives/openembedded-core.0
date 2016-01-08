Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 96CD57326E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 00:48:50 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id ho8so11405204pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 16:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4oos9R87U1Zpu2k3Bw/eomjVJtyy/1Aq6SA7WTzlJ6k=;
	b=JOc7utFjuP5qnm0k8Q+OBWQjybX2SyAkgNWQecQLSBkBFRkCxOiHYn/xVCpJDw7QaY
	mDzwUgHVx5tBaBUAG6yAjnI/A45ID89WLfopk49W0KKenwepus+G3i0Q7HV29N+GDJYp
	BG/28hsmaizPZ4iDFQIr/EesOHadv8YKw0X7xKRmtWU9I1sa0VcRknGgmLOE1lla/SrV
	mAb1zRXT3UK4nMT1GzKI+hFudDnol5WzCt8RmJjttD3qU4ydlTNVcFbWPFwJEaGIEOrq
	VigpOpsl6ekKST0JTqzNmaD5EEPJ6u/ot6oC82/R9BKtwHkSIDVAhj9hlAop6QXk5pMQ
	FXcQ==
X-Received: by 10.67.1.102 with SMTP id bf6mr122085695pad.103.1452214131483;
	Thu, 07 Jan 2016 16:48:51 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id o75sm300234pfi.17.2016.01.07.16.48.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 16:48:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 16:48:33 -0800
Message-Id: <1452214113-11697-10-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
References: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][V2][Jethro, fido 10/10] libxml2: security fix CVE-2015-5312
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
X-List-Received-Date: Fri, 08 Jan 2016 00:48:51 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  1 +
 ...-2015-5312-Another-entity-expansion-issue.patch | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-5312-Another-entity-expansion-issue.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index a30f0b6..b9ce0f0 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -34,6 +34,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://0001-Fix-a-bug-on-name-parsing-at-the-end-of-current-inpu.patch \
            file://0001-CVE-2015-7500-Fix-memory-access-error-due-to-incorre.patch \
            file://0001-CVE-2015-8242-Buffer-overead-with-HTML-parser-in-pus.patch \
+           file://0001-CVE-2015-5312-Another-entity-expansion-issue.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/0001-CVE-2015-5312-Another-entity-expansion-issue.patch b/meta/recipes-core/libxml/libxml2/0001-CVE-2015-5312-Another-entity-expansion-issue.patch
new file mode 100644
index 0000000..979618d
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-CVE-2015-5312-Another-entity-expansion-issue.patch
@@ -0,0 +1,39 @@
+From 69030714cde66d525a8884bda01b9e8f0abf8e1e Mon Sep 17 00:00:00 2001
+From: David Drysdale <drysdale@google.com>
+Date: Fri, 20 Nov 2015 11:13:45 +0800
+Subject: [PATCH] CVE-2015-5312 Another entity expansion issue
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=756733
+It is one case where the code in place to detect entities expansions
+failed to exit when the situation was detected, leading to DoS
+Problem reported by Kostya Serebryany @ Google
+Patch provided by David Drysdale @ Google
+
+Upstream-Status: Backport
+
+CVE-2015-5312
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ parser.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/parser.c b/parser.c
+index b7b6668..da6e729 100644
+--- a/parser.c
++++ b/parser.c
+@@ -2806,6 +2806,10 @@ xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, const xmlChar *str, int len,
+ 			                      0, 0, 0);
+ 		ctxt->depth--;
+ 
++		if ((ctxt->lastError.code == XML_ERR_ENTITY_LOOP) ||
++		    (ctxt->lastError.code == XML_ERR_INTERNAL_ERROR))
++		    goto int_error;
++
+ 		if (rep != NULL) {
+ 		    current = rep;
+ 		    while (*current != 0) { /* non input consuming loop */
+-- 
+2.3.5
+
-- 
2.3.5


