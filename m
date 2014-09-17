Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id C7D2F714D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 01:17:24 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so311396wib.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 18:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=OazSsHZMm0PuAFI+fLA3CZ+y9MG8k1x1qGyZtih9Q+E=;
	b=t4IwV08e//rZ2bH0XML0SAghgEA8awYI6jMwxpqhpAZ5Ip5GwixSYd+HJzJ6Do8vs0
	n2xOi0hge8EctxHLkftP5NSDgMS5Jqm6EhvoE8zDKOpCHfyw+2SlsYDLZFJs5dzBry1w
	258S3+IK0ZEADfpIlX8yLVTthsDmMkX69vbxCeXBloTnBwKRyPfVs5gxkQ2qZK0Zc2LK
	WqInyjcMt7JUU5rS4SGQP1z8CqJE6bGiU8lyWBz6Bze74NFd55cnDfkYsPVH652vGB8A
	XQrIjQQViIyK0J2SNW/6IuFyYT7W6DpNPT4HXi2J0BXkLqtT7r/zDhl4X1QYyYlbyMzm
	diaw==
X-Received: by 10.180.188.13 with SMTP id fw13mr1768925wic.83.1410916646046;
	Tue, 16 Sep 2014 18:17:26 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	bg10sm20164661wjc.47.2014.09.16.18.17.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Sep 2014 18:17:25 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 18:16:59 -0700
Message-Id: <1410916622-26204-6-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
References: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 5/8] hostap-utils: obey LDFLAGS
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
X-List-Received-Date: Wed, 17 Sep 2014 01:17:26 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../hostap/hostap-utils-0.4.7/ldflags.patch        | 27 ++++++++++++++++++++++
 meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb      |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch

diff --git a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
new file mode 100644
index 0000000..c4655cf
--- /dev/null
+++ b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
@@ -0,0 +1,27 @@
+Obey LDFLAGS
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-status: Pending
+
+--- hostap-utils-0.4.7.orig/Makefile
++++ hostap-utils-0.4.7/Makefile
+@@ -14,17 +14,17 @@ prism2_srec.o: prism2_srec.c util.h
+ hostap_crypt_conf: hostap_crypt_conf.c
+
+ hostap_diag: hostap_diag.o util.o
+-	$(CC) -o hostap_diag $(CFLAGS) hostap_diag.o util.o
++	$(CC) -o hostap_diag $(CFLAGS) $(LDFLAGS) hostap_diag.o util.o
+
+ hostap_diag.o: hostap_diag.c util.h
+
+ util.o: util.c util.h
+
+ hostap_io_debug: hostap_io_debug.c
+-	$(CC) -o hostap_io_debug $(CFLAGS) hostap_io_debug.c
++	$(CC) -o hostap_io_debug $(CFLAGS) $(LDFLAGS) hostap_io_debug.c
+
+ hostap_rid: hostap_rid.o util.o
+-	$(CC) -o hostap_rid $(CFLAGS) hostap_rid.o util.o
++	$(CC) -o hostap_rid $(CFLAGS) $(LDFLAGS) hostap_rid.o util.o
+
+ hostap_rid.o: hostap_rid.c util.h
diff --git a/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb b/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb
index 7b224a8..be5481f 100644
--- a/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb
+++ b/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb
@@ -1,4 +1,5 @@
 require hostap-utils.inc
 
+SRC_URI += "file://ldflags.patch"
 SRC_URI[md5sum] = "afe041581b8f01666e353bec20917c85"
 SRC_URI[sha256sum] = "c6f598d8e356c1620fa009eca0a700bf1105e16817eefd77d891994261009355"
-- 
1.8.3.4


