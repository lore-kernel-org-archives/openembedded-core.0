Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F13ACDB478
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:16 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5951.1781960415577004259
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=w2NKNfJU;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-460662fcb4eso2015166f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960414; x=1782565214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2J5XIv2FNKop5jMG0DgerGndUJbXaOHiPh/NqxbfmDI=;
        b=w2NKNfJUpvEECLEQTtIb5mK3+Q2YIaaFKWHiJKbKgQvQvtKsBFUZEoFzJG2V/dMbtA
         9SkY5NuPg0u5/JiA38gmHp0iuvpBYB5xi/C+W/8uN6EqMjZal0yazTHmy5W++yPgToqF
         Q087WMfl6x9nJVEdNkrGybJOrnZO+21/v43aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960414; x=1782565214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2J5XIv2FNKop5jMG0DgerGndUJbXaOHiPh/NqxbfmDI=;
        b=GtEtJhvjbNWix949IBDoSPKSqatdtwXFt0pz8HLIMTRuzxKTgOGh+btutUr8jwTSzE
         ga3eFqtC2sXEb+YX4vYLTStLUlbImRDXv1ZHeKYdHVEV/3+v4ybcm1O5ur0zMVMmezgW
         DuLpuH4o1OkISeS27c+N7qfU3gY1k5FbFggXKM/42YtaUfbZ2sRbM4oxF712JW+7w1b4
         U6XQxnxG+sRjwwxQ29/bjaVNyax0ZWhMnPsChHsgXRKaM2DfFnS3kIa74DdC0TUPcb2x
         Hs33zQiugvPosPOkEcvt5fS8eGz9IAG3wQ+vIZmPP51S/Y8PjJY1FTm7CIomxxy/4hY/
         yCfA==
X-Gm-Message-State: AOJu0YyO/TkyZvnUqv8DTUs8Nhe6cnlcLf6MknHcUDDDyskceI7QkARs
	+SVcl5ggtDxyjLmAWlxSET0hQvhYhO2uzq0x31B80dIZjS0/wl5UEHpPcgTdw1BpDUkYs1V96NJ
	XFTnD
X-Gm-Gg: AfdE7clQuREigT9cK5MMifaUCRA/XoRe6a9q/7iYEcdEzo01FqZydwY/O+ZexIqos2j
	6I7pCC5v3gFJ7gNDzV9nP3sd2nFjctMeSYwIjWOlwlpPFWjFamNSjg76xrAoRgVB75FRFvDYx8v
	7LCcH8cuZEDv1pvUgLB+Eo3PJd6PAWsR4CAbNXj62t3LF0W1vZQWbl1H7oGXAyOB9HodL2rnk1P
	ByvpdX0KEQlPgcx1/qomBIMMWYFsLfd8hDzzvB6IBRYBL+f/lCRTBps82C+/2L9PxKv7n6tFzgw
	HjUQHqDJx65zfdNdCxK/fcWgIMPqykjU4oE1OqSlm4WcDiUkoo/vNxxXvQCnX7uTUtHg9qSNque
	cFBg/fLw7UQgKq8JPEs/PJukqYg0cHHOFMvnNHbRNS8bqyXQvwqzJ2WYUSlrY9HDl6d3cIFk9Gl
	bKgj3yIJ8Un77wLaNK21Wu9XHl7jp/z8HtTZgbzqP+tMYS0XvlImPym9aYKAbsePcfSOahQ4DdC
	fDmxZYshqxrLwOZ
X-Received: by 2002:a05:6000:4b09:b0:460:51f6:6248 with SMTP id ffacd0b85a97d-46509786671mr14037281f8f.27.1781960413811;
        Sat, 20 Jun 2026 06:00:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/36] python3targetconfig: pull in nativesdk python when building nativesdk recipes
Date: Sat, 20 Jun 2026 14:59:25 +0200
Message-ID: <380eed4dbda27b7df165bc2ff665d32bf7f50d83.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239220

From: Alexander Kanavin <alex@linutronix.de>

For the class to work, target python needs to be present in the target
sysroot. This was done only for :target builds but not for :nativesdk
ones, and this patch addresses that.

The issue was reported in
https://lists.openembedded.org/g/openembedded-core/message/237188
(but the proposed fix there isn't right).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f297b18f6b54bfa07b4e3ded98eec962dfdb6f77)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/python3targetconfig.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
index 2877665737a..3b9333a4be2 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -8,6 +8,7 @@ inherit python3native
 
 EXTRA_PYTHON_DEPENDS ?= ""
 EXTRA_PYTHON_DEPENDS:class-target = "python3"
+EXTRA_PYTHON_DEPENDS:class-nativesdk = "nativesdk-python3"
 DEPENDS:append = " ${EXTRA_PYTHON_DEPENDS}"
 
 setup_target_config() {

