Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E70DC77B75
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 06:06:40 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.5569.1682057197776147597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 23:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KTDdTwiq;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682057195; i=@fujitsu.com;
	bh=IbSBP1SpdrVX92wvX+tYwkbVduivJJtbxTvKwjCSV40=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KTDdTwiq60kOmM9NeDrxqxjCZfW0qUa6IHY1eXl028aAJ2gLV71TWtra1CtLgLx0f
	 w7IWAxqwQ6dL/emXRY6BmQ8gRVi+b6nF4RWsCZjxXwZPOGdRRt3hHBJ/rsOQ6+vqX/
	 5nVkif1C9axRRaWavRt7jj3hBqO7uOevqLahsQpLfgGU+5Oz6dJP3rUWaue5vZ5hC9
	 CQTcDkT5lXKis2PfBsve/Sgu50qcO77h6DZN/YyO1fUqSDiqtFr7O6gvG1IPZR+Q+V
	 YS706hjPTWx1oS/qJjzZaIZaTsUXcOfoWsWIldJ8UmiAyyUg3IA5+xKaAf4blfQGl8
	 AFwUbsstd2Zkg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpPta3Sn
  F4FWvsMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvFr1SK2gsvsFdfmTmNqYPzC1sXIxSEk8IBR
  4s3rv1DOFSaJhu+L2SGcvYwS02Z2M3UxcnKwCUhJ3Lj/H6iKg0NEQE/i6j9RkDCzgIrEi9897
  CC2sECoxOsvV9hAbBYBVYmFM64yg9i8Ak4Sq/5uAauREFCQmPLwPVicU8BZ4k3Lb0YQWwio5t
  7lX1D1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7EqJ1g+/oGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNilOLylKLdE30kooy0zNKchMzc/QSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECgzelOCFtB2Nr31+9Q4ySHExKorwvdjukCPEl5adUZiQWZ8QXleakFh9ilOHgUJLg3
  abslCIkWJSanlqRlpkDjCSYtAQHj5IIbz9Imre4IDG3ODMdInWKUVFKnHebGlBCACSRUZoH1w
  aL3kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHk1galAiCczrwRu+iugxUxAix+KOYAsLkl
  ESEk1ME3h1lzz563pgmdnP0YH2J/SWbVA15Vlb+OynItyXt1XDUIeRTWzqkwT+1a/vYjRYV33
  0bAP3teyd5xdpS2RZM32+fom/+wfCwqCvhh8jP2dyLXyE5tR3v7l21c/ne11VnPx/9d6X3Rce
  /gk3p+ayeF8vNBZ/2J18b/zSVfkeM04Gpsvt9fudfUvZd1kuMzD/86iaX7XwnUmlGY9+n3w/6
  /Ehw0s2inMd+cWVwksO9HcLhwfnSpm3iX4lY1Veh/fvuYZDP7CfVp/7j8rL2SUeP5sDrOf74u
  /tvOfOAcW/vv8g2l+eJ14tdA67e9XXF80nle2fCVu92hHlGtwreeN2v55c1h9VYIFN9V0Ooee
  VGIpzkg01GIuKk4EAGAn7yhZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-732.messagelabs.com!1682057194!113422!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26807 invoked from network); 21 Apr 2023 06:06:35 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Apr 2023 06:06:35 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id BC7711B1
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 07:06:34 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B09451AF
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 07:06:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 21 Apr 2023 07:06:33 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 2/2] binutils: use update-alternatives for sframe-spec.info
Date: Fri, 21 Apr 2023 14:06:16 +0800
Message-ID: <1682057176-19939-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682057176-19939-1-git-send-email-wangmy@fujitsu.com>
References: <1682057176-19939-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 06:06:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180273

From: Wang Mingyu <wangmy@fujitsu.com>

gdb also uses the doc 'sframe-spec.info'.

gdb has a priority of 50.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/binutils/binutils_2.40.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.40.bb b/meta/recipes-devtools/binutils/binutils_2.40.bb
index 9087af87c5..1f67b0549d 100644
--- a/meta/recipes-devtools/binutils/binutils_2.40.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.40.bb
@@ -34,6 +34,12 @@ EXTRA_OECONF:class-native = "--enable-targets=all \
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
 PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils"
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE:${PN}-doc = "sframe-spec"
+ALTERNATIVE_LINK_NAME[sframe-spec] = "${infodir}/sframe-spec.info"
+
 do_install:class-native () {
 	autotools_do_install
 
-- 
2.34.1


