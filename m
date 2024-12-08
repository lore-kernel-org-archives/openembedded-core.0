Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02AAE77173
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:06:54 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.78444.1733663207776362462
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:06:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jshTX3MT;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so1899310f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 05:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733663206; x=1734268006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccVrYvktVBX4hX+RbQm6k50+Suwc5+z+zWjyXYbJQNw=;
        b=jshTX3MT8oAveHKsajE501PqYCCMHWDHLPHUN8NtczrLJqxTLsZDqAuEpOJyo4blqp
         1ZVvAP3OTe1AnulZ8ERyih0a4fnp93asbjMFgF+jLCdClHqvemzy8tA0lMtVHhdmemx/
         zjt5LO9dMG4lruNuAVjtO/QXXg35tSaOWnC9w1DxDR+rv0m1QlK8uLpSlhH0kBy2jIIU
         AIAB0Ha80lseKaEz/qt6pBN7LsU5txo1TIzkQkZJRx6ldTqBztHbwFW2piG9TaywwClG
         A7/kN+FWHOTcDCf6GTiA4fviVObX14RVGVzr9s+8DKpA7vJLs/IgICT/tiqSIZPg65EC
         T/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663206; x=1734268006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccVrYvktVBX4hX+RbQm6k50+Suwc5+z+zWjyXYbJQNw=;
        b=VEbpCMbg/PYabNZZVI/EidaGoWlQH+QpgYudFD/xGTJVU6nU/S+9b4o/hSyJUee3uH
         CqxhNLfZuj/uB2bf9JUSIiJoKk9gn5uo0IS8HK31lQyj0xafyq3J5kTkkSOB3Gmq3e4k
         HHjFs4nD6vk02LlqNCBQTfNesYh4bpfLhtI40S4qN0RKWoboL4lU+VDhtghVn6wH9mie
         IqKw9d+E+BRTckwy8zibf9U0V0nBtzPFPTvDBb7WIxd95CRNDbCdolmEA9pOzKnyV/0r
         YV3UFOKecH7pPPrCeHXA3WjUlIzRDuVPxdC7Xt9Tk1e/wlBSxIjOwsz7MpV9CcoI+tJH
         FRaA==
X-Gm-Message-State: AOJu0YxzLQ6NE/giMPczxZQiv6hKEbxc7zRikDzzgRbEJiI0ceNTTN+y
	Pm4jH9go6KMbw70mylLr7p9wmk8omGs695V7jqI6daFNVDOfszTuSxGA2DV3
X-Gm-Gg: ASbGncsoryQMWTj86UCeQPuOLO+/wiDf3u+rQg/JmnqHowpeiFbvPGaWwiHLRMkBZRF
	HWTjxpikyP6/sEBvHIuvvC01o23rNrsb7CF6EpNSTYzUZCY1Me1f9F2/zratW0RxTN3MsFp/oj5
	b9gl880cce59D44aKqYk06pnxWUHnh1qOEnJitQjXciYNBXFNsusIRb5F9TxhQZu1X29nCqP1P8
	sGZXv0KSBIBNoFQeCUotE0jX07dFeHJXUL+HF/xgHWTUGlXkOZkT2r/3CKvxT/JeSBRY3pbAqs=
X-Google-Smtp-Source: AGHT+IHuOtU5YFL8GTrGFoEmOaGvVs4g4b3PjAp97uFtLkP7zPo5d5NZOhf07olpdivvRIgpM4zAEg==
X-Received: by 2002:adf:e18a:0:b0:385:e3b8:f331 with SMTP id ffacd0b85a97d-3862b355ed9mr6843798f8f.14.1733663205868;
        Sun, 08 Dec 2024 05:06:45 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386257de681sm9745476f8f.30.2024.12.08.05.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:06:44 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/4] systemd-boot: drop intltool-native from DEPENDS
Date: Sun,  8 Dec 2024 13:06:15 +0000
Message-ID: <20241208130617.4032-3-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208130617.4032-1-gudni.m.g@gmail.com>
References: <20241208130617.4032-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 13:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208451

intltool was dropped as a dependency in v236
See commit for reference:
https://github.com/systemd/systemd/pull/7313/commits/c81217920effddc93fb780cf8f9eb699d6fe1319

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd-boot_255.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_255.13.bb b/meta/recipes-core/systemd/systemd-boot_255.13.bb
index 4ee25ee72f..397316fe9b 100644
--- a/meta/recipes-core/systemd/systemd-boot_255.13.bb
+++ b/meta/recipes-core/systemd/systemd-boot_255.13.bb
@@ -3,7 +3,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
 require conf/image-uefi.conf
 
-DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
+DEPENDS = "libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
 
 inherit meson pkgconfig gettext
 inherit deploy
-- 
2.43.0


