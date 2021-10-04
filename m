Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A99FC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 18:25:49 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.14078.1633371947543711383
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 11:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="311744762"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="311744762"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:02 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="483208805"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.128.172])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:01 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/11] systemd: fix CVE-2021-33910
Date: Tue,  5 Oct 2021 00:50:45 +0800
Message-Id: 
 <866a880c4fb58dea1e8460acea8152658376cd12.1633366030.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633366030.git.anuj.mittal@intel.com>
References: <cover.1633366030.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 18:25:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156623

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2021-33910.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
index f1db1e922b..e79c79a7fd 100644
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
2.31.1


