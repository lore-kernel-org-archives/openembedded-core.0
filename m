Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE76DC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:57 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.17358.1649598816833312126
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 06:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=y1751a6A;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649598814; i=@fujitsu.com;
	bh=pCkSmpa9ekc1CBPH8J0BFpt+0uUulf/9cZi7vc7jW1E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=y1751a6Aq5nzvl08wGdJ2ChUDhLt1Uzg16O3J0CGRjnJjpFG7dL9D2X+8+fUhiiL1
	 N2Q0wMESynYeDN9DjVuW+z1V9IiQH/OJd+p9Ediff3lVu7ClVsJRYJeLS01eMKe1oB
	 +56XIT2nk4oLfPLC9LUPjpPuCxbq2tdfWSLhWEdCXtxfzghTPm8IYU3XJp/ubC2xSM
	 E927d1dYJloYoYF5TEUqxtOetDBvoUOloimIe98CZBxnzcLDVxu7oqSPte9/uO8VEw
	 IKPJIpI83PH6ygnKRbznIQhh/+fH0zwDa9IOTVns4t4k5pCGWa7zqe13TLqQ+KsFDG
	 ESTq7V37z5/Nw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MRohv7MCj
  J4H23hMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvF9Yh9bwW6eikl7D7I1MPZwdzFycQgJzGKS
  uP34BTuEs4dRYs7D70xdjJwcbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHidw87iC0sYCcx8
  +NHZpASFqD4t2MaIGFeASeJBxOfsoHYEgIKElMevmeGiAtKnJz5hAVijKpE95GnTBC2vETz1t
  nMEPWKErMvN7NA2BUSs2a1MU1g5JuFpH0WkvZZSNoXMDKvYrRLKspMzyjJTczM0TU0MNA1NDT
  VNbPUNbQ01Uus0k3USy3VTU7NKylKBErrJZYX66UWF+sVV+Ym56To5aWWbGIEBmZKsevhHYy7
  +37qHWKU5GBSEuX9Hh6QJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCt/B+UJKQYFFqempFWmYOM
  Epg0hIcPEoivNxrgNK8xQWJucWZ6RCpU4yKUuK8f0H6BEASGaV5cG2wyLzEKCslzMvIwMAgxF
  OQWpSbWYIq/4pRnINRSZi3/wHQFJ7MvBK46a+AFjMBLQ7dFgiyuCQRISXVwNS06emByj/l3s+
  f7Xu6wzX/26N58srCpbIBzdEO1itELBbpOWp1J4vN/X7Gv2tz4ZlvD2oMefgNDGWeJ7Fe/Hgi
  rujH8ZJr+yZ4h+xceF/Q4PGL2Ztrr64KKMm62Xvz0IO7vzYaMh9X43NexBvwzu0I1wbHeR2Lm
  T0Wz47s/FPAdihTkdX8sEeTnIF38U+vvkDJXa+seTPOPvB4a8Strljn3y18ZbnW5k67uHWLuJ
  TLl/PuWPtK22uv6JVLN+qlvj8JqbzzRnphXcBO0z8H7i/eoLnYONfv4sTv03d6RXO/2Jt6juP
  rlZcRh66Hrd2XKO6dlBhfVWLBlX/w8MEoDf5b0T+TX0hUzYnnsP6w5rQSS3FGoqEWc1FxIgDi
  zn7WRwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-532.messagelabs.com!1649598813!202665!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5195 invoked from network); 10 Apr 2022 13:53:33 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-19.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Apr 2022 13:53:33 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23ADrPOX011052
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 14:53:32 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 10 Apr 2022 14:53:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] libbsd: upgrade 0.11.5 -> 0.11.6
Date: Fri, 8 Apr 2022 04:49:59 +0800
Message-ID: <1649364599-24962-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164203

License-Update:
-  Copyright year updated to 2022
-  License ISC changed as following:
   remove "src/arc4random_openbsd.h" from Files
   add "test/explicit_bzero.c" and "test/strtonum.c" to Files
   add "Copyright =C2=A9 2004 Otto Moerbeek <otto@drijf.net>"
   add "Copyright =C2=A9 2014 Google Inc."

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbsd/{libbsd_0.11.5.bb =3D> libbsd_0.11.6.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libbsd/{libbsd_0.11.5.bb =3D> libbsd_0.11.6.bb} (90%)

diff --git a/meta/recipes-support/libbsd/libbsd_0.11.5.bb b/meta/recipes-support/libbsd/libbsd_0.11.6.bb
similarity index 90%
rename from meta/recipes-support/libbsd/libbsd_0.11.5.bb
rename to meta/recipes-support/libbsd/libbsd_0.11.6.bb
index bb8766a070..74fc8ef4e5 100644
--- a/meta/recipes-support/libbsd/libbsd_0.11.5.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.11.6.bb
@@ -29,12 +29,12 @@ HOMEPAGE =3D "https://libbsd.freedesktop.org/wiki/"
 # License: public-domain-Colin-Plumb
 LICENSE =3D "BSD-3-Clause & BSD-4-Clause & ISC & PD"
 LICENSE:${PN} =3D "BSD-3-Clause & ISC & PD"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0b31944ca2c1075410a30f0c17379d3b"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc2c635b94c8dcd3593f53e10fa8a499e"
 SECTION =3D "libs"
 
 SRC_URI =3D "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] =3D "1a9c952525635c1bb6770cb22e969b938d8e6a9d7912362b98ee8370599b0efd"
+SRC_URI[sha256sum] =3D "19b38f3172eaf693e6e1c68714636190c7e48851e45224d720b3b5bc0499b5df"
 
 inherit autotools pkgconfig
 
-- 
2.25.1


