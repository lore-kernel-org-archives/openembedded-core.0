Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0915C64ED6
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 09:49:47 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.19673.1677577782262618664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 01:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FU20jjJo;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677577780; i=@fujitsu.com;
	bh=JYQzGoo3SiK/nwMk7Svnd0Ry2iLDSVLjpy+FSL3hyhg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FU20jjJouP4BvYKr69QRbuRmyegMFElm2rnRmctzrjv9WEpKUB5Vt0o0KMyynLUM3
	 O8Ucvhfgnrpo8W29mHdjsn9ab3iWpINK3ybNjYBFSIKi7zaI0P9Oqjw5B1TtKl3j8p
	 zuysViMNDkPLiyxYQo4WQq2/PrvmqfLo+l1qtSm9ES97cm9fDmBcDTUTomw36Fn4KB
	 2/+MQHLFeQlJmGhojktvTK/atbmK8vuxx92vvZHkecOhFSsikY85YdgUFFMIslUk3e
	 71kochnUAyjyPUUWYntIO2qBnAe1euyRM7PhuOkVHUZUfcGQTOG1Vj+qzjsOb9lexK
	 h4rUnmMsp4jzQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWdfk3N9
  kg8e3BSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1owdz9gL7nBWHNx/gbWB8QtHFyMXh5DAA0aJ
  S3M2sUA4l5kklv7Yygjh7GWUWDC/gamLkZODTUBK4sb9/2xdjBwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUFHCX2b5zCCGKzCKhKzFnyG6yVV8BJ4lD7aVYQW0JAQWLKw/fMIDangLPE3kdbwWwhoJ
  p/y5+wQ9QLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQrTi0qSy3SNTTVSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM3ZRixQk7GC/2/dU7xCjJwaQkyptw9G+yEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  QneLaeBcoJFqempFWmZOcA4gklLcPAoifBGnwRK8xYXJOYWZ6ZDpE4xKkqJ82qD9AmAJDJK8+
  DaYLF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7/xjQFN4MvNK4Ka/AlrMBLS44dofkMU
  liQgpqQYm3w8PPWb0Tf+2rin7TvODmuQN27IPHHLd15DK6dkQ1bfnQc3Exw+ucUxdru3vsXry
  9DquFr35F2UZuHZPbdq97rPtkU97vR5zb76afEZ8X9AWueiA7a79vSnhmh8zP6iJzNos4Oqft
  8Xs71xGA40l1zdPZ3e+JxT2i6NdTP+5Uv7VE4vyypOqGip5ax9Oer3cwuDTg8eqt6bE3bvg8+
  5NX1r+g2/P3j+dZ1wr+t/W5tj7PZ0tU51la45pmuitSPgsznFx9VKL1QwXFinnX8pl6Lv4hHd
  ju97dkz0fzgXqa6V77dr8cxqz5cFPl4ynTVjIcXGn3dWufYbHni9cHr/qnCj//UMOi98Yqfn2
  PNafGa/EUpyRaKjFXFScCAD2rrV1WAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-565.messagelabs.com!1677577780!525476!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29155 invoked from network); 28 Feb 2023 09:49:40 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Feb 2023 09:49:40 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 0339A158
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:49:40 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id EB57373
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:49:39 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 28 Feb 2023 09:49:38 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-zipp: upgrade 3.14.0 -> 3.15.0
Date: Tue, 28 Feb 2023 17:49:19 +0800
Message-ID: <1677577759-20868-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677577759-20868-1-git-send-email-wangmy@fujitsu.com>
References: <1677577759-20868-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177830

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 gh-102209: "test_implied_dirs_performance" now tests
  measures the time complexity experimentally.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-zipp_3.14.0.bb => python3-zipp_3.15.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.14.0.bb => python3-zipp_3.15.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.14.0.bb b/meta/recipes-devtools/python/python3-zipp_3.15.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-zipp_3.14.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.15.0.bb
index dc5091f6c7..5b42dd8139 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.14.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.15.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "9e5421e176ef5ab4c0ad896624e87a7b2f07aca746c9b2aa305952800cb8eecb"
+SRC_URI[sha256sum] = "112929ad649da941c23de50f356a2b5570c954b65150642bccdd66bf194d224b"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.34.1


