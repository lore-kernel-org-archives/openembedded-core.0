Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8347326E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 00:48:43 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id 65so1294502pff.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 16:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SuN8Vd8RwzC2IlymKCLW9MOcIQZPYxQ6Wm7/LE3LpcM=;
	b=h16PnLverZmDwnCZ3RLSEx7ruJaUWMRT4OMVLy7DeiWfQngIEtL0lz8XVPdMF8CBn9
	+RREGY3HclQiZt16DKq0jHOmeBwUAgW8XUykuBkjvtIgbpVtr0o5rx8ibmR2tIFmLaY/
	rFpAqsBoVjCxF4Kt1TlsI7yc0Qj5mQop9sQYOaurfOVTCFQjGlquH6k8o4VWskmq2OVI
	ohGlBERVnGXJHepjb+/18JQ39S564Rk0kBjIi8GtOe4wt319hb91fyMFnfqxSrBrGdJW
	tg3Bwlg2mlfqq+kSJz2/dos4vO//rX5z/ufHH6R8wgrr1wBHg0Ly1e5MZqvovd3HoWvQ
	RSpw==
X-Received: by 10.98.11.24 with SMTP id t24mr578798pfi.61.1452214124843;
	Thu, 07 Jan 2016 16:48:44 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id o75sm300234pfi.17.2016.01.07.16.48.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 16:48:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 16:48:29 -0800
Message-Id: <1452214113-11697-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
References: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][V2][Jethro, fido 06/10] libxml2: security fix CVE-2015-7497
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
X-List-Received-Date: Fri, 08 Jan 2016 00:48:45 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  1 +
 ...97-Avoid-an-heap-buffer-overflow-in-xmlDi.patch | 40 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 389f5cd..65b2625 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -28,6 +28,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2015-7942-2-Fix-an-error-in-previous-Conditional-section-patch.patch \
            file://0001-CVE-2015-8035-Fix-XZ-compression-support-loop.patch \
            file://CVE-2015-7498-Avoid-processing-entities-after-encoding-conversion-.patch \
+           file://0001-CVE-2015-7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/0001-CVE-2015-7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch b/meta/recipes-core/libxml/libxml2/0001-CVE-2015-7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch
new file mode 100644
index 0000000..955c9619
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-CVE-2015-7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch
@@ -0,0 +1,40 @@
+From 6360a31a84efe69d155ed96306b9a931a40beab9 Mon Sep 17 00:00:00 2001
+From: David Drysdale <drysdale@google.com>
+Date: Fri, 20 Nov 2015 10:47:12 +0800
+Subject: [PATCH] CVE-2015-7497 Avoid an heap buffer overflow in
+ xmlDictComputeFastQKey
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=756528
+It was possible to hit a negative offset in the name indexing
+used to randomize the dictionary key generation
+Reported and fix provided by David Drysdale @ Google
+
+Upstream-Status: Backport
+
+CVE-2015-7497
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ dict.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/dict.c b/dict.c
+index 5f71d55..8c8f931 100644
+--- a/dict.c
++++ b/dict.c
+@@ -486,7 +486,10 @@ xmlDictComputeFastQKey(const xmlChar *prefix, int plen,
+ 	value += 30 * (*prefix);
+ 
+     if (len > 10) {
+-        value += name[len - (plen + 1 + 1)];
++        int offset = len - (plen + 1 + 1);
++	if (offset < 0)
++	    offset = len - (10 + 1);
++	value += name[offset];
+         len = 10;
+ 	if (plen > 10)
+ 	    plen = 10;
+-- 
+2.3.5
+
-- 
2.3.5


