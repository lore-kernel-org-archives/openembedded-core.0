Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1FEC433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 00:59:27 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.8785.1636678766760996652
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 16:59:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cZZ4PJxg;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id n8so7139428plf.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 16:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QrETAxAMV4yNzEChNzI53O2W5fTVbtUNHiUCRQCapNE=;
        b=cZZ4PJxgrw425iG44lVFzqcjozrFFpFU8m01LfTMEG9GpO3tRoJdyNbKk+/4PVd6QI
         jxyXKlkpjAmJQDizJxu5u06O8Bbiw5pCDw+Swr8j89CbH1BsMlo9EE/fL5NR4MBPWh+h
         HOSqDcUWb8TIk4YEKgLPtdoSis+xg2qRIUe67TUe+C0XDftrPfmaIHjY2UlFlUVGWHpL
         eJ/zQTa+DVj44l7wONZmkGqEHpQuVWH6MD+o/dKua6jXDqtFdS+pby1EbdJZ0A1CAilj
         G674HQ46M56TrLG2DHRHEsJc4GDEXD+/FTr/yKqlPx/RYwPyB84rIw8ciHjJXR9lzQh/
         9XWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QrETAxAMV4yNzEChNzI53O2W5fTVbtUNHiUCRQCapNE=;
        b=kqx4MuWX1DKSdAZhedTysRncfXYqhiuWkIso+aV/VWPW9lFnZb4R5NgjYo8eIeHHcE
         rcGrkj19Fa7MDmWPcYkuMQgGtymv12rvWC5AxUn1UZzHK/6MQ6VyyIpdEGXvLdA43+vu
         Yz/Cwv3DTrHsYNzuer9YTFCTZQ2nm199VcnwhckLHDh/2H8d/g10XuHsw7i0x3ShQCZK
         i3PNIJ/M8S7VSaWCpY999LYGNZkqzj5BnKBZbtjOlvJAf+rfDcAGaWiIglx8kiXH26zb
         Jsahi1xrLSkfqRIBY0GVR8bMVGTRZploQMQUNurYrpblx3tJ8kXzuUoaAritG2CItV92
         jFFw==
X-Gm-Message-State: AOAM532hLnUX+CRrSQ1i2uNgqnYF913idnK/IEp8Q4Cq8yOQClEbVGDC
	oZeIEoYxK9cFmxhEhOHNUcUjceJ3hQQ=
X-Google-Smtp-Source: 
 ABdhPJzGX7SLPbsnZymfSV+R3ZZ9RjF5guzAK2BDegezyyVaQhCCuix31jxXwxUDdiyJ6v/MqxcuXw==
X-Received: by 2002:a17:90b:3a85:: with SMTP id
 om5mr31927306pjb.28.1636678765991;
        Thu, 11 Nov 2021 16:59:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 m7sm3199267pgn.32.2021.11.11.16.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 16:59:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] gobject-introspection: Add -Dintrospection only when
 GIR_MESON_OPTION is not empty
Date: Thu, 11 Nov 2021 16:59:23 -0800
Message-Id: <20211112005923.1237474-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 00:59:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158203

meson now does not allow unknown options which means we have to be
mindful of adding -Dintrospection unconditionally and provide an option
to recipes to set GIR_MESON_OPTION = "" and when recipe does that then
do not add -D<Dintrospection> option to meson. This will help recipes to
use meson 60.x+ just by adding

GIR_MESON_OPTION = ""

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/gobject-introspection.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index 822a226d5f1..4db1b362d93 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -14,16 +14,18 @@ GIR_MESON_OPTION ?= 'introspection'
 GIR_MESON_ENABLE_FLAG ?= 'true'
 GIR_MESON_DISABLE_FLAG ?= 'false'
 
+# Define g-i options such that they can be disabled completely when GIR_MESON_OPTION is empty
+GIRMESONTARGET = "-D${GIR_MESON_OPTION}=${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GIR_MESON_ENABLE_FLAG}', '${GIR_MESON_DISABLE_FLAG}', d)} "
+GIRMESONBUILD = "-D${GIR_MESON_OPTION}=${GIR_MESON_DISABLE_FLAG} "
 # Auto enable/disable based on GI_DATA_ENABLED
 EXTRA_OECONF:prepend:class-target = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection', '--disable-introspection', d)} "
-EXTRA_OEMESON:prepend:class-target = "-D${GIR_MESON_OPTION}=${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GIR_MESON_ENABLE_FLAG}', '${GIR_MESON_DISABLE_FLAG}', d)} "
-
+EXTRA_OEMESON:prepend:class-target = "${@['', '${GIRMESONTARGET}'][d.getVar('GIR_MESON_OPTION') != '']}"
 # When building native recipes, disable introspection, as it is not necessary,
 # pulls in additional dependencies, and makes build times longer
 EXTRA_OECONF:prepend:class-native = "--disable-introspection "
 EXTRA_OECONF:prepend:class-nativesdk = "--disable-introspection "
-EXTRA_OEMESON:prepend:class-native = "-D${GIR_MESON_OPTION}=${GIR_MESON_DISABLE_FLAG} "
-EXTRA_OEMESON:prepend:class-nativesdk = "-D${GIR_MESON_OPTION}=${GIR_MESON_DISABLE_FLAG} "
+EXTRA_OEMESON:prepend:class-native = "${@['', '${GIRMESONBUILD}'][d.getVar('GIR_MESON_OPTION') != '']}"
+EXTRA_OEMESON:prepend:class-nativesdk = "${@['', '${GIRMESONBUILD}'][d.getVar('GIR_MESON_OPTION') != '']}"
 
 # Generating introspection data depends on a combination of native and target
 # introspection tools, and qemu to run the target tools.
-- 
2.33.1


