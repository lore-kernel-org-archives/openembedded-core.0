Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.2817.1593155944582225596
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D14QWf9r;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id y10so8388113eje.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WnNMoH+6Vvw3bWUc3ll/RywhtmJiR7VoHZYDFRUd37g=;
        b=D14QWf9rNAHmZ4csHj373anjhaYvZg+i2i3YdDSpeG7cueKPsmYaEbEx/79wiLMIra
         rHOAhWwXaNlthR7NLkvEZur0Jay/W67eULfMbHEzSTqTxbtOGKRJD70nhnlEUiOr9ftr
         mv/Psa/StLDTYpqEWb1njUZZbe2if3UyaysL76XzvzPNRAkHh6ciWi496VyfwsYmhJ3V
         9HaVwsteflUK1c54owwSWsr9iBzChs/LxvNMDgzRYMQhtk1K0968EafwUjnFucPUh749
         6iUyinhUy6/QTwmvEd9AarKuljk/XJ1Jni5XHPNU5biGazsi57btV9cMkFvZmzI5nyjE
         T0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WnNMoH+6Vvw3bWUc3ll/RywhtmJiR7VoHZYDFRUd37g=;
        b=Txz8dYl/yY9yU6uj+qxAnrF5Px/EVPBfPNiOEO7mhTrP73whfAauXaVD+dfMvyI/a5
         FsyZrGTQn1RChFpKvx0MgJ7EC4T2ynia6P8B+nxxYRILQ/iMPkAGCktdtFwW3XXIeFpj
         7dxGAytRKrZ6+qk+uw4KcV/LuxOK5efTaJAb49wWeUnp2suPYlYX6MukhQPOJhJg8f5H
         8U8dnPW5MLiYOqWxjoLsjoV9mdluexaTx/5qiXYZgbRYTKdDpBcqSvxhXKnyU2cnkORS
         fi943OX/4tXfWso3/F5asz1H1FnaCV8TiJ8LICXOgIjzPpWZp6Fi8LSXt5Nv+qhm6eLg
         SWeA==
X-Gm-Message-State: AOAM533gNl5a8m8pwPCs3dVryYQuXHXkmJdyBPBQ9z3DrSNTUXAJtFnk
	UwoOIWYolVzeo/HWiJNUvIET0Kfct2Q=
X-Google-Smtp-Source: ABdhPJxSgrJKvUSZGFrXGRhx2GPU4g+XzfKpFqIdbyjKQlyLBSFyabZFqVO8kH1Hkux4AX4fIDcVzQ==
X-Received: by 2002:a17:906:c142:: with SMTP id dp2mr1431536ejc.541.1593155942907;
        Fri, 26 Jun 2020 00:19:02 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:02 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/30] ffmpeg: disable altivec on ppc by default
Date: Fri, 26 Jun 2020 09:18:18 +0200
Message-Id: <20200626071844.29134-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since 4.3 ffmpeg uses vsx-specific instructions, which aren't
available on older ppc machines (including qemuppc):
https://github.com/FFmpeg/FFmpeg/commit/3a557c5d88b7b15b5954ba2743febb055549b536

This disables using the instructions with an option to re-enable them
for vsx-capable targets.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.bb
index 2b0c38d782..b4cf278cb2 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.bb
@@ -57,6 +57,7 @@ PACKAGECONFIG[avresample] = "--enable-avresample,--disable-avresample"
 
 # features to support
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
+PACKAGECONFIG[altivec] = "--enable-altivec,--disable-altivec,"
 PACKAGECONFIG[bzlib] = "--enable-bzlib,--disable-bzlib,bzip2"
 PACKAGECONFIG[fdk-aac] = "--enable-libfdk-aac --enable-nonfree,--disable-libfdk-aac,fdk-aac"
 PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
-- 
2.27.0

