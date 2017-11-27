Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id BDE87780A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:27 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id z3so7596097plh.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GpxcGq2s03CB1F+Sr9OvEYhILXLGKGjHzEkCFAVvEi0=;
	b=o2Ga3sd534SAnERiePSdad2HuHeUndKUPpzoohnuEkYK0Ow6MjX6ow+9jmVTH0/dM+
	+6Yted1CsHpiK9yN+6o6kJk9/emoTOQtB6xmNyceMpfgEk31GMJLco656bKds40BDpfd
	tcJS3yXZpbTCKRphvhYggY3QJf4AQngbf2pJv+KQN4QpVK4g1s932vSN5mOt+OxWcyau
	7gyRoIfrwlPEFHL0q79PKfDXrej3IBfnW5oHeDAKYBP6DWZcOh9/lqKIWt7Ek3SKjn68
	Hz+EgtIZyP/FlbaDmIZHstBbpkfNwd+XsUy4t45GzB9LuDzDWhWwmqqlidZH6GGI0DeE
	FKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GpxcGq2s03CB1F+Sr9OvEYhILXLGKGjHzEkCFAVvEi0=;
	b=l3LmJVZNsbJlBOXqRpjKY2jLmo4zVG/WTjfr5p+JOlju/XboBfmeIQwzr0PnniKAWO
	Uam96zN9ACZNA0EVe/sHu/BWEmRArLvB/5QK6QLDaLqyILVU8opx7erk0NzEJ8SWdTjp
	oE+pTGbyrqxbsO5Bq+yCxDRfySPpj0XOQnfhcJNwZ5l5aaDlmlcM+NW/brUAWBUYOjN4
	x4dejDSa7H2LdHVa6WYPCSz3SCvmRn/sFPy56ZezDWwKjwBKIcOydPOSqeB+86lbUTET
	Lq9WfKobPns840YOGZerkTkYXb6rk00pigT+Rb0iOlO2ImMgMNI7ssImttdNI8+qTs6p
	/Oww==
X-Gm-Message-State: AJaThX6DsrMBC6jNWT62RcucQcrLQM91ITAJnzgL3qlqT0d3wicaNqdQ
	ChEphtca8JPm1T91RSNTcxbjgQ==
X-Google-Smtp-Source: AGs4zMYYmg2HdJClaiSflbfS7YosESawRNUHBqNOmfgp3DTlQERvwk3IxXxkozWOZekJksZz2v3uVw==
X-Received: by 10.84.233.207 with SMTP id m15mr36107582pln.424.1511750129173; 
	Sun, 26 Nov 2017 18:35:29 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:35:03 -0800
Message-Id: <1511750112-2263-17-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 17/26] binutls: Security fix for CVE-2017-9748
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:28 -0000

affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-9748.patch          | 46 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9748.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 6822adb..8a19ac6 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -59,6 +59,7 @@ SRC_URI = "\
      file://CVE-2017-9745.patch \
      file://CVE-2017-9746.patch \
      file://CVE-2017-9747.patch \
+     file://CVE-2017-9748.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9748.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9748.patch
new file mode 100644
index 0000000..0207023
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9748.patch
@@ -0,0 +1,46 @@
+From 63634bb4a107877dd08b6282e28e11cfd1a1649e Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 15 Jun 2017 12:44:23 +0100
+Subject: [PATCH] Avoid a possible compiler bug by using a static buffer
+ instead of a stack local buffer.
+
+	PR binutils/21582
+	* ieee.c (ieee_object_p): Use a static buffer to avoid compiler
+	bugs.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9748
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/ieee.c    | 2 +-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+Index: git/bfd/ieee.c
+===================================================================
+--- git.orig/bfd/ieee.c
++++ git/bfd/ieee.c
+@@ -1875,7 +1875,7 @@ ieee_object_p (bfd *abfd)
+   char *processor;
+   unsigned int part;
+   ieee_data_type *ieee;
+-  unsigned char buffer[300];
++  static unsigned char buffer[300];
+   ieee_data_type *save = IEEE_DATA (abfd);
+   bfd_size_type amt;
+ 
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,5 +1,9 @@
+ 2017-06-15  Nick Clifton  <nickc@redhat.com>
+ 
++       PR binutils/21582
++       * ieee.c (ieee_object_p): Use a static buffer to avoid compiler
++       bugs.
++
+        PR binutils/21581
+        (ieee_archive_p): Likewise.
+ 
-- 
2.7.4


