Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9F5C77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:52:50 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.47781.1681714362726815701
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QEsm+Hrz;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681714360; i=@fujitsu.com;
	bh=qCylrOMeHbZMJSp+MF9k+S2WAk39EAQET2GNOI10V0I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QEsm+Hrzskp930OKUuljmdMZ21dgK1yAMmm8ZjNjZS4xGv03NdtKVrz+IdQKbNAdP
	 X7svKSDPtFPb05t/ojGGd+jw8JUHAFovwFuMg+kt7SzaOzRI05BaplSIUdsK1jwSPd
	 hAmDwZOkOrYv6SywUuzb7rU/Vnxe+ucQ3cTlCIi1p4bZbsWIn1ZjkUO4X4xjsKMAU1
	 jvu9puTe0KW/34WZ5h4jWtrW0hVNM1LgTC0AuEaoAy6smk5Nz9x+Jw4iA6trRMhz/F
	 7WYdk4BKv9ZPHa+YmHi91e4uwx/Z/7c7Bx5mTSTpGxh2RRbuWdADYqApr6lgyeaelV
	 1geDVvmNzEUrg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8OxWXfbG5s
  Ug98HDC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1owfdw8yFTzgrHjVfJWtgbGNs4uRi0NI4AGj
  xMwz7awQzhUmiadt3xkhnL2MEvfWXgJyODnYBKQkbtz/z9bFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAT+LIopVsIDaLgKrE5K/nmUBsXgEniXcrLoHZEgIKElMevmcGsTkFnCU2HnvICmILAd
  X839XMAlEvKHFy5hMWiPkSEgdfvGCG6FWUmH0ZokZCoFKi9cMvKFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkbz4tSistQiXUMTvaSizPSMktzEzBy9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src
  5JwUvbzUkk2MwPBNKU48voPxVd9fvUOMkhxMSqK8L1KtU4T4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8Da8tkkREixKTU+tSMvMAcYSTFqCg0dJhNf4GVCat7ggMbc4Mx0idYpRUUqctxWkTwAkkV
  GaB9cGi99LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5r70AmsKTmVcCN/0V0GImoMVySmC
  LSxIRUlINTN1ndyznLLfa3hk6V7590xm2u0IH4jODvGLaD9XqyTq9eRGX3yI4xzB32bmpXyV3
  bRd75aG65efMdQq7ltuus+7+tnLhRZkOi0s2726krj5zvqIoW6FDks/JYKX11Cv9O9hfbORb8
  oXxy/q0F+q9qSncxTO4dR1k4z/7cf49/XWmg/vHZ6pf+mR0XlyXry16IWo19fDVVXp3VU71XL
  NK887lmaHhP++I4ESVU3w/p8/Zpe3z2p/pi8bPSje1gug5jGy27w3eyLrVPeg/veaNf3nPF1u
  Gbq2GS5dFovRK1zQ9/Xyy96neCbGlbibPJk6T+qalUPYn4lizzNsUpSql/qWBXUbXl0hl7zhq
  8dCgSYmlOCPRUIu5qDgRAOIV2dJaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-28.tower-745.messagelabs.com!1681714358!212560!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15472 invoked from network); 17 Apr 2023 06:52:38 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-28.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:52:38 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 4282E153
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:52:38 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 35ECB142
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:52:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:52:36 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.22.1 -> 4.22.3
Date: Mon, 17 Apr 2023 14:52:16 +0800
Message-ID: <1681714339-18687-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681714339-18687-1-git-send-email-wangmy@fujitsu.com>
References: <1681714339-18687-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180132

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.22.1.bb => python3-protobuf_4.22.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.22.1.bb => python3-protobuf_4.22.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.22.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.22.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.22.1.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.22.3.bb
index add20c0e4..5b2ff302c 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.22.1.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.22.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "dce7a55d501c31ecf688adb2f6c3f763cf11bc0be815d1946a84d74772ab07a7"
+SRC_URI[sha256sum] = "23452f2fdea754a8251d0fc88c0317735ae47217e0d27bf330a30eec2848811a"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


