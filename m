Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 83858775DA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 11:01:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v568Y8CQ002491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jun 2017 01:34:53 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 6 Jun 2017 01:34:08 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Jun 2017 16:36:17 +0800
Message-ID: <3fb6b8bc67e9762936807054182fabb86d28f680.1496738086.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1496738086.git.Qi.Chen@windriver.com>
References: <cover.1496738086.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] kmod: upgrade to 24
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
X-List-Received-Date: Tue, 06 Jun 2017 11:01:03 -0000
Content-Type: text/plain

Drop kcmdline_quotes.patch as it has been integrated.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/kmod/kmod.inc                  |  5 +--
 .../recipes-kernel/kmod/kmod/kcmdline_quotes.patch | 44 ----------------------
 2 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/kcmdline_quotes.patch

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index ba80fc5..7fb10b5 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -14,15 +14,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools gtk-doc pkgconfig manpages
 
-SRCREV = "65a885df5f6f15222b44fd695c5eaca17e837a14"
+SRCREV = "ef4257b59c4307b8c627d89f3c7f1feedb32582f"
 # Lookout for PV bump too when SRCREV is changed
-PV = "23+git${SRCPV}"
+PV = "24+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
            file://avoid_parallel_tests.patch \
            file://fix-O_CLOEXEC.patch \
-           file://kcmdline_quotes.patch \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/kmod/kmod/kcmdline_quotes.patch b/meta/recipes-kernel/kmod/kmod/kcmdline_quotes.patch
deleted file mode 100644
index 46bdec5..0000000
--- a/meta/recipes-kernel/kmod/kmod/kcmdline_quotes.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 4a6f92a10680e7e36807f5e2ae8e497e8d73a048 Mon Sep 17 00:00:00 2001
-From: James Minor <james.minor@ni.com>
-Date: Fri, 20 Jan 2017 17:15:50 -0600
-Subject: [PATCH] libkmod: Fix handling of quotes in kernel command line
-
-If a module parameter on the command line contains quotes, any
-spaces inside those quotes should be included as part of the
-parameter.
-
-Signed-off-by: James Minor <james.minor@ni.com>
-
-Upstream-Status: Accepted
----
- libkmod/libkmod-config.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
-index 57fbe37..ea40d19 100644
---- a/libkmod/libkmod-config.c
-+++ b/libkmod/libkmod-config.c
-@@ -497,6 +497,7 @@ static int kmod_config_parse_kcmdline(struct kmod_config *config)
- 	char buf[KCMD_LINE_SIZE];
- 	int fd, err;
- 	char *p, *modname,  *param = NULL, *value = NULL, is_module = 1;
-+	bool is_quoted = false;
- 
- 	fd = open("/proc/cmdline", O_RDONLY|O_CLOEXEC);
- 	if (fd < 0) {
-@@ -514,6 +515,12 @@ static int kmod_config_parse_kcmdline(struct kmod_config *config)
- 	}
- 
- 	for (p = buf, modname = buf; *p != '\0' && *p != '\n'; p++) {
-+		if (*p == '"') {
-+			is_quoted = !is_quoted;
-+			continue;
-+		}
-+		if (is_quoted)
-+			continue;
- 		switch (*p) {
- 		case ' ':
- 			*p = '\0';
--- 
-1.9.1
-
-- 
1.9.1


