Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17418C54F50
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 06:42:13 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25162.1785134525999179083
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 23:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NhDwtNVr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so15747515e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785134524; x=1785739324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LGZ1YLJHQFPI3SKQLWVWTrH0N1LClPCnH1RUv8zzNUo=;
        b=NhDwtNVrkjvoITuVH1bk9gYeyGAEPUV5wCFOPOHOH5Zs2DELEIT8rZDPwmTA8TwXJ+
         hzXL0k6loegCEf6Jd6v0/S1wo7Jb+3Yp90xQb8WAw/AI7ziomg9pMLXjkX+3IMUIJpa6
         elCynH0T8lSLtZUUwZ/7P9AiwT5rblVKoU+ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785134524; x=1785739324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LGZ1YLJHQFPI3SKQLWVWTrH0N1LClPCnH1RUv8zzNUo=;
        b=TT1Nz/zJIF+z/iBIgzxtaYhs7u2hrHFbtpV3m38XJyfJFTgFgZm+BoCuh1z2BD8opr
         PEYbO+FLHe4nQu4SgH++m8plgoeeH0U39UwyxxnxyfyRSJSCVAm9Yt0/unW7vy+b/CBK
         c69cQurBI7H9VNBq+MxTH+F9JwQQEBVXvraXBA0ubtkzPs/GyvT+zRveViU7HfNAg8e3
         n4HY5YujmBTVu4U/OSNR3Nt7XTrwiTqFfa0IJvw351LozrrGSj8RZBARhIGNPh0H9Idk
         aYiiF/7CvfS/25rlfAoMpy3o6KgNlBUdEP3e7OLrp3031bnMZlP917MFBAawVLOK2rGY
         tYRQ==
X-Gm-Message-State: AOJu0YzaYb2pg+KNUWCguXUF1U2t91axeplnJbwpuFU0O3w0LK1IqpHD
	SruMck5qaBd83H28t4KQUD9tXAzd72oX01BoP9LCGdzUXnDYq6fveombJ6B2JHh2FEW/Xjx7+EM
	Y+fRDnA0=
X-Gm-Gg: AR+sD1014a+qNOpDK5Ijjhk6QJZFvFaR6JjfzhKjK7WIvaFc5JWVSi037pjGt1s9/jg
	nAe7QeZtIfjdRp54QJdpe2V/TnKES2zt8yqoJGa0Y6f+wlu468f0jIGvvZQCQsx/FPNnn4GUc6h
	r9cYZ+LCF4GtcCrzzH1+mofYfUPr+w8+FCvnOpdvcht8SBaAtUDytfPhVJDsQVaPbf/bygVLjtf
	ZNvPDWzAmGNzwMj8naq4sC2xN9HLWSNCSg2D0O37b3F98A6emwCc3U77X1EBSlw+NxGETT74bj5
	60IsJjLu0ZO5cZe9V7phvAMAF1Eu1EDK9BgfUPBfPC8mdsji586AeF9JcAWLfCsHGpP8QLC41IZ
	3EQk8y4Wk1KefS3aPop93WJFx9uweUJzPlZ5oLJ1EyUkVvfuU4wOAqLndl4oSHy5boPltm26ZEd
	IFM6aMtehwR5aHh76r6UK5/4fvUQBRSA==
X-Received: by 2002:a05:600c:1c05:b0:495:607e:5ed6 with SMTP id 5b1f17b1804b1-496b6a31f1dmr86481935e9.31.1785134524055;
        Sun, 26 Jul 2026 23:42:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a01:52d:1da2:a363])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4866813sm229103255e9.8.2026.07.26.23.42.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:42:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] qemu/qemu-system-native: Upgrade 11.0.2 -> 11.0.3
Date: Mon, 27 Jul 2026 07:41:52 +0100
Message-ID: <20260727064158.3784068-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
References: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 06:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242041

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../qemu/{qemu-native_11.0.2.bb => qemu-native_11.0.3.bb}       | 0
 ...emu-system-native_11.0.2.bb => qemu-system-native_11.0.3.bb} | 0
 meta/recipes-devtools/qemu/qemu.inc                             | 2 +-
 meta/recipes-devtools/qemu/{qemu_11.0.2.bb => qemu_11.0.3.bb}   | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/qemu/{qemu-native_11.0.2.bb => qemu-native_11.0.3.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_11.0.2.bb => qemu-system-native_11.0.3.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_11.0.2.bb => qemu_11.0.3.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_11.0.2.bb b/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_11.0.2.bb
rename to meta/recipes-devtools/qemu/qemu-native_11.0.3.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_11.0.2.bb b/meta/recipes-devtools/qemu/qemu-system-native_11.0.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_11.0.2.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_11.0.3.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6fca6bc4992..e440d748b25 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -42,7 +42,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "3745f6ea88e2e87fe0dc838b2b1d4e0a770bf48e01a1d5a186842a1fff76ccf5"
+SRC_URI[sha256sum] = "da5fcffc32762820568b828ed430a728864d34d50b6d2f30358597760cbb0523"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu_11.0.2.bb b/meta/recipes-devtools/qemu/qemu_11.0.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_11.0.2.bb
rename to meta/recipes-devtools/qemu/qemu_11.0.3.bb

