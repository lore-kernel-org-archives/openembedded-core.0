Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8823F46433
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46897.1773653413409211435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tqAJCsVT;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso35669265e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653411; x=1774258211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xh8JkQqfySRyFpH0k1JChOkeKuXow9O98XT8IBXeVqI=;
        b=tqAJCsVT75iE7wcLrd5HbSZON15w51BiLOCgqI7ts3e6vvSPQUPsmIoGS8nMpb6xSk
         24PvP678ZD0bbMyk6ssPlNkSQD+xU9qZxYaJt6wqofx2ghHX233E1WRTqhYy6TKh9BxB
         aWZ1Qio8ue7LvKmzCqCTDrSRFaja/622Pxt4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653411; x=1774258211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xh8JkQqfySRyFpH0k1JChOkeKuXow9O98XT8IBXeVqI=;
        b=tLVd/2d+IXEVqXw1ZTWhHSulP/yhK804C8HpVRba7Uu0zy29OkwNWCJXgkHACPu6k1
         4OzXIuIFut9mUaBKLsycrTzJruJmXEo5ti1TxUHOsXdD8JrV3VQjW/tfJ9QJXzUPsUm6
         Kpxfc/tsydEj+2tqpw5Jt6MlFTdtP6kOMyH7UgkgIuyzpSDcuExyXeC2zcrlRvacx+iJ
         tK5lgwsdFZUyewqHEcRW9KvaEFue+sAWTvZYGbUBuolhJQfBY5SxA7CJVynbRbZhRs9V
         CfUJ2u3meWbBcxm2ZMKn91XSQH72Zy1ZrGzFLatGxy+EQd0tYML82KPGu7yLe7TKXR9k
         aAww==
X-Gm-Message-State: AOJu0Ywf3w37lMoXUROvssAsPOZJanV3e/jdg49xLCvmMjdAUFdLBkXn
	vX+uOliyxQpGwoyY3op8Pk5cS37RxJ5kSlkUuLyAu6L3hAsrF864N0bQThHw3lTYvzUP7NYfguY
	9aSje
X-Gm-Gg: ATEYQzxj7JgLRNcdp/WMq67K0E8JvAICWXuk7MffYcSGaqBnbtap/SIMxz3AqduEWEr
	05rHWNRxhyWjSejGl6VZPmKSBOrOdAUh1YYsnVKkp4gZ6kCGBlnb8RBGN56PTsRy+PcoZkoRqMO
	sGBMpKbqNRdwvII5cHwpjiSo7hGiEd3MDQXvHgWoXmzbtXT1gjKdSRZbZspaPoc3jGggSCqbjVO
	muiBYGCZBOCrClC0Xx6wlDI2IVovERUcdB5XN0kw9X0tI/NRLal2sIsdLL3LmnizRGbSghkUD5X
	RMG91gT7Y4WNrEBHXReTetmu1MSFlqKkpiPWoZhBl9l2RSyHtFdq8jsx4lBtgjBrwwF268AUuST
	s1XBlSyy2z9ebFm/5vLcW6nGFReG/ayO8LP44oDBlPdTXDGFuvKVDe6v6AJ6voXdYSHp1+n89VF
	KF/VVBzgldkc/D8Kxfm87TPKb93iwfKAR3CwNbfYeL8hxpZH+aAkL2w43fbyrgwjsr6df06HzqK
	gaM386jhM3vUBzhShQpida5mNCzzcOGGNr7vEov64WI
X-Received: by 2002:a05:600c:1e8b:b0:483:b505:9db7 with SMTP id 5b1f17b1804b1-4855672ada8mr198156435e9.32.1773653411380;
        Mon, 16 Mar 2026 02:30:11 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/17] scripts/install-buildtools: Update to 4.0.33
Date: Mon, 16 Mar 2026 10:28:34 +0100
Message-ID: <003b4f26061a7ae634b64165482a23e28ae347b6.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233237

From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>

Update to the 4.0.33 release of the 4.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index c105dfe4623..6a1762c14b3 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.32'
-DEFAULT_INSTALLER_VERSION = '4.0.32'
+DEFAULT_RELEASE = 'yocto-4.0.33'
+DEFAULT_INSTALLER_VERSION = '4.0.33'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

