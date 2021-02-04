Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web12.3103.1612474728121532174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 13:38:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MjhNC4Zu;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id u66so3372980oig.9
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Feb 2021 13:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gHJMmFHVVvQTHsAmmJVBsc/mMzhZ2QTJiMzwIoGxTg8=;
        b=MjhNC4Zuk7tJion20mq83JZHAh6p5iy5a8eT3DpjeJVZa/v+81H5iY/vrF17IuGtFE
         ahfCQgV8bwxS4stSUkOpFz3e8+jRGtk3/d4fLApedT+AViEi8FZWs1CXCMTO/BXPDn0f
         mphmNe4DA2rPNuTedGR/Y/wgrSy9XyY13keuTkGPVex1ORAAR/b0X0+8cyrIiJStfDGj
         qwdZ6CwyvIIYqDSmEQgT9Fmguq3p+4ozPhJVm94Wav3MK6fYm2eNM+jVuyqF5i5N/mIq
         VjQNo7Pr/ybqqlHpGm8tPWs1mJ5zFVRrM6utLVRkn62Mbnb3S+5OP8WjRjOLm+/q3qhV
         NAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gHJMmFHVVvQTHsAmmJVBsc/mMzhZ2QTJiMzwIoGxTg8=;
        b=GY//hmLn1IxoQyTT5TkqMl82lV7UUD52Ng9ZVRc7wCIcm0uVpNHRfkGXzGxdnEqgLc
         Oc3c/Tjfpkh7zyBnpmanVjF5NzmHpxNpdkL4UvAPOKwziF1kJLgNAZRX6ep2Knk2EXEu
         Av6wCZgUjkfXIFtn7atd/Q0FZGCZIVHeo0siJ4j+GGzhZL2kVQqadaGTowyYFrj29ruS
         VzMYKFmRR70MSOaJ4D0Cr5fVPeNXoNw/qmivqvp/EWrshi64WszBHmPX/CaULXazLDN4
         Gwf7T79lJv3Fndb/7hq+0BEynKqL6j+Vc/HemfAllBo/R8dnp3DSkJI9So9sSWmclacK
         f78w==
X-Gm-Message-State: AOAM531/qskeeIfvL9+V7INnNrtteMt22IDWzZXNvM1xItddw+qY8Bep
	0nL09UdteDcAkxBmAO8GvmAokM2UloU=
X-Google-Smtp-Source: ABdhPJwEVAYaZk5zINcP6r+G4hGl7Yz6ZUM8/XqOR7Ow1e4lTefbhCepOqeKg79W/W/sQNv/4VVx6Q==
X-Received: by 2002:aca:fc03:: with SMTP id a3mr1037422oii.22.1612474727277;
        Thu, 04 Feb 2021 13:38:47 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c18sm1351923oov.20.2021.02.04.13.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 13:38:46 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] bash: Disable bracketed input by default
Date: Thu,  4 Feb 2021 15:38:41 -0600
Message-Id: <20210204213841.8397-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bash 5.1 enabled bracketed input mode by default, but this causes a lot
of problems with automated testing as it can inject a lot of control
sequences into non-interactive output. Disable it to cleanup the output
an preserve the pre-5.1 behavior

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-extended/bash/bash.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index bc737acd63..db326660ea 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -17,6 +17,10 @@ CFLAGS += "-DNON_INTERACTIVE_LOGIN_SHELLS"
 # This can vary depending upon the host
 CFLAGS += "-DHEREDOC_PIPESIZE=65536"
 
+# Disable bracketed paste mode by default (enabled by default in bash 5.1). It
+# causes a lot of garbage in non-interactive shells
+CFLAGS += "-DBRACKETED_PASTE_DEFAULT=0"
+
 ALTERNATIVE_${PN} = "bash sh"
 ALTERNATIVE_LINK_NAME[bash] = "${base_bindir}/bash"
 ALTERNATIVE_TARGET[bash] = "${base_bindir}/bash"
-- 
2.30.0

