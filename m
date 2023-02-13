Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84BDC636D7
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 02:38:24 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.5751.1676255903192861156
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 18:38:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pa4kRZPl;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676255901; i=@fujitsu.com;
	bh=SdboPm917aFCIb+rLjh+hiyf35UN/HHkCgmMZBPAWyI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pa4kRZPl29QmuqPZFtMh9Bv9HSP+YMw/HTEhPTeHQ8O80OyGBeVDyjZQQ4bK7OUE8
	 H2E/hbE8wFZCKKuyWryksoyervW9C21am4y+vKhvsjUkegBycPNQTCFrocEGRIovnT
	 tmxy3Dc2jR5YD4FDDu2ju3BkR7N3uxBBr7pZ8jHf5+GBCC2/WUwin/1Zw/t54sd3Ac
	 4HhGpumJp1YOx7b0LH8s+i4X+CpIzBp8EpjIygmLzjVrHVqsCnnBbPGHu60ICufQ4r
	 z9Jioz64XpF5MF95eZToY21f/QRcoMwh2zV13+KNtJmvPIzkSPwROwdqMCq36r+Qda
	 mNJ7Rv3kcX63w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8ORpDtn0ct
  kgzf7hSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oz1144wFtwVrnh45QxjA+NpwS5GTg4hgQeM
  En0v47oYuYDsy0wSn4+0sUE4exklvtzfzwJSxSYgJXHj/n+gBAeHiICexNV/oiBhZgEViRe/e
  9hBbGEBW4mLDU3sICUsAqoS03qKQUxeASeJ92+kQSokBBQkpjx8zwxicwo4S3ze8pEV4gSgkk
  lzmEBsXgFBiZMzn7BATJeQOPjiBTNEr6LE7MvNLBB2pUTrh19QtprE1XObmCcwCs5C0j4LSfs
  CRqZVjKbFqUVlqUW6xnpJRZnpGSW5iZk5eolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgUGbUszct4Pxa+9fvUOMkhxMSqK8fRwvk4X4kvJTKjMSizPii0pzUosPMcpwcChJ8
  EotAMoJFqWmp1akZeYAIwgmLcHBoyTCazEBKM1bXJCYW5yZDpE6xajLsWlf1wFmIZa8/LxUKX
  Fe/oVARQIgRRmleXAjYNF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7+5ZQFN4MvNK4Da
  9AjqCCeiIx3xgR5QkIqSkGpg2n8t91aDyPJsz+oX4neIZBx9dTcyTVPszeXdv94u0qohA7t+B
  Vwqy1nXU3g62nF5+nuflaqbCK3VqzGJ/jSX1haQrJ2ws+rM0VrDxVMf7qT1M/uvfftjEk2nZ+
  9AlJ+vN839qJvOr7Mon+nUG8u/SP3bO/9ymebF3Dk5U0XkSpPjP4ZSh3KLJ7vErjr69+UT82s
  OWNQbZD2/uW53knOS+9Kqr/czWD9squprPTIxzMmmcz2C8Y/ui+qsPpzoVHPKa+qmubrlp/5r
  usr/Mxid0Lt5kXL3AarHzhmzL4CndOopN/G/DhbgEM8MsC9o7Dk9P67HcFXdvz87XixZtDv4c
  dnHPwhslD7zVrff5PypVYinOSDTUYi4qTgQAaLwLcmEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-585.messagelabs.com!1676255900!525135!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6496 invoked from network); 13 Feb 2023 02:38:20 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Feb 2023 02:38:20 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E3E7F1AC
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:38:19 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D88017B
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:38:19 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 13 Feb 2023 02:38:18 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lighttpd: upgrade 1.4.68 -> 1.4.69
Date: Mon, 13 Feb 2023 10:37:54 +0800
Message-ID: <1676255874-19490-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676255874-19490-1-git-send-email-wangmy@fujitsu.com>
References: <1676255874-19490-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177076

From: Wang Mingyu <wangmy@fujitsu.com>

fix-missing-test.patch
removed since it's included in new verion.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lighttpd/lighttpd/fix-missing-test.patch  | 23 -------------------
 ...{lighttpd_1.4.68.bb => lighttpd_1.4.69.bb} |  3 +--
 2 files changed, 1 insertion(+), 25 deletions(-)
 delete mode 100644 meta/recipes-extended/lighttpd/lighttpd/fix-missing-test.patch
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.68.bb => lighttpd_1.4.69.bb} (96%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd/fix-missing-test.patch b/meta/recipes-extended/lighttpd/lighttpd/fix-missing-test.patch
deleted file mode 100644
index 6aa843b75d..0000000000
--- a/meta/recipes-extended/lighttpd/lighttpd/fix-missing-test.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From d809433d6d900e899f796606b11bdc6a73413ac5 Mon Sep 17 00:00:00 2001
-From: Glenn Strauss <gstrauss@gluelogic.com>
-Date: Tue, 3 Jan 2023 17:50:16 -0500
-Subject: [PATCH] [meson] remove t/test_mod_evasive.c
-
-Upstream-Status: Backport [https://github.com/lighttpd/lighttpd1.4/commit/d809433d6d900e899f796606b11bdc6a73413ac5]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index ff472c320..77089fc3c 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -721,7 +721,6 @@ test('test_mod', executable('test_mod',
- 		't/test_mod.c',
- 		't/test_mod_access.c',
- 		't/test_mod_alias.c',
--		't/test_mod_evasive.c',
- 		't/test_mod_evhost.c',
- 		't/test_mod_indexfile.c',
- 		't/test_mod_simple_vhost.c',
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.69.bb
similarity index 96%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.69.bb
index a9163f8492..8570d85f5e 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.69.bb
@@ -17,10 +17,9 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://index.html.lighttpd \
            file://lighttpd.conf \
            file://lighttpd \
-           file://fix-missing-test.patch \
            "
 
-SRC_URI[sha256sum] = "e56f37ae52b63e1ada4d76ce78005affb6e56eea2f6bdb0ce17d6d36e9583384"
+SRC_URI[sha256sum] = "16ac8db95e719629ba61949b99f8a26feba946a81d185215b28379bb4116b0b4"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.34.1


