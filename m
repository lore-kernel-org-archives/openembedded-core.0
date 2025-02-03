Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21734C02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 23:49:04 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.103982.1738626541005218649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 15:49:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KA9vdnvr;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436a39e4891so34186015e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 15:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1738626539; x=1739231339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YJi3JojE2kiCLaQ+RqJvttBtcC6pwcvQgGkxDhUvjnI=;
        b=KA9vdnvrCrYuuDLfhQGfEHhdkqq1Jvo9rqqZaqA7UtwnXJekaLFIq+ksFaM3UEkhRl
         1B0YgmHAmNJ4/lkm/d0Svqv8RWrUarn6jckEtmGHl3TxEDZOXZhJyep+G+UgZZkvCk/q
         hNhKlxfJdXjsgOYZRz68AqJ+dHnKCoGTANcog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738626539; x=1739231339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJi3JojE2kiCLaQ+RqJvttBtcC6pwcvQgGkxDhUvjnI=;
        b=LynyyFilhNE8HCEoauhuyl0DxjzPqm6ds4LSKZ9bsl7l5Z6yLBfk+Bl4rObqwEQIo4
         dpQftzy60bKf+j+PyIrFhuqqRB015doyqRWkEKIP5khOWgWEDeG7mhSCAqaaqHJFmrAb
         QXZavXrWo9uIjBSE9+PMLInuailkUPiASLfsgKmFMOIOj5qupNLWQLZ0DJffTPwW2UtT
         eRVTe+8jj5mxdlFpmAztlrlacRIs2A7YSDENU8/FXHWCgbN3fRPCKBdhgYwBsqEA+Gwx
         RkvyucRUNGT2CCGkCe6Arqivim/dyIq1MNze9Cl5UZSDW5r8hLJ5KtgamwusSYkM43Yw
         Escw==
X-Gm-Message-State: AOJu0Yw1uIl3q1v9O+INW2MjbT8LNxqB+XG/3O0u3GUG3IgHVJO49wID
	B9g6UsN0U9QNZj25yT78LQaTEgr/88feHiHkRRXEafG6pb+r+hgYv5xd6xIvgfjUjKWsmyAzESE
	z
X-Gm-Gg: ASbGnctlaMiqL+CkXv7MhxQA4DK0uHhk/E7JsD1F9tY5aq9dkSvsXrxaFMrUJNBFemU
	yQGbwvRmySnlRhBGqGgKkrgvoZEB1UWfS2qrY6p3HB7DDs20y2GHFL1ZUjCrqys5n0tefdj9ZCy
	SaCxrCxR1bV+CTilZK8WK9NEsxGJ3cHMERD0OPxhIWaOwbGMvVjoqe+1MYck08CEN4xZv8nCGCw
	FfscS/1zq927pw4o1QHwKEs37Gn1zQKCGSzJpwTLT7rGgu2SUwm6vvAnV93fxHwps9wWs7BLDIl
	ruZfRb0aWcC+d0BEUiwD28HSfLmlP7MPXFBR3x7hmtboNbxFC6fzwuDjZ1gfrjKP7wMWLpyKazp
	+lNIPjCAzkaLM2Shws9/rGA==
X-Google-Smtp-Source: AGHT+IGFf5VLW5Oq6tEVLW7TRXmUKr+myLmLy3f0tTxTuNYlcPZdL2neqZ78v50tJHFmQ/3BN6Yh+w==
X-Received: by 2002:a05:600c:198b:b0:434:a7f1:6545 with SMTP id 5b1f17b1804b1-438dc429291mr179913335e9.27.1738626538367;
        Mon, 03 Feb 2025 15:48:58 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef000367a1a7f22add27b.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:367a:1a7f:22ad:d27b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1d0bbfsm14314537f8f.98.2025.02.03.15.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 15:48:58 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/2] selftest/reproducible: Move a comment to follow the line it concerns
Date: Tue,  4 Feb 2025 00:48:35 +0100
Message-Id: <20250203234836.3635582-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 23:49:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210745

From: Yoann Congal <yoann.congal@smile.fr>

The code line was moved in
commit 5a9a5ad6a7be ("reproducibility: continue testing in case of build failure")

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 3fb0e5ee5b..30eea2675e 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -275,8 +275,8 @@ class ReproducibleTests(OESelftestTestCase):
         self.logger.info("Building %s (sstate%s allowed)..." % (name, '' if use_sstate else ' NOT'))
         self.write_config(config)
         d = get_bb_vars(capture_vars)
-        # targets used to be called images
         try:
+            # targets used to be called images
             bitbake("--continue "+' '.join(getattr(self, 'images', self.targets)))
         except AssertionError as e:
             bitbake_failure_count += 1

