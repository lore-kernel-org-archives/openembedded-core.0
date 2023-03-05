Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CAAC6FA9E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 08:07:05 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.5245.1678003624103919899
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 00:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yYeQK+1y;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678003621; i=@fujitsu.com;
	bh=u+PxktNO8UbUprwxN6cWz0qpLr1NQC9va0tIvOO70rU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yYeQK+1yD6DPGYKI+xYcYcZxPkqGTgbjwystM3Zkd21HfHuS5eEdVYmfE84H+2SC4
	 0rxpM10tw0i1g2ENIw/QyQH3N4FwQvl4cvgtfL/2ilnxR5T26PPSDG9X3TZCKh1zT2
	 +fRxZ0tSIK9zqw4kEm53lPwRTh05oJfXfFy1KXvAs8VTxS8+9A6J2gfJiiD90VKQ6n
	 jmyxqfNGaXLEOyutvvFdjneamwuAe8YCmZHbR0g+9U5z2hQrJYdvQCKbYcnROb3qj2
	 GdDNIr/p/BG3YDUU33mXZLJwiBbvMcYKt1YNWprlWT0FimvYUay28xl1W8levZSjye
	 WWcLkgZ9ICD7g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWXepL0u
  KwaKDrBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8brlT1sBceFKxZNfMvcwPhCsIuRi0NI4D6j
  xIXPT9ghnMtMEjOW3GGDcPYwSrSdvMTaxcjJwSYgJXHj/n+gBAeHiICexNV/oiBhZgEViRe/e
  9hBbGGBYImFfZ1MIDYLUHz7geVMIOW8Ak4Sb2aZg4QlBBQkpjx8zwxicwo4S/Qt+wtmCwGVXH
  64jQ3E5hUQlDg58wkLxHgJiYMvXjBD9CpKzL7czAJhV0q0fvgFZatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWhWnFpUllqka6SXVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYuinFyZ92MK7r/at3iFGSg0lJlDfwF3OKEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  Qnep24sKUKCRanpqRVpmTnAOIJJS3DwKInwPvQESvMWFyTmFmemQ6ROMSpKifNu8QZKCIAkMk
  rz4NpgsXuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvkwfQFJ7MvBK46a+AFjMBLdY4zQC
  yuCQRISXVwMSvvFTfqT1SjdPLI25p1yTvXPfjqd9ZTm14lSXceLvowIv/KitatvOsDFi2klf/
  wN/YMge5+c1fLi15K6TJYKii2xn6bwp/o17f60mPw92twpsnb5pyLe4zg3ZJ6rLX7clvZVsT9
  RXzpqgkx8pKycRs/31zlf+/rD+syxb9tJkZ7L7mzHtluYUfzc+4HLJcebFjR2BY2DSpwjL3Dx
  cu5/80yl7XrJUUfXbeldUP9G+FrNlps9zl6x71rbnMO87o2CTd+r7Y7431xwwuU8nrdY8qFmi
  kXcwO2/j0+fZDOxZ5pvgtWpz7ZplAzqKTV63+Gcps8l3cf+jWppyTISIaS3OXTf6726o2OUmg
  zeGnXp0SS3FGoqEWc1FxIgA1BEXlWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-728.messagelabs.com!1678003620!689581!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11797 invoked from network); 5 Mar 2023 08:07:01 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Mar 2023 08:07:01 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 790EE7B
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:07:00 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 6C9A873
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:07:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 5 Mar 2023 08:06:58 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cryptography(-vectors): upgrade 39.0.1 -> 39.0.2
Date: Sun, 5 Mar 2023 16:06:40 +0800
Message-ID: <1678003602-30550-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678003602-30550-1-git-send-email-wangmy@fujitsu.com>
References: <1678003602-30550-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 08:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178035

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Fixed a bug where the content type header was not properly encoded for PKCS7
signatures when using the Text option and SMIME encoding.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...vectors_39.0.1.bb => python3-cryptography-vectors_39.0.2.bb} | 2 +-
 ...n3-cryptography_39.0.1.bb => python3-cryptography_39.0.2.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_39.0.1.bb => python3-cryptography-vectors_39.0.2.bb} (90%)
 rename meta/recipes-devtools/python/{python3-cryptography_39.0.1.bb => python3-cryptography_39.0.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.1.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_39.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb
index 458ca2adbd..795e27f75b 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "0cbaeb50bdb7f3c9d7a93b26a0462ef6e97c768ca78d902854fe045c30b680c6"
+SRC_URI[sha256sum] = "a68f106f7a4322cf1e7ed51e3fc6d5c1e0b11d337ed918ec879e8afe0c2a5220"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_39.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography_39.0.2.bb
index abc8d8e0ef..4b591bc59b 100644
--- a/meta/recipes-devtools/python/python3-cryptography_39.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "d1f6198ee6d9148405e49887803907fe8962a23e6c6f83ea7d98f1c0de375695"
+SRC_URI[sha256sum] = "bc5b871e977c8ee5a1bbc42fa8d19bcc08baf0c51cbf1586b0e87a2694dde42f"
 
 SRC_URI += "\
     file://0002-Cargo.toml-edition-2018-2021.patch \
-- 
2.34.1


