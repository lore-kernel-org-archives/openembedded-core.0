Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.10408.1604787843638420739
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2020 14:24:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YhttlU3B;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id x13so3804918pgp.7
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2020 14:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J2sivXZJG2eKhNopNGfH/DeEsIS9fHoQZT/5K4uhh6E=;
        b=YhttlU3BVn3ZlDZRWwKCHtrybVkTd+Iw/U9qm7XhwBS951LgmRnJvVIJALyIz49h0y
         9Js+Cv4TKJ1WTMRPnE532KCl66GyUrVlD7ZtxSRZDt0NBaS5EcrmWl79NqkNIcATTi1N
         HBCqiVDUjZ4nrzmGCCVO83TTz43eyG0fVAVmZoWzWs+NTfXFMls3TDKQmBUXvCPt+2BB
         PPKK1IGORU18BBw5pIL22q9EXJBLVBKPXfDx7TVPewGcTXdiad44MxWgMIceHVB2ixfR
         Izjdn8d0JNPMSdsC1alAYy0kRBjcmP6dtmfIQYwKIw+jNSkjeyEnjDp9f4hXE6swsyxR
         y94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J2sivXZJG2eKhNopNGfH/DeEsIS9fHoQZT/5K4uhh6E=;
        b=kYDWkzRnTwQYgHge/TpW4Zl8SF7rGGlShtRXh5tUHEjVgZ6KcYDw9vGuq1mB0WRtc3
         mKjj0XiJDSG/bROLHqaWJIA6JEwRwx1kV7QqIo+0MdFm9AzFdeSWDvM51pHmkpz/6vIn
         VPalAcWpxRLIb4HXUzgoNIAENOtxTCyY/hxxUpQLiZwpwRtkBQGUAlCWhDiQaM6Xojx8
         cgpzR/XNy814jnNNcJmrfkVXc0iXT5bOaC3fBtoT3s4i0JBtzao8vU+0naaYay2TGiiB
         ZjLmI4rF4znCATgTfUoIOJ6/9vC5df0+c8Ln1qr1eGVJHH1Hfyu6VUBBh4XOsiXQqsxX
         gy1w==
X-Gm-Message-State: AOAM531Tr4xVDqg81Dbse3hCzZOQjagQz9BQJxVTDqZ5zjiXGiqY1J/5
	Q2XkXgP9ANmLMAjdVtlw73gUU4BRl62guA==
X-Google-Smtp-Source: ABdhPJxxDpY+MYUd/ranPYpywWzMvCokXma/glrl+bw9wBLcVX4cVux0mSjPFteg97eiyGNGvhBo8A==
X-Received: by 2002:a63:5b5b:: with SMTP id l27mr7217477pgm.11.1604787842933;
        Sat, 07 Nov 2020 14:24:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id s18sm6900725pfc.5.2020.11.07.14.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 14:24:02 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 3/4] lto.inc: Add -ffat-lto-objects and -fuse-linker-plugin
Date: Sat,  7 Nov 2020 14:23:56 -0800
Message-Id: <20201107222357.43102-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201107222357.43102-1-raj.khem@gmail.com>
References: <20201107222357.43102-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps to improve LTO and ensure the libs can be linked with non-LTO
objects too

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/lto.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
index fe0f6c9f44..d7fea26c64 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -20,7 +20,16 @@ LTO_pn-libbsd = ""
 
 # Override it for additional or different options if needed e.g.
 # with clang thin-lto might be better for compile speed
-LTO ?= "-flto"
+#
+# ffat-lto-objects
+# object files that contain both the intermediate
+# language and the object code. This makes them
+# usable for both LTO linking and normal linking
+#
+# -fuse-linker-plugin
+# ensures that libraries participate in LTO by supplying intermediate
+# code from .a files to linker
+LTO ?= "-flto -ffat-lto-objects -fuse-linker-plugin "
 
 SELECTED_OPTIMIZATION_append = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
 TARGET_LDFLAGS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
-- 
2.29.2

