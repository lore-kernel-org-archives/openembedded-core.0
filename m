Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E243C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:23:54 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14937.1785846229390422985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E95HnmkJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso14953855e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 05:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785846228; x=1786451028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i4XuoJ4ZUgVjTMEVEc4r0JO1oyZecC8ZbIzTEiksvSo=;
        b=E95HnmkJUVf4cT5R4iwpoyhR4T8csCfXEXeB8qFx+J8dNMtYL0tfldXdhK1nzq6R+z
         5WYxJZI2Kt99D6sjNv5kRokc0U6DIXln/eW3Ubf/XySEoMyxVixbzIw8DutUyk+zPl3c
         1EHz+0pg3zRNiiYuaszL3Rqm0XGhdBVd5nHf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846228; x=1786451028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i4XuoJ4ZUgVjTMEVEc4r0JO1oyZecC8ZbIzTEiksvSo=;
        b=krM2jBIsiixmccyuKN5EFk6Q6yGb5//g5zXunQnS8VdmUVKWuQNLpcWjpBDrvcaJb4
         HD0uhOlQu8YghwbQMe7ObfNFz+46NsJWpHurMKw/gTNXr5N/7dPFPt5zbNM5ldUVEClB
         i4Qm9vBDTFPuv4S5Fo2/RWt9CilmG3wNYiSgxAlTYtjoZ4srHIO0vtncfs26AQ+B7Ht2
         zR5FqgDQ6TeMAOv1nAHa2f06rVHo7vCn2UwAw7HvKZq8+u/ZexcZiikQayGqxRZhycRy
         7NqSuUzyjT35WkS4GwflRDOQNCD79s35JCf7hq5320YMHfFiT+X2EOjxxWpRuOTJiOAr
         jGvw==
X-Gm-Message-State: AOJu0Yy6jtbGZolqYV7iSCXSqzCcXf30IAOQJVK9bvZrK32dDwBIZIxw
	4Sn45DHpleLN6GJTS/s7DHcEaxbboU3uveM5pp9159blEIPmvWDEe4IyDF+ZLBFLqo8Sxf1oQK6
	TNWPERgM=
X-Gm-Gg: AR+sD12gouQZOfjl7gDtgEbyYKTFfCpjYNgD9Nucye/vstGobOW4AxVUkcWgn4hZ6d5
	CvJMHyYxZpb9AFNp9/WV1nkCyMo1t7a5Eb23TF6yoc3RrmRivxqkw8s4/30uLvRsYIPt4zB/Nxl
	cjALYIjQMt4W+d2uDP25S7egPZJ3ZIWywk3hbdx81q+fmGHs5xG+rE8e5JBbpswaHzBQwBZVfL3
	83onUi8CyOC/6CYXLaF0HVEGGwjcKkH9gFlD/pe3TPj60MFt1gIra0TvhgU6i5QCGduO+lKR7tV
	iBrHNFLYyEvFfgzzb8ihHMrtG02oIyw4yGN/kpnCFcjXBtDHyDohabtplut+FfBIbEM2exGxstq
	/ZPDQRNhfdZMI3ZbmXdySJsp5Yse2ZjwRbm6cdGK+VUOsf0NYpkx9ooMQeiidJKcPSBUeQn8y1l
	wv6OidHhWfZcF2pyCW8F5nd0usZUsYof2xmTQ0z+z1vEDffEIjbedcC1zcK9mkP+VjkxHZXyawj
	AYrqdR/TheoQLRTJAmIVBtrkIE8
X-Received: by 2002:a05:600c:5251:b0:495:4cb6:71cc with SMTP id 5b1f17b1804b1-4994d48d293mr18151435e9.5.1785846227616;
        Tue, 04 Aug 2026 05:23:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ce15:a763:9e16:7bb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb0c5sm76247535e9.4.2026.08.04.05.23.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:23:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] python3-cffi: upgrade 2.1.0 -> 2.1.1
Date: Tue,  4 Aug 2026 13:23:34 +0100
Message-ID: <20260804122335.3094065-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
References: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242746

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-cffi_2.1.0.bb => python3-cffi_2.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cffi_2.1.0.bb => python3-cffi_2.1.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-cffi_2.1.0.bb b/meta/recipes-devtools/python/python3-cffi_2.1.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cffi_2.1.0.bb
rename to meta/recipes-devtools/python/python3-cffi_2.1.1.bb
index 718e43e3399..455732a2699 100644
--- a/meta/recipes-devtools/python/python3-cffi_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_2.1.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT-0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c0158ab9b75875f3bb7fea081d388818"
 DEPENDS += "libffi python3-pycparser"
 
-SRC_URI[sha256sum] = "efc1cdd798b1aaf39b4610bba7aad28c9bea9b910f25c784ccf9ec1fa719d1f9"
+SRC_URI[sha256sum] = "dd31f52ea1086513bb9df30f8fcee9b8918323ae067a3d5b78bc826a000712be"
 
 SRC_URI += "file://run-ptest"
 

