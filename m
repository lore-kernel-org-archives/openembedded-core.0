Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A83CA600B
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5177.1791319471256020701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RiF+NzZs;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1948581f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319469; x=1791924269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hbnW54CtptI4LyZ0O4OQ/WAglVEER0Un9/uec7fmIEs=;
        b=RiF+NzZs5+PtIgnY9RJl48ynpaIR9cnlUAWLBL/9PbcMAiTAB/lF4DXOKZPNBdi54P
         +lQfgka4fIB89H1oTTaO8CbZz+Yvg5C1NaGfHW4zrB7nP+joxx5tMjGVyVF4yRf8f9ed
         Ptx0SJqANgD2Pkg4ny/OJMRv0eUTvGvcfdGOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319469; x=1791924269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hbnW54CtptI4LyZ0O4OQ/WAglVEER0Un9/uec7fmIEs=;
        b=WQFXG4PxUR5EH1oz55nIvSYQNd0MLO8Y8mJJOAxFpvkmai76Pa7RTEE7OABZpMtSXQ
         GhxO5a4ccASC6GJPZVnXThLUWR7PnrO5tivcyh1v2Im5LDwc5lPyMOAiRpOtPtFpiOri
         Zd9nLqNNKnrPmC9dOy+3xy/kIeMu4OLvJ/zrn7H0VsAjz6TekNNSW2M32YQ94vvjufBv
         EdrqVzD9z2P+7NsHOKn3VTFRz9q04D1ggL7J9Rhq5KmyxK1wL1ryQqII4rYgSkWHIqM9
         JPge95HbV3+CaihCjybZg9aVCwhZBRebeNiM9EnBl8IsnNv1QoKQ5Dk+Z4MtyFYFsJUZ
         IP9Q==
X-Gm-Message-State: AFq9FYIudAGaFaeK+mS7z8lUVsaPsSDvwBuV5OBPgLAWkv978EF3mmxC
	aWdKbK8gqPAdp0XfAXuPnyZpPMG92LZ7FRnxYMy/5shDiRbcTxGCz3MGb9h1QW6ZKD48mv9eAUO
	aWXm/kUU=
X-Gm-Gg: AYBFou0d0a7hWnAwzcIMArnfS0u27hsaB8jFCuEtEAkwOXT+qMp/WgacaPnw5ocjL9g
	mNm/hvcNmSVCO24BLTNIMqBkoHT1wl6wWa6cE+rGdROFeGgm0DieZna8F85k3hcrtWcDxvdOZv4
	IhHdM0u3toGIuKbgDFtqNoprjXOfcbTEohpwiduuFO3KPY4ympJDAqiPWwUX5yN2J09JenpPesV
	GF3C/Qslg3J2H34gr/eyjycltlJ3GexwuUo1++rpgCm/0gL608qG+Qio59GT/I2/2hNwpfYe/O5
	lHAUFKOJxXaKabTI8MN7JnTH+4ZsPjmPOcxSpdV9GQhEebDQKRi1HT3zrQCi9f2agNR2tuuXLkX
	vuZY+y39LMRKa92W3A6DQ7br/PsBp3jNLfFyIq2VxYU7XtHzB1UANG57uPxinLCuz5/JqTBXnu4
	sXFhpZSKo+9nXCCNBaErDuNIcit4MImBDD2hy2wVH8fY7uPMTVJUzhVo6/eJqPhxCTCYjtXrwGS
	r7KdZLsNAzzsb5rk3sIzFVjfacid+Bp1qfIB0DMzI6oKmg7O8DGr5xEA+2BTLNsTgY=
X-Received: by 2002:a05:6000:250c:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-48c72899389mr921323f8f.39.1791319469537;
        Tue, 06 Oct 2026 13:44:29 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 10/18] opkg: update Upstream-Status for a merged patch
Date: Tue,  6 Oct 2026 22:43:45 +0200
Message-ID: <7ff6d2873fc16a53b32bba95fc435e9d34507dd9.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247346

From: Yoann Congal <yoann.congal@smile.fr>

The patch was merged in
https://git.yoctoproject.org/opkg/commit/?id=0682b36c898fb81a40a068481062512bcea9b66b

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c11fe991f05cd8cbb39e4c89e10e28e7a15a220c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...3-CMakeLists-take-the-default-architecture-from-the-ta.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch b/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
index ee7d35e34c4..5142fff7f42 100644
--- a/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
+++ b/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
@@ -14,7 +14,7 @@ cross build doesn't set it.
 
 Fixes Bugzilla: #15784
 
-Upstream-Status: Submitted [https://lists.yoctoproject.org/g/opkg/message/218]
+Upstream-Status: Backport [https://git.yoctoproject.org/opkg/commit/?id=0682b36c898fb81a40a068481062512bcea9b66b]
 
 Suggested-by: Alex Stewart <alex.stewart@emerson.com>
 Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>

