Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E630D3900B
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 18:55:47 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18016.1768416940894856595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 10:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q58Rm9t+;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so740655e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 10:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768416939; x=1769021739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tf/d5/rNSFuUPZ1RytwlE3TNP/F1A9vwqZKBTyPL8kI=;
        b=Q58Rm9t+kuqQGiF8L9lnKSVI5lOtnpw1z8/bPKZ7KfHgmKuNectJNj2j8dFy4/yFA/
         ztJR7HGWAvbKgT49Fj3VuCxQp99sNh/1UFrvkf3XRghc/Wv1aoSYGQjtKj7P/WlUqSOq
         IyumgXF73kvrggoMxxtLQ6y9fBYNr/OHcqH3fT5U+zKX+Hxx/qLVySEMCS12at6A3wXc
         Wgq9zUK1edAcd4m0S9zFh4fOB2WY1VUwfxPmHM2w5h6I4wCb1aEw9Iua6pPTd+Ht90ID
         6LBDEiLCjaEKYtSOvRikoLODgMmXA5oHPxWpgUL2dwq7qoI4PDVL5+LlImG3nyYESDjy
         +xXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768416939; x=1769021739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tf/d5/rNSFuUPZ1RytwlE3TNP/F1A9vwqZKBTyPL8kI=;
        b=vDVLH2VM1n1wMPKI1/cbvqXzuCpWluH8cXDRpJhPcSY+nbP6eUiEIhYqeuHjS2h9bI
         VeITGCptkvIUMRuUsaLA2EBmTCMHmVH/wOklEqIYlM0TKXzBghtavXKYKiOsoGoV6Qn1
         ce0F+3+2kBo0fpJEg9ue7K6GWoVxHKDYvuYB5++bJNElXFlP/KAUCwoUL++jYxfVruxB
         rElZdoLisfBGadc4tG7RBZ1VNhYv32zpbH8OjB92OMTkZLRuB3FCb5/D/wWqBDEKE2nx
         XZh0+pnEZbcoeuxY1Vd+EurpN82/ydohpT1F1ArehlSx9IFeNjJcAlligcK0IWkyEy5k
         Cj9A==
X-Gm-Message-State: AOJu0Yy/m6FVH+SgzkShJdtCf5Kf/yk0gn3c0gn9n2aJrTnuSVnILxd2
	iTskmpF7QE6NAoXr7yfJoD4wxAaQ8iJdMt7rQzTT+Mpw//S/kKfW0WMcYfE9YxLf
X-Gm-Gg: AY/fxX6v+NiNMBXCRsHqMIOy+CF2frTXCKI+ebTx329uUKiJvTfGj99hoKCaFLbVXqH
	QHVfZfTWIR+QjianvwoDjC08RO712GsVLrGWdBYLXgpAwGPgtu0W975yWKD3YPi1yp9a6mAaUbL
	GHMfU9HhT/9y6YD37yXUraQfTiqsbet0EeUz4bYGo3fceJ6KuM6PMhM5TGPWssqrImTXkwU5I9h
	SqOEzn4I2GLVZuyAS/FC1AA2FQhy5cyJ8pWoMx9Czl31fdSH8KYJC0el+gDTJNGkFmJuXcm0/h0
	wqyN13AEsbIgk8oLcT3lkyinYbnNPgWdBTXkV1xxg2jF8DcFJn9+y4RTuULNVKOlP2dJ6n+W+Mi
	F82E/1lEcyUGDbTXmhDZ4wOqnjipQJCj2VrwErPOS95Jlgo4u+UOYmb3rfXyAC5oT2izDgUk2lT
	1xCUhV7wm6cgCjfrsSYKsgZAg=
X-Received: by 2002:a05:600c:34cd:b0:47d:403e:9cd5 with SMTP id 5b1f17b1804b1-47ee32fc8cdmr41699625e9.11.1768416938568;
        Wed, 14 Jan 2026 10:55:38 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428be2b6sm5586085e9.9.2026.01.14.10.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 10:55:38 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v3 2/3] oe-selftest: overlayfs: Make the test more deterministic
Date: Wed, 14 Jan 2026 18:54:13 +0000
Message-ID: <20260114185508.380709-3-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114185508.380709-1-uvv.mail@gmail.com>
References: <20260114185508.380709-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 18:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229370

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

