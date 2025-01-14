Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BA6C0218B
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 12:50:45 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.43090.1736858067719222339
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 04:34:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ma8Y9RJd;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: arturkow2000@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3022484d4e4so49770041fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 04:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736858065; x=1737462865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYi/TTm+1enNtA4IV/T4w0oMOjdGSmQfvoH4tld4LEs=;
        b=Ma8Y9RJdujZB018Gj9SzgKpT2fTOWG6sQpGXQy8fHUce12SjjHggY47iqoBQDJpJOc
         fR3yl8mMNcpraFeaIGbDN8byvrqYkPDTgZdgsAOeAUTe8UHg4heaQVHjIGgKip1NVGpp
         PNu7pdRlCE2QjiRCvcDf109+VFcksjxw/KMHSOWCa6TF/C9vQ9qhoNzsVnY3OVNAbhBn
         CXRM+SWrf9Qn9Sbx0+rhqA6/PI6IOgRZfoK9ov4l4BwaT83UysddmT4mImTGsh+k4lwc
         IBDFVvkHwGQjb523G7olMGv22Ud0LpUiyWIqxZfGUKh7k2QjOMfOdAhIFMZ2gTaLF20M
         lpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858065; x=1737462865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYi/TTm+1enNtA4IV/T4w0oMOjdGSmQfvoH4tld4LEs=;
        b=OrnbypN9gkYHCs7+RV8cQ3Z7x/DJPzgO0wUBGVqlqe6khS/muTw0UbOrXAhW1LmX6G
         TWXtFsVTQIeTUTbYii7djg5RvPVQ57IQ/3ctUvJ2F53THC/E6p3K07xz3FJWEOmdOhTu
         jJmOEcGVIVs1ON2sKLEQKnxBRexHA56SlS20VTQXsjAJgKp5zNXu+KhocWgKmVOymlPM
         OYFd/LpVOnTRSGX0hknlXCBfd06Lqq7pqOdyzVu/rQLeKRsoL/KYw8WbGOzqFLUyuD+0
         2t/PcKs6n7nFEDuPpTnDJEiG7TP8mexugZlhbYQzzAHuXNs/r9H0ahvxXRR6Kytwi3wB
         Fg6Q==
X-Gm-Message-State: AOJu0YzSPxVjRzPmRyFoV4+8KMhWxMV7VWuYmY9mePHKpSRTxrJxzkfJ
	GdzLdKAgfFOPF6NRwcaf01gilY6Og3crTNfxr/EtA/WRw6LjNfbOsBsh6Q==
X-Gm-Gg: ASbGncuLWchuvFxXEgaG3oy5AjuBTTkEEHZwdsp5wc9vWutZJGZYzUnbohrZdmb4tqQ
	jQf+Jt+9h/aeYigOcve1TEb5zdeggBTkHZysWt1lvcSybjtgXWmJgPR3Pbi4KUJ/SnCMYDdvabH
	zEafd1XJzwM2b95ykOl+gcPXNp77FD3+CNB0teL3XiQ4J+J26s8JGEuZ6AYx1QNBZrV3oSZYKaw
	VFrPn49t2oMHqWI1vF5jcj3vrnQSn8PSMTf9eUrJt/T2BQioifUvRNLJU42C//z
X-Google-Smtp-Source: AGHT+IH8Ulx1/I+rl3bPdZ/vVmZvPfaPeAWS2Ct9NEfRt6WNzKih+YWuO5/u4tdU8KzuVqktLtUOXA==
X-Received: by 2002:a05:651c:556:b0:302:3356:7c55 with SMTP id 38308e7fff4ca-305f454741fmr65881521fa.10.1736858065190;
        Tue, 14 Jan 2025 04:34:25 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:86d6:2e13:1a85:5192])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec4d6sm17230521fa.111.2025.01.14.04.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:34:24 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v2 8/8] image.bbclass: enable systemd user services
Date: Tue, 14 Jan 2025 13:26:16 +0100
Message-ID: <20250114122613.3046925-12-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250114122613.3046925-4-arturkow2000@gmail.com>
References: <20250114122613.3046925-4-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 12:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209800

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


