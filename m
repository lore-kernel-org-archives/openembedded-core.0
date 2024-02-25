Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA51C47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:34 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.7449.1708898013851734908
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:53:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Pt4Lz2jo;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.54, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-599f5e71d85so1931129eaf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708898013; x=1709502813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFDR6wSrlDNXBzqFbErAlYB2yiE8rgpNJ9r//zTlGmM=;
        b=Pt4Lz2jopjJfrq0W5evhkCKMkwsRP9sP5qYhQTRS8PcqTHc/mzcsdeYoahwqX5LGli
         AdTmK2Q70JmyZP0K94QnRT1c67DwXAjXDiJGA9YrSEjyS6iXNYeErLMaq8YEMr2Y5Qs2
         uEriwo9JG8BgDx5PGv+98xSvkExQkhls/Eo5i22de4hGGqEnx8amR59AG+2ut6/OSHXG
         kiMsk+mJDvik+f9lyvAV4M4J5OFLWhhuBJeY1Xi2Xov/WAV7+66gG91/cI5IxScrv6fQ
         lKQS5Bes7bM2yq1aPxDjenGy8LwQMR46osjW6oBHkqy684oTVUmMMJtKf+zVLNQqkUxi
         F1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708898013; x=1709502813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFDR6wSrlDNXBzqFbErAlYB2yiE8rgpNJ9r//zTlGmM=;
        b=VCjf2aMo8/djd0JJn6MYnfleB84YV5XIAyjrfsE9/SavZtQzPR1gJ+QUeCNKRzK+Bi
         Wjr7c/nOEfsPShW9BbKaHsXg+L+ZPKKv82VQqPuWQzu2kYwMZv6S0Ivg3OnqrFcfZ5b4
         3k3gbJGy64mcVNumCt4R87BO7EQ6nL9uOa08aetPFPPpTNAfXbT1G0OVB27WSPbZlekG
         kqyoJu++s7LtXmdX4r9/GnZPnYtZtw9JnMWQ+TXxyAJWwrNYpGAAQo2FW7FEgHm3MBs+
         FrMhS0QC/qPx1itiirjrjivDsmSsOWP+EDkf2snyJK4bKseT1Ul5uXODIprEZEF0VljY
         789A==
X-Gm-Message-State: AOJu0YxDgGEREQExvhCqqTvmN0CgehGsCvq29pcDjQx+MINI+oVk0rW2
	tpKnjzYF+AwJvE1rpXXxIlwYMuQVrYeMiLkPw29UnVYOY8gmZHJM3NaRRl5cVoR8+KORt0HLhBx
	s0YEcRA==
X-Google-Smtp-Source: AGHT+IFDKNPeOYT7ZipuTf3P9q51OBEgS1ZrUjZIK5jb1XMSSYtd8ocvWYCCwvz+1/rEPjb/F4NKdA==
X-Received: by 2002:a05:6358:9148:b0:17b:521d:9fcc with SMTP id r8-20020a056358914800b0017b521d9fccmr8035230rwr.9.1708898012961;
        Sun, 25 Feb 2024 13:53:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.53.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:53:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/22] oeqa/selftest/runtime_test: only run the virgl tests on qemux86-64
Date: Sun, 25 Feb 2024 11:52:40 -1000
Message-Id: <16a9037d28303af250bd379de53edb7a00a8ce49.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196173

From: Ross Burton <ross.burton@arm.com>

These tests should be able to work on qemuarm64, but this is untested
and the runners will need configuration.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 09b9558e20e58b473154895b93cff16261c7f561)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 29e82881d1..d06d480c2b 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -8,7 +8,7 @@ from oeqa.core.decorator import OETestTag
 import os
 import tempfile
 import oe.lsb
-from oeqa.core.decorator.data import skipIfNotQemu
+from oeqa.core.decorator.data import skipIfNotQemu, skipIfNotMachine
 
 class TestExport(OESelftestTestCase):
 
@@ -200,6 +200,8 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
 
+    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=14966
+    @skipIfNotMachine("qemux86-64", "test needs qemux86-64")
     def test_testimage_virgl_gtk_sdl(self):
         """
         Summary: Check host-assisted accelerate OpenGL functionality in qemu with gtk and SDL frontends
@@ -241,6 +243,7 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
 
+    @skipIfNotMachine("qemux86-64", "test needs qemux86-64")
     def test_testimage_virgl_headless(self):
         """
         Summary: Check host-assisted accelerate OpenGL functionality in qemu with egl-headless frontend
-- 
2.34.1


