Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F56C64EC4
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 10:19:36 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.38673.1676974769430650956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 02:19:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GjK5bkxt;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676974767; i=@fujitsu.com;
	bh=+v5/wTndfV/kILCiZBGA3/tjE0Bki0fTEL3XC4sBzbc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GjK5bkxtXpSsY2TC5HOHxcPPUTol6w4rtp84GR5xbVEK5mt+9teXegwMBY7ozepj+
	 4X50QbO2qEcuYE/5ML8M8KMW0j7fRjp6aH1yELcnDAhz6j99zh6Mpp6/CrHPbkrMu1
	 yxUJt91Bykz9hx2unL8pbcNSQvr76dIKkRgtYVSZJq50aKG32TaIZ3zlBnpznmPBN1
	 wEkJ1M3dKUE0ccVn4bIKvSzcDyebiGEbMTVjEswjzu8xMkCP76Hw3WmriP0iAWV8vF
	 K/yHN3zQLVCD3MScKwiTQzGAzzygMcPZOhTx8kfwrra61WkfYgqTDPBx64a4NaUBnH
	 4ZmA/VHEj4Sfw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8OxWXftrC/
  JBg+3Clrc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBkHZn9lLnjDXfFwtXsD4xmuLkYuDiGBB4wS
  s1e+YIJwrjBJtN39xgjh7GWUmLS6jbWLkZODTUBK4sb9/2xdjBwcIgJ6Elf/iYKEmQVUJF787
  mEHCQsL2Eq03OEFCbMIqErcOfQZrJNXwEmi7eh0RhBbQkBBYsrD98wg5ZwCzhJzm2JBwkJAJa
  8uLWWDKBeUODnzCQvEdAmJgy9eMEO0KkrMvtzMAmFXSrR++AVlq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFqcWlSWWqRrqpdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOi
  l5dasokRGLQpxWq7djBO6Purd4hRkoNJSZT326nPyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  P2mf0kWEixKTU+tSMvMAUYQTFqCg0dJhLeuCyjNW1yQmFucmQ6ROsWoKCXOO2kGUEIAJJFRmg
  fXBovaS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeStApvBk5pXATX8FtJgJaLH7jw8gi0s
  SEVJSDUxHdZdGKJvtXh2uFasgVeO8K+TOAznPb88uhYmUStRZaXC2pFurnfXJULvDlf8nOv3V
  nQj2wNIWXdGQb5OYhc7rn/gieeiGrtKT57823Luf1vngRvV2K+27j+LN/illH2F/GXKGY4HFv
  Cts3p9lI57O4LwUuMBjd0O77GTVg23JTPNv/1KwerGlYubJWQvtlSWz7gX13b/w2iR9ng3ry5
  Sy8uvCny9H98Z7pKQePMs05dDhJIXb3/2frFL23PTY9Brnca0eL52fXD9Ffh26uqw6coHhBJa
  n796YfN5uvfbn7j3Oi778W2xazi0520z2RMu/sLuam8v8pTdJ5XKvmrHsdp31HZ0LR3JWdIdc
  0KhXYinOSDTUYi4qTgQAus3B/lUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-565.messagelabs.com!1676974765!1448333!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 811 invoked from network); 21 Feb 2023 10:19:25 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Feb 2023 10:19:25 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 02F47156
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:19:25 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id F26B0153
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:19:24 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 21 Feb 2023 10:19:23 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pip: update 23.0 -> 23.0.1
Date: Tue, 21 Feb 2023 18:18:56 +0800
Message-ID: <1676974737-24910-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676974737-24910-1-git-send-email-wangmy@fujitsu.com>
References: <1676974737-24910-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:19:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177485

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Features
--------
- Ignore PIP_REQUIRE_VIRTUALENV for "pip index"
- Implement "--break-system-packages" to permit installing packages into
  "EXTERNALLY-MANAGED" Python installations.

Bug Fixes
---------
- Improve handling of isolated build environments on platforms that
  customize the Python's installation schemes, such as Debian and
  Homebrew.
- Do not crash in presence of misformatted hash field in "direct_url.json".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pip_23.0.bb => python3-pip_23.0.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_23.0.bb => python3-pip_23.0.1.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip_23.0.bb b/meta/recipes-devtools/python/python3-pip_23.0.1.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_23.0.bb
rename to meta/recipes-devtools/python/python3-pip_23.0.1.bb
index 8b956932c3..d9b9906ff9 100644
--- a/meta/recipes-devtools/python/python3-pip_23.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_23.0.1.bb
@@ -33,7 +33,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "aee438284e82c8def684b0bcc50b1f6ed5e941af97fa940e83e2e8ef1a59da9b"
+SRC_URI[sha256sum] = "cd015ea1bfb0fcef59d8a286c1f8bebcb983f6317719d415dc5351efb7cd7024"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.34.1


