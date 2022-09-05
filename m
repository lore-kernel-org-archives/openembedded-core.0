Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C44ECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 09:06:41 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.22851.1662368800397461269
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 02:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Me7z5XEi;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662368798; i=@fujitsu.com;
	bh=NJgXnf5sd84os7/V9BeybAcpwSW1E6+QJH3vX/oo1KE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Me7z5XEiIoZRn8YuVmxamiNEASpxAdBoDnC5e4AzhUvEXY+qDQncvkUxKMJy1JEvT
	 NcwMSzdQc/0MA3pd9NMGMmPrMJVHbWFeRPMhMfu7cG/vaVz+uDocbzXkzcFuTJcKIT
	 LqBiN8MHEJ/eo1H1kniL/RRY2Mm8/j4kh8Z7dV9AXtz+sK8Mx+VRDdpPP2WXDayk6n
	 BxvEOll1hqFUO2SWMB0WOdgl3IUWOPYyWvsrkgcuNk1Tc1kXnVTFGZrNzOaDjWS6yV
	 Ek0jnVvGceHBoKg6LS7z1vykvgC/85hWR4LNGmrupqOMdeCQ87yX9UrwVazlfPwJd0
	 N4M6miubBlQAQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORpCu3RzT
  ZYNUnJos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePANe6CXo6K6+eSGxiXsncxcnEICTxglLjZ
  uxvKucwk0bV2OSOEs5tR4v3kduYuRk4ONgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxu4cdx
  BYWsJdYPGM+G0gJC1D85iElkDCvgJPEpW29LCC2hICCxJSH75kh4oISJ2c+YYEYIyFx8MULZo
  gaRYnZl5uh6iskGqcfYoKw1SSuntvEPIGRfxaS9llI2hcwMq1itEkqykzPKMlNzMzRNTQw0DU
  0NNW1NNM1NDbSS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctLLdnECAzJlOKElh2M
  t/f90jvEKMnBpCTK+36OaLIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6VO4BygkWp6akVaZk5w
  PiASUtw8CiJ8PqvA0rzFhck5hZnpkOkTjHqcsz82naAWYglLz8vVUqcdxPIDAGQoozSPLgRsF
  i9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYlwtkCk9mXgncpldARzABHWHXJwxyREkiQkq
  qgSnvaGrwflNZ/SarVt/Aa+HXivNj1u3vz/73wWLOg/tSgq5zDuzMlQu8xPJXIOL9RPUlgs9t
  WpqEZ03fzL+B42pKRa/RDauvVw9Os3fNmshfsYUpTPbGqaOvxe8GXnLvmn6FpX+mmLe19qxsG
  5lZ3F/3ntpwZmPMvORZrnt+H/b6GZ9amdgoHSi3dE6PdJOwsvm7CuYf382d9SwOBVtZTNJr3u
  lx+fmei4oXjL9t9xba3PI74Ht0bX6reWqFxUa3Pde2Pm+1OCXKalfkfHJJP8sbXsk+wyXX7u0
  oYLprmpuks/u6f8L+gpn3VNfqfXnyprxZ78PrV/bp1c86rkxKnflawD9pQmGP6efjjGc7tiix
  FGckGmoxFxUnAgDRjca/UAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1662368797!261294!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16497 invoked from network); 5 Sep 2022 09:06:38 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Sep 2022 09:06:38 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 71CD41B5
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:06:37 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 66A971AD
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:06:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 5 Sep 2022 10:06:35 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-mako: upgrade 1.2.1 -> 1.2.2
Date: Mon, 5 Sep 2022 17:06:19 +0800
Message-ID: <1662368782-32326-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 09:06:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170306

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mako_1.2.1.bb => python3-mako_1.2.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.2.1.bb => python3-mako_1.2.2.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.2.1.bb b/meta/recipes-devtools/python/python3-mako_1.2.2.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-mako_1.2.1.bb
rename to meta/recipes-devtools/python/python3-mako_1.2.2.bb
index 8155c37984..e3774ee621 100644
--- a/meta/recipes-devtools/python/python3-mako_1.2.1.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.2.2.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f054a5ff4743492f1aa9ecc47172cb33b42b9d993cffcc146c9de17e717b0307"
+SRC_URI[sha256sum] = "3724869b363ba630a272a5f89f68c070352137b8fd1757650017b7e06fda163f"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-markupsafe \
-- 
2.25.1


