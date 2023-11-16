Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2517C5AE5C
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 22:48:51 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.20273.1700174927072803949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 14:48:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CApLuRQH;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9e62f903e88so180102566b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 14:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700174925; x=1700779725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vWvhN2Du7IvDsMEo1Y1tzdHo8ipS232PsUuRthEhIc=;
        b=CApLuRQHHZ+cW1kWlylKQY3KMq2vm64RWmgvhquI3cQv6jJ/nK5MVZpSIzW91b16qZ
         2eUn6uP6iUnzVobSJlhcsixyMX+cbDwtV7EkRLPx48zkOjvwY3S5j9BaD2dYatJwL6qd
         B4afCqHzw7eCaSpRAbZELNG0PDl+a+Qor8X52iQqtnxaHpBGiC8YNaq883xN+mUt2I/s
         xuGwpEvtPSkhvn5IP4+tO9qpb9XASQVdV9Xl3De72HX4sSOw/Nn9yQCyfAKyYn28Y+iw
         f4cfRxdOcJyeBVzxQWNdtAAhPq/ShjcKbezio6PhK7Kjd1a5yPKl97Pws6sPRp1ynQGS
         Z4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174925; x=1700779725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vWvhN2Du7IvDsMEo1Y1tzdHo8ipS232PsUuRthEhIc=;
        b=jKj0rZW5VN4APQY83RJa8y6xLs26zpQIE+tEnXX313r6YeLmwfzt151+O5byo6EtFB
         3CnyxGQrMTSS1WXcAq6i5j73MyoF10HyIDmo36BJUkpnPggooGt5O44r8bxEzhPuYdZ2
         l9nmqpz/9DrZhkL8Ln/Nk7nykHKjsz2bM/hBpJaD6HH8aDd9xRGSpfM+PZL8tV2/I9P9
         moE9UTjGrVjkQZXSIDhzMbO2oJstEelBqpsN1qq6Qm4+ewzXNs3glp3VYEtUMwYltyoH
         S+YMz0Fg14KX2W8c0aNLgaK4Y3GXx5JzIv3l4PVY5DNzPjh7eNGg7uKFzYZNFZNJUCTa
         HUZw==
X-Gm-Message-State: AOJu0YxaDEIRuRWk3xiEWVjhICOZByfDu4ZxGJX7rmJdRJUhoCusqcCL
	XpyyEOLCBnRB1Doi9owC3c/OlKii5TA=
X-Google-Smtp-Source: AGHT+IEB+czFPmlLN69wFMBbAiBu2+ZsmmeInHUpVqAl5/mrxQHu9x6w1trZbABfPK4UV66Xt19soA==
X-Received: by 2002:a17:906:40c5:b0:9e2:d087:86de with SMTP id a5-20020a17090640c500b009e2d08786demr11847783ejk.42.1700174925570;
        Thu, 16 Nov 2023 14:48:45 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t18-20020a170906a11200b009e50ea0a05asm121038ejy.99.2023.11.16.14.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:48:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2 06/12] ffmpeg: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 23:48:30 +0100
Message-ID: <20231116224836.2696913-6-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116224836.2696913-1-martin.jansa@gmail.com>
References: <20231116224836.2696913-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 22:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190820

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
index e65f80d64b..1c9edaf176 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
@@ -151,7 +151,7 @@ do_configure() {
     export TMPDIR="${B}/tmp"
     mkdir -p ${B}/tmp
     ${S}/configure ${EXTRA_OECONF}
-    sed -i -e "s,^X86ASMFLAGS=.*,& --debug-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} --debug-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR},g" ${B}/ffbuild/config.mak
+    sed -i -e "s,^X86ASMFLAGS=.*,& --debug-prefix-map=${S}=${TARGET_DBGSRC_DIR} --debug-prefix-map=${B}=${TARGET_DBGSRC_DIR},g" ${B}/ffbuild/config.mak
 }
 
 # patch out build host paths for reproducibility
-- 
2.42.1


