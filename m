Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.7966.1630502597030557778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bjlKPsEx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id q11so4472444wrr.9
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yIPXUUQGZ8Why2c1ceoClIsifRecKHSxh0+eXLXmBGk=;
        b=bjlKPsExA+QY8BjqYmuo7Ww6VLGNLI21l/Sewk81tEJZu7LGEEwQ81Fuibo1kIMPpv
         R1NKJXyfLxoYQ2VnWH0KQR3jWFbpPzfDFBd4/K1k77Rkw8EAS2Y7WRe9/N1RcZn63H8A
         3uM3BDuUXPVnlVU/1xhzbxEUbCoTirLSomJ3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yIPXUUQGZ8Why2c1ceoClIsifRecKHSxh0+eXLXmBGk=;
        b=TfWmpsqalslbnIT7MRHFyjY04W0/ySn5zp4tBLxx8d2FMAuaG+QYU905L8bp42rW63
         5xJdAlv+zUi/2sFQobTBE54u4YDJCZ4pYEHv8zRRSU+/IeWF/iLurMtSCPbbfdA3mooJ
         nFEurWgIq1OyprjLOEOCMKwFRTBx/bWN3KzEwlX9yfwY659CmmuWVgNQpNd/euaxyfZz
         U+CQVk++baQEvIIsqP0hIpaifQmwtsZ9qhH2xt9/mlfVcxs/VcVrv5iHd+vykH0GOp53
         /VxxdJqTrWW0oKo8GQqANc0YK/mXV0rIGdBCDXFqVindtRZinbuedg09ixRfTy4JXbjE
         n5IA==
X-Gm-Message-State: AOAM531i8lWqIsW93Mps/RJ4jwnKDu7FXtkYnZBr7qz1jL+U7BFWILwL
	B/xFEbD2xP1+HlU2oa23MSJn4XK32ys8xg==
X-Google-Smtp-Source: ABdhPJzNG8jKg+Jl+0dqXbQ7oexNQ10mrhHRXj6istYAfocQiAwSm3DDsCdL1TDyHTEGwU+u7v+S8g==
X-Received: by 2002:adf:906c:: with SMTP id h99mr32242095wrh.8.1630502595160;
        Wed, 01 Sep 2021 06:23:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7e06:66c6:32e7:e304])
        by smtp.gmail.com with ESMTPSA id z137sm6098786wmc.14.2021.09.01.06.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:23:14 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH 1/2] uninative: Upgrade to 3.4
Date: Wed,  1 Sep 2021 14:23:12 +0100
Message-Id: <20210901132313.901890-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Halstead <mhalstead@linuxfoundation.org>

This adds a patch to glibc which allows it to work with Docker and
clone3 syscall issues cased by EPERM vs ENOSYS.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 76f4cff565d..3165fc93b89 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.34"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.3/"
-UNINATIVE_CHECKSUM[aarch64] ?= "372d31264ea7ab8e08e0a9662f003b53e99b3813cc2d9f9a4cc5c2949a1de00b"
-UNINATIVE_CHECKSUM[i686] ?= "36436167eba8a5957a0bf9a32402dd1be8b69528c1ff25e711e6895b583b2b42"
-UNINATIVE_CHECKSUM[x86_64] ?= "92b5e465f74d7e195e0b60fe4146f0f1475fff87ab2649bf2d57a1526ef58aec"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.4/"
+UNINATIVE_CHECKSUM[aarch64] ?= "3013cdda8f0dc6639ce1c80f33eabce66f06b890bd5b58739a6d7a92a0bb7100"
+UNINATIVE_CHECKSUM[i686] ?= "abed500de584aad63ec237546db20cdd0c69d8870a6f8e94ac31721ace64b376"
+UNINATIVE_CHECKSUM[x86_64] ?= "126f4f7f6f21084ee140dac3eb4c536b963837826b7c38599db0b512c3377ba2"
-- 
2.32.0

