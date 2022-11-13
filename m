Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018FFC433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:04:26 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.207.1668308657791149300
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kjdOlzJE;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668308656; i=@fujitsu.com;
	bh=TaeTILbRZr2koundk0VPBzCiCoFm6pmIn2SpHeNF2tQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kjdOlzJEh6cCor1Nnlk/7ESbzUK9/+UKIKBeuaKnvuQ6JLEUBgfTlRcmbQ6tkbcmy
	 XeoDa5R3rRgLA58CQdy8eR/tWSFBXJN3EpJdWdIYh8jIQ+uoxLsZwvwURFufvUfUl6
	 24uBFVED3UMzhhVGIiOFIYyZJK06D8pd5iBV78/6JfZTWdpPyDkNWN2BBpnqnPWfGd
	 YlCgZbCgEzQ94G9KfNe97xLZaMjYfpTa3zsYZegl3DacAlsyUksmzNDMqH5EKB5BEZ
	 h0BFMa8zsIzHAPLT6zKr4X2kqcjlyY5qv/EFWRVWY7pfUvdWi/s59zvG093pQtA7E0
	 jp9GUpfAPX/gQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxSXddXEG
  ywZaFVhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aGnhtsBS+4Kp6sWMXewPiCs4uRi0NI4DGj
  xOrXU1kgnGtMEvP3L2eEcPYwSnQ8W8DcxcjJwSYgJXHj/n+2LkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAu4SZ2+/BrNZBFQlFk1dyAZi8wo4Sfy6/YAFxJYQUJCY8vA9M0RcUOLkzCcsEHMkJA
  6+eMEMUaMoMftyM1R9hcSsWW1MELaaxNVzm5gnMPLPQtI+C0n7AkamVYxmxalFZalFuhZ6SUW
  Z6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBwZhSnOK+g/H4
  sj96hxglOZiURHnTrucnC/El5adUZiQWZ8QXleakFh9ilOHgUJLg/R1ZkCwkWJSanlqRlpkDj
  AyYtAQHj5IIb4UdUJq3uCAxtzgzHSJ1ilGXY+bXtgPMQix5+XmpUuK8EjFARQIgRRmleXAjYF
  F6iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw79pooCk8mXklcJteAR3BBHTE98g8kCNKEhF
  SUg1Mix+/unKVwf/Dg4KZV7IeOyvfiLtyLT0/avFRNhHvGZc842dMv35TO/mSj8S0ezuaPGa/
  OrZ5fWPblz29bBNvP5jMq6p78+7uGdrvvdbGR4dUni0Ve1/z62TpqbO3JRftSvO5tYCx9pGZy
  +ubNxbqb2EUWZRd/DKVb+2kI29b07a1K50qUZ7ocKZH1OSl/aHpLk1bdaUsZiU+6/m5bNt1G3
  eVu4FJb9wsDkpNOj9rRVTDrx8bUwQX7z+zZr0cs81RI4eLXsuYvMwPiWja6F2y6D1tMneD9cK
  /Sf/XuLy/sSWCp9bc0mw3z3pb4esGs9NYd83+VxClVD7hI9dFt9qnPGo1R8vlPn88+fVmsV5U
  13YlluKMREMt5qLiRAAlPFCkTQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-728.messagelabs.com!1668308654!745329!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17409 invoked from network); 13 Nov 2022 03:04:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:04:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 703AD1000E9
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:04:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 644D71000D5
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:04:14 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:04:12 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 65.5.0 -> 65.5.1
Date: Sun, 13 Nov 2022 11:03:57 +0800
Message-ID: <1668308637-14966-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173176

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
-----
    #3638: Drop a test dependency on the mock package, always use unittest.mock
    #3659: Fixed REDoS vector in package_index.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-setuptools_65.5.0.bb => python3-setuptools_65.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_65.5.0.bb => python3-setuptools_65.5.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_65.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_65.5.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_65.5.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_65.5.1.bb
index 8198cbd104..8dc724e55a 100644
--- a/meta/recipes-devtools/python/python3-setuptools_65.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_65.5.1.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "512e5536220e38146176efb833d4a62aa726b7bbff82cfbc8ba9eaa3996e0b17"
+SRC_URI[sha256sum] = "e197a19aa8ec9722928f2206f8de752def0e4c9fc6953527360d1c36d94ddb2f"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1


