Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6073C00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 20:23:45 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web09.11810.1658867024446801978
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 13:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RvcV0UDM;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: ptsneves@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id o12so17702276ljc.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 13:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wz9kO5PJ2BAxm2X6higyzNjva9UcZJWmh9JCRFlUeLw=;
        b=RvcV0UDM+N5efyu7n8VUcMFuudybZXZ2cPPZ846Tw5OkdPKoO4ygZEubcphHriwW/r
         FjmHc2yv/iMfh0NY7EjsXgPkw1rvCIiPXarUMt7g7p+FSR4OeUmt/ThnKAlTjXic92vT
         SyFlNI8t7ryvqP91pYOSW9z9ydk3Hm8/FIkeLQ1Qk3VK5DCmrS3UqPx0TA4YIEHJdFAz
         UPTqyIiMqNnO68E5lUYMIsW0Kt0Hp4VTkxWevIZ+0ApsWNN2xoFzD01wTJs+A1/56TOw
         HlDWxkUeOBnrCeQ3iwtE7WWf8gelQ/Lii3bPzQs5taXw81wOC251oJF6SCVDzV+YtaVm
         h5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wz9kO5PJ2BAxm2X6higyzNjva9UcZJWmh9JCRFlUeLw=;
        b=oW8SRWLygB4Ys5VCk0RV/+FPB0q5Flq/ELULAaXHKYwxSuaGDY2lHkGJFR3YrxGRGt
         tiljsbT9Bt5gY8uFVIchUGCt+bOnA2ysDpwxL9TEUoXrcqS2Mq6LlFNf/bbHJie5/zfI
         vDEgR/aCSqJOQetZrHCH8OV3BC9INQJNc1gepGkLk33QQsy5GP7rsMD4EYdvcK9rB416
         oHt+pqyAO9FR1VK/4ScxroIqRsSXUG+ZlfLmMOFFCuu1TNHsVm9KxmHHRCUwAlAlGsEh
         6h8+JncGdrmkxWY1ehcp6AGYrar5Qqd+fzIWaFb06dxpSGTkiReYLvC+XVvrO6e+S9JS
         QzCw==
X-Gm-Message-State: AJIora/L4kFQawQrgNpk4crm+Gj58ArqjUgX7dhVfgbPvKhYuksJj1XP
	1RkdS1tQUPl2M4hgn1hIk86av31hEMqD
X-Google-Smtp-Source: 
 AGRyM1tewTgrD/LeX+kPiM8qNz+1t0n40W85mIKQxsOq9+jjZd/4Joxjg3f3yqmSdVAiTb6lDyaiWg==
X-Received: by 2002:a05:651c:623:b0:25d:e708:42df with SMTP id
 k35-20020a05651c062300b0025de70842dfmr6378155lje.220.1658867021939;
        Tue, 26 Jul 2022 13:23:41 -0700 (PDT)
Received: from localhost.localdomain
 (031011128142.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.142])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a056512370500b004786eb19049sm1086048lfr.24.2022.07.26.13.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 13:23:41 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH 1/1] lame: Remove hardcoded rpaths
Date: Tue, 26 Jul 2022 22:23:37 +0200
Message-Id: <20220726202337.2141895-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 20:23:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168514

Due to hardcoded rpaths tmpdir contamination happened on lame
executable. This commit hot patches libtool to not hardcode
the .libs directory in the rpath. This solves [YOCTO #14863]

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/recipes-multimedia/lame/lame_3.100.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/lame/lame_3.100.bb b/meta/recipes-multimedia/lame/lame_3.100.bb
index 5b42795f4e..2d9bd9d29f 100644
--- a/meta/recipes-multimedia/lame/lame_3.100.bb
+++ b/meta/recipes-multimedia/lame/lame_3.100.bb
@@ -24,3 +24,7 @@ FILES:${PN} = "${bindir}/lame"
 FILES:libmp3lame = "${libdir}/libmp3lame.so.*"
 FILES:libmp3lame-dev = "${includedir} ${libdir}/*"
 FILES:${PN}-dev = ""
+do_compile:prepend() {
+    # Stop libtool adding RPATHs
+    sed -i -e 's|hardcode_libdir_flag_spec=".*"|hardcode_libdir_flag_spec=""|' ${B}/libtool
+}
-- 
2.25.1


