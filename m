Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68471E6FE43
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:23:06 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109351.1766524981544724388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:23:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=d4Ke8PA/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0a33d0585so50804685ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524981; x=1767129781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LDwVmMOuEHrfHmlpitRdTZzdc39V8cbwAN1hNfxlCo=;
        b=d4Ke8PA/2rRewRqODOXUECfvSnFJlNW+21kSVSPT/AwHpJFgvpXfkqOXxMVswB4/6m
         UNhWzfy1WeEgl2WdLBsuSCki8hi4YXKRzXQ0UsCIESx2qOwbDl2pj3L/56oq6PExRK5e
         Qkl+DpTWLGmwsMtt7sH+H4eUGjPxPLxXWwYwUeyt7ni/9YlMAkBiDwD+lIt7tIrQelZB
         P8hVwdYas3sUNG5H7BsHwI/WBikVnGF2y5wKAbZcxg5shGJaVCWVfs3YIQveo6rGALIZ
         y87DKhHicj4NvpYl3djtifaQlwXdY4DRY+gGsH6X3S7LoPVNQPg6u5yQYSWEPcBgBmAe
         csyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524981; x=1767129781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4LDwVmMOuEHrfHmlpitRdTZzdc39V8cbwAN1hNfxlCo=;
        b=NIYyuq04vZLM+Mc19QLWxjMaHrc9t+3vHFWu0HCKzF2sSTJOvQvENGC9ACIrLNmbvh
         att06OHkQw0DnurDFk0x3YZkUfEtH2JwpXxbNyfVrjpsJ5Mu/1aj2LgFxGXitlDqiVID
         9cFFSJyGx0y4CwI6q5YspPLlwyHEG5rgx1UVlo2oK8JzSBATWfr92wE1epdNchwuNfZB
         cYzYOjaIUaAJVRZJhR1b8vnwzWG6ZFr3ObNjdQN8K4Db72FcJViDOyIXa+2tEK70lzyM
         DqNTkoMb74+dPLH3ll/CNCF/OVUxYGt46bLo2iJNXzsIp4P24PgHl0N4PoEaf7YzQ2LG
         qMMA==
X-Gm-Message-State: AOJu0YziF/P3dVhH6GzS8Cxp4f0MkWR8EZtVltyGL+jWSVxLOET2LeD3
	4qadbrFyK9HdG1j+n9QBTxDzkO4KIalDpBuI9mliqTLbTDiGdFEMiw7GsxB3L9KMLG/fXZbjcCz
	XCyCf
X-Gm-Gg: AY/fxX7IeXkzwL1oRt+uOOB5ZlYt/yCNjgl2vXs0FTjG4R4bpZ1HgSbO/1FHeog88dW
	ovipA+caW70Kb3DGk9sadhUaURK/W+4zE2o1QQOpI04tNeVLKu03QcsBn55DtFdKAioNsZqnTGc
	rZSaEpMAkOWLdy5aK2/m1mslGtfmlaVX14GEGIyzMoL93YdbUkxnc3T0FfrvBuQI+CgoyhoQPWB
	R74Bd3HzX/WjEslmZLkbG/anUkUYzu5ECvHKUfRWlh9PayQHaVqB3j8jG4oOCYOs5FfrM096OSR
	d6/nf+Cz6NLOl/vkMoaFIOQMfAMzkVdS+j7G4pLLe04idrK8yVqMieTE2F/oq9pXQvC7vQbw/7b
	prvFeGiosn0/cHL7JHJjk6bXRK+kGLMuRh3l5dudoHBkzQAHHDYltBMcw9ZUNTpY8HIgg1vrVjf
	lerw==
X-Google-Smtp-Source: AGHT+IFtOIxbJ6f1hGupQRWoa/4l78alSR8gVrlE9P3pRw4XNrkaL6MrnR+n6zGIrKLsaBTBgdI5OA==
X-Received: by 2002:a17:902:c943:b0:295:9db1:ff3a with SMTP id d9443c01a7336-2a2f2735164mr161732205ad.28.1766524980784;
        Tue, 23 Dec 2025 13:23:00 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.23.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:23:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/18] scripts/install-buildtools: Update to 5.0.14
Date: Tue, 23 Dec 2025 13:22:18 -0800
Message-ID: <4c85440cd95d9cd007ef4346ecc9580806526c96.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228486

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.14 release of the 5.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index a449e45cff..f1c3084245 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.12'
-DEFAULT_INSTALLER_VERSION = '5.0.12'
+DEFAULT_RELEASE = 'yocto-5.0.14'
+DEFAULT_INSTALLER_VERSION = '5.0.14'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


