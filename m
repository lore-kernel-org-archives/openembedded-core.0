Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.46.1586989848825178119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 15:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vcDtFcAW;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id y24so2053776wma.4
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 15:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2dwsUjjen1uoV9nEe++hmeL2/RvLF0BofCWnnReF5YY=;
        b=vcDtFcAWxMcLWdLpsP+CnzXl0EIqN6Zm9ghBNidsHTx4udLJnG64IEiAMHHqw6Yn+2
         r9+A4z5B4w2oK49KPMvmz66q3KhnsUcu698ce/HEGlTCkZjO/Agv8+Voc6wqI0xzTRtx
         0Podxlq6xVjfjMV62Uxc4IfMdA/W2HtJHXzgqti4Xjv7v0/EI1S08UP6nAozv7iS97tY
         hj1XVSzcXCbSe5mWEcoTO4qhQ7iwS0m2fRtoOPybudu9atEzB5fns8JkFlx0aPaTY2Va
         Obz/tVGud2S6vL49BRfT2kDlYHQSezOJvK86x525qQMmtYtT+WDEQo19XpYtyOTjBf//
         E5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2dwsUjjen1uoV9nEe++hmeL2/RvLF0BofCWnnReF5YY=;
        b=MY+OmxjS/UxuGJ2bOuAD8hXD3oSF73jeAwvY5272yJFFn3uzbELumSVewdFMUIi1oF
         rDFAW4ABDFmQqIhZ1x5TqPosRpoiTRFDdhuwj68z6QCUubr0YM793/8skhiuG2mwPQzy
         1QK7/S3wleqrW4yvuPZTcoXOoLqYOA1pw0Hw7DVFYOkZERqZZm4LsEAONAUnq3Qs2fed
         NfNJVXyKv6vnI5WAmFnvuh4rpmf6Vsq2OrDz4wDd7BQqpMBZUl1138rdsgBORYd5hTbu
         FAnJelFA9gv4b93G+y3uVJQAnqsYl+ECgi0lUqgbSQDkrDTMfKW/RZNdSgewq/cfdIT/
         59/A==
X-Gm-Message-State: AGi0PubrsbVF+YW0x/Ua5407vG1R8yusW/gn4KxCYYgP/w74lCAjsMOI
	XwyJOZdDsKntMi7loUYqm525WwBwxEY=
X-Google-Smtp-Source: APiQypJYQuGMZ4mypj8iWGWAxnDdgWIKvgCTd2WPo59UFUPL/Ca2H1cPkj41/3zdmXtT9hcByGyidA==
X-Received: by 2002:a1c:e087:: with SMTP id x129mr1535872wmg.127.1586989846852;
        Wed, 15 Apr 2020 15:30:46 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0C2E9228F71216A18EC0DB.dip0.t-ipconnect.de. [2003:f0:7f0c:2e92:28f7:1216:a18e:c0db])
        by smtp.gmail.com with ESMTPSA id p6sm17633057wrt.3.2020.04.15.15.30.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 15:30:46 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson.bbclass: avoid unexpected operating-system names
Date: Thu, 16 Apr 2020 00:30:36 +0200
Message-Id: <20200415223036.12754-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For example 'linux-gnueabi' is not what meson consumers expect: See canonical
table of OS names for Meson (thanks Ross). Surprisingly this did not pop up
earlier but wrong system-name can break building as described in [1]

[1] https://lists.openembedded.org/g/openembedded-core/topic/meson_host_machine_system/73023862

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/meson.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 06034e8b47..167263f76c 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -68,6 +68,9 @@ def meson_operating_system(var, d):
     os = d.getVar(var)
     if "mingw" in os:
         return "windows"
+    # avoid e.g 'linux-gnueabi'
+    elif "linux" in os:
+        return "linux"
     else:
         return os
 
-- 
2.21.1

