Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web08.6234.1603878247538238047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 02:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=cjYyCDt7;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=563aae168=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1603878247; x=1635414247;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hH6XvOvni5KaFHeqpAo3mNGMnZyR+ZlIl/TM9ehRZUA=;
  b=cjYyCDt7xOAFPJEh9gBslczzEN7B0yMBAGzsTaxXkgtVAHYauIlbwImW
   28wm9LibHZb/2fBS7BoLuTIgkfzmkdWYXbG+2pjVKi7+fmvaDBD9+uTT2
   YfPMXYhg2oWX/DUqhCEtC0ih9v5qOblumoTfD0fHMYEi9pOxlZ8ctdrkp
   NTyyoZN3vW1AFR6hqP3cjhduOue4oITfufpJTmRQBA8wkyGKKN5uS3xam
   XrawlqAA1TyxqhtaCAQhp7k/yOAntgAEozlkSMQHHsm91J0y2gAlMYFJ7
   Ja4SufSL42AjCddiR/keMxcWc+GyCvDFTVkwQDVE9DlDqw61H5zwZ2od0
   Q==;
IronPort-SDR: 1zIdiru+rRq7afCarZsKuFwwZRx0+768in10oq3DbeQXDsYbaIqj/O4/reVD8hiIVT9Drn8CLo
 r2RSAYl0RD4CQR95Eg4FSGJdkCDuxtuQ6Xn3Ni+mvonjg+SzdWkP6fnzIV35HCVJqe2OiZ21dw
 /uB2lOaWFplIMexJlo2ugoAImj8NdaC3Ay1ZaQjo+Ieu5MvxeGIqrB7/v8ZWmG2VKdt8dYBwQl
 358Bn4O8PoAAWx7fcwk0iu5ThjtWnTlXqIeUjsVzSQCrAoQdkg0JYjqR93mKp5osVDYT1y8EQM
 wo0=
X-IronPort-AV: E=Sophos;i="5.77,426,1596492000"; 
   d="scan'208";a="2691194"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH] xcb-proto: update to 1.14.1
Date: Wed, 28 Oct 2020 10:43:21 +0100
Message-ID: <20201028094321.556239-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
 sdex4srv.skidata.net (192.168.111.82)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This fixes [1] the following build error for nativesdk on Fedora 33
which is caused by the removal of fractions.gcd() in favor of math.gcd()
in python 3.9 [2]:

ImportError: cannot import name 'gcd' from 'fractions' (/usr/lib64/python3.9/fractions.py)

Furthermore the SRC_URI is adapted as the old one doesn't provide the
1.14.1 archive.

[1] https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/426ae35bee1fa0fdb8b5120b1dcd20cee6e34512
[2] https://bugs.python.org/issue39350

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 .../xorg-proto/{xcb-proto_1.14.bb => xcb-proto_1.14.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.14.bb => xcb-proto_1.14.1.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb
index 6de30098d6..52e474a2e9 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb
@@ -11,8 +11,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.xz"
-SRC_URI[sha256sum] = "186a3ceb26f9b4a015f5a44dcc814c93033a5fc39684f36f1ecc79834416a605"
+SRC_URI = "https://xorg.freedesktop.org/archive/individual/proto/${BP}.tar.xz"
+SRC_URI[sha256sum] = "f04add9a972ac334ea11d9d7eb4fc7f8883835da3e4859c9afa971efdf57fcc3"
 
 inherit autotools pkgconfig python3native
 
-- 
2.28.0

