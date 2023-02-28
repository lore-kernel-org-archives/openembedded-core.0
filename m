Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B094AC7EE2E
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 09:49:47 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.19818.1677577780079480772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 01:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TpW2FHw+;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677577778; i=@fujitsu.com;
	bh=jNBKgFG1lu7oEECJaEaSbyq0K8ghEnsL+eVT8KcJ3Dw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TpW2FHw+c6OIOPlP+vRKk0J78fZrMoRxIwSrkukdhE3wzpArQiYTNvyL7BdiazkC2
	 kp9szJDYeXY2OKPLl5a1TggDdOYIMO8kxEb1IHtOG8RFbjUIkD1aVr2P0mw5xJPCKV
	 PcLhhcOkRhp4dkViBhcdVujJg3+oRrX2oAVCna1cJpTnwUUUYoUOL3rXUeTQJlbbTF
	 1LAlTjwT2rFc0A1MLj6T0K7VfW7r2saX51SADgvyLOIsOrHCe2nBJOEaO5so2R0bWs
	 C2fCVF9+OONJqDh2Rhd1vwY8RijmAinIBBEFnt0zB/GoDUmBd3ScYs6XdJW88hkSIS
	 JEOHzray3XRFg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqGt07m+
  ywZy7rBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bj5SfMBc85K950XWVrYGzj7GLk4hASeMwo
  MbvpDQuEc51J4u6FI1DOXkaJLV92sHUxcnKwCUhJ3Lj/H8jm4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLOApseHwFlYQm0VAVeL8qw9grbwCThJnGj8zgtgSAgoSUx6+ZwaxOQWcJfY+2gpmCwHV/F
  v+hB2iXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0p0frhF5StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjWXFqUVlqka6hpV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6K
  Xl5qySZGYPCmFCut28G4pO+v3iFGSQ4mJVHehKN/k4X4kvJTKjMSizPii0pzUosPMcpwcChJ8
  G45DZQTLEpNT61Iy8wBRhJMWoKDR0mEN/okUJq3uCAxtzgzHSJ1ilFRSpxXG6RPACSRUZoH1w
  aL3kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnnHwOawpOZVwI3/RXQYiagxQ3X/oAsLkl
  ESEk1ME2cz/nl94qELy+Mr7Ikeion8DbvEBeaa/xz1dmXs+aLLvvh9kk/YNo00RAJe/YvlktM
  XxgW61u/nKQ6zf+A3tudiZkVSp47aq8dvHZb/dvdjDP/5QKYoxqM35TveM11ZA/DnaIe08ubP
  nyYGeR97n987f27V8Tbn7ao3F8iHaP2VML8Qrru1BNztG5pc+TlyB5bGHfsaH/X9K7fKqaRS5
  fnZnEv+vfkX9rB/zs+HQqYK/Qt8oS5Iqdo6oeydN7KbaF1j7cu0i3O+jM59PrpLc85mDIv6v7
  v8GU/3+xl38T1c4snv3t0r5Et06u+mnBPE/kjJyU3nbR6XFcZ9SJ/y6PbK0v2SF6+yJHgMSn+
  r74SS3FGoqEWc1FxIgDFo0vLWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-548.messagelabs.com!1677577777!86185!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5212 invoked from network); 28 Feb 2023 09:49:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Feb 2023 09:49:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C4662100182
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:49:37 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B4EA3100194
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:49:37 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 28 Feb 2023 09:49:36 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-more-itertools: upgrade 9.0.0 -> 9.1.0
Date: Tue, 28 Feb 2023 17:49:18 +0800
Message-ID: <1677577759-20868-4-git-send-email-wangmy@fujitsu.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177829

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Fix trailing space
Fix malformed table

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-more-itertools_9.0.0.bb => python3-more-itertools_9.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_9.0.0.bb => python3-more-itertools_9.1.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb b/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb
index fce3aea897..7602350795 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "5a6257e40878ef0520b1803990e3e22303a41b5714006c32a3fd8304b26ea1ab"
+SRC_URI[sha256sum] = "cabaa341ad0389ea83c17a94566a53ae4c9d07349861ecb14dc6d0345cf9ac5d"
 
 inherit pypi python_flit_core ptest
 
-- 
2.34.1


