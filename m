Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC1BC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 03:00:00 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.10347.1671591593697421222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 18:59:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IHs/UBFZ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671591591; i=@fujitsu.com;
	bh=aiBUtKq5PN455KkODZp+XVFyi/Y8KyPyYxAFnLr6Jvc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IHs/UBFZiuwiMkpA0cFutbExN+Wv69l5LHMKOMG/CaDNY4NnUNburfBe/HO3cpYAR
	 T5N5HOSlVd92SHs6Ml8mf5xN9geboougTNbuQA7lu+/bHydz7DFiIZwzQdFOHUmEMS
	 3JFJ3yHrtVmvZcAKkUK9Kn27hu6YpG9WeSqUu8DbsPKhqsmKDfGVfiMArWgb1siGO0
	 4A9EO/l1IAgYcrkk/5qp0a6x8nQM2f7//rAgLUnxEdtNt/7hCtEXF89XaTSyi4qweD
	 bGvpoUXID0NK3zWBoQYS/BvA7yPQC2mkeRgWgDHGRKm1plLUB6+wDr+g3Haz7gIgwM
	 DuAy9fsgQJ3BA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8ORqLusbFG
  ywd7P/BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bNiwUFe9kr3jTPZG9gvMfWxcjFISTwmFFi
  xa2HTBDONSaJK383MEM4exgl5uxewNLFyMnBJiAlceP+f6AWDg4RAT2Jq/9EQcLMAioSL373s
  IOEhQUsJFZ3eYCEWQRUJRZt7mEFsXkFnCSm/zoHZksIKEhMefieGcTmFHCWOPpuLxuILQRUc+
  74VyaIekGJkzOfsECMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjGbFqUVlqUW6hnpJRZnpGSW5iZk5eolVuol6qaW6eflFJRlAqcTyYr3U4mK94src5JwU
  vbzUkk2MwMBNKU5m38H4ZskfvUOMkhxMSqK8PgyLkoX4kvJTKjMSizPii0pzUosPMcpwcChJ8
  JqWAuUEi1LTUyvSMnOAUQSTluDgURLhtSsBSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSp
  w3FGSGAEhRRmke3AhYRF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMwbA7KKJzOvBG7TK6A
  jmICOmHZzIcgRJYkIKakGppKegistcctae2W+darlHoo6c/GGlfujO2eZuc92RghrfRN+eKT3
  ira6c6e/jsuN6j/3hUt199Z7FjD6fbEv91gcWb8kcdm2vzE1K2Tl9RwS1J6oxHxYsyTopye37
  Vz99t/HsnbdN2p4rP1KZemCxZLbNp9tv7hUWdDC+SBrbMyRgvtfHNmerLn9vsObKXZGu7V0sN
  vhh9unnL+X5rTqy+ZDP43ue8vv4l7O9DJJsp/vlfwUrWeb1y5y8cp6JXJmQa6Ufeffm1t/B3u
  lsP9s7mF4Y79rsZ7j9L4p846/fpOVppV1JZHxXRHvxqhYlZLoG+HzXgpXHk24LzZ/ziqGSV7r
  yvQLV1SpCbbukru1UImlOCPRUIu5qDgRAM2sRFtjAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-732.messagelabs.com!1671591589!61095!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2077 invoked from network); 21 Dec 2022 02:59:50 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Dec 2022 02:59:50 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AE4BA10018D
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 02:59:49 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A1A9A100188
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 02:59:49 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 21 Dec 2022 02:59:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] git: upgrade 2.38.1 -> 2.39.0
Date: Wed, 21 Dec 2022 10:59:09 +0800
Message-ID: <1671591551-12455-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671591551-12455-1-git-send-email-wangmy@fujitsu.com>
References: <1671591551-12455-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174891

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/git/{git_2.38.1.bb => git_2.39.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.38.1.bb => git_2.39.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.38.1.bb b/meta/recipes-devtools/git/git_2.39.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.38.1.bb
rename to meta/recipes-devtools/git/git_2.39.0.bb
index ef64dba7ac..3622b9709d 100644
--- a/meta/recipes-devtools/git/git_2.38.1.bb
+++ b/meta/recipes-devtools/git/git_2.39.0.bb
@@ -166,4 +166,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "620ed3df572a34e782a2be4c7d958d443469b2665eac4ae33f27da554d88b270"
+SRC_URI[tarball.sha256sum] = "d929fe67cef7ac3ca709d2b56a9920f17112d5a524bf8112af37ec045a7a5109"
-- 
2.25.1


