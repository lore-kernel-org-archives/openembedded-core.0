Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.10780.1613848167833844102
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 11:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UO8MklBV;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id 189so4063178pfy.6
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Feb 2021 11:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bnM/GkdV4nnRWF4oMy5jK9L2RkqhZzo0dvf3AMZmOl0=;
        b=UO8MklBV0uOoO8okR1kUUKBtUl9Rb4CPCyNgk4FfmNyNO15jA4bsnMzJKLQHBm7OVq
         ulPJKtbftjmnon0SsQ6wg8yplvA/ldhg/HqATF/icTMfljrxIyVpeS01426XPwKj1L+R
         J9F/cf4Kiu862aaP4jmp9IDMqNw75yJ3btEJheWP15WAFUC/XK9WP4TZaUGduf7ko7Oh
         oLiAYIaYq3RfFGHMK4VJ5aMfz13SJwclkWuvDVHVtTh0/jdppTGJJW/P7hnXipR0x2Pl
         X1ET3CS+5w6rtEzFTIj0OYrPinu9LCd1sSRCIFEilWb0AHCVanmvGNLAemgIto0Vc1Z0
         xQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bnM/GkdV4nnRWF4oMy5jK9L2RkqhZzo0dvf3AMZmOl0=;
        b=V1EllTa0d0z69v2RWy79yrhdEXZ67g5heRGpxKNqaHqQcDIB0fawcKXo37G9x6OZw6
         xBWDGhHXz49bIQ0Dt8Rn70O3cf8SY5XjMtH5MeHthSpW74//QoHwr1+AYLlnJDVFcQhG
         vHlCV7MEzzSRWyKxM5fu319QILKsLUk536NvV0CcYV82zRidaAeRPBKNB2Fb3zvDXtkz
         8a/veCWq3MGS5Cz3H9pIBTlAQIYNW7DI3NPh8YDVc+bqV3VmjlcIiAu4GHqfzBm7QIZZ
         G1J+Kmo/zCIAn4gvrNDjCtX66Vec/SVe8/DKAt8LLPspU3ZWNZ7/XK7xrwLOAhLGjG87
         t6KA==
X-Gm-Message-State: AOAM531XmnviGDmnZeJRE7ScqB7EN84XbArrmqZyWv+DOmimEed6nzDe
	bMQLZj4f35FMFUmXABqS4dhFqXbwwq62BQ==
X-Google-Smtp-Source: ABdhPJzIS6aKsBQ4VwYhGBj1XubzOQfOo4bo4kIf+DPS/ZhJCslY7gktEtU3fIw+1R5AYgXB9qZCxg==
X-Received: by 2002:a63:44c:: with SMTP id 73mr14024481pge.128.1613848167156;
        Sat, 20 Feb 2021 11:09:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id x190sm13632307pfx.60.2021.02.20.11.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 11:09:26 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] runqemu: Disable vga with nographic
Date: Sat, 20 Feb 2021 11:09:21 -0800
Message-Id: <20210220190924.3153040-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using nographic, explicitly disable vga since some qemu firmware (
OpenFirmware ) defaults to std vga, and when vga is enabled then it
disables output to serial and redirects that to vga which is by design,
hwoever we expect the console output to go to serial when using
nographic, therefore its important to disable vga with nographic
especially on qemu based ppc platforms

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index dd92a64553..2e31338d8e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -462,7 +462,7 @@ class BaseConfig(object):
                     raise RunQemuError('Option nographic makes no sense alongside the sdl option.' % (arg))
                 if ('gtk' in sys.argv):
                     raise RunQemuError('Option nographic makes no sense alongside the gtk option.' % (arg))
-                self.qemu_opt_script += ' -nographic'
+                self.qemu_opt_script += ' -nographic -vga none'
                 self.kernel_cmdline_script += ' console=ttyS0'
             elif arg == 'sdl':
                 if 'gl' in sys.argv[1:]:
-- 
2.30.1

