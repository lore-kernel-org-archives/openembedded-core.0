Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2210AC7EE2A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:02:52 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.27819.1750604564727522104
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 08:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tRmnnuaI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-748d982e92cso2077260b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750604563; x=1751209363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qw6/DijYkNDT7wAHqSw+COjU5j2bjo7hrBlHAaLJPts=;
        b=tRmnnuaIAjkMvOtXnW7MYVp8vz9Ie59SeyEUSlOOWv/2TN75+mJE5C3xKfl0EL/ZJQ
         Vg+GaRK7YFyljJBYN3XWkHJHS63k0rqtYDzR4ueolJVFpJJxGtedjWuDFUIhNkDhhCfo
         7nW4vY6GOwkWlHCBSiSh3UizJE2pvgP5Oavz7ykeSSq/zON1LGzvQzqagQqo3INfbq/a
         a04X4EZkk46iZj0/kHrqvFaIAV2Ghup1LUNVt5XuZCLTX9nfU4FA3qomP/WugLsnmJ61
         u3Ld952S9B4Waqn1L5+6YBsFOSjAit4r41E9I0gEdY/dUWamPJKh5FWDEsMD5UT/cfk5
         8vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604563; x=1751209363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qw6/DijYkNDT7wAHqSw+COjU5j2bjo7hrBlHAaLJPts=;
        b=ZvemYrRtQbD8KZ32zRrCfna76Sg4igakUrsmok/+WqVaRhUKQe4S0Tmtq8VN47o3cd
         Blibqs4b8OZQ0oBEjQrEtOwWfA7Q7Bt1lL4hSjHu1aCxru7Pf1Bnl5iWMLzOAGV+Fbio
         pvcZkJ5zAccqYv2wUJijiO6LORbaGxseBORJv87a8AQxL2T5ng8wch6dgULklSJxw0bx
         /z2pvIzigcBgijPt96h14m0XcNMXm7XbYAvHgeMZOaGZh7coC6OXSLNFtzOPn9WnGyPi
         k/8a9TgP92hR89cpq4aJs6zvic7mVddt44d2eG5YuDEA0CSWvVOpglBYhcc+I+MYQpWj
         wGmA==
X-Gm-Message-State: AOJu0YwB4Z7H9UQm8FkhlHOP2SqOCqX/b3v+RmvIBAQY+KQg9VX0fl82
	JmKgp76JRAEHw7FLQ0HsGTD5iSVtgb+WmVnV02MF8xdLG+8pWwJQnVam1wq9pfFFZpjp3smOAsm
	48/8HvYk=
X-Gm-Gg: ASbGncuBJaXfOugMC5RsIo3P3riep6tyZVaYPH/RYu7cH5OOG5/ZDH2RhDwm6rYOX5D
	q75JoUjZM0fWcpvy2wtyQ6+mnLxEDZNYCs+qZvv7Yc0Y6niEAJI2xHrvjFVCjzuHDKDEwR/RSBt
	kr5m9LVff9njyptroPEnXXb2n90isU7zQClPVAz3U2ihZro5AAkAnOvPquiiAmxXgrXrxE8N3cQ
	yNumAMjvu2zcCBNfEHfC81PKwL0GyJIY7jfBs/U9ZZOBIrrKUKQHsTzeCciwn2KREbqa3WDrVPh
	5sJzNayutpEJ2FuHV+kE0RAVk3IpQFAtKOETYLOFInuf686jUGy0tA==
X-Google-Smtp-Source: AGHT+IGPQzjmguEmEThn6ogUDnmrMcocnYWahi2Ob3MS0MEDxCexzeGToIyRhwcdUyxt+EnEPl7YOw==
X-Received: by 2002:a05:6a00:1952:b0:742:3fb4:f992 with SMTP id d2e1a72fcca58-7490d9e4688mr11401198b3a.10.1750604562995;
        Sun, 22 Jun 2025 08:02:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46eb71sm6222521b3a.22.2025.06.22.08.02.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:02:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/14] systemtap: add sysroot Python paths to configure flags
Date: Sun, 22 Jun 2025 08:00:08 -0700
Message-ID: <85a5d7b1d2c8600f30e38e034f828e5897d9a093.1750604257.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750604257.git.steve@sakoman.com>
References: <cover.1750604257.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 15:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219191

From: Soumya Sambu <soumya.sambu@windriver.com>

Explicitly set Python-related flags to use sysroot-staged headers and tools.

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index c84fc27001..40ccf1d523 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -35,6 +35,13 @@ PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,
 inherit autotools gettext pkgconfig systemd
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3-probes', 'setuptools3-base', '', d)}
 
+EXTRA_OECONF += " \
+    PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
+    PYTHON3_CONFIG=${STAGING_BINDIR_NATIVE}/python3-config \
+"
+
+CPPFLAGS:append = " -I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}"
+
 # exporter comes with python3-probes
 PACKAGES =+ "${PN}-exporter"
 FILES:${PN}-exporter = "${sysconfdir}/stap-exporter/* \
-- 
2.43.0


