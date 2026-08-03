Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F62C55182
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 23:27:00 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5788.1785799617328606920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 16:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=b0SAAWdV;
 spf=pass (domain: konsulko.com, ip: 209.85.214.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caea3f742bso40661975ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 16:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785799617; x=1786404417; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51J53fCN1oCjTKA6YPqzrZpkN2AUEtDLVcfVe+WNJ+A=;
        b=b0SAAWdVjOagCCbNMRYQtQS5o6fxwihw0hEMa30xleURLEcHnoh1RUxCuttvKPrYQr
         eK+KPn+r1CBq58JQB8MhZ+WxoOV+gw0kYVuWtF3fhQU3zFGM0bPaJQCq1q8WtbVHo+V1
         2a6ogFp9P7SBANwVehJbYvlo3ht6xDxahGMC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785799617; x=1786404417;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51J53fCN1oCjTKA6YPqzrZpkN2AUEtDLVcfVe+WNJ+A=;
        b=qQblYbyWiAHnorlnZxEeSxgHcXCInSuUZf3Wx6DKdz8JCSrYkwyHfArANRgoafvL9F
         2daOM6pK67wncl3bCd+6NnX+TtxOL8fuSf/ig7wIw+HVFpKRdWJoGpeFt9UJBThhOhBc
         fYCh+qABbBlrwfMKqXOqThivvBRR+Tec1WEaSrasQ30tw3ZKyLUi1OpUWBTlstN1BA4k
         tcKGds5MQqWrMVU5wijVRYR6d+GTHtH5iangOXPeSROLaIZ0akxUKcTQPZq/89qUGaPb
         2hgr7WqVvClna0JCFrBwZE1Aav5bYuXJ0Uqr1pSdk7S0lyrhBCg8giG+IpnT5ELmuQQG
         wQcA==
X-Gm-Message-State: AOJu0YzYeSUVI6WSsM5Z5UKsjUE6XOH476RD4E7p0SW3OZ1rG0B7B7Xg
	Ly3Qcjf5dB/7rXxk2E99UfoK6R2ASOpg+6OPtM0I9C91OIHlVNWL9GCSHrgh8n6iiYWgVfrmEI4
	H+JPM
X-Gm-Gg: AR+sD13CmpkLl8RaOuN4YyMIco9XGgkCkJxlzFlXwdoFJR/PnuZII0uOG/sWVNDb48N
	gcgUwotHpENQxlhO9zBTuAPjvS1PYzogiSgr1twD/otEjTEhV9exnkcNbtyKRzqoJI4PaF7eYtV
	a7MW9bNUq93Hga8hEGYdPrgdEaYXTTruHJ4C4UkShnxGTj4En8s/NHzouK7jloMv4SRecSdFbD8
	GexULAv4Hyd8w9ZJnatVcGa6CmPJliEUq3fQ20bazhkKwGrpTN8WSIuYQtXX0JmP5SgditLnE+B
	isB3s9pJswxNq4colpsoXnWyNmlkr/zf4gIe8/UtxyGffrikWYpTzFuhypVaXEQT95Gkx0ISVhm
	uJxf/oYiHy/ymCAmqmokips6K/7wUoKDr6UB//QZ1XzongSCpAqO8cmT+0ecvMdXS9HpiEpNNy8
	yrwhFJg3GSCvJlMJqPX88lZ9ME49UxOEL/DFAqnH6hFE2zQdTRhJnoIWO7mzA67e5q3yYMOIR6o
	1N3Ag==
X-Received: by 2002:a17:903:124e:b0:2cc:f5b8:4c2e with SMTP id d9443c01a7336-2d0521cd890mr114129435ad.9.1785799616663;
        Mon, 03 Aug 2026 16:26:56 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6808:583f:6e91:c834])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b11f99csm44342545ad.58.2026.08.03.16.26.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:26:56 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] Revert "python3-websockets: enable ptest"
Date: Mon,  3 Aug 2026 16:26:41 -0700
Message-ID: <67b03cb15e4d75bced1c4837a0cf391105a2a379.1785799308.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785799308.git.tim.orling@konsulko.com>
References: <cover.1785799308.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 23:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242676

From: Tim Orling <tim.orling@konsulko.com>

The tests/ are no longer packaged in the sdist and this is intentional:
https://github.com/python-websockets/websockets/issues/1739#issuecomment-5016084799

References:
https://websockets.readthedocs.io/en/stable/project/contributing.html#packaging

"You mustn’t rely on the git repository as input. Specifically, you
mustn’t attempt to run the main test suite. It isn’t treated as a
deliverable of the project. It doesn’t do what you think it does. It’s
designed for the needs of developers, not packagers.

On a typical build farm for a distribution, tests that exercise timeouts
will fail randomly. Indeed, the test suite is optimized for running very
fast, with a tolerable level of flakiness, on a high-end laptop without
noisy neighbors. This isn’t your context."

This reverts commit b75738de6f961a52f94dc89bf8178fef60217984.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/ptest-packagelists.inc  |  1 -
 .../python/python3-websockets/run-ptest          |  7 -------
 .../python/python3-websockets_17.0.1.bb          | 16 +---------------
 3 files changed, 1 insertion(+), 23 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-websockets/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 453fb87c17..370606ead7 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -94,7 +94,6 @@ PTESTS_FAST = "\
     python3-uritools \
     python3-wcwidth \
     python3-webcolors \
-    python3-websockets \
     python3-wheel \
     qemu \
     quilt \
diff --git a/meta/recipes-devtools/python/python3-websockets/run-ptest b/meta/recipes-devtools/python/python3-websockets/run-ptest
deleted file mode 100644
index 5fe2bdf545..0000000000
--- a/meta/recipes-devtools/python/python3-websockets/run-ptest
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-
-# Skip these 2 test cases with fail due to an inherent test-order/caching
-# issue in that test module
-pytest --automake \
-    --deselect=tests/test_imports.py::ImportsTests::test_get_alias \
-    --deselect=tests/test_imports.py::ImportsTests::test_get_deprecated_alias
diff --git a/meta/recipes-devtools/python/python3-websockets_17.0.1.bb b/meta/recipes-devtools/python/python3-websockets_17.0.1.bb
index b84aa0dcef..6733cfd0f9 100644
--- a/meta/recipes-devtools/python/python3-websockets_17.0.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_17.0.1.bb
@@ -4,9 +4,7 @@ HOMEPAGE = "https://github.com/aaugustin/websockets"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
-inherit pypi python_setuptools_build_meta ptest-python-pytest
-
-SRC_URI += "file://run-ptest"
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "5baa9bc0dfbae8c507e51c8cf1b6d4628086f7a87bbd3a9952bd5f035451f1cc"
 
@@ -15,15 +13,3 @@ BBCLASSEXTEND = "native nativesdk"
 RDEPENDS:${PN} = " \
     python3-asyncio \
 "
-
-do_install_ptest:append() {
-    # These modules import test helpers from tests/asyncio, tests/sync or
-    # tests/extensions, which exist in the git checkout but are not part
-    # of the sdist, so they fail to collect. Drop them and keep only the
-    # self-contained sdist tests.
-    for f in test_auth.py test_cli.py test_client.py test_connection.py \
-             test_exceptions.py test_frames.py test_http.py test_http11.py \
-             test_protocol.py test_server.py test_streams.py; do
-        rm -f ${D}${PTEST_PATH}/tests/$f
-    done
-}
-- 
2.47.3


