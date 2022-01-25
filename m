Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7D0C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 00:12:12 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.604.1643069530810088900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 16:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dYeSGG7Z;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643069528; i=@fujitsu.com;
	bh=PyBkumg6IlkNRVtSr1BE//rVnNgfmT+3711yxNdDy/o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dYeSGG7ZmMo3AF96ELT79uU/GPhpw9NSxBIDrNy28Ccww2QR5IL8YyelERba94iFI
	 6rchCc85ME9cPgc1d4dczPLJpmDxtZ80q9jEuAQpJ8Vdnddtgl8idfFataEWEvtB4x
	 AJZQc/g/IPNQeC2eRc5xEXn/UBCYdAJW620Hxa7OOSHRKnGYLP65V1Pehyk09HzQ/U
	 GaLikWtp6TlckvAkpQCJMo1ns+MXgFhgRn4AZBeZD0pYMyCNZjvf6GSlOcCurPhzwW
	 pTwskRX+2Ix25qVRKDiULlw53jG2sJhwTXDMdkZEdlLVLSHb55HaB4VVCZy0QtYh0e
	 gCjXrhDhMyPNA==
Received: from [100.115.3.74] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id CA/23-02280-8504FE16;
 Tue, 25 Jan 2022 00:12:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxSTfC4X2
  iwbt33BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bz+xbmgkbOih/T97A2MPZwdDFycQgJPGaU
  eLtjMSuEc55J4t3N3+wQzglGiUe3PgNlODnYBNQkpt+6AWRzcIgI6Elc/ScKEmYWUJF48buHH
  cQWFjCSmD+vA8xmEVCVeHJsJwuIzSvgKLHj020wW0JAQWLKw/fMEHFBiZMzn7BAzJGQOPjiBT
  NEjaLE7MvNUPUVErNmtTFB2GoSV89tYp7AyD8LSfssJO0LGJlWMVolFWWmZ5TkJmbm6BoaGOg
  aGprqGuoaGZrrJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBmVKMePNHYyt
  fT/1DjFKcjApifIaW71PFOJLyk+pzEgszogvKs1JLT7EKMPBoSTBe9wGKCdYlJqeWpGWmQOME
  Ji0BAePkgjvSTugNG9xQWJucWY6ROoUo6KUOG+XIVBCACSRUZoH1waLykuMslLCvIwMDAxCPA
  WpRbmZJajyrxjFORiVhHk5QMbzZOaVwE1/BbSYCWjx7/PvQBaXJCKkpBqYgia9ORq8SF6fVz3
  5TrxnsKvydp6olZ43peYxapjY5Ju85tnl9PtuHqfmDpOFNvPfv9mWnnXqZ5pR8RdL600NkV5v
  l5bdSZhuns4q4HEkmWmdf5NyStfZq055q2//nzD5hPCeEjZ93VOH953cYrKjasfsxX2dt/zu7
  zh7rPhoir/FP/tw/sVXFu+IM+k9Mu3b4zutOc1f7u2MTA74uEqR8dDvA698P7dO+VQqn+f9cn
  FtOuPd67ntl1p5TJo6X2rs9tJ5tfDS5tiPYopKN+W4X3Xxbqs+fE/jx3zn1gfP1gfmhx8705M
  nI1GTr+jPnnV84ZcdE7c7XdyW9bzlwqmNd7WX5Cq2VwRcU1m2/hTTQyWW4oxEQy3mouJEAK2X
  OtJFAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-27.tower-587.messagelabs.com!1643069527!43385!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 425 invoked from network); 25 Jan 2022 00:12:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-27.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Jan 2022 00:12:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id AB2DA100352
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 00:12:07 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9EA8D1000FC
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 00:12:07 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 25 Jan 2022 00:11:45 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libwebp: 1.2.1 -> 1.2.2
Date: Tue, 25 Jan 2022 08:11:33 +0800
Message-ID: <1643069496-5684-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 00:12:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160905

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webp/{libwebp_1.2.1.bb => libwebp_1.2.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.2.1.bb => libwebp_1.2.2.bb} (95%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.1.bb b/meta/recipes-multimedia/webp/libwebp_1.2.2.bb
similarity index 95%
rename from meta/recipes-multimedia/webp/libwebp_1.2.1.bb
rename to meta/recipes-multimedia/webp/libwebp_1.2.2.bb
index d634e02180..281cff1bf2 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.2.1.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.2.2.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[sha256sum] = "808b98d2f5b84e9b27fdef6c5372dac769c3bda4502febbfa5031bd3c4d7d018"
+SRC_URI[sha256sum] = "7656532f837af5f4cec3ff6bafe552c044dc39bf453587bd5b77450802f4aee6"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.25.1


