Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDB7C4829F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 08:29:05 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.13376.1707380937316518291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 00:28:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bTIuYbbP;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40fb3b5893eso12255835e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 00:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707380935; x=1707985735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioniT5sAo1c/jtO6Xo0crHkJGkB25nmvFiMk9hL5J/Y=;
        b=bTIuYbbPO7JujihOJXPQecULVbF+L5DCOovtWUlLY2oSSn4FZjwJAoh0j1nZfrk5Va
         YAPilK26/RC3FQRVJDumYRs0EfJpO2mt+WE7RqTGo2KYA8ulwdK4WyfEywQLAPdWFCLv
         hBAHNhDUu4SZ6KTRKsTYNXIbdXDC8ZU+mVKCLUSYrlSx/gWKO3wtHYibUgRSyD191Vfn
         lPo6GuqgxH7Vixz6PmI10E9Iqq1A+C0jF8fDBTPoPkTIVGWn/CNvMQSA+2FJNdeqqaQg
         Xki+keQQFnidLxQblEVwhODCJmWG1/g2KKoUru6uC9T59NgPIXsucVd+QVi//Kx1w1sx
         q8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707380935; x=1707985735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioniT5sAo1c/jtO6Xo0crHkJGkB25nmvFiMk9hL5J/Y=;
        b=U3MP2cZsqqQOWNJM0Efcx4Oa9y7jde/vRRilhe54b0wu53poW4qJ/D7B6gU9cFb5Pz
         BscdRDz6s+Lx8Axyr2V/mDatOamPmkuJDqfOD3fXLhDFvE/3kaUC12DzTbB0v91pa0p+
         wVf1F0rPnR6NlXReTMU21Wq1CMILeFO/O5S1TIrg+lUhhuGVypX+/7CTC8IcpPK+7V48
         iViNAH0CtQPEz1C7qVizeiMB1DVvGekogyJ/KYwbc/HcdGtRcVDn+Ky6ck7ZXXbjJZ3B
         kdfQKr0ahOuWmjtjh5WnQ7UiWYHttWO2U4mY5UADIKBd/3k9vUl1bJRKm1XzYndoetEu
         8ITw==
X-Gm-Message-State: AOJu0Ywbv+fSTDSdF0qpn7IaBfmjLppMd+MEhzugGx/vzaxvCOeVLRAl
	8M5yEkTmS3rBskLPWXVQjEMkaNl/zotfw4DjZzUpuSP66F/eMkKRpcFrDOFx
X-Google-Smtp-Source: AGHT+IECHcm6Yh8tx5d+3ZoExvLnrDEKKbleT6fSiN0bZLCvlXOBbg3t0Mc6hySddPDqjwlAu/ioXg==
X-Received: by 2002:a05:600c:314d:b0:40e:60c3:c327 with SMTP id h13-20020a05600c314d00b0040e60c3c327mr6174969wmo.1.1707380935282;
        Thu, 08 Feb 2024 00:28:55 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id j12-20020a05600c190c00b0040ebf603a89sm913321wmq.11.2024.02.08.00.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 00:28:54 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/7] oeqa: replace deprecated assertEquals
Date: Thu,  8 Feb 2024 09:27:28 +0100
Message-ID: <20240208082821.430510-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208082821.430510-1-adrian.freihofer@siemens.com>
References: <20240208082821.430510-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 08:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195107

assertEquals is deprecated since Python 2.7:
https://docs.python.org/2/library/unittest.html#deprecated-aliases
It throws errors at least on Python 3.12. Replace it by assertEqual.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/sdk/buildtools-cases/sanity.py | 2 +-
 meta/lib/oeqa/selftest/cases/devtool.py      | 2 +-
 meta/lib/oeqa/selftest/cases/liboe.py        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/sdk/buildtools-cases/sanity.py b/meta/lib/oeqa/sdk/buildtools-cases/sanity.py
index b9dfa39a061..a55d456656e 100644
--- a/meta/lib/oeqa/sdk/buildtools-cases/sanity.py
+++ b/meta/lib/oeqa/sdk/buildtools-cases/sanity.py
@@ -21,4 +21,4 @@ class SanityTests(OESDKTestCase):
             # Canonicalise the location of this command
             tool_path = os.path.realpath(self._run("command -v %s" % command).strip())
             # Assert that the tool was found inside the SDK root
-            self.assertEquals(os.path.commonprefix((sdk_base, tool_path)), sdk_base)
+            self.assertEqual(os.path.commonprefix((sdk_base, tool_path)), sdk_base)
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 15249b70fdd..dd3a5e9b5c3 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1097,7 +1097,7 @@ class DevtoolModifyTests(DevtoolBase):
             runCmd('git -C %s checkout %s' % (tempdir, branch))
             with open(source, "rt") as f:
                 content = f.read()
-            self.assertEquals(content, expected)
+            self.assertEqual(content, expected)
         if self.td["MACHINE"] == "qemux86":
             check('devtool', 'This is a test for qemux86\n')
         elif self.td["MACHINE"] == "qemuarm":
diff --git a/meta/lib/oeqa/selftest/cases/liboe.py b/meta/lib/oeqa/selftest/cases/liboe.py
index fab69291981..d5ffffdcb41 100644
--- a/meta/lib/oeqa/selftest/cases/liboe.py
+++ b/meta/lib/oeqa/selftest/cases/liboe.py
@@ -99,6 +99,6 @@ class LibOE(OESelftestTestCase):
 
         dstcnt = len(os.listdir(dst))
         srccnt = len(os.listdir(src))
-        self.assertEquals(dstcnt, len(testfiles), "Number of files in dst (%s) differs from number of files in src(%s)." % (dstcnt, srccnt))
+        self.assertEqual(dstcnt, len(testfiles), "Number of files in dst (%s) differs from number of files in src(%s)." % (dstcnt, srccnt))
 
         oe.path.remove(testloc)
-- 
2.43.0


