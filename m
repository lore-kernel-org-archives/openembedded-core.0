Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.2584.1615661558031802931
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:52:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KOzAhStO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id f73-20020a9d03cf0000b02901b4d889bce0so3142526otf.12
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WsoXF34pdd7tSPkKlvxxhLyRBt+1kZLNUkgek5CVLls=;
        b=KOzAhStO7+9p0X02bP4vaAJtlyvNONWA1m1uDACzM7Zym28Y+LZxCaxxFXmEeMICFf
         SdFrGE45sWNaPqRXtKePnZU0ZpHwJw9llAhkEDFkEbTnaFkZt60WaBFBXDdAK6OHRise
         sTT4UF16RytqC81lr04kE+9A6E5b7A8E1Uytu/hENP/jjUAWc588F07flKQcCEfwxVzq
         TGQt8tieQSOKHdjxMJt+zwy3KPihFpDxLPKhGSivS3b4h/TO6ZUb2IVH1uweB9QKYmLD
         gUFhqcDPr5WAqXUk5hDgfz7RqD53KBhXhTiSm877EtZQrxAcQzpAh5M9KTZvf7NlDEKe
         SKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WsoXF34pdd7tSPkKlvxxhLyRBt+1kZLNUkgek5CVLls=;
        b=OEY1RnbIxvDAw9xnr+/E8m28Mzrd+8Jde5H3VS4VcOzrXEwoZ85WYcSEhPVi0XQGfC
         JgqrqTCGtsSK1x/nA3kV7BuSBouO/XAceEP+TFb9Zc5fNbnUscU3KpGXJiscTKBI5R3O
         Mc6AtbGLJsSc+/hK8Lbbe0QHDPjt4Q+52qD82p8GHHH9wDnASrxmY2s9OBpjsd76XYSP
         SkezoZIOXYcmQFbGXRXXDyElcvWJ5Y7+ZOYc+Hoc7niEx8cxhN+qpK3V/gMM2ki8yWPs
         TXQhHmzIDmy6l8CwZdnt9AD+WUYQ7DzvkhxxEV1hnGLyFRoBmg8KRnmrsP0/OC01fWul
         d29Q==
X-Gm-Message-State: AOAM5339xkMZwkXWUsIY350L//ocvAnHic72di6wOKbZzmBrLEr9B6e4
	GmWOh5SVwJC0KtlfuR50u86hcEAsPGWseDHK
X-Google-Smtp-Source: ABdhPJzQXwP7A48aLqrIZGUVCWsGCvBtJfka5tc1yR2+bj893rGaFMFyyb9J3zJGUItrpeAIZvpqBg==
X-Received: by 2002:a9d:206d:: with SMTP id n100mr8287734ota.353.1615661556958;
        Sat, 13 Mar 2021 10:52:36 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.52.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:52:36 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 33/38] runqemu: use "raw" instead of "bin" for ovmf
Date: Sat, 13 Mar 2021 08:49:22 -1000
Message-Id: <b3cbde17aff693e2d5ba6d61922fca54e75b9f6e.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jon Mason <jon.mason@arm.com>

bin is not an acceptable format for qemu and will throw an error is set.
The correct format in this case is raw.

Signed-off-by: Jon Mason <jon.mason@arm.com>
Change-Id: I9d78e356d39ecb15bef886c19870b029d9badd65
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd279aeb986b4676ea8ecb1e7b12c7e29e83460a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index cc87ea871a..63e533a934 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1328,6 +1328,8 @@ class BaseConfig(object):
 
         for ovmf in self.ovmf_bios:
             format = ovmf.rsplit('.', 1)[-1]
+            if format == "bin":
+                format = "raw"
             self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, ovmf)
 
         self.qemu_opt += ' ' + self.qemu_opt_script
-- 
2.25.1

