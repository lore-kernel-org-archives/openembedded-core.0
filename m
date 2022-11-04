Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF580C43217
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 06:48:18 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.8279.1667544496958009508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 23:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BMNsgCTY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667544494; i=@fujitsu.com;
	bh=v6Ou33l9WX66p9Fkuaq0CzxNikzUgb/VbAn94yJMfQg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BMNsgCTYA8S3shm2dDt6OKXvLMTcTvCgPmVeIIKy/6x0rdeVed4yGEwQoNjsMDB8S
	 UKCRorVGEluFdS9TY6+JDbK+FmlNehKxMWD9/XY/Y/ipeGm2B7rwTKlkNoGYDpA2a+
	 SC6lNrGjOSCo4S1VEpmpj0gCsi6Gk8UKePm9LVzGKCgtInlUBsYRupf6HTRx8AfSug
	 y29uDkcaJsk/AEapmjIgl9S21iHFtrqf0EztsZ9rlT9j8wzEXtwG1qVB3FgjFrOT56
	 mRlTE2XFGFJdvk8Zle+mPpmrAulfFLSxBBPFad+NYWi9lPVzbBjnc+7DyscXWoYOrh
	 GCZBrLrHrbSXA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORpLt2a0q
  yQUuzgcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnG+wb/glkjF1QWLWBsYlwp1MXJxCAk8YJT4
  eHErG4RzmUniy4anLBDObkaJrz1/mLsYOTnYBKQkbtz/D1TFwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBJ4kd7GyOIzQIU33vrKlicV8BRYsuPuSwgtoSAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2
  aIGkWJ2ZeboeorJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYjQtTi0qSy3SNddLKspMzyj
  JTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzElGLG3B2MO5f90TvE
  KMnBpCTKW8ebkizEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgnfuJqCcYFFqempFWmYOMCpg0hIcP
  EoivL/nAaV5iwsSc4sz0yFSpxiNOZYtv7aXmWPm17YDzEIsefl5qVLivIZbgEoFQEozSvPgBs
  Gi9RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5pIPfwZOaVwO17BXQKE9Ap26qTQE4pSUR
  ISTUwnSnj6surEAifnn9g0qt7xWu0p/5Qvc3U9oaxQz19DfvWawqsbxnS64Tl117xcn941fWx
  6u6bWken6ud+FnbZMCFdPj3s7raKbOaLR/hftiX/XHbdjFvgsNcre4mar1Nnc3K53inKenOP5
  5pozPxnatP/9tx7PcdvjdujW5XPrv5jcVlkzXt/zVbR5IsXtj8LCr7rsDN++gylypMPu2y21/
  hOXvFQR4n3pftKjw9JN7MbTCtjq5LFX1y9ML106YHdK58d4tlVtiR8296MG8fV5RlfuNw17LT
  4cfoo43sLt2NFzo+qHyo5NC5Uf/HrXtTlurQfbIyu1y5nKfFHKt0IvWKcUVP+aMMJprkxW2va
  mpVYijMSDbWYi4oTAUsbMSxRAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-591.messagelabs.com!1667544493!37992!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17124 invoked from network); 4 Nov 2022 06:48:13 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Nov 2022 06:48:13 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6839E1B5
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:48:13 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 5D4751B1
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:48:13 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 4 Nov 2022 06:48:11 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-babel: upgrade 2.10.3 -> 2.11.0
Date: Fri, 4 Nov 2022 14:47:56 +0800
Message-ID: <1667544476-4822-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 06:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172694

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
"the author" changed to "the copyright holder nor the names of its contributors"
"THE AUTHOR" changed to "THE COPYRIGHT HOLDERS AND CONTRIBUTORS"

Changelog:
===========
Improvements
------------
* Support for hex escapes in JavaScript string literals :gh:'#877'
* Add support for formatting decimals in compact form :gh:'#909'
* Adapt parse_date to handle ISO dates in ASCII format :gh:'#842'
* Use 'ast' instead of 'eval' for Python string extraction :gh:'#915'
    * This also enables extraction from static f-strings.
      F-strings with expressions are silently ignored (but won't raise an error as they used to).

Infrastructure
---------------
* Tests: Use regular asserts and "pytest.raises()" :gh:'#875'
* Wheels are now built in GitHub Actions :gh:'#888'
* Small improvements to the CLDR downloader script :gh:'#894'
* Remove antiquated '__nonzero__' methods :gh:'#896'
* Remove superfluous '__unicode__' declarations :gh:'#905'
* Mark package compatible with Python 3.11 :gh:'#913'
* Quiesce pytest warnings :gh:'#916'

Bugfixes
-----------
* Use email.Message for pofile header parsing instead of the deprecated "cgi.parse_header" function. :gh:'#876'
* Remove determining time zone via systemsetup on macOS :gh:'#914'

Documentation
--------------
* Update Python versions in documentation :gh:'#898'
* Align BSD-3 license with OSI template :gh:'#912'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-babel_2.10.3.bb => python3-babel_2.11.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-babel_2.10.3.bb => python3-babel_2.11.0.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.10.3.bb b/meta/recipes-devtools/python/python3-babel_2.11.0.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-babel_2.10.3.bb
rename to meta/recipes-devtools/python/python3-babel_2.11.0.bb
index 7420bfc917..f6eae88b80 100644
--- a/meta/recipes-devtools/python/python3-babel_2.10.3.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.11.0.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "A collection of tools for internationalizing Python applications"
 HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1b3f4650099e6d6a73e5a7fc8774ff18"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fb98e9f202b978d6569807b9525cc691"
 
-SRC_URI[sha256sum] = "7614553711ee97490f732126dc077f8d0ae084ebc6a96e23db1482afabdb2c51"
+SRC_URI[sha256sum] = "5ef4b3226b0180dedded4229651c8b0e1a3a6a2837d45a073272f313e4cf97f6"
 
 PYPI_PACKAGE = "Babel"
 
-- 
2.25.1


