Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39356F46C7B
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 07:13:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75573.1775546035542996358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 00:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dfFOrAdl;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a041eae5so20786795e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 00:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775546034; x=1776150834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7WGJo+r4HFWOocOezDDbAgVUcH9E73x0W7UiWaboFc=;
        b=dfFOrAdl5jg7DIgpikIIh1veuqKzsO784qopCB+eEdJnPIxWmS357IMjnqVdkkUf1E
         qkV5wlaXdo5YiUmjNKGa07BnwXMHGvI2iNdxq1Hv0i3A1hIxTX8HTO12jn4dRAe5BpiL
         rqU4dsheweU/B9Tb3ylb67XAgitIElwZT+U0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775546034; x=1776150834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E7WGJo+r4HFWOocOezDDbAgVUcH9E73x0W7UiWaboFc=;
        b=s5VGxcUEv0VkfqNfdV4Ad/h+FkZeFD+WZcLvAqklfh0AIiE1EqxeNoRtGSRcnUu7pA
         gOqslmY094O5oXS7QNtKz+NxDPp2mwkf3jc493r8WXRGvkOF/B1IFbpuAIkof0w+p+mz
         MROF+i278KTmd8V5rKhbRPzpdW1MyTEF4aQa4I/DUJy8ifJMyb+WnQZsol3jnGfmmIHV
         yzjxX0zrzGsRt8amTMG66+YSFYdBDm6nHwMoGtD7PUNmf/zvljokmnTo0tZL4O8BX6AP
         lIsYLXS6i1zUoKehqi5nyg2OHPHuSCLwArl0BLQuYE+e4A2xLFEYI20RI5m4MgsRy+CU
         4QDw==
X-Gm-Message-State: AOJu0Yw42Wep4Eq6KB+y1I2UD7ajZduJ2bygBEfPss4BmMdNQXSbdjH+
	x5QF/QlNHKHRlLJDfL/Ome8juOvetonSUuos/bVVeUXVo0FxAsyMfKMPHA1rorDTcSzbD3wVPgO
	uCqf4l8s=
X-Gm-Gg: AeBDieuKxwDTZAoR5JjE9LSZOXGlzF0TXdsSQYan8rp3WJhoE1SE7/Ja9QHmeDNCmaw
	MlS9188jVekbmCSGMQZ2t9aioKpWxJLq+9vnosFaZCllhjHVXXnqtfVze+STPJ6TZCZfQF7TcLF
	lHcAbYzbKANA9euHm6Wwu6YQDU4K1Vt9Ai5el4lkHjq0OHF1CZ/Acy3/EnpIGh2XRsavSkMfX/r
	CP91uw4biYIMHDx30NDIzO5PZzJc7THBHAGDDXmI7Sxo+/u+tSUVsRb6P2eblPKEOH8J0m47+hb
	RldiVRr3IXiGbuyqtj1A7Y7KLGdVvjUmucm78EpxgmWLieUlWgKr6r2wujN2OdtJjvDkPNMkDEJ
	Zdt0+wqDJAq0uFuxVbf/vB/BxIrmO2y4p0SeIa/QrUwJC3iUvpKObd/h1DXtwjJ12tq1qTnjKax
	qFmwC02arftwX+OmeLHavYro12kyr4YxTZ8iGOASuVrjreueOKpDJDQZsFy0Np+dMl9sI3J48s9
	AWlXJpInce+rQeTKmlULI6p0aQ=
X-Received: by 2002:a05:600c:4f46:b0:488:ae26:435e with SMTP id 5b1f17b1804b1-488ae264582mr107077245e9.16.1775546033734;
        Tue, 07 Apr 2026 00:13:53 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d0fc00sm156364925e9.4.2026.04.07.00.13.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:13:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v2 18/18] scripts/install-buildtools: Update to 4.0.34
Date: Tue,  7 Apr 2026 09:13:26 +0200
Message-ID: <14ffe9ce3bfb10dc658d3bd648e531c9fadfe20a.1775545489.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775545489.git.yoann.congal@smile.fr>
References: <cover.1775545489.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234722

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

