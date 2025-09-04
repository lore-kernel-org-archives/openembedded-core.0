Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01526CA101F
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:18:05 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.853.1756999083513915089
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vW7O1N19;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b47475cf8ecso740428a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756999083; x=1757603883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOKWfioBrYlsu2Fr+QGWpPQdBjZvkou8bzLrEiSM6Yc=;
        b=vW7O1N19DAgixnjvfb/YhXu6thjgDgknCpHS8AFLLIezJa8UZ3N4ITM10orc8O9lh4
         JOgFhIGIPo6Dq4thV8mwoBzkLPG4e8b1paO4ukQUOO4YHmJQNDM0zJp4+Mlz12gS0w//
         k2WjFLn0vovaZ7oC2Khm2aN3wfWBGsq2sO8mo6fpLBCTfdK60IwdXfH3b8jF2QB71Kpm
         qaASNWRVwBcAIaRNcA76hEXcWOcluby9nE34U4Sw9BzkHoSCLzQZ+I1UA/RbsocvlJgJ
         TeOsSVR0P41aSW6icGrTa4Eq5BZjIFp2g4Fshvl2EDfCo7nQAQ+13QxQwA5lZXA3geQE
         HRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999083; x=1757603883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOKWfioBrYlsu2Fr+QGWpPQdBjZvkou8bzLrEiSM6Yc=;
        b=HFg3tHjNuPGOUrmYP6rThyGdfcJjujfqpoeeesvZJdkHev0jN1rMiRSZCdegrvreUZ
         Ebwqv1LiHAATOXm9gTx01EBepAKeeiGmUpaAnQpb5dMMIh9Isiy3ri8DQglZ5v2IC/yW
         v52//zz9nOlEBB+iANTuMGjJarYX0Qa3Gw4h327OzMrhsRjxS815zSRlv34vTzz81s6R
         XRBtDuTPa8E9e9PuKWuX8XfPN+612JLBkUlbPsbayYCYas9xibUZGFi6c4TLGp+S/i36
         K75bNrMO0HYIfhycU1UnFzBQCNO5Db3l8kRBOsfAIy2UNJ+XN3QXR9wPbXw4X8pu3U+i
         m4HQ==
X-Gm-Message-State: AOJu0Ywm20YpQzXBhMnM3fWPi8AJGU+3V5jxQztIMGD+f0NBqvZup6qC
	GomNX8WJxEGbh0DAxOAKc7D2qYZIc50k16riaw5Mw8BUnNNNiKRpn8DHbWtPfqZLtleKv2r8ktK
	zbNSz
X-Gm-Gg: ASbGncsroYZ4WSGv/HV+MyQdTRyAPwtgwCT7R3mAJqh/smgBKmkkvMbBw2kmjXu0pYf
	h+3P06UPBV0sSIUjAWFiHul0mU/V/AjkTTrM5qwjb2kv1xpf1ZPGmhxcPHXHmzczCGYHJNNqnzm
	qAmiGMpGAKPXLaI7HfRefglwZexQlLI/smd/GiXngTJzVKDnJVR/tT3g0SC7Qn2nm5mtKWEomDR
	fTcSuT6jMVmo1g0awC4xIdxdHVMSvuqXQOkYjkCXfQzczY3S0qKatKJflH0kPeCKWvJYIvdIgyg
	sv1Rjw2fYnIQkHUwJc4yr1Ob2w7Na6cDwDfyboBzZcXbFK67mmuYo5gAa0BMg4u9t94pwqOhngx
	q9j3iIaXBAa+4vg==
X-Google-Smtp-Source: AGHT+IEpzo9SjRlPpJeZoNkjPpCv1QGmb6p9Udu3cW8NERq/hg5f+KZEZyHtSALPZyZH5fCChx8B+w==
X-Received: by 2002:a17:903:2a8d:b0:246:e1b6:f9b0 with SMTP id d9443c01a7336-249448f2573mr283973025ad.18.1756999080260;
        Thu, 04 Sep 2025 08:18:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89a7:8cc5:2043:ebe6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b0637d948sm84720845ad.30.2025.09.04.08.17.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:17:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 5/6] pulseaudio: Add audio group explicitly
Date: Thu,  4 Sep 2025 08:17:43 -0700
Message-ID: <4fc918da4667eebbbdae3def8c38209a3d650f97.1756998900.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756998900.git.steve@sakoman.com>
References: <cover.1756998900.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 15:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222953

From: Kyungjik Min <dpmin7@gmail.com>

Since pulseaudio-server requires the audio group, we explicitly add it.

When use useradd-staticids or do not use the default group in
base-passwd, an error will occur because the audio group is not defined.

NOTE: pulseaudio: Performing useradd with [--root
TOPDIR/tmp/work/cortexa72-poky-linux/pulseaudio/17.0/recipe-sysroot
--home-dir /var/run/pulse --gid 998 --groups audio,pulse
--no-create-home --system --shell /bin/false --uid 998 pulse]
useradd: group 'audio' does not exist
ERROR: pulseaudio: useradd command did not succeed.

Signed-off-by: Kyungjik Min <dpmin7@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/files/static-group                  | 1 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index 441123e2c5..252fdac67d 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -28,3 +28,4 @@ sgx:x:528:
 ptest:x:529:
 xuser:x:530:
 seat:x:531:
+audio:x:532:
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 18c12ede63..4708145bb9 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -147,7 +147,7 @@ do_install:append() {
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server = "--system pulse"
+GROUPADD_PARAM:pulseaudio-server = "--system audio; --system pulse"
 USERADD_PARAM:pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"
-- 
2.43.0


