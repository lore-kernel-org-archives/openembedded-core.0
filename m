Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.10152.1619891225625871611
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 May 2021 10:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RSOlEt2L;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id f6-20020a17090a6546b029015088cf4a1eso1005026pjs.2
        for <openembedded-core@lists.openembedded.org>; Sat, 01 May 2021 10:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yjYYZtwud3zSplU0NwFrebwuNYBQbwurUs3wWwd+g3g=;
        b=RSOlEt2LyKx1ud8MhlOTw/FvkZ3W4gn3+0rm29Tz1vydzsnnwMnjKT9OJWkeGPyAra
         ut7GqvLbhR59HVzcgAq5/bt74kcQ6c/O2EOB8xUOeCLAqMm5jccaRLJJQ2YURMEbQpcI
         jhmhB8UAk2SYAQKzZ1QgEA5RlSGL/YIsWRrOai1UdJF+Znc6Oiw0x56ouE+HPcntRVmh
         xzO8D4xalhZFKpExWARAL4RsrxciGfCHSqcV8xPYUAEC78UmCrXcqVFDMpYpPiZqpYL2
         Z8e+cKi68EbCSb3QXwfzvywuMceMZ2y6kF34VpxzR+Kp0JioSrioj4m8u15rTxIfGkSk
         CSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yjYYZtwud3zSplU0NwFrebwuNYBQbwurUs3wWwd+g3g=;
        b=VXYUlRPgUCL+G0EcLwSrryI66YpHugUevAV+2G6RbertspFdJFUZ2jeS33/8R++j9a
         0mkqyX6pvotlITslgGZeLe5IGZ9jED/SUv3dG0HGXKxRiydGA28kuqGp3uuzTn8Z7l0w
         M5Sf6VIveqtL/KlQzVSYbBpx0D6HpRuTbCoZNltFe7zTb+oeJXR/Cr+0MShVvhHEG5Wy
         LpqAUmpFXc+S2hPt14mJwIxXWF7j7ABzvCRcKIwrXsz8zZo9nvNVshgKgYUIvTIbMmng
         6jwxbGg42BOxVLifythQNnJflQsMKaWmtNMEkrc6/QnsADpEOl9qGE4ekzjiqcnOZBda
         FEJw==
X-Gm-Message-State: AOAM531tKy+TkuTDo2MZPnsKp2JQnztnEx8tD90xZa7Oc9vypfhzboMO
	m6QvmxdFl5kNpb/AbQ9Sx0iO+jX8CzTi3A==
X-Google-Smtp-Source: ABdhPJymIJkruRzk4eIpJKz56A4rJ0OvjDp3kkJqmufWJHQugfcgNL2IlY+12roE5sL8TfU3oXhaYw==
X-Received: by 2002:a17:90a:d512:: with SMTP id t18mr19317054pju.108.1619891224971;
        Sat, 01 May 2021 10:47:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id h9sm5750098pgl.67.2021.05.01.10.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 10:47:04 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] valgrind: Disable leak_cpp_interior test
Date: Sat,  1 May 2021 10:46:58 -0700
Message-Id: <20210501174658.524270-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210501174658.524270-1-raj.khem@gmail.com>
References: <20210501174658.524270-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This test is known to fail and especially is prominent with GCC-11
where stdc++17 is enabled by default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.17.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index 4eb948f2db..ebbd83dd3f 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -233,6 +233,9 @@ do_install_ptest() {
     # https://bugs.kde.org/show_bug.cgi?id=402833
     rm ${D}${PTEST_PATH}/memcheck/tests/overlap.vgtest
 
+    # This is known failure see https://bugs.kde.org/show_bug.cgi?id=435732
+    rm ${D}${PTEST_PATH}/memcheck/tests/leak_cpp_interior.vgtest
+
     # As the binary isn't stripped or debug-splitted, the source file isn't fetched
     # via dwarfsrcfiles either, so it needs to be installed manually.
     mkdir -p ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/${BP}/none/tests/
-- 
2.31.1

