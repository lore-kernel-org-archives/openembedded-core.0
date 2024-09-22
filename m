Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D90BCF9C69
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 08:42:04 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.11624.1726994520358224288
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 01:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Za10qO50;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53659867cbdso4730711e87.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 01:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726994518; x=1727599318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ/knW2N7PVRDDB5R+brL7z9Erq/BRnXkTj06+QJIXc=;
        b=Za10qO504ywWru3gsAnOSj6MfXHwFwDHOTY96I3pD8IfDRKPRqRc3SP9ixIuIZcUzk
         jTOF39OjNsG8EY41gzg2i/Oo49blmQypUKK/MW3Ru+D7+T07QEZqcDJvkvkOX0A3vogV
         JJVKjsFw1FLQCNAisKJvgxKFAPOw/chi0sygzgZKUwG2GwikIw/JnGWggtMltE2dyd9Z
         HRmnE/p0ghqoxhu7F7Tqz+lul4rCqSjLVH1xa63P+lrJ/KtlVH+osdQebalzFra4PIx4
         CBTlsBvuJeNDwHNGjMjS99hRfe6ncmxhHS8SljFafzA5Cp6e0ZZnrKcu0HJLRYScac6j
         MnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726994518; x=1727599318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJ/knW2N7PVRDDB5R+brL7z9Erq/BRnXkTj06+QJIXc=;
        b=BBDva/zO4n8lZxaQ9iGaAFX7W80qSntjllZSnJ42Av+VpUm9/hiM1f7rtpRqhEV+6E
         ATbznGHkAcauHdMmMV1AVk5seEuBvDsNSzznurXDL9oI8c3RfhOSYrKhyhuSwAefvPiA
         mYwGRVzFSSiCjJAgzLbfGrORaunLQsJH/dF5+HyACIOR4U5DUuOJJdMudVgxYP9HBsPG
         LxFXtIF+PE2IZaydo5UnDidrGEB+34GY0TurZZnao8kyEoLyIp1e51PviOqmO7D8M49w
         0f6iGKhzSAowFqEa4xpQZGEcI3cIJFgNYbeDTGzp194TagogqYJyro1qBhuTmYoInbUg
         LTlA==
X-Gm-Message-State: AOJu0YzDuTHTpp3L5Kbw5OcZrTiVXVTlenE6eFdCdi6iz4g3K9lmF5oP
	hVMKI0dcvauT7DGRzheBhlVuAUXeFAEcZeCUAB/irX6TwCfmwl99hmE0tLPxpSxe/WmP9n7ITp5
	IqU8=
X-Google-Smtp-Source: AGHT+IHnrHCKen2WYWx6XNaOzCg814dglkDxH4lpwlc2xuR4/TBNLlByN16CnJK7gQ1hS+CYiHhbIw==
X-Received: by 2002:a05:6512:130e:b0:535:3d15:e70e with SMTP id 2adb3069b0e04-536ac32e4e4mr5402884e87.37.1726994518288;
        Sun, 22 Sep 2024 01:41:58 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8745sm2877339e87.236.2024.09.22.01.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 01:41:56 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 03/12] systemd-boot-native: add runtime dependency to python3-pefile-native
Date: Sun, 22 Sep 2024 11:41:19 +0300
Message-ID: <20240922084128.9648-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240922084128.9648-1-mikko.rapeli@linaro.org>
References: <20240922084128.9648-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204775

It's needed to run the ukify script.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd-boot-native_256.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_256.5.bb b/meta/recipes-core/systemd/systemd-boot-native_256.5.bb
index 73db59b14e..58db408dcf 100644
--- a/meta/recipes-core/systemd/systemd-boot-native_256.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot-native_256.5.bb
@@ -13,3 +13,5 @@ addtask install after do_unpack
 PACKAGES = "${PN}"
 
 FILES:${PN} = "${bindir}/ukify"
+
+RDEPENDS:${PN} += "python3-pefile-native"
-- 
2.34.1


