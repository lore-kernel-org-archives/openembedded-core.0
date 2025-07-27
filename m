Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A64C87FCE
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 20:05:12 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.66859.1753646705077920802
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 13:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m69/PMTY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23694cec0feso32881985ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 13:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753646704; x=1754251504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGVEByqpPFOj5BbDcmLwyHX+OCe3LJGcHwI2K++wSA4=;
        b=m69/PMTYgnG3S6M2dTcovE0m5QCuD5Nam0kBIcVhdV84F4xdp3fw9jIFtNSUqmMAWX
         hTexnmmOPjaurAVpL+jwb5cJGsoGA7ZMuMduyFs6fWTDzI9YpbS78GV6/yosPLeCJpYo
         BAgJyzPbM6G1nF8je6ESotirGdr8dav89lTwiNROPl2LsCAk7gQvDezAk8/EKZTO1J4A
         3ubXMCyRICGd+dih364GSPgO7Z8cy2YDENOzCcfdB+GRohT2pG/agYVfMQsX6KmRqgYH
         gZTJjwc+JRaiD6oZjAduzQUvn8Lj0qc4trvQVjV+aAT28eSDq8qvIPeJEWC2rfJsCw/0
         TEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753646704; x=1754251504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGVEByqpPFOj5BbDcmLwyHX+OCe3LJGcHwI2K++wSA4=;
        b=BoYNCD5dBJ9ZoV5ZjvQsvnEuUnI+veSfXVV6K3mC5fjvQtghIydBUjFDW5rpye3wfn
         G389JWgf3U7aSMmmbd1OTgfbhehmxC3LJzwLHmctKb7Gh6ZXY0LFQ9C5/h6QyDwtdkbD
         FGn7fTE7IsgZF5xdJTp8M0TeDNcCrzmBwWng8YU5EiBGdJQuGu9ydc3Z5gSbDULZ45TN
         4K0Ed/BZP48mXIxKrPBqbR1kTWFprruzVJmi8eLCQQMFLdFJTHBVSkdm8Tf+74uSfc6g
         YAkfVySQtfrbhU/ynEvORF7hbbJO1xGOOVu1wKaK23qN/qg/9d27QTzzKbGlGFD/moKb
         B4ww==
X-Gm-Message-State: AOJu0Yw0o6TEalPtfO5PP6HC2UkcjaYx7Rludq9KqB2nk3PKGoWbMU90
	VRUEc4h5UQsdcJkesbed8uEasqMT9vIps10NgzbNFK9NagY4w6Yprm6qpIh/Ji7fJIQkjXhPVrR
	IJCTUW80=
X-Gm-Gg: ASbGncsjNE8me08AptXXmnc1/zd2OWJXjih6DRfGdieIQIF2WrFO16OzdbM+X0gmVOA
	a/4RkYcyAhsfssidzr/HYogx4JXtfJu3Mkrbuolfp+00a/ILp1bGYxckYO1JxplEUPHp3Kh9czO
	LK7TQpQSWVinPia6a8xp6mEFo4BMLUGeC+VdKZdYUtnjpGlK3qZv3GrQey+GdVjzOKLwKP55lrV
	LRrK+m/tJwDKywfUxKxCQgxTc2XurgYNSMqW6BMsyFZbYW0Ebt7A2VJMImHvd7APgfjXSV1RBc+
	4JY/fc0XpRFPeTL9CLEgtK/ti4JnYDwwbPHbhkujLdzoAaIp6w1VDjMI163cydrvcpqIQGzyNia
	k/9jFnVATS0fziQ==
X-Google-Smtp-Source: AGHT+IH8aaWezsK0YyYLSxrY3wN+YHSaKRm2aqwGCkYqIHtV7I7OkW5CkIp6Lo16cwd/C5J9dSurEA==
X-Received: by 2002:a17:902:fc48:b0:240:3915:99cd with SMTP id d9443c01a7336-24039159cb3mr5289705ad.9.1753646704191;
        Sun, 27 Jul 2025 13:05:04 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:22e3:7abf:ace0:e5ff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe512ef7sm38905665ad.131.2025.07.27.13.05.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 13:05:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/10] scripts/install-buildtools: Update to 4.0.28
Date: Sun, 27 Jul 2025 13:04:41 -0700
Message-ID: <8e59118164d6468443db211d9ade058402f21add.1753646578.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753646578.git.steve@sakoman.com>
References: <cover.1753646578.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220980

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.28 release of the 4.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index cf75d84630..3c86a087e8 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.27'
-DEFAULT_INSTALLER_VERSION = '4.0.27'
+DEFAULT_RELEASE = 'yocto-4.0.28'
+DEFAULT_INSTALLER_VERSION = '4.0.28'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


