Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5431CCA47B
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 04:20:18 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.20960.1656562807190574194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 21:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CH3iIvhl;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656562805; i=@fujitsu.com;
	bh=ENIxzO02VXPSN3kX9w4GBhb2rc0/4O6W+h7cSpabzBQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CH3iIvhlXInf/Da+tbdNJ0r5sS5BSidSxuihFw6/KZ+ZaVy0yj7WCQVMF2yplc6ih
	 s0IglRL+nSU74RrbPze6iOwD2UZ/BXO1QeiysIdg692mQY5lZRohKMOXluP/E/MuMn
	 FxFa9fTa5V6WtqBrnoW+adL/B+iTWlDyXDy8PUD1G2j4hpIdvBpuyW95QPQAvZ7Yt2
	 5/Z2kbyi+dN0Ztn89tyWEnKBtoVTF5VCWyKNlpPffV9XzU+EJRZPhKGTLeRJx7SLRs
	 ei2anjGh2GbdygrLKrpkuP78uQsrMM30WPTF4S4vOxtW9A+XX8tQXX6Olu2AZyz100
	 kaUgWEbKJj+pg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8OxWbdEZW+
  Swatl5hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bdvX+YCxZzVbTNWcfUwDiBs4uRi0NI4AGj
  RNeTGUxdjJxAziUmiZb1KRCJPYwSix9NAkuwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAo8ScFQsYQWwWAVWJtoWr2EBsXgEniU0PbrOA2BICChJTHr5nBrE5BZwlnt6azQ6x10
  ni8sTXjBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm6HmVEjMmLGNDcJWk7h6bhPzBEbBWUjaZyF
  pX8DItIrRKqkoMz2jJDcxM0fX0MBA19DQVNdE18jYUi+xSjdRL7VUtzy1uETXUC+xvFgvtbhY
  r7gyNzknRS8vtWQTIzCEU4pZ3u9gbOr7qXeIUZKDSUmU15B9b5IQX1J+SmVGYnFGfFFpTmrxI
  UYZDg4lCd7jSkA5waLU9NSKtMwcYDzBpCU4eJREeENB0rzFBYm5xZnpEKlTjIpS4rwVykAJAZ
  BERmkeXBsshi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubVBhnPk5lXAjf9FdBiJqDFO6f
  tAVlckoiQkmpgClNL8vgeEcB0d4WB1nEZN0XBIAb5Yzp7plgUH6i4NG2W9dXwI7fNbt5pFzhn
  eo1p/Qruzo05+wq6VHz++tbeSq/lMfywbvGT8JiJhTaqn40Urn4tmWblfEfr02Z203mhca4Zi
  35/kt/rLF3+YlMkyxP3vMpA/YWqPk8vsvaK7P/aqqf69t1+6YdVamoSVd8WLt2ZF+UbGHdozs
  IzC5eo8/cw7RT4ansu0PnopGYGUf7zqw9lbleSLNwhkzPj+UKejTM5r75ZvV/NfWtne6W+ucV
  zHd0tNXNjz9mrsPvz1P5tKfdO2nzCOuO5WeeshPxsVYML+1emRLPbGjB7zvVq+XVZZZr77gte
  Zx02BLopsRRnJBpqMRcVJwIA8+iox1wDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-587.messagelabs.com!1656562804!248286!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23604 invoked from network); 30 Jun 2022 04:20:04 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 04:20:04 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 7BCE8142
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:20:04 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 6F65073
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:20:04 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 05:20:02 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gstreamer1.0: upgrade 1.20.2 -> 1.20.3
Date: Thu, 30 Jun 2022 12:19:32 +0800
Message-ID: <1656562773-11393-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656562773-11393-1-git-send-email-wangmy@fujitsu.com>
References: <1656562773-11393-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 04:20:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167394

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gstreamer1.0_1.20.2.bb => gstreamer1.0_1.20.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.2.bb => gstreamer1.0_1.20.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
index 3aa9aa7048..1f4576c3e1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
            "
-SRC_URI[sha256sum] = "df24e8792691a02dfe003b3833a51f1dbc6c3331ae625d143b17da939ceb5e0a"
+SRC_URI[sha256sum] = "607daf64bbbd5fb18af9d17e21c0d22c4d702fffe83b23cb22d1b1af2ca23a2a"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.25.1


