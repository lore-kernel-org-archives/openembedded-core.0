Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76634C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 10:54:48 +0000 (UTC)
Received: from esa4.hc324-48.eu.iphmx.com (esa4.hc324-48.eu.iphmx.com [207.54.71.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.89915.1783076062523947929
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 03:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=ZPZHhjko;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.71.48, mailfrom: prvs=637cd645a=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1783076064; x=1814612064;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N11w8WS78mBpbf1Bu5jZ50WLPOviNXhliJNDh3/dOws=;
  b=ZPZHhjkoo/fm77jYXJ4s0uzPtKP7X/+Z91GiUmtK5bdg9ZZQBVI2hX/y
   BPT6dPT6hiQeRlKthzUXaMG/WXpZxthW7SgzCgTOxnDEM9eegf71Mzyb+
   ugecxhFYU7LmqVRT4NZ9qduzWehmTO2Q++BgUL2qpOMeYTCwQtTd/VuUC
   E=;
X-CSE-ConnectionGUID: Ub7LJa5wSeGvMi/tvef/5Q==
X-CSE-MsgGUID: T2R4Q/b0TxiGUm7b3n/4VA==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa4.hc324-48.eu.iphmx.com with ESMTP/TLS; 03 Jul 2026 12:54:22 +0200
Received: from unknown (HELO esabb3.muc) ([10.31.187.134]) by esagw2.muc with
 ESMTP/TLS; 03 Jul 2026 12:54:22 +0200
Received: from smucmp19h.bmwgroup.net (HELO smucmp19h.europe.bmw.corp)
 ([10.30.13.174]) by esabb3.muc with ESMTP/TLS; 03 Jul 2026 12:54:20 +0200
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp19h.europe.bmw.corp (2a03:1e80:a15:58f::1:81) with Microsoft SMTP
 Server (version=TLS; Fri, 3 Jul 2026 12:54:20 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.212) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Fri, 3 Jul 2026 12:54:20 +0200
X-CSE-ConnectionGUID: 8/3ATOe6TgaWAm6A6RaqwQ==
X-CSE-MsgGUID: OxcRRpaaRRmA2iFTpxcsRQ==
X-CSE-ConnectionGUID: OPK1+5mfQ9+NRfKZcQBUiw==
X-CSE-MsgGUID: OB7ZVNyjR7CBp4116jvTZQ==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, <alex.kanavin@gmail.com>,
	<mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v3] json-c: upgrade 0.18 -> 0.19
Date: Fri, 3 Jul 2026 12:53:49 +0200
Message-ID: <20260703105349.1664278-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp18a.europe.bmw.corp (2a03:1e80:a15:58f::1:50) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 10:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240106

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
---
changes in v3:
- Deploy required app differently to hopefully fix failures seen
  on Autobuilder (see [4]).

changes in v2:
- Build and deploy apps required to fix ptest failure, as discussed in [3].

[4]: https://lists.openembedded.org/g/openembedded-core/topic/120061116#msg240021

---
 .../json-c/{json-c_0.18.bb => json-c_0.19.bb}    | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/json-c/{json-c_0.18.bb => json-c_0.19.bb} (72%)

diff --git a/meta/recipes-devtools/json-c/json-c_0.18.bb b/meta/recipes-devtools/json-c/json-c_0.19.bb
similarity index 72%
rename from meta/recipes-devtools/json-c/json-c_0.18.bb
rename to meta/recipes-devtools/json-c/json-c_0.19.bb
index c112aacf4bceb0c41dbe2e1643d2d7e0944bf250..6f357b45b97c602cb19523089fb63ada2a1384f5 100644
--- a/meta/recipes-devtools/json-c/json-c_0.18.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.19.bb
@@ -9,23 +9,23 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
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
 
+# xxd is required by the 'json_parse_cli' test.
+RDEPENDS:${PN}-ptest += "xxd"
+
 do_install_ptest() {
     install -d ${D}/${PTEST_PATH}/tests
     install ${B}/tests/test* ${D}/${PTEST_PATH}/tests
@@ -33,6 +33,10 @@ do_install_ptest() {
     install ${S}/tests/*.expected ${D}/${PTEST_PATH}/tests
     install ${S}/tests/test-defs.sh ${D}/${PTEST_PATH}/tests
     install ${S}/tests/*json ${D}/${PTEST_PATH}/tests
+
+    # The 'json_parse_cli' test executes the 'json_parse' app via '../apps/json_parse', so we
+    # package it accordingly.
+    install -D -t ${D}/${PTEST_PATH}/apps/ ${B}/apps/json_parse
 }
 
 BBCLASSEXTEND = "native nativesdk"

