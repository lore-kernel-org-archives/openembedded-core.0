Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11C9E6749D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 11:39:01 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78511.1766403538290483868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 03:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K4i3GNKI;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477a1c28778so44190235e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 03:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766403536; x=1767008336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tf/d5/rNSFuUPZ1RytwlE3TNP/F1A9vwqZKBTyPL8kI=;
        b=K4i3GNKID8gyi7F908nG6DinDZYJM3XUvcLkktRx5mXNnzUNiduUauayWnqzxGNsmK
         vkSSsQNEgNAkeVGpMquDc1lFgWXrIedQV+kpvI4DTo38NNoLlqtmixDWKRm31K9S2ib4
         X8PJAtuLlYC6oCUOSFka8vntD+0zn6nBVK+FcMeTK50VWJQw0D6zLO1Jw1SUin+paiyT
         B/KNoPc32xcjhuEpKUB09Ff3Zeg6fOy20x1vrFvrw/AWdKa6Gplcziz6Ivul/B+aP6f7
         6LvyQyUg3Tdgem3ciI8KoH7Jo94KYJn286eV5Zt6Dj51e4GfZasiBpzybfw1P+jRig/H
         UeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766403536; x=1767008336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tf/d5/rNSFuUPZ1RytwlE3TNP/F1A9vwqZKBTyPL8kI=;
        b=tksTCukBeEI2ayJ/NUvUphSkJmzdWts9fFWQANvTXdvSqXHA074gjqnQOVTAlFnniu
         OrsuJaTXH8RID5PP80vzsXnrKKXeMy6GMvzgJSQJ9x9RHMyuRzV+8CTriMD+HGvVqGxD
         lEj3U8Nuy5lSs6cB2AuRGO9/daeGl30lL/4kkLdIR7xo3zKhUKIzKnIfaViFbILR01cf
         qRaX7yCNM9aSN6IQ/YA7bmDtOnSw0NkWiLMxF+kg5PtVlQlKfcgJllGiJZivxid4HoTA
         TPb5qPq7kaUI90ppA5k6VVklHBqwhDynfmq5b6mLKm0R3LuEU0FbPF+uiKhKykjg2Xcy
         KEBw==
X-Gm-Message-State: AOJu0YwzLUDTAJ23WjQCw5DlZQdYETvCOL2P/y30K13wzq6m8gQtqDmQ
	cXL0c9r6kJu+Lylq2som+mnvykmitRz39E9zRVk94SHUXeGbS82fqjGLhYjEskvn0jk=
X-Gm-Gg: AY/fxX4ImJ1shxT1PdlHo6QBttRaQUZLdvycgeKEendupYeK1b5vsDtjTVbx0w0i+oN
	ZJY3gkBJ7baycL6kycTk1dSmcpX+eVDH3174Y9QJ2xN+ZHRg2uN40VE++Xa3rFfj9NSl1SClXqy
	5dptCtXAMO6mBxjGSK4HHED7b0oO0QZ0IEkb1gIVVTUh0PCw/1MUbPI3POzuflpIdlrWs6go59j
	7Jd8E7VoqggSod5hOp+S21fC8ftlp967cGAoPVeNh8ghEKNouYUms7Fmec4TKNFIkTU9nlnH8jK
	9E6EHJbRWSUgg0oDnDUj/FpVsgbaSEs4TGoUI7TSvaLgS4DlzYP2H5ZUwDRJJ9MmfRUYXJzE7nC
	loVQrvyZ9Hzc2rbkdD5sjbKgdINfM5QSCNjntmUW2Idaq/g9WcX2Qy4aCGeN2A3nkrofheApKqE
	DG3mxTrIz9eugj
X-Google-Smtp-Source: AGHT+IF57BfHU9H33SaazjIMrlDYIJ4vVP4XKdFe9wr9/4WyqpAJuKMF8r+cst/PNL7gT0NeP5aPuQ==
X-Received: by 2002:a05:600c:4e90:b0:471:989:9d7b with SMTP id 5b1f17b1804b1-47d19594b70mr122289255e9.21.1766403535924;
        Mon, 22 Dec 2025 03:38:55 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08efsm21720373f8f.29.2025.12.22.03.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 03:38:55 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 2/4] overlayfs: oe-selftest: Make the test more deterministic
Date: Mon, 22 Dec 2025 11:38:38 +0000
Message-ID: <20251222113840.2163929-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222113840.2163929-1-uvv.mail@gmail.com>
References: <20251222113840.2163929-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 11:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228298

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

The test orignally was written under assumption that poky distro is
used. When poky-altcft is used for example, then systemd is already set
in DISTRO_FETURES, which the test did not expect.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 580fbdcb9c..3e55e97927 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -5,7 +5,7 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu, get_bb_vars
+from oeqa.utils.commands import bitbake, runqemu, get_bb_vars, get_bb_var
 from oeqa.core.decorator import OETestTag
 from oeqa.core.decorator.data import skipIfNotMachine
 
@@ -46,7 +46,8 @@ inherit overlayfs
         res = bitbake('core-image-minimal', ignore_status=True)
         line = getline(res, "overlayfs-user was skipped: missing required distro features")
         self.assertTrue("overlayfs" in res.output, msg=res.output)
-        self.assertTrue("systemd" in res.output, msg=res.output)
+        if not "systemd" in get_bb_var('DISTRO_FEATURES'):
+            self.assertTrue("systemd" in res.output, msg=res.output)
         self.assertTrue("ERROR: Required build target 'core-image-minimal' has no buildable providers." in res.output, msg=res.output)
 
     def test_not_all_units_installed(self):

