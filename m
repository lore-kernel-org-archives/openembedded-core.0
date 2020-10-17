Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.9399.1602926854602196632
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 02:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bmFpx7r1;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id c22so6977011ejx.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 02:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=To/mtFOJoqjV6PvzryiwdGzQDT65yhB5uQR0XhePiNY=;
        b=bmFpx7r1aJdQBBhde8vl3btHC9P/+8v8s7A6q7UwHKXqnicMqqFmfvC/jfftCPm3CA
         9qorQGWbD5OMmh6rclTrJ2s34YPW8pRsPJB7UuPUdQGZvf2YLxuW+/s5png0Ik9Y3ByG
         YId1FkWUKVvtm5eG7RUV0r9WWoS0kIwGtDnWNcudqPeIUmsc4+WytfkfITwtZQR/ajq/
         i3nT3LHzESJ66Ps6MvQpFUxcLAC/YlZfi1c09wV4uCx0OcVmW3A9+JHn95PTirvQOFxI
         l4m+0g90HPE3/+jnEKWCXfQDTqPMluBvaU1obpRTOwVe2Sh+zTNblis6jXGdG510rWnT
         XmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=To/mtFOJoqjV6PvzryiwdGzQDT65yhB5uQR0XhePiNY=;
        b=tQaHcbpFRsO0FqgSy3+k5BQF5xC/EwW9U7tWqRlVFtPG2lYIf0sv+xqcaSzzDINgu7
         AjGTsTjCCbJYBlIOqMckTc4vjp/H86+e+BefWQ5vdXakHGe2hhexCknppVhwi1cBs3bu
         ArpeIoPnh9LYwjfNY4eOeVDw/SvYO0kLZl+YjypIzASASeJCCmFipzFQmoJdNJ6MSm8i
         OUswTYfC0B9XTTKky93a9wY+8PyaTC6mO9xwHPxNQhNUhggiuGFm3wgoRX7/wLpKFrMw
         byKXzk/7Vb2hJOycRmjZbru6a+aXtu6z1HrkS4bAHl9hYo50zm0Y9RfeCVTOsz3ZsL13
         Y6gw==
X-Gm-Message-State: AOAM530OXAA7Uv6DP3EPHb/OAcWK3/qJ2JDKua9beLzYqjapCNGIMAzK
	h1rSEMEI38UeBew/wgqg5Fv0h14AX1M=
X-Google-Smtp-Source: ABdhPJxbfbFZItWzGp42wQVo1FKWedm3R3HEHN6WyKFviV9jWH86ojcgt3axgF9b/rZ24+P6XqeE3Q==
X-Received: by 2002:a17:907:2089:: with SMTP id pv9mr8225073ejb.427.1602926852597;
        Sat, 17 Oct 2020 02:27:32 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j18sm4585898ejc.111.2020.10.17.02.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 02:27:31 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 1/3] tune-thunderx.inc: don't append _be to ARMPKGARCH for tune-thunderx_be
Date: Sat, 17 Oct 2020 11:27:10 +0200
Message-Id: <20201017092712.2343122-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* the _be suffix is already included in ARMPKGARCH with:
  ARMPKGARCH_tune-thunderx ?= "thunderx"
  ARMPKGARCH_tune-thunderx_be ?= "thunderx_be"

  and then it was appended again through ARMPKGSFX_ENDIAN_64 in
  meta/conf/machine/include/arm/arch-arm64.inc:
  TUNE_PKGARCH_64 = "${ARMPKGARCH}${ARMPKGSFX_ENDIAN_64}"

* broken since:
  commit 08433cc58abf0cf3e42b22d20870a50287cfb8bc
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Tue May 26 16:10:37 2020 -0700

    armv8/tunes: Set TUNE_PKGARCH_64 based on ARMPKGARCH

* fixes:
  scripts/tune/log.fake-thunderx.thunderx_be:    Error, the PACKAGE_ARCHS variable (all any noarch aarch64_be thunderx_be fake_thunderx) for DEFAULTTUNE (thunderx_be) does not contain TUNE_PKGARCH (thunderx_be_be).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-thunderx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machine/include/tune-thunderx.inc
index aa4d0501d4..d1aaf4891e 100644
--- a/meta/conf/machine/include/tune-thunderx.inc
+++ b/meta/conf/machine/include/tune-thunderx.inc
@@ -8,7 +8,7 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mcpu=thunde
 require conf/machine/include/arm/arch-armv8a.inc
 
 ARMPKGARCH_tune-thunderx ?= "thunderx"
-ARMPKGARCH_tune-thunderx_be ?= "thunderx_be"
+ARMPKGARCH_tune-thunderx_be ?= "thunderx"
 
 TUNE_FEATURES_tune-thunderx = "${TUNE_FEATURES_tune-aarch64} thunderx"
 TUNE_FEATURES_tune-thunderx_be = "${TUNE_FEATURES_tune-thunderx} bigendian"
-- 
2.25.1

