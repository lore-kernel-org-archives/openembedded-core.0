Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA5CC54EBD
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 14:57:16 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.88826.1673621831707185630
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 06:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fWX+7Fb8;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so18953139wms.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 06:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ss9BUCSzK1t0BYLnXI3iWX+m7uYac+v1NhhqMB5KrYQ=;
        b=fWX+7Fb8yn0OxhkbGQ+mYbeRRxKkAgNVxnUDXo7Mh4GDggVXsBUMEmV9ZljY3PumCj
         mVe8sbwlUdSWBf5d92qIPohsTA/j9VG1BaGQmcEMlLGQ+jFnxN9yhBZbXBxWaqG7ZOS5
         BjiQgBOzUm74PbLPJYC6ZcnzpZaBM4OE1RUIRnp6Nq1vIX2HSuyI3TCyodk14VXAcxOk
         muY4CdIDakK/uIbQSOlDeoF4PjFvf+CRD9syUkM/eK24VVLQ+fPeNyMJBe9MOxEWgN9j
         +3bDGadjc1Twsh8XuJ7ZbpucFFlhsZQRzlX/TA+jKAkfJNMfjihu5rK4BCKXRYcUbnHL
         YGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ss9BUCSzK1t0BYLnXI3iWX+m7uYac+v1NhhqMB5KrYQ=;
        b=ljEaP3Kq5furPu/63OGZF1XEgX5v1R0hAU+kwjiyYadKbGSFGWMTGiJtxODGBeW+Om
         6k+15XoaejPckad8AEyQ6Gk8aE4cEeG1+SP6i35iHmgRQBArjQkYTNp7r1PBv8YIIkrG
         xAHYfhRTugkOeeH/gS8DzyW62gn4UC3f1x5/34txfoxTdLGaaoE5t3aIHOprsyGLNmg+
         jtaMRXVb0GhyoyG8pZXBGf1NI2odMkHzB1FHkRgdvcXrGO9ZqThhDR+tYObkR8xpL16M
         FgCgvIms1/T42mOu7Wug+MKiIDZ4Ivqa+2XkT0Ox+vE9mjHQc4ELDYX5K2z6lhKH61ls
         0STw==
X-Gm-Message-State: AFqh2krB8J7rLib12/pXUzk8KNmgAB7z8pPvJevr9S6V3geR7cuez+S1
	/7psiy2fOqniuMV7wdDyuQFMdPHOh4U=
X-Google-Smtp-Source: AMrXdXs5GY2oBWYktzysjeJRynkra2VGF6z4iqQ/GxNrcKA8OhXduXXlwdstsgXYw5H16JFsQoCnZA==
X-Received: by 2002:a05:600c:540a:b0:3d9:ebf9:7004 with SMTP id he10-20020a05600c540a00b003d9ebf97004mr16349993wmb.29.1673621830059;
        Fri, 13 Jan 2023 06:57:10 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d20-20020adfa354000000b002bc50ba3d06sm15808417wrb.9.2023.01.13.06.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:57:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/7] selftest/virgl: use pkg-config from the host
Date: Fri, 13 Jan 2023 15:57:00 +0100
Message-Id: <20230113145700.2773771-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230113145700.2773771-1-alex@linutronix.de>
References: <20230113145700.2773771-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 14:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175834

The check needs to report dri location on the host machine,
so pkg-config binary needs to be capable of finding the needed
dri.pc file on the host, and therefore needs to know where
host .pc files are located.

This may not be the case when using pkg-config from buildtools,
so this forces usage of host pkg-config.

runqemu already does the same PATH tweak, so this simply brings
the two in sync.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index ae79724956..7d99c158e5 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -268,7 +268,7 @@ class TestImage(OESelftestTestCase):
         except FileNotFoundError:
             self.fail("/dev/dri directory does not exist; no render nodes available on this machine. %s" %(render_hint))
         try:
-            dripath = subprocess.check_output("pkg-config --variable=dridriverdir dri", shell=True)
+            dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True)
         except subprocess.CalledProcessError as e:
             self.fail("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
-- 
2.30.2


