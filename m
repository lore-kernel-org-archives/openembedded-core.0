Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E42BC677F1
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:23:27 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.134739.1673760191776433733
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:23:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PoM5IKDM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760197; i=@fujitsu.com;
	bh=owC3GzVOwe4ziusUpKahpqeGBiL8cYtbiA5MbQLBlkQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PoM5IKDMqnC8dTPdIVnrtREsuW1qOFx8W9Uh9Ucde5Ch8eSKIny7bjwhbIrkIlTOC
	 DwwfUdziHMPqhLR0gs3Omb/NLtJpcivBqTGwJbEGVStfUha1iGy983evCG+IKp1l/M
	 rsXTQE5NHD9ZOkGOtFjAeyabAmEuTIfwyOUorwYgYrbwmCweFinsH/RxPDWFV2SLID
	 yDZG9iaxGOW9xG7Qk1301dQckR6xC6hHZf+RHLNvZVLle1gwcQINuZT+4Z0BTV+odJ
	 BiDwmerkz/W+jRk83wZUe4GZyR1Y2tg9SjkzJfxHkATJwoINWxd+ceWymWllkvVwfe
	 l3TLGtsWu7bgg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqHu493C
  ywfq3EhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aVGUeYC5bzVLya9om9gXEmdxcjF4eQwGNG
  iZ45sxghnOtMEi8XzWWCcPYySjy98JW5i5GTg01ASuLG/f9sXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBdwlFnR9YQOxWQRUJZp7VjKDlPMKOEpc3gcWlhBQkJjy8D3YRE4BJ4nu+ztZQWwhoJ
  JtR/rBxvAKCEqcnPmEBWK8hMTBFy+YIXoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUj
  aFzAyrWI0K04tKkst0jXTSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxN
  zknRy0st2cQIDN2U4iTOHYxzlv3RO8QoycGkJMob+e1QshBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3g2Nh5OFBItS01Mr0jJzgHEEk5bg4FES4dXuAErzFhck5hZnpkOkTjEqSonzVvYAJQRAEh
  mleXBtsNi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9ynIFJ7MvBK46a+AFjMBLQ6pPwi
  yuCQRISXVwKTT8oRTZX1gbbyu75u6sMVbV1nyfp5RqNakKfs7IOpazAe1nH+/cjZrKxut6D3x
  RWNvmp1x3bFjecaTp2015ZcM+F/juPZ4YUx2RN40BUOGF9frPIK7Jj1P3bpqlUG2Ztfz0NdK7
  fcL0mNlHkudvfHg5uxtoSuXfkqav/SbWlHflZKPZ49umXqHt57pwFctnbVr7ny2jV5kObfpn7
  yQS2GqfNMndrYZFSE/mE02CP/TaDCfFZd+WLLd7UOZ6ByrLLkY09bmqc/29e3ZLTotYNbEZ+u
  tbfv2sTJbH7G4MfHFoc5N05Z437OJyJ8o4Nv3p+OlmenzPXFPpq2vv2Ydxp7WJlawdKfFSXcT
  wcgHl5RYijMSDbWYi4oTAZGEzgZYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-745.messagelabs.com!1673760195!229392!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14863 invoked from network); 15 Jan 2023 05:23:15 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:23:15 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D58F1100182
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:23:14 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C8C7B100043
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:23:14 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:23:13 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 65.6.3 -> 65.7.0
Date: Sun, 15 Jan 2023 13:22:54 +0800
Message-ID: <1673760175-2523-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673760175-2523-1-git-send-email-wangmy@fujitsu.com>
References: <1673760175-2523-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175870

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* #3594: Added "htmlcov" to FlatLayoutModuleFinder.DEFAULT_EXCLUDE -- by :user:'demianbrecht'
* #3667: Added a human-readable error description when ".egg-info" directory is not writeable -- by :user:'droodev'
* #3713: Fixed incomplete "getattr" statement that caused problems when accessing
  undefined attribute.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-setuptools_65.6.3.bb => python3-setuptools_65.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_65.6.3.bb => python3-setuptools_65.7.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb b/meta/recipes-devtools/python/python3-setuptools_65.7.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_65.6.3.bb
rename to meta/recipes-devtools/python/python3-setuptools_65.7.0.bb
index a8bcb3a602..789d212281 100644
--- a/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_65.7.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "a7620757bf984b58deaf32fc8a4577a9bbc0850cf92c20e1ce41c38c19e5fb75"
+SRC_URI[sha256sum] = "4d3c92fac8f1118bb77a22181355e29c239cabfe2b9effdaa665c66b711136d7"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1


