Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web09.7116.1616377391240365791
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: yNpzOia2VQWHAGPzTKHt0EEYJA92cgVUSZjTO2P1YsDxYoF6bMxNHBp4UfMgJyt0Iy4WZ0hnU4
 SYmGKmME2ScA==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211702"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211702"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:42:08 -0700
IronPort-SDR: 0R6igRq35wootpRdNEBipjv/9ztY7jP65xmGQoosInoAyA4pQsIdmgYS7cqyfU/9JwZchl/qjk
 a0Gx7R0nSMrQ==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295294"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:42:07 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 24/25] xcb-proto: update to 1.14.1
Date: Mon, 22 Mar 2021 09:41:26 +0800
Message-Id: <b4620992fb5d81ca0bab3979297aa78fe00da85f.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Leitner <richard.leitner@skidata.com>

This fixes [1] the following build error for nativesdk on Fedora 33
which is caused by the removal of fractions.gcd() in favor of math.gcd()
in python 3.9 [2]:

ImportError: cannot import name 'gcd' from 'fractions' (/usr/lib64/python3.9/fractions.py)

Furthermore the SRC_URI is adapted as the old one doesn't provide the
1.14.1 archive.

[1] https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/426ae35bee1fa0fdb8b5120b1dcd20cee6e34512
[2] https://bugs.python.org/issue39350

It's needed in gatesgarth and possibly dunfell as well to support
distributions with python-3.9 as we build libxcb-native, which is
failing with xcb-proto-1.14.

1.14.1 is a bug fix release:
https://lists.x.org/archives/xorg-announce/2020-October/003061.html

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.30.2

