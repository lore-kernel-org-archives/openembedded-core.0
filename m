Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B594CFC532
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 12:20:30 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8113.1763814024145368969
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 04:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z6ml6jIN;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b737502f77bso412280866b.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 04:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763814022; x=1764418822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnO1iWOpZwwVwHai8trXA3nB0xEk9AyqYo6Fadf4nS4=;
        b=Z6ml6jINDeYVm0Nlcfm+Twupuu+9/7q5qZmeaUTT3govaduq7NhvZTm0PeVjkw1PpZ
         r50KXgi6qVgt6GQ46joeDnRc/cgxEjFmIdd4fDi/K1Ju4HqegEsbjygXkUG+EeD1nDAB
         V+n0aj5XP7LqwFPTjPCPHf8BVfSZGL7MHq/rnCaVzowHU1F5S7eb+O2QhKYilKBwbiSM
         y/mPJkucxchkvwvX1lgxuEJTsrEmSWB/YgBqKBEAiB3bcbVOWe+v+ME3II3dJ8KvdScq
         jnygI2py2wVPDXdrRyxn3fD/qrzKbF/sOCM8Lr0tglvWp0M5DzwmfmvuOisMFlb5SsL8
         9R9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763814022; x=1764418822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MnO1iWOpZwwVwHai8trXA3nB0xEk9AyqYo6Fadf4nS4=;
        b=tkkzVHc3kkNxKgYR8Zv9r9caTo9N04YArzc5oX85zy0ZqoIJbxjp/CrnSFQWqcO4fs
         yc+Vc5/aW71zvWeSECWpD+/tJyspepi5FXwcYhVYPpEMDhpYORk6tCAFWPfOle5sFVI9
         OmrNYmzO20sGebMSaeXiuDAEa1sfTn0KnjFWqVGHPCD6An+kLD0LPyYoeYr/Oefq0TWy
         OpAFWPit27qp6HNPeDy6qHL/3CFp7ywUQkbyQ2ZuvNvCO53z5qF8MMEDppnO3gu73f83
         pOLbUx/dGj1LH5NrcBx/7O7E/Yj3uuE4rVqc+fp87eBeG+FwIubqr0m1TcFEtINSGIQY
         Pmsw==
X-Gm-Message-State: AOJu0Yw1SaUTk/5DrSEIa8pvCCq4qJ0mfqFqC8PB4yty+icqGimZIFam
	JolnqYVoyfHhVYK4RFGLtTNqxEV9JdU9xLxp+5Ps3hU3+KbxaV/9zvFwCLGAug==
X-Gm-Gg: ASbGncv5DkcplZsckWzNG6y9ULTolvYziI20yFE8Y6MdsvspU6io6xZkz5zacm7VG31
	PworZK2+PD9fKWKzlZHCo7kELnYzjj+2oGw9oamnVpAbxKusDKbwNJ/+ihD2kTzn2FPGha9hhAA
	HQq/UWnb3I3Nm7xkDs0vNVxH+U69TsGEy3zXxx6ZDrHsV8UzQWcWakDDkamJ+Hrlxc9wwAVQ2uS
	KPYhlVVGzTcljDrXeG+IUMN4EJf8epDvhUvpHopVZ1uTt9Okn5AErSeyCAri0M9HJ/waAH0QiVr
	DDruz0KAGpQUXK5vtusSbdGSazQyU6Fm6owi21OyjGzUwif/WwEA4JDwWMs1bCJkmM3ShjnLOho
	4gOGD5m6hMw4SRzyDefH//BNnH6uwBtvYONvNJpjQn03jqdUFAMmIZ1Qz7997MDVjcIyFdtTSiq
	P3M//i4ZR71S/DNfHq2PJ66GCDp9cl33wednXPfNe3Jpd7ykg9DCQti2mnLgZZKsLKfsxNnII6l
	TsROJbmGLmVVWiadtXus4DpXAb2MvKegzo9fcKUnRSTX3Hy8Sg=
X-Google-Smtp-Source: AGHT+IFdRiRDhSB09aniLOR8vhdG11yA+Eu4XgER/eECdtj8mYrQfBq98EBkJnoNpJXQVq0126U4bQ==
X-Received: by 2002:a17:907:3f14:b0:b73:6b24:14a0 with SMTP id a640c23a62f3a-b767158cdd0mr533642266b.18.1763814021937;
        Sat, 22 Nov 2025 04:20:21 -0800 (PST)
Received: from peterliu-Precision-5680.atlascopco.group (static-212-247-106-195.cust.tele2.se. [212.247.106.195])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b765504828esm708694066b.64.2025.11.22.04.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 04:20:21 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org,
	peter.kjellerstedt@axis.com,
	Ross.Burton@arm.com,
	richard.purdie@linuxfoundation.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V3 1/3] systemd: use "+=" to set PACKAGE_BEFORE_PN
Date: Sat, 22 Nov 2025 13:20:11 +0100
Message-ID: <20251122122013.1960798-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122122013.1960798-1-liu.ming50@gmail.com>
References: <20251122122013.1960798-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 12:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226691

This avoid overridding the original PACKAGE_BEFORE_PN value could be
set in bbclasses.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-core/systemd/systemd_257.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_257.8.bb b/meta/recipes-core/systemd/systemd_257.8.bb
index 549eb7fb29..20fe77fb13 100644
--- a/meta/recipes-core/systemd/systemd_257.8.bb
+++ b/meta/recipes-core/systemd/systemd_257.8.bb
@@ -412,7 +412,7 @@ python populate_packages:prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|systemd|nss).*"
 
-PACKAGE_BEFORE_PN = "\
+PACKAGE_BEFORE_PN += "\
     ${PN}-analyze \
     ${PN}-binfmt \
     ${PN}-container \
-- 
2.43.0


