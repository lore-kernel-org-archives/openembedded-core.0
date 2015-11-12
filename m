Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id D57FE77288
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:39:51 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so79691051pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=mH1bzkifWjFMzLiXAw8kQOJ6lsVnT67WSdgaPm5XQ70=;
	b=yba+LEyoP1xPWK4QJWXmPde7V9dC+8v2OWQx3MtJebGqaXcdAAuTOXJH5pJWUZLbVW
	ssF4exqnaQQRkRLV7jPPn8hV0c26j1qJiSqfuFUGQPSRZ3oD+l/baqmG5awpuW7BQwDQ
	cyV8gxZjf4/o/ylg53zHjorPvxxgx/HUaw5klxT+wAO5J7Cp0Qo0Wu1LLp50m5JgQekX
	TmaIqGqImthvPCAAeZ3iMzVNjGdjjFs2haBEH753ODFFBl1aNamrWc9XmzYHDC108eg6
	lRNMJwFOjTxnUxskyas/2sU+kSd+7d54EXHoW8uYokWVWFjDmWW9THJaV/p7BTIyTxPX
	1ISQ==
X-Received: by 10.67.24.97 with SMTP id ih1mr27332129pad.65.1447371591845;
	Thu, 12 Nov 2015 15:39:51 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	cs5sm16739866pbc.15.2015.11.12.15.39.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:39:50 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:39:16 -0700
Message-Id: <e72f75fbff0903bd7be7d30443ba222a68aa6221.1447371033.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
References: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371033.git.chris_larson@mentor.com>
References: <cover.1447371033.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 05/11] tcf-agent: obey LDFLAGS
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
X-List-Received-Date: Thu, 12 Nov 2015 23:39:51 -0000

From: Christopher Larson <chris_larson@mentor.com>

This silences a GNU_HASH warning when using external toolchains. The patch is
courtesy Abdur Rehman <abdur_rehman@mentor.com>.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../tcf-agent/tcf-agent/ldflags.patch              | 28 ++++++++++++++++++++++
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
new file mode 100644
index 0000000..c03c55d
--- /dev/null
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+From d92af0483c20365fd0af740d0baef8870b4aa374 Mon Sep 17 00:00:00 2001
+From: Abdur Rehman <abdur_rehman@mentor.com>
+Date: Wed, 26 Aug 2015 19:18:11 +0500
+Subject: [PATCH] tcf-agent: obey LDFLAGS
+
+Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
+---
+ Makefile.inc |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.inc b/Makefile.inc
+index 959028f..3148942 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -96,7 +96,7 @@ NO_LINK_F	?= -c
+ # Linker definition and flags
+ 
+ LINK		?= $(CC)
+-LINK_FLAGS	?= $(CFLAGS)
++LINK_FLAGS	?= $(LDFLAGS) $(CFLAGS)
+ LINK_OUT_F	?= $(OUT_OBJ_F)
+ 
+ # Archiver definition and flags
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index f8fd390..1337da9 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -10,6 +10,7 @@ PV = "1.3.0+git${SRCPV}"
 
 SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;branch=1.3_mars_bugfix \
            file://fix_ranlib.patch \
+           file://ldflags.patch \
            file://tcf-agent.init \
            file://tcf-agent.service \
           "
-- 
2.2.1


