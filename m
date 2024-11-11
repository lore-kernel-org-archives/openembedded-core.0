Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3391DD3ABD6
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 17:34:51 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.65307.1731346487101503749
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 09:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KiLG0TFc;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d3ecad390so3363933f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 09:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731346485; x=1731951285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+gDWxhoFDR1iC5YqaKZ9a2RUWFvszeTxmhq/G559dU=;
        b=KiLG0TFcIYeFLAar47h61PU1fxNrkmGsXLeqST3NG28OhRziJi5JM8htimD0a9IfC3
         2L3P880g7O+fKDnN8VU/x9zvHl/J8+juMizv9uggnegPRLX+g3CYjBlMfAnVFjtmHsTU
         /Xq4TTIaLBj50/TRBA4P4tU7igaqq8ukqxHSv7LWWJ90mIP4RsQfE7tJ21Howa5o6Fhi
         4G6EKnCNJfShjy7ymaQ/gbDJf7dOyBb/tfGOdc/WmmaS5/KNUJAHCRn2Embyyvvox8r6
         Tnw59a+DpQXa9soGOpattpCVieFt/M+hlT+cynmH30ttWINn/RuhuX1DJjOX49a2dnVq
         5yFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731346485; x=1731951285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+gDWxhoFDR1iC5YqaKZ9a2RUWFvszeTxmhq/G559dU=;
        b=QOBPmW1IU97huf8coF8BOo3JiP2BP5w6eqHN8TfS/Z4cay0JprdIO1BJidPhOuvOQZ
         aLoEXpvTUoesZqsUTDFYF9ZK0AbZjwoQtRji4KfHiaNBH/gL1Sj4kOPNEApFF5FRuHGW
         36TIzp1f6TQYIzZZNyDK3JpP23i0KflZTVikvHnKlvNhGjN6G7QuM9pji3lSmWkx6s+x
         yq+7jPCU6KBsAVfJBCkEDUTS6vp7tyBrpfw2zsZwCwwwyA1QJElBMAJNI0HfMZADOkTw
         qV9SJk5W40OJfis0F79/NRwbG+4sSvODctVWDHSR4tWwnpp6DzIHyHhNHfPLohzCW6NK
         RZdg==
X-Gm-Message-State: AOJu0YyxDJAVfO97DtlWh1mxreIyMJZn0Z5yTZmuSE33SdpYEA5b8QF9
	hRHHhPvuXv9LuZcLtMNcqVYALa2iorHphGqnAmTeyqSekPXvlo6HKT6r1Q==
X-Google-Smtp-Source: AGHT+IHyg53aj1erpMpZeyjBf8wvZDsBgGejLVs1kRIr6O1+g2AZ2SngLpijzHCVsm8uOhz6/za+rw==
X-Received: by 2002:a5d:588a:0:b0:367:8e57:8 with SMTP id ffacd0b85a97d-381f0f7f1abmr12331402f8f.19.1731346484839;
        Mon, 11 Nov 2024 09:34:44 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b04753d5sm190057575e9.0.2024.11.11.09.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 09:34:43 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH 1/2] bluez5: add PACKAGECONFIG for library
Date: Mon, 11 Nov 2024 17:34:20 +0000
Message-ID: <20241111173421.44377-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241111173421.44377-1-gudni.m.g@gmail.com>
References: <20241111173421.44377-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 17:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206964

Also add support for a native version of bluez5 package, which has only the library PACKAGECONFIG
explicitly enabled. The main goal with this is to allow other packages, like Python 3, to
include the library files at compile-time. Using the native package is preferred to avoid
dependency loops.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d31f4e2295..f0551a052e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -15,6 +15,7 @@ RCONFLICTS:${PN} = "bluez4"
 
 PACKAGECONFIG ??= "obex-profiles \
     readline \
+    library \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
     a2dp-profiles \
     avrcp-profiles \
@@ -33,6 +34,9 @@ PACKAGECONFIG ??= "obex-profiles \
     deprecated \
     udev \
 "
+
+PACKAGECONFIG:class-native = "library"
+
 PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
 PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
 PACKAGECONFIG[testing] = "--enable-testing,--disable-testing"
@@ -40,6 +44,7 @@ PACKAGECONFIG[midi] = "--enable-midi,--disable-midi,alsa-lib"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd"
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,,cups"
 PACKAGECONFIG[nfc] = "--enable-nfc,--disable-nfc"
+PACKAGECONFIG[library] = "--enable-library,--disable-library"
 PACKAGECONFIG[sap-profiles] = "--enable-sap,--disable-sap"
 PACKAGECONFIG[a2dp-profiles] = "--enable-a2dp,--disable-a2dp"
 PACKAGECONFIG[avrcp-profiles] = "--enable-avrcp,--disable-avrcp"
@@ -80,7 +85,6 @@ inherit autotools pkgconfig systemd update-rc.d ptest gobject-introspection-data
 EXTRA_OECONF = "\
   --enable-test \
   --enable-datafiles \
-  --enable-library \
   --enable-pie  \
   --without-zsh-completion-dir \
 "
@@ -166,3 +170,5 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-utf-16"
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


