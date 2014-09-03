Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 02DF570F28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 17:28:14 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id et14so17958547pad.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 10:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=9WTzJphfatKtZpXYBH6eDy6gryLekwDvyYHphE473xQ=;
	b=CqrAcrHN01WtR2Wg1MzsUmyJCmtdYT3am7iQ+85Kj7I2Cbbzg/rC3O/fUHw8BVEZby
	o10jg7awwKG29Aw4umlCLTpMzYXApoKQyFYLzrEMSrbwF2nr73bTQkI8Xh9FEX9mAt4E
	aGcbq6ZSnCozIs8bwLcIhC7sdQEWuub9QTy/yYPyJKpNjVWWrDWvVIgBhYVWjKgABzja
	VvnpX2iLiZpHY0zHoBFQ79EzJPG0WWqerZ+uLfoqj3fsBFKxCKjG1R9bdwmjWsMJPZ2e
	LGbZZ4h+/Hu0e5i3vzl94wu/bx9ZNv+8vQTB4qvsJIysDakj4Vw8t2wsRRzHmMjgKBLI
	uYbw==
X-Received: by 10.70.47.161 with SMTP id e1mr61108725pdn.71.1409765291589;
	Wed, 03 Sep 2014 10:28:11 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id zm5sm7367263pbb.76.2014.09.03.10.28.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Sep 2014 10:28:10 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Sep 2014 10:27:43 -0700
Message-Id: <296b6b0727ada91d72244307146189428b73204b.1409764769.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/8] setserial: obey LDFLAGS
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
X-List-Received-Date: Wed, 03 Sep 2014 17:28:15 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-bsp/setserial/setserial/ldflags.patch | 23 ++++++++++++++++++++++
 meta/recipes-bsp/setserial/setserial_2.17.bb       |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-bsp/setserial/setserial/ldflags.patch

diff --git a/meta/recipes-bsp/setserial/setserial/ldflags.patch b/meta/recipes-bsp/setserial/setserial/ldflags.patch
new file mode 100644
index 0000000..33f23b8
--- /dev/null
+++ b/meta/recipes-bsp/setserial/setserial/ldflags.patch
@@ -0,0 +1,23 @@
+---
+ Makefile.in |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+--- setserial-2.17.orig/Makefile.in
++++ setserial-2.17/Makefile.in
+@@ -13,6 +13,7 @@ STRIP = @STRIP@
+ CC = @CC@
+ RM = rm -f
+ CFLAGS = @CFLAGS@
++LDFLAGS = @LDFLAGS@
+ DEFS = @DEFS@
+ INCS = -I.
+ TAR = tar
+@@ -20,7 +21,7 @@ TAR = tar
+ all: setserial setserial.cat
+ 
+ setserial: setserial.c
+-	$(CC) $(CFLAGS) $(DEFS) $(INCS) setserial.c -o setserial
++	$(CC) $(CFLAGS) $(LDFLAGS) $(DEFS) $(INCS) setserial.c -o setserial
+ 
+ setserial.cat: setserial.8
+ 	nroff -man setserial.8 > setserial.cat
diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-bsp/setserial/setserial_2.17.bb
index f1e8cd3..8dbddd7 100644
--- a/meta/recipes-bsp/setserial/setserial_2.17.bb
+++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
@@ -14,6 +14,7 @@ inherit autotools-brokensep
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/setserial/${BPN}-${PV}.tar.gz \
            file://add_stdlib.patch \
+           file://ldflags.patch \
           "
 
 SRC_URI[md5sum] = "c4867d72c41564318e0107745eb7a0f2"
-- 
1.8.3.4


