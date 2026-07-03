Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFE8C44503
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:30:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88739.1783067400363341269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eeS7Quzq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so2314805e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067399; x=1783672199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y40QTPT9KowACEIBQqXtftR5+n28Z2n8C9vwhEFMQVU=;
        b=eeS7QuzqrumspUBYGlrB81kpIGPrMTc/32WWIgfiTsrlIPpJHQpAz9eKDSBsv5S5VK
         +8siul+du9A9pgTdViqRnuJpG2dj+VBtATPJbt/x1WCgvf8y/uUdcWCjk0KTm/93W26k
         kZ6iGDWDsS4VVpy6VyAoO/vDg0O4iPir2MJuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067399; x=1783672199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y40QTPT9KowACEIBQqXtftR5+n28Z2n8C9vwhEFMQVU=;
        b=PNTBmFZ1TvF6BDmAYkfk9tgTjc7fFkbpHKvDLEy4BPCayQrdAmnyvsOqZ3GaPyyWes
         e6BnubrJKgH3r7Dm76fDfz7+/tb/2kfq8wDROd3BOSkc6RlU/oZRbR3HM5J1bg42HxbZ
         cNUa02OSnStSiIAaTLrjlN+NZDTpFPjELwJS6UDKOiJZEFjDypMQN1V+9Mr69aRdSnfD
         UaFP4qNt9eNd4MUivIXMSDNZVFrbUvTEPIWJZFRQYaz73yxsQIUY+W5KSOLtrlzL8s4J
         t6jIJw/bM/GeWQ3tLpGeACYJtlnqRns2vos1svp88h9+AKAQAVrzksuzIBgS+Q8lVMZ6
         tkjQ==
X-Gm-Message-State: AOJu0YyQMOcvufPCqW1EK/gZIjWg8yX6S/E3rawokPihDjUTHV9vX8We
	nKIRiM2wEY8VtKFCY1CW8y6y6UK1TLFKU26GXXb42tOJCWqFmQXcrMSKHaTzB+iNSElZJevQUrt
	gZoLOW5Y=
X-Gm-Gg: AfdE7cmex/S7wxzZchU0X4Zbj33g/c4Xpu7O/tHdlaZ8X7HbMgbfH36EjzUXI2d5e3e
	+Io2rOUZP/WrymPpbS5bfa9xRBvjQt5ig6kF74WR6u74KBDHJXXs+b/QHx5pu2u9KuEeFOeXuul
	qPW7h7u1AXYI72/PhhpwcR8oj1isviWgiWiHtHgOpXP1SVmTiG6YC9dhzK5lvnVR4dZwnytsJ9m
	St7EC7MemrmiaYG8kvljo7QlTJ+xv0bke2ZjtzbToAldSIGf4ZCxqN9x9H3AyD6KCiOph4xQLgQ
	qCw1oK6vLD99xNMN+myh6WQsmxs23TyFTSlW47n3UpXSn4vcIrRIPzWsPlFf6NIQpqu00o12JP+
	zt3wvZsuL9rkPmYnzbbW+yD8DsfOZGm2sQIJYNAhEjQgatBAEwYfzX/fd2B7CBDQ6WVlkqGrLaI
	oCc+3H3Bro1MDTjE+wNDUoOmkWUf9/J+g7M7k+XQ2I/g==
X-Received: by 2002:a05:600c:a4b:b0:493:bef8:ba8 with SMTP id 5b1f17b1804b1-493c3dfc635mr114168205e9.39.1783067398522;
        Fri, 03 Jul 2026 01:29:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15684554f8f.2.2026.07.03.01.29.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:29:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/15] libadwaita: upgrade 1.9.1 -> 1.9.2
Date: Fri,  3 Jul 2026 09:29:42 +0100
Message-ID: <20260703082955.1585712-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240084

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libadwaita/{libadwaita_1.9.1.bb => libadwaita_1.9.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.9.1.bb => libadwaita_1.9.2.bb} (89%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.9.2.bb
similarity index 89%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.9.2.bb
index cf4fe6b45fc..9a40c2e4153 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.9.2.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "2ae34dbb3ea56d270925707cefa36050482ec88a741f1810b7619a5377c41a66"
+SRC_URI[archive.sha256sum] = "6920f813a76c4856591ca56ee842e94efbbe736e8ca2f445c9e9fc3b4e7076f0"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"

