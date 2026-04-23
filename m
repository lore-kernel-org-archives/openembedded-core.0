Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE301FDEE31
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 17:13:04 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2695.1776964377021284282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 10:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=YPUx+rjP;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8ee63e91acfso257867085a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 10:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776964375; x=1777569175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZWD8nMp+NPDzGyM42GlU5qYkT3IzTFN1fEdf29kOPw=;
        b=YPUx+rjPsDe8A/TKzVaETWLheiA6Yn7MATW1N0MyaOX9Fd2rplagdcVoOlb8iY43SW
         mhOCuJ4iNEqHZmr4MWUcnWDKhY5So5ez/tqFMQ9xAh9dHj/g6+faRff87rfs9j2fofvF
         zWSVrZZB/3rkRJVVj2zbmewRBzTC6RUsT0NkuiqIpUfprkBqv1hdw8iqWpw0tzxLpj4b
         pkvagVa94BiUKhExJRG2ny4m7ZdevfXPM4Xj37T2eJrOpZFYt3mr7DzcH9MOj2+GESI7
         0y8qTsUI2jl0cXrldKIrG/66D2fOPiTTD/ZqIeVChWwyZ7LSVG2j35uiMfHKR5Jv4jXt
         qtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776964375; x=1777569175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ZWD8nMp+NPDzGyM42GlU5qYkT3IzTFN1fEdf29kOPw=;
        b=hor+wZssXQAXtP+ffhmvwKFe2YqCjxJlvNmKbvBrboHdG5CsxUoiWFZD5fyfRkFahf
         vqvHA3BEtBLN5tcY5JpjdOoWXZ+ExbhW18ngf5HUwNtWeRNca+sNNk7dLS0AwDTQJT4/
         7LvRjkBhntv+I/pFdcDcdSwDT5QloK76qmQJeM++py3LuV0YxrNCKyQ0WqhHP/+LJAMA
         Ra2mi+eHqQHaaqtNVOibP0IlIB7myfLm5tAqcMoRHPOx7N0X/PBnZJAP6oWnbCGEcbDh
         HHeFxTTfSNNldTkq6+I4S+GI1QtHGn1GNxYCp5g0mvDmlzzHk36ye4vItYbLGJFrHpJC
         Jbhw==
X-Gm-Message-State: AOJu0YxdVGwiwyI/H4MHU0hRpFZ1xBwlLmwpaA0mfwYwwWFwVt5ZfBwm
	FA/PuhvUd6j6QHuE83wdRnECaE8wAoU4Onv7zaowkAh/E0DkpuPWdtjsT7LXjlVh8//2cYVFKrZ
	IdZfK
X-Gm-Gg: AeBDies5nf+KQjr+1Y62BaBOB/Lw2ajiuzaSLl9XDqP2EkQb0SBQZZ41UOr2tefbnVb
	x5ihbvJ4wOOfsIj0cBrHuO5mb5M0c63f1/HaHzB98wgexSPMn3RUF7bXBDgO4OqAevLU7O1ehnH
	m8tMwHp0hFzd0+mVfpp+dpXg9+n3AvowxcMHhG24EeMWrfHZ7UuczAX4P3euVhg/+KDoohPariK
	B8potOcdwqOQFnk50QgLqbEf1qX2HQmYjWiazyOrYuzmS7amycAcn3gJnPmjMlscv0wnt6/UUIk
	g6k5CKRIdNt43+6R+sdDfYvG/3o+uyHNYTtWjyZHQORD8WzmpVbVTSKCV0pJn+RcXuHQwa2tlnw
	LAMQkMIUi8YIwf0h2ry2pUpbFNPsoCdCxuadio9+yGSuOR4AW2I9VTRla3jTZNBCiBtwemD3Ywz
	oidSjo/qLKSP2RsnCHfWj2aAoeJB501GKWrB//Gg==
