Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64B6C02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 05:52:52 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.33639.1738821162746537796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 21:52:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jIeabYWW;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38db0146117so181637f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 21:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738821161; x=1739425961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o22mLFF8SWm+DMx5EKMnMfIHDngILKUVZecNoG69GG8=;
        b=jIeabYWWjYPD6PmWeBTu1wJIPYgVkl7/O59Mkcn4jsrtv13DWoQ14L3cVWkPy39jPG
         zNCYrQRhmR7mKFsiR8yXMBWRVurmj6XRsdIjYI2Nhw1wKMb8Hz9/bV6rZdRZSe6KV2oX
         MVxAimQXfrFB7l53laGc2HnTCBl45HH/lWTncaLM8osz4qHFM9QoVoJ3GbjdBb7rrHVz
         U37XD722PJcvi4TBP2ClGswyEGpydZUo9mw+YPr1yKmMmjEtbpNtQbW9l9u2PPo3qWpF
         tAhNyuKDzxVWsuvp7mcLm9qx9WDwn66UC1GrixOAUqiuA0FwbdpynkWvzW8svSGRuEyv
         T2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738821161; x=1739425961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o22mLFF8SWm+DMx5EKMnMfIHDngILKUVZecNoG69GG8=;
        b=vHjtRLDcQp6ohFwd/5lv7cNRK0s6xAJQTv60wEESWRnDFhpHcQ47TRJ9xc57tYdrfb
         KTS0PbjfzhFIKk2pkS1EO88EF8q7kWP/p+Gn/s2KW3w8+kxfsVBYKKvmdbAOesOHXkVc
         iP/rQ2wFB9n1skPF4RlC0z0TqpOU4MLSQ3ul2jPAON5KSeFvFQaU0upNXdxU3/k9Zggp
         apQ0udrKIJqiJVvOztl5kj72Dwo+173usFs6HnE43CsPqlU9bfcSjiOvDdTYcC+g6LX+
         K+JT9D+0HRvew4WPk/3TN0BqNy3RLmcS+0EPwVmwNRbtdf3npQZ0OL0TP+UnMCYDy7jS
         Yoog==
X-Gm-Message-State: AOJu0YwYDAb4E/RO8vO1s2H8ZYy/LMlHxiup8ZZHkVudwVK/Kqx3xCpX
	WwLZxljoPGBTy9U3QMf3P3iGo3sAc5lChmX5HPpIezBsUGT3WSpN/yDBIg==
X-Gm-Gg: ASbGncsVIPD9g4wOaco2fB+sCBSQKxrnP6ZTvRLR8mxdn2LUKVDC0TeeMdxBR5inpZW
	9NVZo6cIS/A4Uo7SDkF9MBihDR8cJ2r5VzyguSoKq7gW1hoqf9xSziw1YmKtwaWhkbPH87qf2x3
	8jyXtxzW9qHptB2ggEdaDJL+MXoE3BLJr0CEcaIQhGCZmP5r6QTmQuiyZ8x4lL2N+CjvwSOFBya
	yXN3JUCgDp1c6J4LoXiTv3KKo9ZdbXEKya3rzOX1VisaBIZFct4zU/JhgQ5oPixUyL/iBgUl3op
	sG+iOfUorrfMEgNzmUq5fknv1H98FcSbx3k8NkxnmO1Rpw==
X-Google-Smtp-Source: AGHT+IGz+0WvEr3H1vNy1zk4IFkT+mAvT3MHwAk0cAt4sHtujpgQGddJ5707pM/7uRBi5VaUlkbi3Q==
X-Received: by 2002:adf:f78c:0:b0:385:e429:e591 with SMTP id ffacd0b85a97d-38db4888aa2mr3611138f8f.23.1738821160678;
        Wed, 05 Feb 2025 21:52:40 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fe37sm777242f8f.69.2025.02.05.21.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 21:52:39 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v8 5/5] oeqa/selftest/cases/signing.py: Re-enable self-test
Date: Thu,  6 Feb 2025 06:52:22 +0100
Message-ID: <20250206055222.3319167-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206055222.3319167-1-zboszor@gmail.com>
References: <20250206055222.3319167-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 05:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210902

With all the pieces in place, the self test can be re-enabled.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/lib/oeqa/selftest/cases/signing.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 51d1c3fa64..4df45ba032 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):
         """
         import oe.packagedata
 
-        self.skipTest('This test requires rpm-sequoia support in rpm')
         self.setup_gpg()
 
         package_classes = get_bb_var('PACKAGE_CLASSES')
@@ -84,6 +83,8 @@ class Signing(OESelftestTestCase):
         feature += 'RPM_GPG_PASSPHRASE = "test123"\n'
         feature += 'RPM_GPG_NAME = "testuser"\n'
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
+        feature += 'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
+        feature += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
 
         self.write_config(feature)
 
-- 
2.48.1


