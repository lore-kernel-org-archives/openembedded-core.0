Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBACEE7719E
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 14:40:33 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.36896.1736692500749316195
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 06:35:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CzClPzAr;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: arturkow2000@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3d143376dso4957954a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 06:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736692499; x=1737297299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYi/TTm+1enNtA4IV/T4w0oMOjdGSmQfvoH4tld4LEs=;
        b=CzClPzArN25sUIdZ7M3zEgG2w2Jej7/idnJm0Q+uKcroqG9jnLRg8PMBM0sBtlpFA0
         /yyyb2df1F5xwIE3BtzAhli4ItiWPojSVhJRAFnM4bTK3DlPZFpv50kOyskuZF60S3n5
         AqNJjt2I1EmEGDqmmfrI3C70/yOEgcj/OmP3nNoweIPY1IjtCwgdLYbAaqmSv1gbh9Gg
         EJY1uKPQ9n25hApfhcAJT3NTKSYMGaSODOJq4/lfk5BmE//BkOvXSqslJiCInWb12VZl
         OqKt87UYu8fD3ZocrrDErs7+tObHVUjlJ3lU5mHw8oQgsJ8D8zIN3Zu3DZtTuechiQ3h
         vofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736692499; x=1737297299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYi/TTm+1enNtA4IV/T4w0oMOjdGSmQfvoH4tld4LEs=;
        b=cb5NIVIJfzm/2Z34ouZrb0ncyT7Mnd/0+4L6l67xRt2KmrNmI3bVQjlR/ezdjhgOHQ
         qx8Y49U2K4jw6DFXMFHvUHkPtz9V6HMv/F+7Mx1J8mPAo/WTZLMGYqsMnI0KeIGYVwGs
         EwnydpMXCJ7A5WNwnaejPlnvWt9LVSWUVXFrXlOgADL7ARH4hOIMsBI4Ft21vBhz7/bd
         N8RVmeFMjaAyNFqfVty+n0yJ1DOFglqz9UdRSEXyuH48JSVR8um1cX54VpShPbvTH+0/
         taw7UoGB1MdWuBTe6FZGyvi0l4LDmLpNzjETk0T//bBpnG+hanql/JZnf4BA2iKOFNqL
         o2sw==
X-Gm-Message-State: AOJu0Yw1d1w3KELQuKTIR0F5lyAOKg8Y8RT8Me6logbimfH1qCc0TEwt
	HmztZ9lc9leRpC/Oj4O41kQ+hNN4umDJNRLiL5dTELfP+F4Xxqbt+o+dCQ==
X-Gm-Gg: ASbGncs6YrPEtJbyYv5VTAQacDqersNIZl+sN5aHXzOf2OhdrdyIet/2OFC6/acdzuT
	r4VilEyhh6NcgCmeWMdLAX5rxbQhA7yr2jD8Pon0hEzPoCDFKPN109owVlQGIymJHMvi5R0wMnB
	s5KyxatSsjZFYrlj0WM35DU/NvFNfxhOsbD+paxc1hR11bKIHqy4np3G6Q2NIClOOogPoD0k9kl
	4Jc35OdlhJo7p9yl5jM3i8t30m7dVZCCrPeSPid8m3GQ1mJeaOnzrU5QmZq2sqb
X-Google-Smtp-Source: AGHT+IG3EuIO6OeT+xrbFHT46386Nhavi5dago6Dot1aTTj2mlPSBr4uIx/8OdZs77mXSE6tgqkBFQ==
X-Received: by 2002:a05:6402:5254:b0:5d3:fc60:a504 with SMTP id 4fb4d7f45d1cf-5d972e17891mr16021187a12.20.1736692498554;
        Sun, 12 Jan 2025 06:34:58 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:dec6:9e22:e5fb:f0d5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99d05bec4sm3207739a12.14.2025.01.12.06.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 06:34:57 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH 3/3] image.bbclass: enable systemd user services
Date: Sun, 12 Jan 2025 15:31:41 +0100
Message-ID: <20250112143141.1300189-4-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250112143141.1300189-1-arturkow2000@gmail.com>
References: <20250112143141.1300189-1-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 14:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209688

Run systemctl preset-all with --global flag so user unit's are enabled
the same way system units are.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 meta/classes-recipe/image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 84a2017eb5..f08818db03 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -702,6 +702,7 @@ reproducible_final_image_task () {
 systemd_preset_all () {
     if [ -e ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ]; then
 	systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
+	systemctl --root="${IMAGE_ROOTFS}" --global --preset-mode=enable-only preset-all
     fi
 }
 
-- 
2.47.0


