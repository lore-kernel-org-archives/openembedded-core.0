Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.15375.1631124097778665757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WannOUrY;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id i28so4587815wrb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hl+o8aYOEUcmEt4QOgA/v/3kBPM128K/jDdQtX7XQKE=;
        b=WannOUrYp7uiVoI4l4LUNQhkPlURMUOxvhgYVykeJLTU6RLL5h+zNAl8XTo5iLW22T
         Nw6nz90jeerS53/+Jj7AYQpl0cFLc9QQRj57GIkhxhWul/YqijI1KVBN3TGw6gI7nhCS
         L0TAs6TtoRtm8pGEE78omsVPL4p+tgHVU0RWrj+50HLcRv9VA0aBphWxZmg5uY0sbqIJ
         dbPz5LsPLmyeOOtosbI3Z86HXylBwUoTxUdPD1ObTJMCih061P06cwZ/3j1CCGbYUKNs
         mxymYfsLAh24HK1fo0bPjkMhzfQqgetF5LUL/w/Rw2SfA4HoxRe6i5DvPPZbL/GHRA9Y
         aduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hl+o8aYOEUcmEt4QOgA/v/3kBPM128K/jDdQtX7XQKE=;
        b=GgojDrsyKNuyUkaBknlB1R6O14qw/WaV1lREAR9qwyGWRDFXMdDXhmtyr3uU4kyGvv
         vwhf8D9JafC0cxPbXk81WbpL4fssU+4bDIubnP/c0Eb5i+ZSk9gXfZ+16BwIEChY06RD
         bYEqbpzDw4ApT5yRU701SAPv5vBcj/3+B/ETbcRO5f4q+qW8YIVNnWuxrh8qwlILPfnO
         fuNXZCbKNfFe0R2aHse24/E/iegYi195Da9Nv31CExAPe5g3RZMNplWNFlAqxgJjFUvP
         9XSlrtoNh8GacdNJ5HmKWGd6+h57iRq/Bk450fdVXjkgc+b7VYIxM5d2Yx+lneSLXFVG
         U/Iw==
X-Gm-Message-State: AOAM5306p0jyDHtE2dQv6rhbbGxkkIApRf2X1qm36b57SgXbY4um6yQZ
	tHOJBRfc0BlE4fRGQplKZW9AwkordGI=
X-Google-Smtp-Source: ABdhPJyu66lAPRQpYX0zsdwmHpngxNmfCsv/eify0Dm98Cia4MGsHTfIOCfUXPpnP8bnt6g2Ev86Wg==
X-Received: by 2002:adf:e0cd:: with SMTP id m13mr5480752wri.137.1631124096413;
        Wed, 08 Sep 2021 11:01:36 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/26] runqemu: correct vga-virtio option to keep virgl enabled
Date: Wed,  8 Sep 2021 20:01:10 +0200
Message-Id: <20210908180125.103473-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qemu 6.1 has (perhaps unintentionally) disabled virgl in -vga virtio:
https://gitlab.com/qemu-project/qemu/-/issues/586

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c467b0eb19..3268bb18ad 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1350,7 +1350,7 @@ class BaseConfig(object):
 
         if self.sdl == True or self.gtk == True or self.egl_headless == True:
             self.set_dri_path()
-            self.qemu_opt += ' -vga virtio -display '
+            self.qemu_opt += ' -device virtio-vga-gl -display '
             if self.egl_headless == True:
                 self.qemu_opt += 'egl-headless,'
             else:
-- 
2.31.1

