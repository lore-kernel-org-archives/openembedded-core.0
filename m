Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95CCC624DB
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:35 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2491.1788641134903325643
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LD6X9jPK;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48444ec4fe2so1304212f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641133; x=1789245933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x0yitZs4H+Ik2mW9eCj5VL4Hhdb7oYNeIQa2KAAFIP0=;
        b=LD6X9jPKTN0I07M5muLIQ6IJiVqIYCG5TRjHcsgvx91Rq+5/UUPF8Z68YqXiw0j4xT
         u7FhR46O8HGyQ486+0ZifoA7sOIWG1/E+1IR/7TQv6m1qyqme05JHsy9PGnYTdROiv+Y
         AfFa86AkEBLPch4KwbpwpVxVSALkiZa9qC+Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641133; x=1789245933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x0yitZs4H+Ik2mW9eCj5VL4Hhdb7oYNeIQa2KAAFIP0=;
        b=PCuYmU1GOGdUrNnK6VWzuM6yg3VX7dw+PMHTfe9m5ruM4OG/VlCOS6TIywLFDgMw6V
         mWNYhLZ43D5z4ModC7aqElUZd2pf/zub5wqTw7wa2o2aen+JI1XZQiXDexw9uRaI2Wx4
         rLO8zAon9SDOmgocNry5x1EWycMJ5lcj3NiTwku/V1GHIt/l2p8tuDKsErP1jW4hoSUs
         ncFRkrhOHw9BC4hZvgYo38UM6ouFflY8248L9PCapirYbUeYdHUJyv273gVjkGJSPUUF
         vDI9P6LATFsX9t2GchCt0fntdlxUo5ctfP1FP+V7HfwSCFw2/62NLswKIH3Rs020mR/R
         TW/A==
X-Gm-Message-State: AFuF++naivOhry3oNMO0ejoZztzzFhefiGF9tYTb6CF1JhIBl89wN8cW
	vQdCybMsLs67lYVtdBcmXagXITR21YD0Cd9ZWz4VM6kqk6y0rgfbCheTVSG1yC23Nq6z4y4QweK
	vi5NMvUg=
X-Gm-Gg: AYBFou2BMkRGla1eO6gSpjb95GKOw1gv0D/DhdEP2CtRNR/4ud0VE/xX83IIvXyAd6K
	QhQjiGB9kdwXKbGcjhJgZ2M6JvmeD06UM5JJiyifUhQOrdJraf1hkCIQlg97OPk1Jlk5x3vpHPg
	CxDTjUCxfBvrKe9S8JIZipzdOekYH8BQO+soO+ic/f8062vjhxD4SybGafBita4F7BFi5GXYKgM
	WO/jFbApJfFd8jhU3pmaF46qMSZpF4B1nQ5ynbiR25/BKA+g4uVwvEASatu+/Xa5AzPq0F4xRN3
	j/gtk6j8ORATZDcrNJvdN3z5NcJZrvLcFSmZACCXbZ3hFD7aIt9gqqutP+UAN7j8o+ULBhPwg5e
	tTIKrUzuQ9Zi3uHFQ+koCMG54zPudWCreC4Camh89AY3qnyVOnPbiFZcnG2J5Olf817D316Aa95
	uvvwHdTZ+2Mjf6elWpJeKOnXoDlOMidslQE7HHdMWn6VbBUFpGbIEvv3heAyULVu598xda2Nh57
	ySn8bwsb7LhzH5CpOivQFaOlOK8hYYxDD0+cqjzCCueUcqI/5zHdLscmaqRgtjhGMY=
X-Received: by 2002:a05:6000:468a:b0:484:3310:710e with SMTP id ffacd0b85a97d-48587291a2cmr21967361f8f.26.1788641133151;
        Sat, 05 Sep 2026 13:45:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 40/40] scripts/install-buildtools: Update to 6.0.3
Date: Sat,  5 Sep 2026 22:44:41 +0200
Message-ID: <31def396136be047e10c507a50264aad52ba6b0f.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245192

From: Yoann Congal <yoann.congal@smile.fr>

Update to the 6.0.3 release of the 6.0 series for buildtools

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index b59cfbb8705..e1af05fca33 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-6.0.2'
-DEFAULT_INSTALLER_VERSION = '6.0.2'
+DEFAULT_RELEASE = 'yocto-6.0.3'
+DEFAULT_INSTALLER_VERSION = '6.0.3'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

