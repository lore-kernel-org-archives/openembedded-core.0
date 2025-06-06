Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC5EC61CE8
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 12:13:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.32108.1749211995080097860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 05:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aI/GcfrP;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a375888297so1320051f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 05:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749211993; x=1749816793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TWkGY/PGKvCa+/CKQIgyC7D3olDz5NBhMowUHxeumg=;
        b=aI/GcfrPQeE+wXMrPfA/xRWRf6Vt5+/TMSYtA+kXTto25oDq5ax39Bzzsok4k3YVxi
         I3eVnFrfJRbzuO6XsH9wcm8tgeXIU9JonRmKiGz/jZfww/XpzK0jlQTBvO9sVqVL05M1
         WBcfsA3MGKblBVj7QIni6inVsBMjL9KptCl6x+n0Im/R2kVRdZM0blI9bbTeSpRkiD0F
         u2HJPhJSDs6fO0ll4NulagdxL6LK+Su1YlP/cL8oB0YiuxbLjnJyMk6dUPolcvhUbyo3
         XH1bSjhAH8WUDhk3kHZKcVu9yjr9udBmXiOp+hUxnkKPVCX8ksxCK164CrgKbncwbiK3
         Xk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749211993; x=1749816793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TWkGY/PGKvCa+/CKQIgyC7D3olDz5NBhMowUHxeumg=;
        b=O7VMY2bUlNSldRV5ba+Y/rVxMcoL2mkI8pKzFNR8mzZ48RfjOdAu3wV23q7AJskjQR
         LUq+odfGEVK1Ed5VbLrb+yJ8/gaq1iKEZBQThLZORqpg9sqX0XNXrJzgceHPzAvwqcro
         VFy0Z6+XjDdD7o3Fkg15eM9ppsDg9S9bfYIK3h19A4Oq7upjaTixor4D3Tm26eY+GLfD
         HjFnC92K/6ApnHT8dQCVEs+HkQ5upkbPBlqUmIB4lU0zmKpg80nSOaRt2wLxPoGOm5ud
         dd9BiuOMpCbi8elI59TOaauvGSRkXJgzIJ94TeGuBxHjjsotvAeH/veNqx6IlvMyjWRr
         8nrg==
X-Gm-Message-State: AOJu0YybmcrLUB9Qz3TVEZ8YZE9voSgxtL8CRqUnYNl/1rbTScQBScJU
	O39dz/8djtbnRKaN8k/+0h4RQmsY3j4Zkf9xYtpOPKnySpKQsxL3AukiTpqFWQ==
X-Gm-Gg: ASbGncvh18iHPMrZmoXX2boQYEKgNSeap79w4J9XbMjXZXQX94i2f6hiFtemTPheO1Z
	MFVoW1AfKnv3wsyKox2fCGCsEtyKR2l4x8qxZ2q4gQpA51fEOx8zRsxCdwWwKuFdfrFOLjhYc7b
	dj08jje974iyP29pzu3A9NadW2/GKKLlW8A50FZjNShiEjbJ3ABPvSBBb0o4lS2VCkp3i51+kxR
	HdGZzKNZ0579cFKh6nM0EMkGZC4IW+ypbz4Q+lQHPc1oCRGUm9Ec2kMDvmvwXQfFNYzM1Q8iXID
	yjIoW8L/TwFQsv8KcAEC/Ylu/jA5w2ZfE3QknbOylhmgyUzUFw9sfziIg195nXGpJcgybvozMzn
	k4QU97ylhWp5oeTUp/JdTCJE=
X-Google-Smtp-Source: AGHT+IEz/vCJcLWt4AiTcfds0YRpMospeDwzmZ1pJiS3dUeDVpEnMcTOZydtwD042ckh5yGjG+uSvA==
X-Received: by 2002:a05:6000:310b:b0:3a3:598f:5a97 with SMTP id ffacd0b85a97d-3a526dcdd9cmr6595058f8f.9.1749211993185;
        Fri, 06 Jun 2025 05:13:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e014sm1718391f8f.3.2025.06.06.05.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 05:13:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] templates/default: do not separately enable sdl in qemu-system-native
Date: Fri,  6 Jun 2025 14:12:56 +0200
Message-Id: <20250606121256.487555-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250606121256.487555-1-alex@linutronix.de>
References: <20250606121256.487555-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 12:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218135

The recipe now does it directly.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/templates/default/local.conf.sample | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/templates/default/local.conf.sample b/meta/conf/templates/default/local.conf.sample
index d96b964c5d..3a9706c1d5 100644
--- a/meta/conf/templates/default/local.conf.sample
+++ b/meta/conf/templates/default/local.conf.sample
@@ -208,9 +208,8 @@ BB_DISKMON_DIRS ??= "\
 #
 # Qemu configuration
 #
-# By default native qemu will build with a builtin VNC server where graphical output can be
-# seen. The line below enables the SDL UI frontend too.
-PACKAGECONFIG:append:pn-qemu-system-native = " sdl"
+# By default native qemu will build with a builtin VNC server and a SDL UI frontend
+# where graphical output can be seen.
 # By default libsdl2-native will be built, if you want to use your host's libSDL instead of 
 # the minimal libsdl built by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
 #ASSUME_PROVIDED += "libsdl2-native"
-- 
2.39.5


