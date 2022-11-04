Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4610C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 06:49:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.8351.1667544556435158883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 23:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LF6qVZC0;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667544554; i=@fujitsu.com;
	bh=rDrncosAnQbBRnS8MPwYpyT3bOfpavzMORA7KUzOoHc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LF6qVZC0tZr5dNMU0Z4oCb8dIbRi1SEt/hBl9i+oV6as+zEtt0kDfukj5j/a+8KH3
	 hMI8GeT9O91NT5xBpTJrPFZgeW9xsT+A1vavxylYqIWmvcfGrnDPiinOYZgtaamtD/
	 8SmM1YvOggy+uG5pX8n2myHOpBxPGLIhu+7iFuaNcpFXSCDxYXzBAF2a4ry+58fTeG
	 AUe6GpEWAW8uLNnyHQ3xAU1LkUIytZcQ3dX/qUgJ85OlHGN+wkBmuK+0w1vNgwL+x3
	 NqML1okkZqv40echLFFjG3ZjyYnmMOyH5Jtjccc1FoSHjqz2xgqNH2XHg5gW+V3An0
	 GCmGkC7V5EbMw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8ORpPtia0q
  ywd55mhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aunQdZC5ZxV+z4so6lgXEJVxcjJ4eQwANG
  iZf3dboYuYDsy0wSHasPskA4uxklvu57ygRSxSYgJXHj/n+2LkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAiESa+ccA7NZgOL9n/YxgpTzCjhKdO/KBAlLCChITHn4nhnE5hUQlDg58wkLxBgJiY
  MvXjBD1ChKzL7czAJhV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVoVpxaVJZapGtoqpd
  UlJmeUZKbmJmjl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5dasokRGIgpxQqXdjC+
  WfZH7xCjJAeTkihvHW9KshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3rmbgHKCRanpqRVpmTnAq
  IBJS3DwKInw/p4HlOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlDiv4RagIgGQoozSPLgRsA
  i9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdxrIJTyZeSVwm14BHcEEdMS26iSQI0oSEVJ
  SDUzdAcdMqyR+POA58G510Bqt47+1XouZdgdPfDfnXLjhn1eGkj8Wz7msmvG1Jm1ZMO/tg6/O
  etbL2zq2tProfo+6k3Jw0g4vU6n1bq1Tn+yY88N2avJ50QMxZa+L9kS2HtLbrLuy7337b90PJ
  +4uy8962uxctuyn8pccI7njj97oRcxSPqr27EDWbq0TxyxibVoubKwRubJwybS/6SrFDxbr3d
  T0s+Lwmu++yvFUaYf2vUe9vBrFj21lNDn6rF+HRz9deGLGLWsf9ilHp81Kmenne+dG0ZXNi1c
  9XqB0f8WOx7Ffcy9HfFMWPTDR8A73+57c509Pbwm6f3dB167Vy8Omt05JPl504578zNfvmhdt
  5FFiKc5INNRiLipOBABpqlN7SwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1667544552!81962!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25031 invoked from network); 4 Nov 2022 06:49:12 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Nov 2022 06:49:12 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 633B41B1
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:49:12 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 587221AD
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:49:12 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 4 Nov 2022 06:49:10 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hatch-fancy-pypi-readme: upgrade 22.7.0 -> 22.8.0
Date: Fri, 4 Nov 2022 14:48:58 +0800
Message-ID: <1667544538-4879-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 06:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172695

From: Wang Mingyu <wangmy@fujitsu.com>

Added
=========
 Added start-at in addition to start-after that preserves the string that is looked for.
 This often removes the need for adding markers because you can define
 the starting point using a heading that becomes part of the fragment.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...adme_22.7.0.bb => python3-hatch-fancy-pypi-readme_22.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatch-fancy-pypi-readme_22.7.0.bb => python3-hatch-fancy-pypi-readme_22.8.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_22.7.0.bb b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_22.8.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_22.7.0.bb
rename to meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_22.8.0.bb
index a0167e25e9..4c256d155b 100644
--- a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_22.7.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_22.8.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_hatchling
 
 PYPI_PACKAGE = "hatch_fancy_pypi_readme"
 
-SRC_URI[sha256sum] = "dedf2ba0b81a2975abb1deee9310b2eb85d22380fda0d52869e760b5435aa596"
+SRC_URI[sha256sum] = "da91282ca09601c18aded8e378daf8b578c70214866f0971156ee9bb9ce6c26a"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


