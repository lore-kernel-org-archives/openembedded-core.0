Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1678BFF5117
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:16:35 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85476.1775578591435330751
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PMW4uKhz;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso417975e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775578590; x=1776183390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7WGJo+r4HFWOocOezDDbAgVUcH9E73x0W7UiWaboFc=;
        b=PMW4uKhzYL7xOwcRxYAkHU+VfOq2I+eAhKhK6ROdaGhkouMVfUDNRkOf0LXLFX+lZG
         +n1+67b5LtYNa6ysRVgNd1mxYYFJV5LGqMotY5l6YrN7DZ3m4+cZxLpAd4136UWxmGaK
         YyU69IDNuYvuwSAeprAhOnKRg8QM2Fy8nv12Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578590; x=1776183390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E7WGJo+r4HFWOocOezDDbAgVUcH9E73x0W7UiWaboFc=;
        b=ddkRjde8x2+3XH47WV6vaEsIFAzf0oxY8TVYOgSPD6qKKNL/mzx592w5QAf5LJRLvb
         pnyCV2DYi8qs6jYXf4buYCce9QVdIrtX0UmLI6dV9KkPw6o7twWwGmDXIalhCTCS+mgi
         Z4Eno5S4VQpp+RPvtIfpOpDqXLFb3DOyIEtom1StSrq8V0qLElaPdaQwem3hyHqTm3Yp
         KvS0QojmA85ZcMqXkwbgTjNu0ZX+hl0TMhi3yYt+47FguqpPfV4dXuL5rYhSOdBOOJGu
         8gpQGzRSvABEGouJ7T7HKd0LDYP0yCqkEdE3IHgYFUpj/kkxEZQaNOzj6fNKgP4S7UKE
         O+cQ==
X-Gm-Message-State: AOJu0YwqU/CMoGFELimFthYEB0vBMbbsrvvw5rGPJhYYHeuaCizE4P/6
	zgy6tW/4AQv2Cdi7Ls/RAhh0r7HZa+3ApBAdWcnjynnPs+q3q8+FyqkCT1r+REqALQKoROYhrwm
	oibrMbmc=
X-Gm-Gg: AeBDies+gfV3C8LGGWy5oU8Up/5qQhhZztqiZI7bjOonYpLpq+ayjYadQLX9+dwughv
	m5l+Kng208UJQMRJl38fVILltSjxavz6YUE3wLds1xBPgYCEZKDnQC6NMkHSlbFrRGuhUOjKuZQ
	dk+4bKjYSYDRRstGAS4/KmiiqFH7uUzOqnm6R/1saT3cZHqUSRL4J/Ya+wjunAJ6UgyHgVHma6O
	HIlVMbhrXk3Sl33NnCgamxxrjFUeahkV5nTlH6Gv2k8ILeawoltScYqUKxqPzUxORdzl9wxhmLa
	c/laag3VhepeDB+MCZXRL7Yom9NFSwCkFCeaD1xWikcN1DArIiuAIZcp8wliiG8Eiob9w7c5OlH
	xDEGGPVr5nv52cIGwG8sh9vg0NR1ncei3aN6Q7wdzwwTqgzV9JWtGvB0+UJkO2ktwMqabN5g/eX
	uWSUIrmW37ZM12t5wETciL7M5vHjrzuzX2aNqcyqI/DfnydyKdXvNYx9gEB1xiS0M0H7jbAbb+z
	+EKxfLACKfdweMny5oTwqKrYeuN
X-Received: by 2002:a05:600c:5289:b0:487:22ad:403e with SMTP id 5b1f17b1804b1-488994b34b4mr259901845e9.14.1775578589597;
        Tue, 07 Apr 2026 09:16:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c4b57febsm1195665e9.4.2026.04.07.09.16.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:16:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v3 19/19] scripts/install-buildtools: Update to 4.0.34
Date: Tue,  7 Apr 2026 18:15:56 +0200
Message-ID: <94df79c304f692b0108155e04905180cdf92b2cd.1775578386.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775578386.git.yoann.congal@smile.fr>
References: <cover.1775578386.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234772

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

