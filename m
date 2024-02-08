Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BA8C48BC4
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 08:29:05 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.13545.1707380939458433207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 00:28:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bNqUDwTe;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41047386c8dso446535e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 00:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707380938; x=1707985738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZW8o2yC/ZC2yZRT5vLU5turIhrA8VlXAtpFNwccmdaU=;
        b=bNqUDwTeAGOebKWTRc3K2HoO9Sq6LDHoUMURugHvtUzF8V+2FqMDR154hLHcTkE1kk
         /s+dJ4tNn3Smxe/moIYlJUodhnVdRM8n6DL7fjLiQVPPUMkcMud1scLgiWvNDY781Cyp
         Gm3X62ApD9JuJPmiD76crhW32BhTpme88y24cJW1I9y142hQJnfsMPExs9IM3OuyP/uq
         vnqsQpnCotHxsd2KdG59jUDCc5Sh600ZgK3JJUjXymyqarJzYHFrJo4AC/WvYMrLL6TD
         wnwFzf6Ch4R3t7l9gLJZF0LNv0RaQFZcR2u1SwvdfXCF2PYyQemQ1I9zTr4G5kBJu9u+
         jH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707380938; x=1707985738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZW8o2yC/ZC2yZRT5vLU5turIhrA8VlXAtpFNwccmdaU=;
        b=Q4c3IAYSHHq40SA/DO/Vvc9KxdlXmxV6Vrow0yA48hF/XQWpjdvykWtXS5+hNmigpW
         jI7TWiXOCtl87cx55pt1EcMN04ogNKfnlXJLh2xOmtBujuU0Ap8gr8F7tnDqyJs4U+ZN
         4FFMeF8WtY8FfnAFejFGB/O61ruUpJMaIZpSSIgTXkJVa/fchg8SP0vNsfYlhf2F8VSA
         FYMau4JaZsn4YlUY8Msicl5PR3oXiEubuyhgbwEbtVJFJ7s9hf1TeoG3EluvixrJy4b8
         oZBnCH/cV4204oc8Hu2XGuRBFoIvPno1CLLsVPWSYOeBUpgRSQsIxcV24sgQHtekKKYP
         6ejQ==
X-Gm-Message-State: AOJu0YwWDnOXY0n9SyBekIVbCaUr57rVog9u/IAlO0cOS9XqNxx+FvGu
	f6Mtz3YKet1/utE+wg1jGLgFZQx4hUxxqGLZ5wjQD7OJi7k4YcwUr0kO6YXX
X-Google-Smtp-Source: AGHT+IGtFnGb7kU456el6w2gY7Yf6Ec66BV9esK8JWi6akEb9PPtrpxcjA6iUjbbO6g1qq3ecsoQvQ==
X-Received: by 2002:a05:600c:4614:b0:40f:dd79:b758 with SMTP id m20-20020a05600c461400b0040fdd79b758mr5601115wmo.40.1707380937665;
        Thu, 08 Feb 2024 00:28:57 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id j12-20020a05600c190c00b0040ebf603a89sm913321wmq.11.2024.02.08.00.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 00:28:57 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 5/7] oeqa/selftest/runtime_test: allow GPLv3 for bash
Date: Thu,  8 Feb 2024 09:27:31 +0100
Message-ID: <20240208082821.430510-6-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208082821.430510-1-adrian.freihofer@siemens.com>
References: <20240208082821.430510-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 08:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195110

Test cases failed with:
  ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Package bash cannot
  be installed into the image because it has incompatible license(s):
  GPL-3.0-or-later

Allow GPLv3 for these tests.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 12000aac16e..4277c98a39c 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -124,6 +124,8 @@ class TestImage(OESelftestTestCase):
         features = 'IMAGE_CLASSES += "testimage"\n'
         features += 'IMAGE_INSTALL:append = " libssl"\n'
         features += 'TEST_SUITES = "ping ssh selftest"\n'
+        # core-image-full-cmdline needs bash which is GPL-3.0-or-later.
+        features += 'INCOMPATIBLE_LICENSE:pn-core-image-full-cmdline = ""\n'
         self.write_config(features)
 
         bitbake('core-image-full-cmdline socat')
@@ -175,6 +177,8 @@ TEST_RUNQEMUPARAMS += " slirp"
         features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
         features += 'GPG_PATH = "%s"\n' % self.gpg_home
         features += 'PSEUDO_IGNORE_PATHS .= ",%s"\n' % self.gpg_home
+        # core-image-full-cmdline needs bash which is GPL-3.0-or-later.
+        features += 'INCOMPATIBLE_LICENSE:pn-core-image-full-cmdline = ""\n'
         self.write_config(features)
 
         bitbake('core-image-full-cmdline socat')
@@ -212,6 +216,8 @@ TEST_RUNQEMUPARAMS += " slirp"
         features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
         features += 'GPG_PATH = "%s"\n' % self.gpg_home
         features += 'PSEUDO_IGNORE_PATHS .= ",%s"\n' % self.gpg_home
+        # core-image-full-cmdline needs bash which is GPL-3.0-or-later.
+        features += 'INCOMPATIBLE_LICENSE:pn-core-image-full-cmdline = ""\n'
         self.write_config(features)
 
         # Build core-image-sato and testimage
-- 
2.43.0


