Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3072EF88073
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:53 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7595.1776322131626654489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KC8WY+aF;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so100256615e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322130; x=1776926930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAd0/5j1V5xgW4q/pId9w5+bSBm8u0tp0yA30KouV0A=;
        b=KC8WY+aF4F8BZWka0prc2GWokHs/wg6yP5pO/axP1WOqqMwGrwnPm8/yrfN/dqStNz
         cHxYkEVQIlsrMAorNtwG50wI9tUh8IwCK0/tWQ2uQKUR1GRrMhyW60Ic27LZU5VQSlfZ
         OlXiLFlCdY7P6ZtCBCsNd/B6n+iVojWj6tF8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322130; x=1776926930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xAd0/5j1V5xgW4q/pId9w5+bSBm8u0tp0yA30KouV0A=;
        b=gq4R3NlK36Zavc6EHnSpknPchC66awBrZ1nXkXJJuJU0hzmqvZx2RNjeAn7ogKo/bF
         WZwqbyZVXEAPbicDUKtzrUduaGec1B2+tICeYV7qEPbExzX5C7gvQQ5O2ib3nLpJGzS6
         8GThaAyY7/PToE8Sn2+xSybQnlLSKRJndvjaOmO/g8cpmsBn2YsswffOHaJXZLRFSD+Z
         U3Ku9gPXbVkK1Ia7zaftvDOuG0kUSE3RjZmWFrELMsBygN3t6/v74fx2dAztjomJDOsB
         WA/ZuQo00qJBafHzNYvsATUmmXXwvrcKZGWFX/NhMqgujNqwX8hYmOImIPfPJPrrfxLy
         KGGQ==
X-Gm-Message-State: AOJu0YzZOZC1RTlyGbzp1opGUIvcft+9hfeh5yyhVzyHZQhoV6F5zw4J
	fZ3MeY965rI5BVL+QH2SPqiX6WsPDo/zbWbfl6xdt3PSXKmlr0R0+GtZK6F1yiFVHMgPVuuBZAX
	O46BohtILeiU7
X-Gm-Gg: AeBDieu2aRuCsty+DaOg7VPKUVChkQ+qWsu7N11H5o2SwyilLYYvZTiZgf/+8fc6/nj
	5Qa0Pg1CH0dModBlVSmc7DPnLvrBoWWxJTotVPsf26A7w6Gxji3eHHtbXVonXwMlxBcmEN0C2TT
	tRxdvCz1RNbyXoAvZqPb1Lx04qBGFxJT+brUpwPvTkuofoe2+jfSOvvuiHKV2xYLAuyUKhyf1PD
	/iitwgPxHdjStH4Lgyi2U7qtdClnFhmEZIrwYW9H+6DwpW8qUkt7XX5dCjiqDN4fKxBVQepla3U
	JAJklvs3krd+YKJ2pM2nwdcn8v063liUD3Qvk2KaIVE+lNRtcb9hh/TbmLbbSS6bRdTl3hjHmqH
	B447JNxLxwd0nModKpzL47G0Zqq5EBRHKWf/WHMxEPn8vopXRqL7NTvXkUYXEeKARKu9tSTALzD
	Vf/QZXy3FYD77BqcZEgfIUBe/yljhPoJztDLIrisr3GcHjENKTIbXJt/0HBNPAZjZD7eW26bKJO
	kK+dbdP+Wflz8ZmQ24nhvygONtPRwab1ZY6ew==
X-Received: by 2002:a05:600c:c08b:b0:488:bc6a:528d with SMTP id 5b1f17b1804b1-488d68867a0mr243292965e9.22.1776322129564;
        Wed, 15 Apr 2026 23:48:49 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 47/47] scripts/install-buildtools: Update to 5.3.3
Date: Thu, 16 Apr 2026 08:47:48 +0200
Message-ID: <dc0dd419fb43968426d342b1d84d0204001cd39f.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235389

From: Yoann Congal <yoann.congal@smile.fr>

Update to the 5.3.3 release of the 5.3 series for buildtools

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index b9c008a2ecd..7807bde910a 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.3.2'
-DEFAULT_INSTALLER_VERSION = '5.3.2'
+DEFAULT_RELEASE = 'yocto-5.3.3'
+DEFAULT_INSTALLER_VERSION = '5.3.3'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

