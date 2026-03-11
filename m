Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEB21049523
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:47:35 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17043.1773222445595452194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HiEqYS4Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso36388065e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 02:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773222443; x=1773827243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+dNrQ/qrLSUt2jRPqMCrBxiFgE3zQhg4KOAXL3C0x0E=;
        b=HiEqYS4QM+Jq44WsIDOJ6WehS00UwBtaUIw+utFGIauAR66A/mreq3jrutvC/nuwBw
         BvH8jvfxRbAcugeP0yOcvqSQGVnqLjKzCL/J9N1BBOnG6RlujuG/nKaj1SpbXPgkG31h
         CifGyzVovWpc9f50LHDUkLT43e2WwdwQTY0sM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222443; x=1773827243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dNrQ/qrLSUt2jRPqMCrBxiFgE3zQhg4KOAXL3C0x0E=;
        b=YWRw9EHMNR5IANQMdBTzUCm925Dbf251EMgA9/uT7olYGsllhw8ZgegEf5F0gYGZZ6
         kVBIzYgqBeSVUtOFs5jWZwH7P8xJqLM7ovZCBOR4YlriHRh225xlWILRVxLtm6+gUKBM
         zvKnJTaxVp5fVewkj42w79rHxa8VucDFUBtY63x5pgT48eQRqSePNc2dAXyXYQw2rqu+
         XGfpV0B7Ezf/ZiG6gVYz5mDbmWO9Tq6SfOEKm41MwbLjGJAJYLi19sag7vwjufRz29F6
         Sae6OuuqpdGoPOjkOVSRmLzgkJmD8oI8GuSUGwqsSvlOyekZxyu505B5vbB3tbWeuXQe
         40XQ==
X-Gm-Message-State: AOJu0Yx+Zz4FeGJOwG8E58tvKG1g9INPtprLQqstHtpIDzosXNGpOix/
	IBvT816uoxYSa8vaqN2w3KrLvbRjRhmkXMNlBhpx37InyQejb0gsLtSblt64QuWHxk2fRdeAT9x
	YekDksKQ=
X-Gm-Gg: ATEYQzxVwrBdmRix7UeyzvVteZfwubapqke0VJv6yy7as5HQOmjUpSB89sFJG9pDmS0
	3aNlaccuFfXP79Gj2JkYI9TgXLpzKDIncP05bZ4bP306KUXmtxwO4v4aYRkwWlS29Hbueg4obl2
	kNs3gq7NLu35zR3B84eMvfM4485Do3e9hnMJPBsHptdj/qc3NSwWhHX29kqkqREVKVKv3kCVEUn
	857vMSPj4FxBToo+Opn7gElgs/nqlM3FoHsgj8TbHjYSS53m8Wv+oXJo71wRpS1MPlQorApRKQe
	8kwptybYmvzD0+e4ArjUZauD8GmBrV3NNSel5kJM8IV4GIi/ma0rWTVHTyRj3JkIqoCq1M1obkd
	ev7mnM/VSeO5O80564uPjkpUH8odREDZy9lLJ9UER0NPMslOAdhrX6jk7kA/BEOc6rIyHRfeNrs
	4jdb8x65IBDV7s/4Eg08XWtkA7d9TrP03suEQuZ0S0WCWABmIaw+Q=
X-Received: by 2002:a05:600d:6450:10b0:485:38fc:7069 with SMTP id 5b1f17b1804b1-4854b1b1a61mr22134785e9.23.1773222443449;
        Wed, 11 Mar 2026 02:47:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7fc5:b1af:c486:ad0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm180707505e9.9.2026.03.11.02.47.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:47:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest: Introduce OEQA_TESTDISPLAY variable and use for sdl/gtk qemu test
Date: Wed, 11 Mar 2026 09:47:22 +0000
Message-ID: <20260311094722.3403685-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232856

Currently we've been using DISPLAY from the parent environment indiscriminately.
Since we can change many of the tests to use internal VNC, we really need a mechanism
to only use a DISPLAY when the system really needs to and there is no other option.
Somehow we need to differentiate between that and a system with graphics available.

Introduce OEQA_TESTDISPLAY for this purpose, this being used only if there is no other
way to run the test.

There is only one test case I'm aware of that needs this, so this patch updates
that test case.

This variable is not meant as a replacement for all DISLAY usage, it is only
for cases where the test would not otherwise work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 463dcc53967..4ea68fad7cc 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -11,6 +11,7 @@ import os
 import tempfile
 import oe.lsb
 from oeqa.core.decorator.data import skipIfNotQemu, skipIfNotMachine
+from unittest import mock
 
 class TestExport(OESelftestTestCase):
 
@@ -226,8 +227,13 @@ TEST_RUNQEMUPARAMS += " slirp"
         Product: oe-core
         Author: Alexander Kanavin <alex.kanavin@gmail.com>
         """
-        if "DISPLAY" not in os.environ:
+
+        # Use OEQA_TESTDISPLAY if set, fallback to DISPLAY from os.environ
+        display = get_bb_var('OEQA_TESTDISPLAY') or os.environ.get("DISPLAY", None)
+
+        if not display:
             self.skipTest("virgl gtk test must be run inside a X session")
+
         distro = oe.lsb.distro_identifier()
         if distro and distro == 'debian-8':
             self.skipTest('virgl isn\'t working with Debian 8')
@@ -252,12 +258,14 @@ TEST_RUNQEMUPARAMS += " slirp"
         features += 'IMAGE_INSTALL:append = " kmscube"\n'
         features_gtk = features + 'TEST_RUNQEMUPARAMS += " gtk gl"\n'
         self.write_config(features_gtk)
-        bitbake('core-image-minimal')
-        bitbake('-c testimage core-image-minimal')
+        with mock.patch.dict(os.environ, {"DISPLAY": display}):
+            bitbake('core-image-minimal')
+            bitbake('-c testimage core-image-minimal')
         features_sdl = features + 'TEST_RUNQEMUPARAMS += " sdl gl"\n'
         self.write_config(features_sdl)
-        bitbake('core-image-minimal')
-        bitbake('-c testimage core-image-minimal')
+        with mock.patch.dict(os.environ, {"DISPLAY": display}):
+            bitbake('core-image-minimal')
+            bitbake('-c testimage core-image-minimal')
 
     @skipIfNotMachine("qemux86-64", "test needs qemux86-64")
     def test_testimage_virgl_headless(self):

