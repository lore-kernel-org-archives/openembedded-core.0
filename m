Return-Path: <maxime.roussinbelanger@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C68EB64DB
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:19:58 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.15987.1687450797664752540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 09:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=M0B1E0RG;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6b5915d0816so3100781a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 09:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687450797; x=1690042797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC1U7jjJP21pBnjjIu39BTGjdYq883LDdyEoJ5A7jDE=;
        b=M0B1E0RGxX18LATggdgTomLfRMy6ihs/gszgjdH5uM9PL5k3Z7Eml7IC3XItG/JLxq
         EKlFp2k58MllCDwOPRFpQwCzyTYDFAtzmJEENYIHOCPwyIyoIeTY8m3C41WipE2pgQdn
         VmSVlqM7RvI/rJtzcxs6LpvNXLKnfjfmtWWti6nuAxTzvIVmQRkI1+gfW9flIoZ4L6G0
         qyqIWz3fE6kOEo0BC/KOTC5+cKr1BUik0GuHnfBNe1j8sU6tXOm4NhsJdHeSSswwEZqZ
         tlr6swxUqLDh5y7sGOor1cM8ixxlay+yLfP1Yt0bOCa3L+bI9yO13sSySG8zZ8n5fx+F
         aywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450797; x=1690042797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KC1U7jjJP21pBnjjIu39BTGjdYq883LDdyEoJ5A7jDE=;
        b=BaNcyZNFhgBTNfTFJz2unVyMl2Zuq6pJ0N/zfap1iDqnhIDTc+LS3Qvu3lcULFZEKY
         thKoeX1vtBPNhDj6alsKY12yP9hcA3klWj4xs2S+pK5SAumoZRK7P9E5P6leovZ3vJH2
         rUnb8+2PSj9759rhHQucDRUwZIFDoestiAyZ/XToCH28W/eEP/S3drFO2WfNjq9gAHMg
         fMXuEkdAixMj65W24aQpglx8GjY2yhg8d+I+itr32SYPToIxTKK6joiFGWNT77m4sFAx
         L8r/QCZnxcg4GnAqp38IMOUgOLvbx02EQbdtdp747X0cuVtPpYFwpRCbvIgT7qlkme+G
         UPMw==
X-Gm-Message-State: AC+VfDyu97B55DP4uFmZ2xlMiK9NejFZckdw5B6jF8kLW50Jb+Vr7ilN
	iQWebooHLiUsKyTCkYTd/vNOLbnxfcw=
X-Google-Smtp-Source: ACHHUZ6P1c5GUNvM++WfuxDFtvtdC5zx/PkeczfYkqniwSTt9c8i8a3yoghdI4EvC8B4cSP4ckPT/A==
X-Received: by 2002:a05:6358:cd22:b0:132:d0d2:7cdf with SMTP id gv34-20020a056358cd2200b00132d0d27cdfmr2131002rwb.6.1687450796689;
        Thu, 22 Jun 2023 09:19:56 -0700 (PDT)
Received: from mbedesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id l14-20020ac84cce000000b003f7a54fa72fsm460698qtv.0.2023.06.22.09.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 09:19:56 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
Subject: [PATCH v2 2/3] insane: ignore nativesdk-${PN}-src host contaminated issue
Date: Thu, 22 Jun 2023 12:17:50 -0400
Message-Id: <20230622161749.797820-2-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com>
References: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183264

From: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>

nativesdk-${PN}-src will be installed to a different machine and files
ownership will change at install. Since the ownership will change based
on how the user will install the sdk there is no point in checking
ownership

Signed-off-by: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
---
v2: New commit

 meta/classes-global/insane.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index a4dbc9a123..82ea834f99 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1116,6 +1116,9 @@ def package_qa_check_host_user(path, name, d, elf, messages):
     if path == home or path.startswith(home + os.sep):
         return
 
+    if name.startswith("nativesdk-") and name.endswith("-src"):
+        return
+
     try:
         stat = os.lstat(path)
     except OSError as exc:
-- 
2.36.0


