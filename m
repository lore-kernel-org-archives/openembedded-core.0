Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8EEC3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:37 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.55955.1722258807661455071
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dr//Tb/p;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2cb53da06a9so2120467a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258807; x=1722863607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frHvG8eQCsCeu4IArpEP5n/yWsCZcElq2S8Z/IwOTP4=;
        b=dr//Tb/pJzjoXrK7EBzy+LrrVuu8CcZblqtC3BlWyPylsutRgB1ekXynlDgbl9s8PT
         NwA0XHXH3rx5bIClz8vDQ4PUmBN2pWuyK5bG18yjtiJSUauRs8Y95bmnIRoxm/X/ck+l
         yRrSTkffI9h34DfjZPbuZ8qfGku9ja1NhGmD8XnCu9EQWgf9nYFFjdSTNJb+on0ps6kx
         5ut406ncH8p98JiHPTLlFbn9WmbFfZRWI9elhVPE2m+ggUU/Fc8HlpQQoh5wpQe4JTts
         ONI+IRxRJSZwQVNeqT66JZCcNZeOtYfy50zcpc0fXXrOV+HK4L4mO1OONRoXmDwaU68c
         l/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258807; x=1722863607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frHvG8eQCsCeu4IArpEP5n/yWsCZcElq2S8Z/IwOTP4=;
        b=DV/uDqoOKimp7SKeBDS295fHldYPta+IUQfKvFnkmfkq+ECslrCcdzKgASePEYSC2y
         2FVTDPihdKGm3cntKPqIBRGh/g/noNDLjwu/J/+KJiF2BFiH/T14cI1brhCespWytxOc
         HqRLHo5czRPfYB41JtB9sw8iW0W/QAk13IAuhcKEsbzX9fB/ZFJ4JR/WLEdkRYYPdqv+
         QKibZd7Zg9OP9smJELH58FKZpFgQHdQQFcMHtKJa5x9hoxRxogcrdNrz41QNMGd222dB
         m3EyJAHtH3Mu87WfnYIzNi1Ij6wdFyyADaXKgrrFblV36rwRB4d7ZLjcj+3i1Q3BKmGY
         coHw==
X-Gm-Message-State: AOJu0YxvVoIWUM4Llzhhtns7/TOrMfg1B44WdkzactC+OOXfyrNKuqtv
	D+lDIs4pDX7HecvDEpcIQrdJCObJguCKaRz4VucDezInLKU8c+L0aQUDfz/q/JxNjvyUQ0W6ljo
	5dgQJ3A==
X-Google-Smtp-Source: AGHT+IGC4ajPvMnCQZ01KOt63tI8/G/0pIoduhUpUMTpYLZvwlGJW0MGy0QkNwO3te26373ik8DyeA==
X-Received: by 2002:a17:90a:5314:b0:2c9:6188:f3e with SMTP id 98e67ed59e1d1-2cf7cf7fd35mr12214951a91.16.1722258806858;
        Mon, 29 Jul 2024 06:13:26 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/37] archiver.bbclass: Fix work-shared checking for kernel recipes
Date: Mon, 29 Jul 2024 06:12:32 -0700
Message-Id: <340dc094df5eda4a3834a90578b331d9edcffa94.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202636

From: Benjamin Szőke <egyszeregy@freemail.hu>

Source dir can be a symbolic link in some BSP's linux kernel recipe
which points to work-shared path (like linux-fslc in meta-freescale).
Change to use os.path.realpath() in order to get real path of
source dir.

Signed-off-by: Benjamin Szőke <egyszeregy@freemail.hu>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9191aa685418af32f003e067ef7c5737a271e3a5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 2d0bbfbd42..9d286224d6 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -473,7 +473,8 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
 
 def is_work_shared(d):
     sharedworkdir = os.path.join(d.getVar('TMPDIR'), 'work-shared')
-    return d.getVar('S').startswith(sharedworkdir)
+    sourcedir = os.path.realpath(d.getVar('S'))
+    return sourcedir.startswith(sharedworkdir)
 
 # Run do_unpack and do_patch
 python do_unpack_and_patch() {
-- 
2.34.1


