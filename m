Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83105C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 02:21:33 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.2411.1707445289504318638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 18:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ifKB6Foo;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-296a02b7104so368395a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 18:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707445288; x=1708050088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vu7Rxu0Q9xJ+f/6bO5zV8y1Nv/XjiRGW1MCmqSjr0P4=;
        b=ifKB6FooDet6JorC2Yz/YriGL/d994r+aItLep3IS03EY/4SGwWPtOPmeHaZ4ovojH
         vwvIA3ehpjXSoTWOcw+4ghONrWNAMTRgbNN7wGYOJta4Pae51TYAadscV0vGMKSF64Uo
         kVFKNolCC0khan3yFD5qTflGCSyxoolmgLM7j9qtEGSh87NnFnS4jWDFhFkCo3gtj3D3
         UQN11s8HI7RbW2ERVN3PM/hBxiNzM+h4mEre+kz6AjaQReGT8vLAtNF1YBDqUwucNpEt
         wyp3N3rNo17gbUBK5NXCm0PQ+bqhC8rU4TRqc4pLW3T/RIrTXL7uYA5Wr+J9KY2FynLX
         sitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707445288; x=1708050088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vu7Rxu0Q9xJ+f/6bO5zV8y1Nv/XjiRGW1MCmqSjr0P4=;
        b=Vhc1xnh9jyZROxtC+W90H+bLN0exWYdLdSOZUwIWQfJ22vbtYBGETkXjUv10yuztFT
         2ypTCAEIjbFGAXe2+bU1o2EZ8bYi/6kZpn4dK8WtjZPB7qGcXIgWgWwN618dxYOaDeko
         vxzruwvZG5oYHvd8vDXmGvm8zqMzP6bBxurfNbjNRVxNy2ZFzrI0X/6rrSrGyS2Wma/Z
         QHuoLYorvJVLjGmdKtfJtW8f560fXwY85earNmNXHLQPFBZGdudkZcl14IE1n2WySXJU
         oeMczwk05suM7tyz3pSNJUmf6NlOP94E1BB9T6WxjqcXA9xfqAvER6uCQZW5BsBLjCoK
         2Umw==
X-Gm-Message-State: AOJu0YxocTXHwszXG+FhXH9/pucI/W/6V27KUG92WS+ydiecKUVNqt7m
	iNTHQ95d3AMvPcwR9oxtmg/3pUu1LQlxxv94TmxwHnPVO9SqKzCWNgGAVslL
X-Google-Smtp-Source: AGHT+IF7PsidoqmFQ6me6S2+eoRZdnKAdl3ZerXULSeNUy+NZ+2RjFH4xwsM3KyefpKpKNjdsklgEQ==
X-Received: by 2002:a17:90a:9ad:b0:296:2f5c:61f6 with SMTP id 42-20020a17090a09ad00b002962f5c61f6mr280467pjo.38.1707445288505;
        Thu, 08 Feb 2024 18:21:28 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:8cbe:e895:b511:86c6])
        by smtp.gmail.com with ESMTPSA id ft10-20020a17090b0f8a00b00296a6175fc5sm498490pjb.36.2024.02.08.18.21.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 18:21:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-pyyaml: enable ptest
Date: Thu,  8 Feb 2024 18:18:59 -0800
Message-Id: <3314011a7a01983cca9da01341274daf81303b89.1707444824.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707444824.git.tim.orling@konsulko.com>
References: <cover.1707444824.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 02:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195186

Upstream is in the process of migrating testing to pytest, backport
test_dump_load.py (the legacy_tests were throwing Errors and Failures).
We don't really need to run upstream's test suite, but we do need to verify
that our runtime is functional.

https://github.com/yaml/pyyaml/commit/a98fd6088e81d7aca571220c966bbfe2ac43c335

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---

All tests pass on qemuarm64 for core-image-ptest-python3-pyyaml via testimage

 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 .../python/python3-pyyaml/run-ptest             |  3 +++
 .../python/python3-pyyaml_6.0.1.bb              | 17 +++++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyyaml/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index b590640edc2..0192146dbd0 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -69,6 +69,7 @@ PTESTS_FAST = "\
     python3-pluggy \
     python3-pyasn1 \
     python3-pytz \
+    python3-pyyaml \
     python3-trove-classifiers \
     python3-wcwidth \
     python3-webcolors \
diff --git a/meta/recipes-devtools/python/python3-pyyaml/run-ptest b/meta/recipes-devtools/python/python3-pyyaml/run-ptest
new file mode 100644
index 00000000000..8d2017d39ce
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyyaml/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
index 102e2f2498b..62be059df52 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
@@ -20,4 +20,21 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-netclient \
 "
 
+inherit ptest
+SRC_URI += "\
+    https://raw.githubusercontent.com/yaml/pyyaml/a98fd6088e81d7aca571220c966bbfe2ac43c335/tests/test_dump_load.py;name=test \
+    file://run-ptest \
+"
+SRC_URI[test.sha256sum] = "b6a8a2825d89fdc8aee226560f66b8196e872012a0ea7118cbef1a832359434a"
+
+RDEPENDS:${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-unittest-automake-output \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${WORKDIR}/test_dump_load.py ${D}${PTEST_PATH}/tests/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


