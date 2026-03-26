Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EE2106F312
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 09:16:39 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43325.1774516586178425307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 02:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1qE7PSnw;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486b9675d36so6611055e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774516584; x=1775121384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m9xMI4mTqpwWAZuzR5BWAyrkpb+HCry9sBX1UCiXVqY=;
        b=1qE7PSnwLIqkCRc+klYW3r8EokKHB8O63uWLqHZsZ5WHsJFI+gCHshSmGAdwRoxevo
         eL5LPqzkyq7q7peuomZFawHuq/gvUeJXKGUWZtAqyiUH7Gs0snhzdfet3NBNBH1C0voo
         qdpo8zzEW/N2kN2d5m67C6sfrsaSMI7LQsJkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774516584; x=1775121384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9xMI4mTqpwWAZuzR5BWAyrkpb+HCry9sBX1UCiXVqY=;
        b=UsFkAwQ+wGFmWrKc9PGB87YEAc5iDggrmczLVxMR1egk7z89sr30a5dw5lmqwa4BKM
         hqfRN6wrvl3x7x6/j61dGcx9l07UCt8+cc0uG0+ctSAxFisuwtM0m3DB4sWM0cOqY7Rv
         Kh4df9dF3UVVUdyaTW3R1+S0veMvPThlGlcDq1c8oejnxEvHy1Z+JkU6owW07RgoFEYo
         4/fRcfTPr8LcaQYunXRwUD7Lvt/I1vSUExDkiq89V8Ufc8D9BUSobN20+gNWXtuAAqlA
         e4bkkFPMr8inD7cuSndh97AjtI64QYo8D8vMicf4rFB8jcAU53EoP4laTNy60BHbb1dS
         UVxA==
X-Gm-Message-State: AOJu0YyOwHpYuBCPxjwSGITh+YVBHt1iaYqGb0590MAPGMTW9xBCHXA8
	nov93XV2zm/QFN7wKGNMEKcHMDdSPL//7ihrQSnVcBDNiHzfHofe6R0pbYAhIxR7t2WdSr1de69
	nXXme
X-Gm-Gg: ATEYQzziidtHmD1tMpJxqnIJH34ATkqyPgRgL4qSXnef1MWWOZ5ZQfiAbG31J902soT
	bSWTgDSx63yrjpCuEEV52mqPCorhJGaeipmOl0ghsvnfalYhMkKUhMIXgcLVVHhh2Tw5L5nvPUI
	aV89QWqUjz9N0qpHJ2AZE5zhYMGugWs8nSa8Fx/+iKRTplEnonOdJMgm6uDBYjIJQgS8iEiAbvF
	/Sx6mqbZY95EUOmaDmOnPh3jPxettDMBhTZouBsVZMmzUnIRhMep8rET7/jZwbiAU+/9kDP94rZ
	qIF5EfoUqMHmF6gcN5gPounT0lonvCT8g8EocRAfbfPV49Nh3+1/Zi9dEvAwW+HQJ/hYBq6zTbs
	eOxjNlWb9WzYKP3Q+zP+XBpHR4FC0IAOdzUxtQK6qYTyAcS4Fydyf8PL4BA/HaUVsY6dw/+dGOl
	JezLW09J+t/GXbVw3oWjTMPaDFab75FOSIRwaBh0dulB8RvyGW0c7eTUZliSw5wbso/w7gL92wr
	KvbciW/uEiXemsA3kAmHetNbvTWGsrVswwvOzB1nG4Z
X-Received: by 2002:a05:600c:c4ab:b0:485:3f17:425 with SMTP id 5b1f17b1804b1-48716039ce7mr99916635e9.21.1774516584203;
        Thu, 26 Mar 2026 02:16:24 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720901e74sm11174685e9.18.2026.03.26.02.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:16:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [scarthgap][PATCH] Revert "scripts/install-buildtools: Update to 5.0.16"
Date: Thu, 26 Mar 2026 10:15:43 +0100
Message-ID: <20260326091542.2127802-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 09:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233957

From: Yoann Congal <yoann.congal@smile.fr>

This reverts commit 917c382c412766b40779788ee2411ac23358f0ae.

I mechanically did the update but should not have: this was already
raised here:
Re: [OE-core] Wrong version of buildtools files uploaded for 5.0.16.
https://lore.kernel.org/all/DH2QPDTPQT3Q.1TJYOVQ7PIU7B@smile.fr/

See https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/RELEASENOTES:
> ---------------
>  Known Issues
> ---------------
> The poky DISTRO_VERSION was incorrectly left at 5.0.15. This is a minor issue, if a workaround is needed please cherry-pick:
>  - poky commit 06210079b2e10d6d3fb943afe87864267e329821, or
>  - meta-yocto commit 03f93c769ec99e5086e492d8145eb308a718e8d3.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index d95d5839c9..c874494f4a 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.16'
-DEFAULT_INSTALLER_VERSION = '5.0.16'
+DEFAULT_RELEASE = 'yocto-5.0.15'
+DEFAULT_INSTALLER_VERSION = '5.0.15'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

