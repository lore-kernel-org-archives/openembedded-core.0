Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0EE601A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Apr 2014 10:23:14 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id z11so3019400lbi.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Apr 2014 03:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=zZp4gPHFJLkh0nzwLTDHIYcdnlBNuty8f63PDM+rVo8=;
	b=ZbJoZ1rcHzhruGB+ONNZLGrFbPUSjV13F1QIca/Mof0DdtZ1pvngpcnUQG0UGoyDAk
	4QBFBKR51f9XwbCMTbEzdC0A7198bb6Zs6Sxa2DR/hLAuJF4RVN0DgT3OjYiWh3xXMTg
	QhwG3ghoVEer6ek1kk+JA4SZbY6VryhhhgX0UZCp5d08tU87Fkksl7YTYyLI6kmesikI
	s39+ietMJdV0Q/4liXfpe3Khp/sV8a2rjIR397ulJZx9VjBuH9+vWtCz1Tb3WBOnuTL9
	oqr6Adt7x8KA22h+O82Iu4nOMxffEv8E2ITEZbJvelT/gNS9iqnwhXkJA0HDCbfSxc5D
	wGpw==
X-Received: by 10.152.26.66 with SMTP id j2mr26973229lag.25.1398075794821;
	Mon, 21 Apr 2014 03:23:14 -0700 (PDT)
Received: from localhost.localdomain (c83-249-172-217.bredband.comhem.se.
	[83.249.172.217])
	by mx.google.com with ESMTPSA id z10sm36970543lbu.1.2014.04.21.03.23.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 03:23:14 -0700 (PDT)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Apr 2014 12:23:00 +0200
Message-Id: <1398075780-18038-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] console-tools: Remove floating runtime dependency on flex
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
X-List-Received-Date: Mon, 21 Apr 2014 10:23:17 -0000

The 'loadkeys' program defines its own yywrap()/yylex() functions,
there is no need to link with flex shared library.

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 .../console-tools-0.3.2/no-dep-on-libfl.patch         | 19 +++++++++++++++++++
 .../recipes-core/console-tools/console-tools_0.3.2.bb |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/no-dep-on-libfl.patch

diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/no-dep-on-libfl.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/no-dep-on-libfl.patch
new file mode 100644
index 0000000..a6735a5
--- /dev/null
+++ b/meta/recipes-core/console-tools/console-tools-0.3.2/no-dep-on-libfl.patch
@@ -0,0 +1,19 @@
+No reason to link with libfl since 'loadkeys' implements
+its own yywrap()/yylex() functions.
+
+Upstream-Status: Pending
+Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
+
+Index: console-tools-0.3.2/kbdtools/Makefile.am
+===================================================================
+--- console-tools-0.3.2.orig/kbdtools/Makefile.am
++++ console-tools-0.3.2/kbdtools/Makefile.am
+@@ -19,8 +19,6 @@ LDADD = ../lib/ctlocal/libctlocal.a ../l
+ 	../lib/cfont/libcfont.la \
+ 	../lib/console/libconsole.la ../lib/generic/libctgeneric.la
+ 
+-loadkeys_LDADD = $(LDADD) @LEXLIB@
+-
+ bin_SCRIPTS = mk_modmap
+ 
+ noinst_HEADERS = loadkeys.h
diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index 80fab55..c60a5a0 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
            file://uclibc-fileno.patch \
            file://nodocs.patch \
            file://fix-libconsole-linking.patch \
+           file://no-dep-on-libfl.patch \
            file://lcmessage.m4 \
            file://Makevars"
 
-- 
1.9.0


