Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE63C433F5
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 03:38:36 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.3673.1634873915606680624
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 20:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19M3cYpu006535
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 20:38:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19M3cPFH022302
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 20:38:33 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 21 Oct 2021 20:38:25 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 21 Oct 2021 20:38:23 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sudo: update multilib patch for sudo.conf
Date: Fri, 22 Oct 2021 11:38:21 +0800
Message-ID: <20211022033821.36375-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Oct 2021 03:38:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157292

From: Kai Kang <kai.kang@windriver.com>

Update multilib patch for sudo.conf that there is one more replacement
of @plugindir@ to avoid installation conflict.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...o.conf.in-fix-conflict-with-multilib.patch | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index f7ccfdd623..f4fc376bb8 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -13,11 +13,11 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 Upstream-Status: Inappropriate [OE configuration specific]
 ---
- examples/sudo.conf.in | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
+ examples/sudo.conf.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/examples/sudo.conf.in b/examples/sudo.conf.in
-index 19e33ff..af78235 100644
+index 6535d3a..50afc8f 100644
 --- a/examples/sudo.conf.in
 +++ b/examples/sudo.conf.in
 @@ -4,7 +4,7 @@
@@ -29,7 +29,16 @@ index 19e33ff..af78235 100644
  #   fully qualified.
  # The plugin_name corresponds to a global symbol in the plugin
  #   that contains the plugin interface structure.
-@@ -50,7 +50,7 @@ Plugin sudoers_audit sudoers.so
+@@ -51,7 +51,7 @@
+ # The compiled-in value is usually sufficient and should only be changed
+ # if you rename or move the sudo_intercept.so file.
+ #
+-#Path intercept @plugindir@/sudo_intercept.so
++#Path intercept $plugindir/sudo_intercept.so
+ 
+ #
+ # Sudo noexec:
+@@ -65,7 +65,7 @@
  # The compiled-in value is usually sufficient and should only be changed
  # if you rename or move the sudo_noexec.so file.
  #
@@ -38,7 +47,7 @@ index 19e33ff..af78235 100644
  
  #
  # Sudo plugin directory:
-@@ -59,7 +59,7 @@ Plugin sudoers_audit sudoers.so
+@@ -74,7 +74,7 @@
  # The default directory to use when searching for plugins that are
  # specified without a fully qualified path name.
  #
-- 
2.17.1


