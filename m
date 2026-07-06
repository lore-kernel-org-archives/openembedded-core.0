Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A91CC44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 10:46:07 +0000 (UTC)
Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147390.1783334755844961194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 03:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=BaYEF72s;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=64019c500=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1783334756; x=1814870756;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nj0616Xt0KTy5UdFi2rd2cel6hFgZkKBdRjRtPV+/y4=;
  b=BaYEF72sDkQF8LWWvh9qmAgp5cPYllkcRdwQxL1IzxjKJIUYtu71jX2C
   22X1XyqZ5Sijqz03NJS4qLGym/+oI5mf9Vdrp/Rhq8hRuNrlyswTveSr1
   mSpxydboR1yAMFzd6k/vK3wfmvvL8wuOrsYr347fJdKA7WKPCZxaJ5aSD
   U=;
X-CSE-ConnectionGUID: k+IqXFWpQZqAo6znvfbhmQ==
X-CSE-MsgGUID: 0e99tAXWShisn9iU5UmpoA==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 06 Jul 2026 12:45:53 +0200
Received: from unknown (HELO esabb6.muc) ([10.31.187.137]) by esagw4.muc with
 ESMTP/TLS; 06 Jul 2026 12:45:55 +0200
Received: from smucmp17c.bmwgroup.net (HELO smucmp17c.europe.bmw.corp)
 ([10.30.13.153]) by esabb6.muc with ESMTP/TLS; 06 Jul 2026 12:45:54 +0200
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp17c.europe.bmw.corp (2a03:1e80:a15:58f::1:46) with Microsoft SMTP
 Server (version=TLS; Mon, 6 Jul 2026 12:45:53 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.209) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Mon, 6 Jul 2026 12:45:53 +0200
X-CSE-ConnectionGUID: fHXOBACgR5qp+GqWF7kX6w==
X-CSE-MsgGUID: 5hGYgjT2QzOfpvQ/fK9GFQ==
X-CSE-ConnectionGUID: WDVoW+ObT1KN845ogTwE5A==
X-CSE-MsgGUID: UJzWvEimQ0GuTBFXULIg1Q==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, <alex.kanavin@gmail.com>,
	<mathieu.dubois-briand@bootlin.com>, <Ross.Burton@arm.com>
Subject: [PATCH v4] json-c: upgrade 0.18 -> 0.19
Date: Mon, 6 Jul 2026 12:45:39 +0200
Message-ID: <20260706104539.3313976-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17d.europe.bmw.corp (2a03:1e80:a15:58f::1:66) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240244

Release notes are available at [0].

Newly added tests (see [1]) require the 'json_parse' app at (test) runtime.
Thus, apps are now being built and the 'json_parse' app is deployed in the
'ptest' package. We do not package the apps separately as upstream doesn't
consider them to be ready for that (see [2]). This approach is based on the
discussion in [3].

[0]: https://github.com/json-c/json-c/blob/json-c-0.19/ChangeLog
[1]: https://github.com/json-c/json-c/blob/d9d8cab82291637671f6c90cf06e578750a08718/tests/test_json_parse_cli.test#L18
[2]: https://github.com/json-c/json-c/blob/d9d8cab82291637671f6c90cf06e578750a08718/apps/CMakeLists.txt#L122-L124
[3]: https://lists.openembedded.org/g/openembedded-core/topic/120026557#

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
CC: alex.kanavin@gmail.com
CC: mathieu.dubois-briand@bootlin.com
CC: Ross.Burton@arm.com
---
changes in v4:
- Remove explicit ptest RDEPENDS to xxd, as it will be provided by busybox to
  avoid pulling in a number of dependencies.

changes in v3:
- Deploy required app differently to hopefully fix failures seen
  on Autobuilder (see [4]).

changes in v2:
- Build and deploy apps required to fix ptest failure, as discussed in [3].

[4]: https://lists.openembedded.org/g/openembedded-core/topic/120061116#msg240021
[5]: https://lists.openembedded.org/g/openembedded-core/topic/patch_v3_json_c_upgrade/120097794
---
 .../json-c/{json-c_0.18.bb => json-c_0.19.bb}    | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/json-c/{json-c_0.18.bb => json-c_0.19.bb} (70%)

diff --git a/meta/recipes-devtools/json-c/json-c_0.18.bb b/meta/recipes-devtools/json-c/json-c_0.19.bb
similarity index 70%
rename from meta/recipes-devtools/json-c/json-c_0.18.bb
rename to meta/recipes-devtools/json-c/json-c_0.19.bb
index c112aacf4bceb0c41dbe2e1643d2d7e0944bf250..e42d4f6f567f077c338dc8d00af7004ec0d93271 100644
--- a/meta/recipes-devtools/json-c/json-c_0.18.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.19.bb
@@ -9,20 +9,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "876ab046479166b869afc6896d288183bbc0e5843f141200c677b3e8dfb11724"
+SRC_URI[sha256sum] = "37ad0249902e301bd9052bf712e511fcc6acff4ecaad4b5900aad9ce564e26de"
 
 # NVD uses full tag name including date
-CVE_VERSION = "0.18-20240915"
+CVE_VERSION = "0.19-20260627"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
 RPROVIDES:${PN} = "libjson"
 
-# Apps aren't needed/packaged and their CMakeLists.txt is incompatible with CMake 4+.
-EXTRA_OECMAKE = "-DDISABLE_WERROR=ON \
-                 -DBUILD_APPS=OFF \
-"
+EXTRA_OECMAKE = "-DDISABLE_WERROR=ON"
 
 inherit cmake ptest
 
@@ -33,6 +30,13 @@ do_install_ptest() {
     install ${S}/tests/*.expected ${D}/${PTEST_PATH}/tests
     install ${S}/tests/test-defs.sh ${D}/${PTEST_PATH}/tests
     install ${S}/tests/*json ${D}/${PTEST_PATH}/tests
+
+    # The 'json_parse_cli' test executes the 'json_parse' app via
+    # '../apps/json_parse' so we package it accordingly.
+    #
+    # Note that the test also depends on xxd, which is provided via busybox and
+    # thus not listed as an explicit RDEPENDS.
+    install -D -t ${D}/${PTEST_PATH}/apps/ ${B}/apps/json_parse
 }
 
 BBCLASSEXTEND = "native nativesdk"

