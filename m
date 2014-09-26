Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3F15E71604
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 20:16:56 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id p10so1605873pdj.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 13:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=p1PDsQ4t6FCg3SU9rFUkSyinwuDCDEZN5XHT3JVHQUs=;
	b=ayMjYEGisB7pZYJ4dC2U2crKdwvmSVTTd3NORsOcL6bDGeJFgcOFf99EWluUaL1nvp
	LreG6XWN0JxpS7uLQ3GE3xZZIY/hyrHZIVIo5rg2haF/gjoIpciuKBIHLhz4kSe+DA1U
	naXRaq0rizoDpmVPcSN2rolFdIo9Y9fTyhpg8sTpmGgX8chyfzLKWgURDhyxOz97FCkl
	Lvl+NlHSgIY2sxCrbRC1KLrgUl1MEe9am3L9xPPAbA+iJJDwqwdrLb06dQFqNQ/99Byi
	jnTpSK3ond/vR4GuE2+Drg7htNQoCZsrgxmiuXV9tTduN4ka0mLwE6Prfy9je4Rmq7b8
	aMWA==
X-Received: by 10.66.66.229 with SMTP id i5mr34052699pat.131.1411762618406;
	Fri, 26 Sep 2014 13:16:58 -0700 (PDT)
Received: from haswell.localdomain (c-76-103-58-225.hsd1.ca.comcast.net.
	[76.103.58.225])
	by mx.google.com with ESMTPSA id f12sm5730775pat.36.2014.09.26.13.16.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Sep 2014 13:16:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Sep 2014 13:20:54 -0700
Message-Id: <1411762854-16452-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] bash: Fix CVE-2014-7169
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
X-List-Received-Date: Fri, 26 Sep 2014 20:16:59 -0000

This is a followup patch to incomplete CVE-2014-6271 fix
code execution via specially-crafted environment

Change-Id: Ibb0a587ee6e09b8174e92d005356e822ad40d4ed
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/bash/bash-3.2.48/shellshock1.patch | 16 ++++++++++++++++
 meta/recipes-extended/bash/bash/shellshock1.patch        | 16 ++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb                |  1 +
 meta/recipes-extended/bash/bash_4.3.bb                   |  1 +
 4 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/shellshock1.patch
 create mode 100644 meta/recipes-extended/bash/bash/shellshock1.patch

diff --git a/meta/recipes-extended/bash/bash-3.2.48/shellshock1.patch b/meta/recipes-extended/bash/bash-3.2.48/shellshock1.patch
new file mode 100644
index 0000000..2e734de
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/shellshock1.patch
@@ -0,0 +1,16 @@
+Taken from http://www.openwall.com/lists/oss-security/2016/09/25/10
+
+Upstream-Status: Backport
+Index: bash-3.2.48/parse.y
+===================================================================
+--- bash-3.2.48.orig/parse.y	2008-04-29 18:24:55.000000000 -0700
++++ bash-3.2.48/parse.y	2014-09-26 13:07:31.956080056 -0700
+@@ -2503,6 +2503,8 @@
+   FREE (word_desc_to_read);
+   word_desc_to_read = (WORD_DESC *)NULL;
+ 
++  eol_ungetc_lookahead = 0;
++
+   last_read_token = '\n';
+   token_to_read = '\n';
+ }
diff --git a/meta/recipes-extended/bash/bash/shellshock1.patch b/meta/recipes-extended/bash/bash/shellshock1.patch
new file mode 100644
index 0000000..3c69121
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/shellshock1.patch
@@ -0,0 +1,16 @@
+Taken from http://www.openwall.com/lists/oss-security/2016/09/25/10
+
+Upstream-Status: Backport
+Index: bash-4.3/parse.y
+===================================================================
+--- bash-4.3.orig/parse.y	2014-09-26 13:10:44.340080056 -0700
++++ bash-4.3/parse.y	2014-09-26 13:11:44.764080056 -0700
+@@ -2953,6 +2953,8 @@
+   FREE (word_desc_to_read);
+   word_desc_to_read = (WORD_DESC *)NULL;
+ 
++  eol_ungetc_lookahead = 0;
++
+   current_token = '\n';		/* XXX */
+   last_read_token = '\n';
+   token_to_read = '\n';
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 07c6540..5fafdcd 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            file://build-tests.patch \
            file://test-output.patch \
            file://shellshock.patch \
+           file://shellshock1.patch \
            file://run-ptest \
           "
 
diff --git a/meta/recipes-extended/bash/bash_4.3.bb b/meta/recipes-extended/bash/bash_4.3.bb
index a01fcf1..7b134f8 100644
--- a/meta/recipes-extended/bash/bash_4.3.bb
+++ b/meta/recipes-extended/bash/bash_4.3.bb
@@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            file://build-tests.patch \
            file://test-output.patch \
            file://shellshock.patch \
+           file://shellshock1.patch \
            file://run-ptest \
            "
 
-- 
2.1.0


