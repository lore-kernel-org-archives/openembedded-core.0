Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98FCC76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 03:11:25 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.121730.1680664280848020520
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 20:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SS7Dt1Y2;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id le6so33160578plb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 20:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680664280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYqfTnvCFrjGPcHRZ1dRyGizy37l1a0MXfGbaI2TsXI=;
        b=SS7Dt1Y24wZxVTLT1Fp4XSquw8RCG24HibVq31hWx5yu0wCpJB5x4xm164tN28BY6w
         32OeSPuQDuXAAJWwNptkDNdorS93zBwsaRxVI5Xdgv/ycWhNaXtPY5emPHV12scSDky6
         9NlO2J5I18YU3i8K662rgM5jO+3D/Vsr10WejQ/Z1Dhcy7wKctVP0UtTgHunjZH00kOF
         bQ8QBp+a69aOAXaNV5lweUo+ZAZkHRJN8v3L1PBlD0Z3mouZx76kn1/YvvpnKEdhwXJx
         3rFXA281XFsshyahCvL/sHb1bNgnPioTV5jIP1tCiWRL5J/R/9hOPFuEtg71lyCq9eOX
         +k9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680664280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYqfTnvCFrjGPcHRZ1dRyGizy37l1a0MXfGbaI2TsXI=;
        b=ldC1/e2efRw9KU5Hy5mwsu4D+Rp9bXUZ9yaooxd2MnJ8oyYGiddGHBL1QWvIXwcLnd
         t90EHu9tDJayBXCddaq3Hfd+oK7KLdg+bDbktzkVMXkc2sBFS4O5rnsQiEXyNDErkzt+
         tgT94FqTyy0hbDj6ZvJ8V2AmpEGHOWJ3HLofEDsvYiMfWCQfvjr4p3sL1xkCS8Imb2lv
         Bjjtk1CV45NM1Z7jLTZr+ptsDLHfe8sTx3eqXNL668apbCDNFmLs3xeeseg+NDo4bJWS
         bRzzj1WaoVYQGctIrdm9+YIMRm8w6Uw55VaBBvM7QH1bgerZtzohl1vMyVPV0mVdx0gp
         2IEA==
X-Gm-Message-State: AAQBX9e1YVH/hJ4XCnET/dt0SZcgdbhcnllOxJfIplW/Jkd+JKk0ICxu
	ELNrO7lECoJnGclIxNTv8oGkHToFKgLhkw==
X-Google-Smtp-Source: AKy350bssyUutazvFTJW2oY3He7DqQV8whFSyXtDlnOblfc20ELG3VBJn0ZltxRaQxqt3j2hcwCStA==
X-Received: by 2002:a17:903:644:b0:1a2:9dd0:1f74 with SMTP id kh4-20020a170903064400b001a29dd01f74mr3672322plb.54.1680664280027;
        Tue, 04 Apr 2023 20:11:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id w11-20020a170902d70b00b00186a2274382sm8986295ply.76.2023.04.04.20.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 20:11:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] mpg123: Reset ac_cv_sys_file_offset_bits on musl
Date: Tue,  4 Apr 2023 20:11:17 -0700
Message-Id: <20230405031117.2576191-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405031117.2576191-1-raj.khem@gmail.com>
References: <20230405031117.2576191-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 03:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179721

This is required to nullify whats passed from cached site file
musl-common

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb b/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb
index 0a2d870cfa..58bd172329 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb
@@ -35,6 +35,8 @@ PACKAGECONFIG[sdl] = ",,libsdl2"
 AUDIOMODS += "${@bb.utils.filter('PACKAGECONFIG', 'alsa esd jack openal portaudio sdl', d)}"
 AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'pulse', '', d)}"
 
+CACHED_CONFIGUREVARS:libc-musl = "ac_cv_sys_file_offset_bits=no"
+
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-largefile \
-- 
2.40.0


