Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520A4EF4EA6
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49558.1775456861567975193
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=l9qb4qmN;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso51480705e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456860; x=1776061660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7WGJo+r4HFWOocOezDDbAgVUcH9E73x0W7UiWaboFc=;
        b=l9qb4qmN+c+5rFHiZDdkK+Mb7L5p7CCi5Emqm2FX7BSOu0is9hupaL5cR3CDB7/aMD
         1SUNlA3zmYadWoBsYWmEpjLWobvYUkOuLB4gGwWFlfoM3JF9tr8ilQ0CuOFNI+jvyC6/
         ILLhQTo0xbHFrGhp2Pnom6fUsW3mtf7IrEQtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456860; x=1776061660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E7WGJo+r4HFWOocOezDDbAgVUcH9E73x0W7UiWaboFc=;
        b=ZiMD5AXLa7BKE8z5oweUhFm8TvmSI1/0aJLujzOVat+mpUjU3Nm5DQ4kUsF5yzE+We
         1yf39G/RJT937obNqplKqEr6p5CLYyl13Gzfe0zeqsAlqzco8N7Hjk01P543mzzioUud
         oHdTogdBbbO4X7+gIhHkUwaQH/f2oXXgcUIxNclVFYvnEtHJtBeM8Ni+ypcm20hpnPBc
         MEkDq+77Sj308ZOP66jNleYDtMTjk/5XUYoPL5nyQGap7YZmJz8F4uf+WXBNFJY0L7fh
         XS3q30HjQ4HhPvi3Bqe+W+JtA7LoXlKyALGGhRP/MAt5eF4G/wxdOofZY04IY5PtGjqw
         WXOA==
X-Gm-Message-State: AOJu0YzKf4fj2BuXlwCWIdUsEDbWRhkYbMPf35b+wF2IJzYTyvMS+WsI
	50rUcFc6xt9OfRb70jJXWVhGpEK1Jrff1u1uU5d5MbzqrgRchdQi3xlL12+SqCsXrf0J9yL6lYE
	rB0xK60I=
X-Gm-Gg: AeBDieuuHpbzpWzlV3UBuO24hAwGmopX9abI3IJ8sUVfsFFtzuCZ2S6sj58iYajHCfb
	qMG4e0FrvuyOkdGh/dsitHKnsm536Z1R3Uhup42KEmtuPTkc/xND07mnuQhVEpbBHtPfTsWo8hu
	/l5xhfVqYFaS0nxU4FQTR5hCwBQKycVnAgWt+h4hQhvlM9tCkQkjOzDnM6Uz7BtePogVq9WdCRH
	5c307VF9DAwNN5MRYi3/VnkEFjTh8xc4V/uybJ5vf59QmB9p8G5ZnFy/crYOPsYCyPJCICmp+Ri
	HkyYeEci01Rnpsbz/8KpQQu5+WvN6nON1/ShTtLSwc2nyW7eShRilhyR64XAfuzG0xqQVV5FUeA
	SiWMStMvL81esXDP0ZAOQDAcQCgStyOrDCrLDDZqvbBwrdsphSp/iyRNGvq8PoRzt5PruzeypW2
	OGNvizRRsdRcrbUR9TDEkWATqxy9XL6lPclO9qVypT9vGf1iAkxXZZtO50CSMcaRg2aN9wOGn5J
	+g/OzMTQpR/Fes1h8dJkyuSz9I=
X-Received: by 2002:a05:600c:3492:b0:488:b14f:b8ed with SMTP id 5b1f17b1804b1-488b14fb9e4mr37247295e9.0.1775456859666;
        Sun, 05 Apr 2026 23:27:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/18] scripts/install-buildtools: Update to 4.0.34
Date: Mon,  6 Apr 2026 08:26:47 +0200
Message-ID: <38444a1a8eb2575e2ad273a922d9793e10c3858c.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234664

From: Yoann Congal <yoann.congal@smile.fr>

Update to the 4.0.34 release of the 4.0 series for buildtools

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 6a1762c14b3..8754f2d773e 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.33'
-DEFAULT_INSTALLER_VERSION = '4.0.33'
+DEFAULT_RELEASE = 'yocto-4.0.34'
+DEFAULT_INSTALLER_VERSION = '4.0.34'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

