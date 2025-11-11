Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3C9CCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:59:19 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19456.1762873153242620515
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:59:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xZseCaj+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3437ea05540so2732452a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873152; x=1763477952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9Q95o1JycxnWSxCNx5NkELaeB5dG4ILg+B7aFPaRW0=;
        b=xZseCaj+3n13Pgt62L7ZU7U1IPJHCtK3l6KPgOCUowCXfJnFAGB/ydhWAko6cbixN4
         zB1dbpRrK+KLkZTIyx8iAc5edXo6AstG+ndavziKnTVQojXl16RH4s9Ruda+s69oPLED
         IJAli13s9CwNVKpTFx3vog7P38HgT7m2FkK8y5WVg8gNJOhFUWFdu+6+FmErwukjP2PY
         9VnbFLcy1vrtqz8/ygyH6avbbF36MMBUeJxSfpxpj1+IsFOtbwJSE3UhBYV5m9Z983sf
         e671RaiMi6RHH3z/HVv+Yt6maDdR0D7YO1Qx+5kjGtEpdThGAckkN0qMKBUp+Uu4kKN2
         cp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873152; x=1763477952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d9Q95o1JycxnWSxCNx5NkELaeB5dG4ILg+B7aFPaRW0=;
        b=NI6CDI/V9RJq1QC6TspLfrGLzZzb8Zn2tz5SUE68DXVynZxEUIfQlFttUG2bt4bGO/
         kFj3q1S6F/6a8josVqgI6P44YahvYLsYBvyXiawu6q92TH46OvxhaiNjr5ebRWTW8QGz
         Se2O0mtj7S+8FppwaY1TbUMuJUAjyvQxuMXsEJpbIYXu3v9KH9HIXwMWgZlahuTfTFYi
         i5GQ06vHW3TD00vTk3HCG6eMar+T+PIQF1h499J4tXtXThDReVVj8p0uU4K+Yh8qTCRv
         S2SGBZkPEJQajKbcbuMLo4xBXsCWB7rgiPIGRk16FFrqYPx2fzMQcTV2j15bRSig8axg
         Awpg==
X-Gm-Message-State: AOJu0Yx1ae6rj/9xUa8BU3Xo+NK3nYdKiaJMJSdxJ+yVRBYAnEQemvJm
	6b1HVIgfqjdz1Q1xgMPMLU9R76A4efS7DBD+yciyhB3DtQYm8yZnBFbZlWeKMgtDwEdvC0l15t1
	wDDq3zVo=
X-Gm-Gg: ASbGnct6K9ktul0BsLQ584I6LFVg/3bznhr5dWU644g5KiraQSn6CnNYJHD/X3h9QuH
	QyKDmdTjpFd9uwcG9Ov2l+jG3H1D3m5KWql5nJH73tDHLdZ+tVDGiYV/7+3z+xXJYgqLPwRyOgu
	ZO6QzP9flauaScaHAX7Uyxv30Honm065giwdTZuNtRSKq/hMfLyrMLmI1ayM7zFG1z76pHheeA6
	VmigVNeRYj4yaOol2XPm6wxk3Z1/S+aNcIWmmEYsb+dEGx7QJjvK29zyaEMTX6VUFAlBoRucjG1
	8YTOpN8MCLngYf4pIhm5PtOlItjSAxbMO5k7kC+w57e+Xfc04VYlD2QJWieZDehF1U0agsvJcys
	jTqkz8QNakPGsSy2nT3krN+h4Ue3aBeTgkx6GCKOl0R5QjicfDRnvMkC1huI6Cn1AoUE=
X-Google-Smtp-Source: AGHT+IHS5NARacw1ivOkPauHzZh7V8UMu/6B2DywyDhfR+1C9MhZgcOKL2YLD4zCk536IlB+PsqrFw==
X-Received: by 2002:a17:90b:1d49:b0:340:be44:dd0b with SMTP id 98e67ed59e1d1-3436cbc6fc3mr14605399a91.34.1762873152542;
        Tue, 11 Nov 2025 06:59:12 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.59.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:59:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/19] xf86-video-intel: correct SRC_URI as freedesktop anongit is down
Date: Tue, 11 Nov 2025 06:58:27 -0800
Message-ID: <64eff9fa267f33d2ca0972a5dc4ae010138cd720.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226184

From: Alexander Kanavin <alex@linutronix.de>

(From OE-Core rev: 04037a14e1431c4a51f5d51885974732a6108368)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9649bec517996558e01d668d2b59e68306a3a647)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 2e526bd799..0a42bd9975 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -13,7 +13,7 @@ SRCREV = "31486f40f8e8f8923ca0799aea84b58799754564"
 PV = "2.99.917+git"
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-video-intel;protocol=https;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/xorg/driver/xf86-video-intel.git;protocol=https;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


