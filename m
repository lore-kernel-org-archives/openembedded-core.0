Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A34E668B2
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 13:17:30 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.66179.1732454240675934186
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 05:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A8p3r9Sr;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so31563205e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 05:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732454238; x=1733059038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8C4w3eXPFWQJx/iZA2bCd5f8zJUAJ8sQ0pdUWW7LyYI=;
        b=A8p3r9Sr4wDljpo0W1KNvMUDF6dyRusg7Ns3O3wiifOpkAt2UHUx5EDdyuDC3FJ0+h
         Qt8hCBvKJVBvbl5V5l42sCy2AEC+ijOr+UoL6HtkVVxqlivf9Vka0xyJPmKUpCgoAUKY
         m1f9nEEjLOzmNYfFa50TydNNjupHUHXxu+wmA0818xP5ozOqrMxfhwb+/xbjHnC3sp81
         e5GH9dlb6o4jfrkedMCYGLYVFiKj3y8WNfrWgvMRMqoCIcYp6TgiSx61y6HLLHYTjiJJ
         YcpR6YmnlTYGPLLv/o6gx9ed27fhGnCTFDxvGpwpx+3rtVreVKtr+eF5PyFqi0ej3QIT
         CpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732454238; x=1733059038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8C4w3eXPFWQJx/iZA2bCd5f8zJUAJ8sQ0pdUWW7LyYI=;
        b=TqFwzpbt+1m1b+6rs34bqc2huZLnScVKOHEV/5QyBkX/avpYDJ7PNaEHdTDHYSbDRE
         3XA+xg0o3IuCBB4JyGYordCbMLLgpjbt68b0FhNAQpgB9AWuvaAs2HqdhDFzKC2U+Y8c
         uHHF0LeNvQqO1rhloPQJ6kdle1rqmhZxct2paWOLPHSNrC9dgv1+3PtXwdqhhQT0K4Q3
         ckKU/KwRUQzFaBZvwgu1n504ERX2xjvH6HmFpuoh7m4VgtTbT3KFFkI7+LfMjxSM8r1j
         HvpBIR/i/m4oFq0VaiFtv65a2SRx62w/LWNlqVLDALon7msrWpGSPG+i+g3qkALIsM16
         pfgg==
X-Gm-Message-State: AOJu0Yzx95uz180SCirm2bct2S+LVfPhlM0AFVSPFNKv44kCf/ZJdc5A
	YFETBXWYEIzFHKCzFlzjkstT/kOshNJBHqj7tTE2kJ+DI+GbtZh4nPsMhA==
X-Gm-Gg: ASbGnctb13fWyWJhPGXLdgCl2v7A8Q15Q4ru3Rh15u8NUBdZldKeLDGJermpTS4wRs6
	PVpDSUDVZ0OayEl9durbLy8+pBwBgg7Hu7HALbhNMxRFhoiuCkfeHzq3jlGPJTpb+RYt7MxUGmJ
	BU/VDEEBS7iNjfER63ZIuQvxaIlI44IdLDqNghG/z6oDtw4gNnz9HkBNBgRyZVD8Hr+vZV0k/Qt
	pb1x3NAdC4Fzpz+7LR/1m6kd0qPGmzQ4pE0C/X8PqsgeudFsK8XMn9WZCYhsAwVYRC1sxnVQdQ=
X-Google-Smtp-Source: AGHT+IHz41PvJOEs4dLHDgEqlt1729gTn9IJM7Qk+YPOK+t3iSDDbft2w7KAu7cz+Nzh34THIP22/w==
X-Received: by 2002:a05:600c:1c98:b0:431:588a:4498 with SMTP id 5b1f17b1804b1-433ce425fb9mr80461805e9.14.1732454238428;
        Sun, 24 Nov 2024 05:17:18 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349cc29406sm26546375e9.0.2024.11.24.05.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 05:17:17 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH v2 2/2] systemd-boot: drop intltool-native from DEPENDS
Date: Sun, 24 Nov 2024 13:17:07 +0000
Message-ID: <20241124131707.4129-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124131707.4129-1-gudni.m.g@gmail.com>
References: <20241124131707.4129-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 13:17:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207708

intltool was dropped as a dependency in v236
See commit for reference:
https://github.com/systemd/systemd/pull/7313/commits/c81217920effddc93fb780cf8f9eb699d6fe1319

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_256.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_256.7.bb b/meta/recipes-core/systemd/systemd-boot_256.7.bb
index 4f477b877a..10b532d47c 100644
--- a/meta/recipes-core/systemd/systemd-boot_256.7.bb
+++ b/meta/recipes-core/systemd/systemd-boot_256.7.bb
@@ -3,7 +3,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
 require conf/image-uefi.conf
 
-DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
+DEPENDS = "libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
 
 inherit meson pkgconfig gettext
 inherit deploy
-- 
2.43.0


