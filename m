Return-Path: <anakin@childerhose.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740E8C87FD3
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 21:01:12 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.5972.1754168468271162473
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 14:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@childerhose-ca.20230601.gappssmtp.com header.s=20230601 header.b=2Ho8Il0C;
 spf=none, err=permanent DNS error (domain: childerhose.ca, ip: 209.85.222.176, mailfrom: anakin@childerhose.ca)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e182e4171bso212222685a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 14:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=childerhose-ca.20230601.gappssmtp.com; s=20230601; t=1754168467; x=1754773267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiBVCm3kHuI0cgqd/pUxZ4FQ9wbP5vfgW9pyekiWoog=;
        b=2Ho8Il0C4/889EToLgtbxcckQFjddk4C/G0MXuZ2UfTd72N2rrgMVpCJ7eJadgcCbF
         gCkV/fccX5aOMNXF7YFujp3jVV06sq1PhhQknW0cBdUZllna5fowKWRhZvRAMpEFM9OR
         h5vTW6hnuoM+svMkvNsmdhuUZWFsIzNBQaolUmaTnDVeWsARnz/1zRr9fceBIfDgCwp3
         DANSrYT4EFUlijJmbuPY9S943nzDTcr3wFMUNvXPUJj/0l6EkTfvkx665uC1Br9G+t+c
         svS+KU4JTm5VY7g0jqT5Kbs6FEr8Ji4sxI5OkctwGRotxGif1V6pchWkydg88pZYrP4l
         4EHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754168467; x=1754773267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiBVCm3kHuI0cgqd/pUxZ4FQ9wbP5vfgW9pyekiWoog=;
        b=FgdNdOzdQ2joHCAJjv4YbDnPzMRUa7B4BszPXsCOHklAu5k+7Wh/zTgsv5aRSM4s3c
         Pf0/HJunJOibb5iG8jlAeJBcl+tuutHMT00ct9CrjHZQ0q7pvH/s3yVghj5jzWE4V4YQ
         VlhZHALObzB6hNXJN1SBQmqzcP3XJWSNBzTKukgfXnqI5OcHu2nCe1V14wCqcysfqQV8
         dggpYpIJxh9KaLPw2DAy28M7i8oRhZs5+jsSbTp06gEG1ZKJFr0a+S/zmKkN1cW84c2B
         vT5NX91qNqmSGpjvs6jd7U3VNvmWGRvTV7yRkeRdbmOgyoFDslQUcIfvEenXW8QYNU5d
         IVtg==
X-Gm-Message-State: AOJu0YydrGq8a6n/aGZdmHSOAXYOAXiEk/q1KqQhKLEpYxOlzABp0b/J
	N8ddnxOivPkKQut5s1QrfsXP9ilvuGLEiOWPCXeb44Omo2PlB+2A47DoZ13WAmOLFbEUAnwtwG/
	BIALtRc/1tQ==
X-Gm-Gg: ASbGncsDgP8tjCSl+9hfmlyo7ytOw6nKf8R/Bv20ZWEDmKoye4Fr93KrAFND/9W4kkZ
	eS6geVblDde3N+7jXnevKXpOdPTsjkStdMRITbSLNNODotkQ7CotQZy/kJnYjMY0yEoyjgIg3G8
	e6Wg6drY3dpPQNWlmRvZBwghcUxgr4zx2Ze64UEFQ18CPssKmZc8iDzSSQGPujy0SoK+cNzBKDM
	fYWM2A08psXWrRUbmIdbbqd5YNv4vhsgP+L+4FWtbvgIKcJrcXnSLZ/UP9r60B6tsIgtbVm55Fo
	/ynLov0cDoNHO27dyPDZEKXXHPOlqEdC3o2+cHGcvk2IQXUtt6G7cHNkY2y88BaLUsjx/ihVAHy
	1ERodyk1TtrJpwe55
X-Google-Smtp-Source: AGHT+IFRcFZSRu8Nudp0hZQR5LfH/H3ykLns0OUU0u76kYTCJhB32mxkjvtrTCrv9nL6mhKBye1keQ==
X-Received: by 2002:a05:6214:27cc:b0:707:656e:db1e with SMTP id 6a1803df08f44-70936319889mr59320016d6.44.1754168466881;
        Sat, 02 Aug 2025 14:01:06 -0700 (PDT)
Received: from vader ([198.16.184.245])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5a01sm39134646d6.70.2025.08.02.14.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 14:01:06 -0700 (PDT)
From: Anakin Childerhose <anakin@childerhose.ca>
To: openembedded-core@lists.openembedded.org
Cc: Anakin Childerhose <anakin@childerhose.ca>
Subject: [PATCH 2/2] meson.bbclass: inherit compile_commands.bbclass
Date: Sat,  2 Aug 2025 17:01:07 -0400
Message-ID: <20250802210107.19804-3-anakin@childerhose.ca>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250802210107.19804-1-anakin@childerhose.ca>
References: <20250802210107.19804-1-anakin@childerhose.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 21:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221387

meson.bbclass generates a compile_commands.json file by default in ${B}.
To automatically configure the clangd language server, link the
compile_commands.json file to ${S} via compile_commands.bbclass.

Signed-off-by: Anakin Childerhose <anakin@childerhose.ca>
---
 meta/classes-recipe/meson.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index c8b3e1ec29..4f5d7b9e5e 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit python3native meson-routines qemu
+inherit python3native meson-routines qemu compile_commands
 
 DEPENDS:append = " meson-native ninja-native"
 
-- 
2.50.1