X-Received: by 2002:ad4:5aac:0:b0:896:fdd6:4a93 with SMTP id 6a1803df08f44-8b02817214bmr449347466d6.50.1776964375243;
        Thu, 23 Apr 2026 10:12:55 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae86947sm213869266d6.37.2026.04.23.10.12.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 10:12:54 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/4] python3-vcs-versioning: add ptest
Date: Thu, 23 Apr 2026 13:12:46 -0400
Message-ID: <20260423171246.309711-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423171246.309711-1-tgamblin@baylibre.com>
References: <20260423171246.309711-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 17:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235831

The tests are in the 'testing_vcs' directory, so set PTEST_PYTEST_DIR
accordingly. Add setuptools, setuptools-scm, and git to the ptest
RDEPENDS, since many of the tests make use of them. Many of the skipped
tests depend on mercurial, but that's in meta-oe and not worth moving to
oe-core just for this.

Add python3-vcs-versioning to PTESTS_FAST in ptest-packagelists.inc,
since the suite only takes a few seconds.

We also need a custom run-ptest script for two reasons:

1. There is a 'vcs_versioning.test_api' used as a plugin. This is
   mentioned in conftest.py but is intended to be picked up from
   pyproject.toml, which we don't ship with the ptest image. Instead,
   just add '-p vcs_versioning.test_api' to the pytest call.
2. The test logic tries to rewrite pytest's assertion failures, which
   doesn't work well with our automake formatting. We can work around
   this by telling pytest to output plain messages with --assert=plain.

Example test results:

|============================================================================
|Testsuite summary
|# TOTAL: 409
|# PASS: 364
|# SKIP: 44
|# XFAIL: 1
|# FAIL: 0
|# XPASS: 0
|# ERROR: 0
|DURATION: 3
|END: /usr/lib/python3-vcs-versioning/ptest
|2026-04-23T16:21
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-vcs-versioning/run-ptest   |  6 ++++++
 .../python/python3-vcs-versioning_1.1.1.bb    | 19 ++++++++++++++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-vcs-versioning/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 11a894accf..d7a529678f 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -87,6 +87,7 @@ PTESTS_FAST = "\
     python3-pyyaml \
     python3-rpds-py \
     python3-trove-classifiers \
+    python3-vcs-versioning \
     python3-uritools \
     python3-wcwidth \
     python3-webcolors \
diff --git a/meta/recipes-devtools/python/python3-vcs-versioning/run-ptest b/meta/recipes-devtools/python/python3-vcs-versioning/run-ptest
new file mode 100644
index 0000000000..6550ec8273
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-vcs-versioning/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+# we need to load the vcs_versioning.test_api plugin for some tests to work.
+# Also make sure that we don't get pretty diffs for assertion errors so that we
+# don't see terminalreporter errors (which the automake plugin un-registers).
+pytest -p vcs_versioning.test_api --assert=plain --automake
diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb b/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb
index 788717de9e..4d2f5007b4 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb
@@ -7,9 +7,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
 SRC_URI[sha256sum] = "fabd75a3cab7dd8ac02fe24a3a9ba936bf258667b5a62ed468c9a1da0f5775bc"
 
+SRC_URI += "\
+    file://run-ptest \
+"
+
 PYPI_PACKAGE = "vcs_versioning"
+PTEST_PYTEST_DIR = "testing_vcs"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 DEPENDS += "\
     python3-packaging-native \
@@ -21,4 +26,16 @@ RDEPENDS:${PN} = "\
     python3-typing-extensions \
 "
 
+RDEPENDS:${PN}-ptest += "\
+    git \
+    python3-setuptools \
+    python3-setuptools-scm \
+"
+
+do_install_ptest:append() {
+    rm -rf ${D}${PTEST_PATH}/.pytest_cache
+    find ${D}${PTEST_PATH} -name __pycache__ -type d -exec rm -rf {} +
+    find ${D}${PTEST_PATH} -name '*.pyc' -delete
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.53.0


