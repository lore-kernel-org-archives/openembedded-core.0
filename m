Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABE3C4451B
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 19:30:02 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55.1784403001496570501
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 12:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cQzBCyED;
 spf=pass (domain: konsulko.com, ip: 209.85.216.50, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381b831d535so6416602a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 12:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784403001; x=1785007801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mYF7V+a2yFqweQHHm2Ch2orrIgnjG1ye10LJwctlciY=;
        b=cQzBCyEDXCAlN3Jd04LmhTbybClRVajoN3HnGrw7Hu4ux0V076duafqahqBsFIKpEh
         s8HWcooZq0fUskixbVrylKwKMkEJzTI6TnsezdTeC7IX5T4jz6FiYZvaMTSqQG7L4iU3
         tFLKaIdYucdi07xbGZ1WzCdiNPYOGbA6aiS8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784403001; x=1785007801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYF7V+a2yFqweQHHm2Ch2orrIgnjG1ye10LJwctlciY=;
        b=sJ+C0TB4W33y9cTE3nP3inIsUeu48KIRctSYUiG114i/vnHl2josJIgPhi9pRO4U5r
         rDKgci24rqNKFpl81P/3/yNifuh4nbdmypKdLjOqTmIu7zEeUC3zUNtTQjgcWzPFJl1z
         8Zk04Moh1f7eivn1facQ7GPaDOmNJo0trVM+w55MX2ZlgXB7YxnOpD3LKa0N3Zgp5m1j
         wPjKhu0dDahPXeRY7nxJVtD2J5p27Lf6SBC7NFKnf+SNANqNBMUgiKBumYa29hr8l+GF
         4s6jP966GVNSJqXDQmrboZ4ZcWWk6GOLEZGwcSrWY+efyej/BZCfqja2X6dvFlfH22SQ
         1CZQ==
X-Gm-Message-State: AOJu0Yylwh00oZ/ISpwaucwcXM7bSkFsuneOkPQnMQ6/l+ZBcEcDwe1B
	gYlH9MCP4Zg7N/SKSH4zeimpvleaBr45yaQ7ribRwpXYQa6QTr5PPATDeXREggBv1rhYP5P6bJO
	UQOR2
X-Gm-Gg: AfdE7cn1qo6G0rm8AI29hhOBAodMpR7oo3gzhi5yH5Yefu9m80UsPHwN4kdrxAsZaKw
	s/L5lnFS0sKV9qrjFUfqr0W8PyawR/3Z+lMsQdf4ZGtuv1rmtsr2ir4lRL0N4WkYaWMaVpL9grq
	mEfN9DDJLeTwlQsyQjLOHSybh1i5PyxQ/wO1FcXZRaxGNi6vYimneyYXncDlOF75tVV6MLus5db
	RLD4PouLgGy8oPqKPNUngKeOa03e4P853xAYWVKT0qWK67OgRBJnXmz1Zyl0lqUG+sKjofXRT/x
	x8y07MWLpYh0GDhV/lBdRq9wFMfxpe0l7tglXbmARLWfncXsQm9WfO0onoWWPWYzem64w2npYSv
	Kvho2bdVa1li0ehn7buDVAz14mXfFtxKwTYEnq/x7qtOHXVXCunQ/2q1CXFq4nwRGMbriEDPWf7
	iHXOMASuOCM+d3vJ7B+mE=
X-Received: by 2002:a17:90b:3f85:b0:38d:dbc7:5178 with SMTP id 98e67ed59e1d1-38e4b54610fmr8500537a91.22.1784403000707;
        Sat, 18 Jul 2026 12:30:00 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:ab5e:7eee:9312:fd2e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b0e828asm3178550a91.12.2026.07.18.12.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 12:30:00 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-websockets: enable ptest
Date: Sat, 18 Jul 2026 12:29:49 -0700
Message-ID: <20260718192949.1269959-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 19:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241269

From: Tim Orling <tim.orling@konsulko.com>

* Add a subset of tests provided in the sdist instead of the full
  suite provided in the git checkout.
* Skip 2 test cases that fail in test_imports.py::test_get_alias,
  test_get_deprecated_alias due to an inherent test-order/caching
  issue in that test module.
* Do not add python3-werkzeug (from meta-python) as a dependency
  so we can limit to oe-core only.
* 301 test cases pass with no failures.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/ptest-packagelists.inc  |  1 +
 .../python/python3-websockets/run-ptest          |  7 +++++++
 .../python/python3-websockets_16.1.1.bb          | 16 +++++++++++++++-
 3 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-websockets/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 2badb56c48..abe777e178 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -93,6 +93,7 @@ PTESTS_FAST = "\
     python3-uritools \
     python3-wcwidth \
     python3-webcolors \
+    python3-websockets \
     python3-wheel \
     qemu \
     quilt \
diff --git a/meta/recipes-devtools/python/python3-websockets/run-ptest b/meta/recipes-devtools/python/python3-websockets/run-ptest
new file mode 100644
index 0000000000..5fe2bdf545
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-websockets/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+# Skip these 2 test cases with fail due to an inherent test-order/caching
+# issue in that test module
+pytest --automake \
+    --deselect=tests/test_imports.py::ImportsTests::test_get_alias \
+    --deselect=tests/test_imports.py::ImportsTests::test_get_deprecated_alias
diff --git a/meta/recipes-devtools/python/python3-websockets_16.1.1.bb b/meta/recipes-devtools/python/python3-websockets_16.1.1.bb
index 2e2eb0c3ed..6baa744fac 100644
--- a/meta/recipes-devtools/python/python3-websockets_16.1.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_16.1.1.bb
@@ -4,7 +4,9 @@ HOMEPAGE = "https://github.com/aaugustin/websockets"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+SRC_URI += "file://run-ptest"
 
 SRC_URI[sha256sum] = "db234eda965dcce15df96bb9709f587cd87d4d52aaf0e80e2f34ec04c7670c57"
 
@@ -13,3 +15,15 @@ BBCLASSEXTEND = "native nativesdk"
 RDEPENDS:${PN} = " \
     python3-asyncio \
 "
+
+do_install_ptest:append() {
+    # These modules import test helpers from tests/asyncio, tests/sync or
+    # tests/extensions, which exist in the git checkout but are not part
+    # of the sdist, so they fail to collect. Drop them and keep only the
+    # self-contained sdist tests.
+    for f in test_auth.py test_cli.py test_client.py test_connection.py \
+             test_exceptions.py test_frames.py test_http.py test_http11.py \
+             test_protocol.py test_server.py test_streams.py; do
+        rm -f ${D}${PTEST_PATH}/tests/$f
+    done
+}
-- 
2.47.3


