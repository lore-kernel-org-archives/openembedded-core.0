Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4FBC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 06:59:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.8412.1667545175343489232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 23:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kVg55GAq;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667545173; i=@fujitsu.com;
	bh=tVKkvOmLw82m/YOQFpJNJwDkG+YD7SWjhZd/fq/DRm8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kVg55GAqJKPXBRvvhw08PzD+G6X1T3jlWD8xw7ss9fVczyGrnEIQ0tylKUOKZJ9CC
	 cqh4C8FNElc4at7u+QRsDvfrI/aZKHzs2c8HOrYewU7z2N1MBLWi5pk8CxnPhzgAGP
	 H/d9ndLfjLFSQuT3JGGLgIdoQFT64DrUTBS7l8O7QMnzNthBAL1ReSumGt2F5S593O
	 YY+fi0OlhwqaJA+uOUNQca2DkO4NVoiyBRnPtsgZ5ihSo5OO/lofw6BfZgVSR2S/n6
	 DDPsq5c/7AZKU2C+3bvp/zn7uHpCcBoCAAZ8aY5j57jQSYCM2S7nF2BNCbB9OOIlg6
	 I7ynG3h03F9XQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8OxWTdkR0q
  yQc9Wa4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePj719MBT1cFW+OLmZtYFzI2cXIxSEk8IBR
  YtWrbiYI5zKTxO+uz6wQzn5Gib6Nh4AynBxsAgoSC7eeAUpwcIgI6Elc/ScKEhYWcJDo+3OcB
  cRmEVCRWNu5jB3E5hVwl1i7azoziC0B1Drl4XtmiLigxMmZT8DqmQUkJA6+eMEMMlJCQFFi9n
  R5iPIKiVmz2pggbDWJq+c2MU9g5JuFpHsWku4FjEyrGM2KU4vKUot0DQ31kooy0zNKchMzc/Q
  Sq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTyUks2MQJDLqVYLWAH48dlf/QOMUpyMCmJ
  8tbxpiQL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDN2waUEyxKTU+tSMvMAYY/TFqCg0dJhPf3P
  KA0b3FBYm5xZjpE6hSjJcfU2f/2M3MsB5Mzv7YdYBZiycvPS5US53XeDtQgANKQUZoHNw4Wo5
  cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOGg1zFk5lXArf1FdBBTEAHbatOAjmoJBEhJdX
  ANEtt5rVVzwMn880//Ifz0s67kh8VuybbM2QnrJJ+tuROw9FZs3tyOgV6z28vnONj1GHFnvLw
  fZdmxrLrGufqODzZ8ya41QtdXj2Z07Ha5lRR0U/evJWP8rbFtHy5XS44RW4116cnzrPudz6TZ
  Of9Mf0+g/++cyysWw5bd5ZcmuDqYnLHeZvLzcuTbBPn8eZsfS4f355x+0ST6Zf4Evnl7/uWJM
  ccyGs14Vx/UPDcaft5MczMh3IDzuZm+815bqQXL3q2/Zil+y4bCXu31TUG8oGF2eE3nm38df1
  xwK7py9e3/LY34k5pmr8s8ZFW2HMNb62/Zx6nsK1jnxRrpdotoKZzobl0/2vDzNMZ7zYKKLEU
  ZyQaajEXFScCAHjhlCRMAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1667545172!17890!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1307 invoked from network); 4 Nov 2022 06:59:32 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Nov 2022 06:59:32 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id AA1F5152
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:59:32 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9DB39151
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:59:32 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 4 Nov 2022 06:59:31 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-pbr: upgrade 5.10.0 -> 5.11.0
Date: Fri, 4 Nov 2022 14:59:24 +0800
Message-ID: <1667545164-2588-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 06:59:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172701

Changelog:
=========
* Fix symbol identification in multiline message
* Replace deprecated readfp method with read\_file

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta/recipes-devtools/python/python3-pbr_5.10.0.bb | 4 ----
 meta/recipes-devtools/python/python3-pbr_5.11.0.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.10.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.11.0.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.10.0.bb b/meta/recipes-devtools/python/python3-pbr_5.10.0.bb
deleted file mode 100644
index 022f834901..0000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.10.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-
-SRC_URI[sha256sum] = "cfcc4ff8e698256fc17ea3ff796478b050852585aa5bae79ecd05b2ab7b39b9a"
diff --git a/meta/recipes-devtools/python/python3-pbr_5.11.0.bb b/meta/recipes-devtools/python/python3-pbr_5.11.0.bb
new file mode 100644
index 0000000000..16967f6d17
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.11.0.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-pbr.inc
+
+SRC_URI[sha256sum] = "b97bc6695b2aff02144133c2e7399d5885223d42b7912ffaec2ca3898e673bfe"
-- 
2.25.1


