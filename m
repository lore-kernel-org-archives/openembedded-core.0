Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF972C98308
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:05 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2930.1790154718096834259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ohx/fljL;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so3845615e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154716; x=1790759516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gJfJ5Q/HZPO6KbD981RWdPHdpMCy0Fg3pT7+jC0tYtA=;
        b=Ohx/fljLdUQZqdH+rDQVVmMLAQj59k6z2ptxjlIyXRT8jseIvYVpgT469YKq2j90Bk
         cz7ZtkQwliUsmqlQBhm+xinL4QkTaQi7Fter4YEktNN8JJNPHRKul16Qy8EL6r+0k1pv
         Qpu+sIXO4Yl7+rjSH5A4eVE4yDHu8dRy3DCrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154716; x=1790759516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gJfJ5Q/HZPO6KbD981RWdPHdpMCy0Fg3pT7+jC0tYtA=;
        b=HwJnmzkGfFBsUkv6T6Fje2SEfSbEcgCZiVw4SgERnYiURZ2FGp8Nj0gtE5K9rxC5lT
         j8BZflX5LvxvrHzkaeJOqSOrjn2N3fc+hAwT4TyV4bue4yl0Z3raQ0h4095aUmbxyPia
         Jv4iUg7TnznqrMvYWlaMBWW671Hs77/60PU4umKihkhMUnj8Cx9VxNEGjPfTs8eqpS8Z
         h1bvNjfZd4kHzc3UC5ebeP1H7zoNWai81TVJAIi4BV+R1McSAvIwOxr+mj5Qn8ixP9TF
         1XL8iKQ+KJ+iu74aqm+6gJtQgmrBapFCF+eC53iar6XibMIRlm1CK4FDHJYcF8cUo37A
         okBw==
X-Gm-Message-State: AFuF++nFtra3qGrsTsapqYnYD6SMHZi7DZt1mX/dCw74+FlJeFED9eXU
	5LLe+3KK+VZRKbubFwziUt2C+S5p/SVtuMHXal3qzEe07b4yQt2KRvwj5FCH0dhFatg+p1/XWOe
	dRE6cu3s=
X-Gm-Gg: AYBFou0rM3vP05poKQ/UcAhlXIQypRuYTHpfJc1N6ByzDrjrKqXUN+4f9MbimACj8yl
	tMlDAIGXFwKq7iogqKCTTOBGRqul9TMJ+2f09GgVzORdVPMcnYBaRC01p8EC5uxPy1N5W7jnIVo
	gjeOqUr8jPKg/6sBq+AYEKKsWWEjzG1KF/CF+fVh9eyYYSUwCXUahJMGZewuXNuDVjsqao528GH
	o3lgG/qXfDOp6IKrSWhjy3xLXiqsy28iOiOPtqYSSgCYOQrhMcbNhKhjzKihkFfzSSuVon5uZ3q
	n/tH0ZmT2oT0lM2dUkK7y0JfeabEkmlMEuBsvHm2HzQ+Kccd0j7tlW+5wZhXACLpOYmykeTsa4G
	Twh0J8ZQ8nfNlFj2IbMHXOn4gkM0lDUjEM6mnl5S1RlB2ukDTBHSHza9L2WsY32SHyHhqE6wx1L
	idwyER/5q9L0mEMTRjSv5uVAgOYUFvD4x32m7UDNUxIncpfns5YoWUUpMq21hwiAY3+Fx/uFqa8
	wsgAT85oJL7uHBdPIhXb93L67t+8A5O4EZs9IqHhr3/SlQVp7oVn0av+/uDsVyT/yzSpIQe/xG2
	aDWst2E=
X-Received: by 2002:a05:600c:3b84:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49fdecd5957mr29436575e9.11.1790154716289;
        Wed, 23 Sep 2026 02:11:56 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 31/48] scripts/install-buildtools: Update to 5.0.20
Date: Wed, 23 Sep 2026 11:10:33 +0200
Message-ID: <955e0ed1c6651f0a1d18d0c9bee5f6ef494cd189.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246493

From: Yoann Congal <yoann.congal@smile.fr>

Update to the 5.0.20 release of the 5.0 series for buildtools

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 65200e0cf49..f33f192e468 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.19'
-DEFAULT_INSTALLER_VERSION = '5.0.19'
+DEFAULT_RELEASE = 'yocto-5.0.20'
+DEFAULT_INSTALLER_VERSION = '5.0.20'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

