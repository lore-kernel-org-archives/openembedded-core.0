Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.49.1620061763874600004
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 10:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RjTAaXcM;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id b11-20020a7bc24b0000b0290148da0694ffso3696951wmj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 10:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Okjmo/E7nug2ewbTAgtIlp0Lii+X46bZCGrExNO5ZCY=;
        b=RjTAaXcMQYJ5/d9lMnZO4tmwgCMewdGhvlxB9ORYAnYN8Epq1qqD2U3vnAQAqN8gqn
         6qsDEwEO+o136qtxyVbtEinNV9DNGQsq7ryrZxM2Avq+j+pvY0VzygI5ve+X9kf16fph
         I44Fis47xf+WISYHWsTSer/JeDR8cvFMFFymYXKXsTZeKwtICgyPBTXQDplB1QUpweqp
         VXl6ZFyyi4dYflwO4Q+Su5fZpxoQAcNc64w1Umg/sAzq9L8HwG4bXkQzmAWaJAB91yN+
         tHcevYy4tnxfy8A+gDyJb/9xtFUoKtuw4ibbcaERuET4urQXOXpadeVEg4uRf96hXC87
         53vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Okjmo/E7nug2ewbTAgtIlp0Lii+X46bZCGrExNO5ZCY=;
        b=VdWCXb/fb30RJvumOmqLbyS8qOk5vcNMZS/6T4mSeqnj2F8T5Y9B4wwlDeYNE7MVP4
         v3vA5RL99CEo5Br6/8oyTwGH6BIfMEiNFREQcuu58UyV8yu0dDEhVGRMC6ILINQaewoM
         zl0Ru0b97B8JEwdVWVSnlONFqGoxGjIwpmmTTAm0xtJFez1jP967BnFzs5OVie+efbg0
         2hXz9bG08Q7kgwN7BuPzm9QQvapj6N1Z4TaR2Bvku5aGSfl0OqRVUBQ6xMVCcOaB2oC7
         ZasbvwW2RtnBbelHEcygF3pVHOr/AdBwvWdUMvcTyV1bdK3lAurKMZKwMaR2DlIoGMqd
         A2YQ==
X-Gm-Message-State: AOAM530n0j4PGQrEiRL5aJWERIhRaB5gSh1pXmIv7Ye+YnZ41WOe6gac
	75i+4rvCN43/r33CpJWZOl5xHib/FCJqUw==
X-Google-Smtp-Source: ABdhPJyjrxmRcqURnWRxcn6+IYqE8x2233k8Txg57mWwka3SnfALkmgMGywueMhU1aJ0ZcBjSivu/w==
X-Received: by 2002:a05:600c:48a8:: with SMTP id j40mr23053788wmp.114.1620061762178;
        Mon, 03 May 2021 10:09:22 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id v17sm12692045wrd.89.2021.05.03.10.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 10:09:21 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 1/3] ptest-runner: libgcc must be installed for pthread_cancel to work
Date: Mon,  3 May 2021 18:10:40 +0100
Message-Id: <20210503171042.123645-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This only affects glibc systems and have been
found on runqemu core-image-minimal with gstreamer ptest-runner

STOP: ptest-runner
libgcc_s.so.1 must be installed for pthread_cancel to work
Aborted

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
index 57a3ae005b..6bd10d2fec 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
@@ -26,3 +26,5 @@ do_compile () {
 do_install () {
 	install -D -m 0755 ${S}/ptest-runner ${D}${bindir}/ptest-runner
 }
+
+RDEPENDS_${PN}_append_libc-glibc = " libgcc"
-- 
2.31.1

