Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B6FC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 09:02:33 +0000 (UTC)
Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40625.1782896549848068885
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 02:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=HSELifmU;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=635ba791b=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1782896550; x=1814432550;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uOFrid40mAu1M+xqdHSGoEbvWhab4WX9PFugjcUBKUY=;
  b=HSELifmUTLdfYkA2T9KU3IIzkcLdiqx+dwrrqfyDVsHJVCPGEZFqoNxc
   RouBu1lXnDhwRJbJtVVALOLsla67wF6TM75gPh54TeIPOvyfIyzt43CHs
   20qfPafQ3Jkby6xIaLAbfuJrGE3p3ZUFgeMdZxFJOvUxO7GTYju2yePSJ
   I=;
X-CSE-ConnectionGUID: SuE9pcrDR3GVA/9vEIH7Zg==
X-CSE-MsgGUID: 7YF4J7zwTjWlqvag5/4oWQ==
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 01 Jul 2026 11:02:27 +0200
Received: from unknown (HELO esabb6.muc) ([10.31.187.137]) by esagw3.muc with
 ESMTP/TLS; 01 Jul 2026 11:02:27 +0200
Received: from smucmp16h.bmwgroup.net (HELO smucmp16h.europe.bmw.corp)
 ([10.30.13.150]) by esabb6.muc with ESMTP/TLS; 01 Jul 2026 11:02:28 +0200
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp16h.europe.bmw.corp (2a03:1e80:a15:58f::1:150) with Microsoft SMTP
 Server (version=TLS; Wed, 1 Jul 2026 11:02:27 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.210) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Wed, 1 Jul 2026 11:02:27 +0200
X-CSE-ConnectionGUID: NPU0ay6rROicdRYkTG8fOg==
X-CSE-MsgGUID: KboSIZCFSXyytyKoyMCIkg==
X-CSE-ConnectionGUID: wCLqIOPeQIWPP3VoAziV5A==
X-CSE-MsgGUID: WtJ7nfIDTL2XS6QKQ8UyoQ==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, <alex.kanavin@gmail.com>,
	<mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v2] json-c: upgrade 0.18 -> 0.19
Date: Wed, 1 Jul 2026 11:02:08 +0200
Message-ID: <20260701090208.3598070-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17f.europe.bmw.corp (2a03:1e80:a15:58f::1:64) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 09:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239958

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
changes in v2:
- Build and deploy apps required to fix ptest failure, as discussed in [3].

---
 .../json-c/{json-c_0.18.bb => json-c_0.19.bb} | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/json-c/{json-c_0.18.bb => json-c_0.19.bb} (70%)

diff --git a/meta/recipes-devtools/json-c/json-c_0.18.bb b/meta/recipes-devtools/json-c/json-c_0.19.bb
similarity index 70%
rename from meta/recipes-devtools/json-c/json-c_0.18.bb
rename to meta/recipes-devtools/json-c/json-c_0.19.bb
index c112aacf4bceb0c41dbe2e1643d2d7e0944bf250..d530a37f1713e4c1aa3d2b35bf677d79b6a09d02 100644
--- a/meta/recipes-devtools/json-c/json-c_0.18.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.19.bb
@@ -9,25 +9,30 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
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
-    install -d ${D}/${PTEST_PATH}/tests
+    install -d ${D}/${PTEST_PATH}/{apps,tests}
+
+    # The 'json_parse_cli' test executes the 'json_parse' app via '../apps/json_parse', so we
+    # package it accordingly.
+    install ${B}/apps/json_parse ${D}/${PTEST_PATH}/apps
+
     install ${B}/tests/test* ${D}/${PTEST_PATH}/tests
     install ${S}/tests/*.test ${D}/${PTEST_PATH}/tests
     install ${S}/tests/*.expected ${D}/${PTEST_PATH}/tests

