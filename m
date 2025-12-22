Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AC9E6ADC5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:36 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87815.1766434112652708717
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Obivp1gz;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7a02592efaso624257866b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434111; x=1767038911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWfetQKsJPnq2Q7IDzCasKjrTFOUVQhncwoauXXcpYU=;
        b=Obivp1gz8ntQMk5x/Gc07EjkEVM9TiXgdcgQQtZjdy7g0X7MGKY7+iweg4/9fVOsyC
         Yx6djvJutdQBS+PfXqdJY4knBwxgc0+Q4ZNqyjPLRWVLfTQoPzEVYKJJr/hlFFvpXNFU
         Q5Avpqn0D74xn+cx7r1jzLD2vKSLHjg8hB2psNuG8TwXgYymfcLdGYojndrKX0nXpBih
         FvIFLyAXHSvrkhRFb5yEJxxQhSV/eTeM5OSz1r9Ie23XK2sryHSa6GUxDr3weV59djn3
         0aqAjBOmKj9vNYakgvhijL9JOxFl2IUcNYZ3g6NWS7+bZByATg+9vOcqM3hAV1tTiSee
         G1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434111; x=1767038911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BWfetQKsJPnq2Q7IDzCasKjrTFOUVQhncwoauXXcpYU=;
        b=FTgluiioDQEdyvkz18ofVSzNWhbyMWHFPSJ8IV7xdLsQgA5SDS47NOdv2jzbqPYS11
         UC5be1ApKRHj2B/xjkA0giP9LTlhEJwfY+J0A901mGe8n3EDYd2Nd3G1v2UcEfgY/KtP
         QrIY7Mj1HDaF5nEQzciWWohEoAKd3Ez5Bzg7+mJiQnS4SvCrmePDmwQ/s5gdXE39Sjsj
         nlUGigMgQhOtRPu5gZ1aa0NFWQCmFFe92a6d3ScMee/+FhpTnm4jh7iH/fon3zGDvuzf
         7k4gFQq6JXoW4offUipxDDxozhl77CynYVArwaOttBwfIqYC3D0yB+sT19qlU+MsMOhg
         RE7Q==
X-Gm-Message-State: AOJu0YxwNKQt9qxlAPmK2Xp4yMDpiTwgbmLtBq17BbIxj4c6rCz00YFy
	k4108YbEH/nqjc9CeosCRV/ug9E4JsMj7KljwdMq1Cezy/D4OiWoK21a/EJD4g==
X-Gm-Gg: AY/fxX77DmvbIUN4yQSxkm26/eUZ0xrD1QlsRNGksIBvKFPIPwXDzIMfyQzgDJ8X5OX
	RWgH/2HIDcFG1q7mondBbXZg1EydJW4ul92ZOhP94SkWzlQcjeLpogteStRsM7nhDtgMC/PI50+
	efeRcZMMFc/wIkYMXgbqeV+gsFxH51SI3qcLCm3qQenD5Rk5cvJcgKEBZpiJ4fQh01/of6Q8rrI
	XzQbkrb87Z56fqa4mNh0z80SN9dYCHH1LpZ/DDOFCCprso75PlXaKQPdsfhndH4vl+PmoV0tOOG
	tSoIGjpNQYeCzck3mc4TRBBWB8/7UeeF0biofHVNqQpDPX1vjQUTkkeFjdFyfMn0A3Kz8J7trXf
	y6UPAtowozyIC/82vsie2z6q38BHez8sjaxGY+OfKxEZhVJXn+MqBaycLFmrpOCzk2hGpZcGoel
	wGLAYJPsiJWWQ+FmK2beeh7ZydZlyf8OiCziJQxY7T40AOvHE=
X-Google-Smtp-Source: AGHT+IE4WiCny13onMHI+I/gcbVQgVmgrk2CNFi20STJt08JdE2YBKzT51NNUtZ2f4T2aE7pVEvEZA==
X-Received: by 2002:a17:907:608d:b0:b7a:2d:71af with SMTP id a640c23a62f3a-b803715339dmr1378299066b.38.1766434110928;
        Mon, 22 Dec 2025 12:08:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 065/114] python3-pdm-backend: upgrade 2.4.5 -> 2.4.6
Date: Mon, 22 Dec 2025 21:06:47 +0100
Message-ID: <20251222200739.2278706-65-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228390

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-pdm-backend_2.4.5.bb => python3-pdm-backend_2.4.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.5.bb => python3-pdm-backend_2.4.6.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.5.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.6.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.5.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.6.bb
index 5e6d75c188..95d8e3e4a4 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.5.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.6.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "56c019c440308adad5d057c08cbb777e65f43b991a3b0920749781258972fe5b"
+SRC_URI[sha256sum] = "5dd9cd581a4f18d57ff506a5b3aad7c8df31e5949b6fd854bbc34c38107e4532"
 
 inherit pypi python_pep517
 
-- 
2.47.3


