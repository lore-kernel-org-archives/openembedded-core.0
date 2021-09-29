Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB1DC433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 03:29:08 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.4220.1632886147361460198
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 20:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: qi.chen@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18T3T5m2005002
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 20:29:06 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18T3T5FL005042
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 20:29:05 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 20:29:05 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 28 Sep 2021 20:29:04 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 28 Sep 2021 20:29:04 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] systemd: fix CVE-2021-33910
Date: Tue, 28 Sep 2021 20:29:04 -0700
Message-ID: <20210929032904.115721-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 03:29:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156438

Backport patch to fix CVE-2021-33910.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...it-name-do-not-use-strdupa-on-a-path.patch | 72 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_247.6.bb    |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch b/meta/recipes-core/systemd/systemd/0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch
new file mode 100644
index 0000000000..0ab8174441
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch
@@ -0,0 +1,72 @@
+From b00674347337b7531c92fdb65590ab253bb57538 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Wed, 23 Jun 2021 11:46:41 +0200
+Subject: [PATCH] basic/unit-name: do not use strdupa() on a path
+
+The path may have unbounded length, for example through a fuse mount.
+
+CVE-2021-33910: attacked controlled alloca() leads to crash in systemd and
+ultimately a kernel panic. Systemd parses the content of /proc/self/mountinfo
+and each mountpoint is passed to mount_setup_unit(), which calls
+unit_name_path_escape() underneath. A local attacker who is able to mount a
+filesystem with a very long path can crash systemd and the whole system.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1970887
+
+The resulting string length is bounded by UNIT_NAME_MAX, which is 256. But we
+can't easily check the length after simplification before doing the
+simplification, which in turns uses a copy of the string we can write to.
+So we can't reject paths that are too long before doing the duplication.
+Hence the most obvious solution is to switch back to strdup(), as before
+7410616cd9dbbec97cf98d75324da5cda2b2f7a2.
+
+(cherry picked from commit 441e0115646d54f080e5c3bb0ba477c892861ab9)
+(cherry picked from commit 764b74113e36ac5219a4b82a05f311b5a92136ce)
+(cherry picked from commit 4a1c5f34bd3e1daed4490e9d97918e504d19733b)
+
+CVE: CVE-2021-33910
+Upstream-Status: Backport [b00674347337b7531c92fdb65590ab253bb57538]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/unit-name.c | 13 +++++--------
+ 1 file changed, 5 insertions(+), 8 deletions(-)
+
+diff --git a/src/basic/unit-name.c b/src/basic/unit-name.c
+index 5f595af944..9b6cacde87 100644
+--- a/src/basic/unit-name.c
++++ b/src/basic/unit-name.c
+@@ -378,12 +378,13 @@ int unit_name_unescape(const char *f, char **ret) {
+ }
+ 
+ int unit_name_path_escape(const char *f, char **ret) {
+-        char *p, *s;
++        _cleanup_free_ char *p = NULL;
++        char *s;
+ 
+         assert(f);
+         assert(ret);
+ 
+-        p = strdupa(f);
++        p = strdup(f);
+         if (!p)
+                 return -ENOMEM;
+ 
+@@ -395,13 +396,9 @@ int unit_name_path_escape(const char *f, char **ret) {
+                 if (!path_is_normalized(p))
+                         return -EINVAL;
+ 
+-                /* Truncate trailing slashes */
++                /* Truncate trailing slashes and skip leading slashes */
+                 delete_trailing_chars(p, "/");
+-
+-                /* Truncate leading slashes */
+-                p = skip_leading_chars(p, "/");
+-
+-                s = unit_name_escape(p);
++                s = unit_name_escape(skip_leading_chars(p, "/"));
+         }
+         if (!s)
+                 return -ENOMEM;
+-- 
+2.33.0
+
diff --git a/meta/recipes-core/systemd/systemd_247.6.bb b/meta/recipes-core/systemd/systemd_247.6.bb
index eb31dabca0..571a1efe8b 100644
--- a/meta/recipes-core/systemd/systemd_247.6.bb
+++ b/meta/recipes-core/systemd/systemd_247.6.bb
@@ -31,6 +31,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0002-sd-dhcp-client-shorten-code-a-bit.patch \
            file://0003-sd-dhcp-client-logs-when-dhcp-client-unexpectedly-ga.patch \
            file://0004-sd-dhcp-client-tentatively-ignore-FORCERENEW-command.patch \
+           file://0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch \
            "
 
 # patches needed by musl
-- 
2.33.0


