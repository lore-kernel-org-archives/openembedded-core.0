Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id C200D65D00
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:56 +0000 (UTC)
Received: by pfdd184 with SMTP id d184so43101260pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=w5kSsUIXEV8aETInuCnoxbAflLseKqcj2nDrxRKhx3o=;
	b=kshmIG+cHnGCxHEsUkojAfxGRnsReMJ78TdStkW8aOWB5JtWVvyYu/J5ICXGlasd5Z
	hoMfpCpgpwiYTRcvBwb6LQEIY+Ic4e+94ABA9uq9bQJlwtT3rWSPDFZGQiTmMLNXYeqU
	Fx/4PdyeH3dPpDHqZP3CUFDrUHiJS333G0nD54M1vGoHKuYHe9WbrjvL//2PSqqJeEm8
	sIHRjWh45jb1OfBVLeCK0bSdApN3aY+84HEgWx/NZNyxOk0LT9aSVU9Jm3RBXSdneryE
	yV7VX0l5Pd03WDegyvb/bPzon+MsgZm8cARXpdZkVxDW/fZ6q7PipH6EmWqjl48yXwVs
	JMrg==
X-Received: by 10.98.7.91 with SMTP id b88mr31595920pfd.48.1449344157851;
	Sat, 05 Dec 2015 11:35:57 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:28 -0800
Message-Id: <1449344129-32738-15-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro][fido] 14/15] libxml2: security fix CVE-2015-5312
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
X-List-Received-Date: Sat, 05 Dec 2015 19:35:56 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...-2015-5312-Another-entity-expansion-issue.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-5312-Another-entity-expansion-issue.patch

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


