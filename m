Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A630C19F2C
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 09:00:12 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.6343.1659517211174469389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 02:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=U/oL8+x2;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659517209; i=@fujitsu.com;
	bh=lsaF8TJeZwB3aGwJcqtDcHbbbkknNG8SRqvGPxvXHaA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=U/oL8+x23rG9HNj4CzGvmuvOgQuBsy30Hl252J9KSn31IHWwvA7XsTySPqfRZTjae
	 bQVTkdvWJKVTIOwbF+dMwZbCCnxAscASo2JA6h1lQAg5tWivOhYYRcu4CtmPgjrq4q
	 hPnvhKD5G9SV+6xefmDlXZFP4luNQEF0YxDdOHH0vd3LcrFuUb4Q7pHVnjQhpJd/5b
	 GTrnteEfHHsjwXMM+/0mfQ7hd3jznZ5iIlsQq9a8Soojr/Uv4YYtDYN3sHDKYPdobr
	 iR1FNZYMwL/3zJTJAxw80KStoXY4jCgBhtYMUsxdfrf7saZXmb/oW6m4TK/Lrpf1hv
	 k7sp/BMA0au9A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORpCth+Sr
  J4MEOM4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePt2Y2MBe95Kx51nWFqYFzF08XIxSEk8IBR
  4tXVr2wQzmUmic9X7zN1MXICObsZJda0SYPYbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHid
  w87iC0s4Cbx+fhJsFYWoHjvq40sIDavgJNE24/nYDUSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCskZszYxgZhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaJ1UlJmeUZKbmJmja2h
  goGtoaKprbKFraGKgl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5dasokRGJQpxWo9
  OxhPrPqpd4hRkoNJSZT3jPmrJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvDymQDnBotT01Iq0z
  BxghMCkJTh4lER4hZWA0rzFBYm5xZnpEKlTjJYcU2f/28/MsRxMzvzadoBZiCUvPy9VSpx3L8
  guAZCGjNI8uHGwKL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZi3D2QKT2ZeCdzWV0AHMQE
  dpMP1AuSgkkSElFQD07uZzZ01EhsSvks/2i6l7xPwRWnpn3O+YSe/OHex3U7p3HD2VUfFIv2r
  Csu1o38n6q+ddHA2hwk3w1kV7V83zlZdq9e81vJu2ol6ffulXmfU56mfejHTfKHPx0+/pN+If
  0zOPTv57OTzQd/nbFq0cNq1Kz8qFt9exB9S+TfXZ0mwrOys1P2+Oa7WeUIXTc7IscdU3D62Mj
  +IX0HksUmr1vO7yyJMHqSxcfWnhM12OMbx5eirTlmz/30JCh5p5Rc23ppq/Zs19BffNmWTS4f
  2PJ6uWr/g5aOJf1elxhlruCSKLzLKim/vmFwRXcB36AznbM1JOnydE05euas1d0Z/Q8Gyh0Kb
  pj+JErp8ZMHyM9OUWIozEg21mIuKEwFvagXBXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-548.messagelabs.com!1659517208!47958!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21714 invoked from network); 3 Aug 2022 09:00:08 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Aug 2022 09:00:08 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 8B7C61AE
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 10:00:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 803DA1AC
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 10:00:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 3 Aug 2022 10:00:07 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pygobject: upgrade 3.42.1 -> 3.42.2
Date: Wed, 3 Aug 2022 16:59:57 +0800
Message-ID: <1659517197-31322-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 09:00:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168811

Changelog:
=========
 Error out instead of crashing when marshaling unsupported fundamental types in some cases !180
 Add a workaround for a PyPy 3.9+ bug when threads are used !200
 Fix crashes when marshaling zero terminated arrays for certain item types !191
 Fix a crash/refcounting error in case marshaling a hash table fails !191
 Make the test suite pass again with PyPy !191
 tests: support running tests with (MSVC) CPython 3.8+ on Windows !206
 interface: Fix leak when overriding GInterfaceInfo !204
 setup.py: look up pycairo headers without importing the module (helps with building on Windows and MSVC CPython 3.8+) !205

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pygobject_3.42.1.bb => python3-pygobject_3.42.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.42.1.bb => python3-pygobject_3.42.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.42.1.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
index 443605ae26..cc7b07e804 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.42.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
@@ -18,7 +18,7 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
 "
-SRC_URI[sha256sum] = "1f34b5f7624de35e44eb5a7eb428353285bd03004d55131a5f7f7fa9b90f3cc9"
+SRC_URI[sha256sum] = "ade8695e2a7073849dd0316d31d8728e15e1e0bc71d9ff6d1c09e86be52bc957"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.25.1


