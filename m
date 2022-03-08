Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D514CC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 10:35:04 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.6710.1646735703537861380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 02:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UwFIpLkU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646735701; i=@fujitsu.com;
	bh=tikbAGi7hMEO12uc6OYWliKc0i1IkyY0rkoPBXrdi0c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UwFIpLkUtrE49Y67R8CiPihI1hXMMenpi1zjRlyHPBzKJoM87ZBlU7hhRl2s6aBvK
	 qWgwKlHsPWHqC5USlCoNHQCdfCps8yeZPuQ4Y70xN7i20yZbmnXMKSuK5iAVxeJ/3X
	 lyRB0dI56iOM0wWGjWYAm5b7mrZTro1/V06G1hj3r1OYAE55HiKGJAYYEqBUy+S9aP
	 DYilvqDmVjTkZCqs8eF56XnYZrIYtkBChzkhuZt8d1cxBlPd2MlHR/Omc5VyhV/ftX
	 5PuDzycoDS/v6lqgpCDoK0i9UFnkuREsHETVfzGmrBxGZtoWxTNLmkVWbpb4CKdlIY
	 SSzVAiEhjU/lg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORqBtqqJ5
  ksPyRiMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnFo3xfGgn6uisY3t5gaGOdwdjFycQgJPGaU
  eHX0N3sXIyeQc55J4tIKbojEcUaJyVcmsIIk2ATUJKbfugFkc3CICOhJXP0nChJmFlCRePG7B
  6xXWMBBorNtGwuIzQIU39x2gRnE5hVwkmi4eQ4sLiGgIDHl4XuwOKeAs8T1vysYQUYKAdWsfR
  YKUS4ocXLmExaI8RISB1+8YIZoVZSYfbkZakyFxKxZbUwQtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjHZJRZnpGSW5iZk5uoYGBrqGhqa6Zma6RkYWeolVuol6qaW6yal5JUWJQGm9xPJivdTiYr3i
  ytzknBS9vNSSTYzAQE4pdnqyg/F130+9Q4ySHExKorz1bOpJQnxJ+SmVGYnFGfFFpTmpxYcYZ
  Tg4lCR49+gD5QSLUtNTK9Iyc4BRBZOW4OBREuEt1QJK8xYXJOYWZ6ZDpE4x6nLs3HJ5L7MQS1
  5+XqqUOO8akBkCIEUZpXlwI2ARfolRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO9rkCk8mXk
  lcJteAR3BBHSEnZEayBEliQgpqQamR2c5kg9dCJ5UJ6kavfbflz8nY6a+v18eqNS8/WPczWnS
  tya1NopoXtpbYxNT4L7EQXKia3u3svu9o5ITFwm90BS/e3f9rduMNzcfv73zeuDnJ5WOGo8vG
  jyvs5tbZLzDX+wM56Z47WMfZO/0NM1u2r/N1UZ1VcXr7ovHfit8vp9pN313NaP2PeGZNenRPU
  6rDHsaFZJkl9b+72O9IdS85OIhx8tCp9n4WM/cfPtwVt7FC+HrNpekzv4fuXD6t7mHP145zOX
  3idtc1/HSm0NLZykdu3/vhHHxp9hSyx9/c9ddXF3J4pm9a72C5qHvZ5bEchhMSSnl2/3ug4Im
  W/On985LJeq/yv/+32G+vqMy6Z4SS3FGoqEWc1FxIgAprb3qawMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-545.messagelabs.com!1646735701!3330!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11511 invoked from network); 8 Mar 2022 10:35:01 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-25.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Mar 2022 10:35:01 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 85464100182
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 10:35:00 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4B15A100191
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 10:35:00 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Mar 2022 10:34:50 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pip: upgrade 22.0.3 -> 22.0.4
Date: Tue, 8 Mar 2022 18:34:34 +0800
Message-ID: <1646735675-58918-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646735675-58918-1-git-send-email-wangmy@fujitsu.com>
References: <1646735675-58918-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 10:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162897

Changelog:
=========
- Drop the doctype check, that presented a warning for index pages that use
  non-compliant HTML 5. ('#10903 <https://github.com/pypa/pip/issues/10903>')
- Downgrade distlib to 0.3.3.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pip_22.0.3.bb => python3-pip_22.0.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_22.0.3.bb => python3-pip_22.0.4.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.4.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-pip_22.0.3.bb
rename to meta/recipes-devtools/python/python3-pip_22.0.4.bb
index 7eb9fb69ba..6dd29b9120 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.4.bb
@@ -16,7 +16,7 @@ SRC_URI += "file://0001-change-shebang-to-python3.patch"
 SRC_URI += "file://no_shebang_mangling.patch"
 SRC_URI += "file://reproducible.patch"
 
-SRC_URI[sha256sum] = "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0"
+SRC_URI[sha256sum] = "b3a9de2c6ef801e9247d1527a4b16f92f2cc141cd1489f3fffaf6a9e96729764"
 
 PYPA_WHEEL ?= "${B}/dist/${PYPI_PACKAGE}-${PV}-*.whl"
 
-- 
2.25.1


