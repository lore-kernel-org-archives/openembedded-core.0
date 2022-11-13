Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FBEC4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 02:59:45 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.168.1668308376609096998
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 18:59:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VrY+3pSP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668308374; i=@fujitsu.com;
	bh=VBFmHOjeRd2Nq3PJJmEBBcnPp2ukTcOWSAPkWmp6OQ8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VrY+3pSP+0zsb+CuoCuptjktX9FcvZsKjpswLnv4qjx+Aqc3Q35TY/+kdA1BknT6n
	 6g5YmF6bVyofEDncpQx8zQuDMQMyyGJwpMHK+yuwFj+Bez//0pRcgeyfQnHVIgy8mV
	 sQgJkgLTLxnYSiYZ8Ph0vcuAvSX7wgr+T9ArAy/yazm8T2vhkAKByAH+mtcOTQjI0z
	 Hft+y9ult5KuET4CCuWhNgdNowxJT7wcsTbMaTd7ypOPikCgZDCteDNnF/ocWpOqB4
	 KTC74JnWgO6ZaIQNFLbjd3mf3zQUOpPT0rG83n0LLIHm0DPzRknUXoRXQ4616RzLnb
	 8NzsLIjN57/jw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8OxWXdKbEG
  ywepzChZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bsxxuZCk5xVNxu/MfawPiMvYuRi0NI4AGj
  xPYfm1ghnEtMEnufr4Ry9jBK7Pizm6mLkZODTUBK4sb9/2xdjBwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUFbCTmfDrMCmKzCKhK/P3XzQhi8wo4Sfw++ZAZxJYQUJCY8vA9M0RcUOLkzCcsEHMkJA
  6+eAFVoygx+3IzC4RdITFrVhsThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNZcWpRWWqRroVeUlF
  mekZJbmJmjl5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgMKYUp7jvYDy+
  7I/eIUZJDiYlUd606/nJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4f0cWJAsJFqWmp1akZeYAI
  wMmLcHBoyTCW2EHlOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlDivTjRQkQBIUUZpHtwIWJ
  ReYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMuxZkCk9mXgncpldARzABHfE9Mg/kiJJEhJR
  UA5P1LZbThifKfn5S273tCcc1zhj5rCu1sdwCM4oP7d26gUvt3NoXq9M7hXomnf2k6yZ1y/Cc
  VCVTcsvVSU/efir6ZiXDvniX7NqH2TwKij3uM6J+N8yT6P7UN19giZrcuT3tqx8UT7wr+9iq+
  WLKLt+cj+9WGy5x3daqlagUtD2zy/ZH2vmKef7cDwNc7sz58ebq1QK3/VLqyyXl+zZIRDyf8v
  B5tKjcid8vp1vz3H8m/eazSMD7bwEvnjVrmgkFfz2w0+zVnF83syLnCx2y9Pl/VEPn7nT1LA6
  dRHUxvzOXmE3Wy/yaJC37ap707zUqUcYX+5eJPj7BsPK00/++7Ervlyr7upn/Z7+7IPEmZmuq
  EktxRqKhFnNRcSIAXsipNE0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-728.messagelabs.com!1668308372!5274!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19531 invoked from network); 13 Nov 2022 02:59:32 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 02:59:32 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 06183142
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 02:59:32 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id EC44673
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 02:59:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 02:59:30 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsdl2: upgrade 2.24.1 -> 2.24.2
Date: Sun, 13 Nov 2022 10:59:08 +0800
Message-ID: <1668308348-14628-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 02:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173170

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.24.1.bb => libsdl2_2.24.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.24.1.bb => libsdl2_2.24.2.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.24.1.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.24.2.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.24.1.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.24.2.bb
index 6bff0b8fe3..ce5a8aa8f2 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.24.1.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.24.2.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-native = " file://0001-Disable-libunwind-in-native-OE-build
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "bc121588b1105065598ce38078026a414c28ea95e66ed2adab4c44d80b309e1b"
+SRC_URI[sha256sum] = "b35ef0a802b09d90ed3add0dcac0e95820804202914f5bb7b0feb710f1a1329f"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.25.1


