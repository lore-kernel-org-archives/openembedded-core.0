Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.3494.1612388482624885625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 13:41:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OkfNbg1z;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id gx20so494597pjb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 13:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HG5cTtccW9ZPPBVMwiClNpwq9LkjPg3yYLRtSlw6ooc=;
        b=OkfNbg1zDrjqt1nJer3rK8DjGZ5CQpKzWJv9MDogAGNGDmdVnGkV+2XuxywCQcur7V
         2DqRmf8ZJf43uLtFabwF60GyE1bt7GWRhHUW1Tlgr+CLnuDJgHl6Q9+0bi+MqHt16Vxk
         ES+0+dQucPMVQPyNO5uTpmt4tQEhQjT8aJhsuL4gPS/kLusWRjUB5TX/TEmsxbKih0dG
         XR4HwLOf9u9fPkzhyu/8RgUXW2SbMcmVP6tYfShlMuuVYI0/3EkVzIrRB9TkrLTIRoah
         pcQCPTdwv11vw1ns/eKL3OZEvevRa6kdCI1znudvizwK5Txqqi6+qhUMRaekgUR9VnEE
         Qtbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HG5cTtccW9ZPPBVMwiClNpwq9LkjPg3yYLRtSlw6ooc=;
        b=nFNVXCfBNfXG/i+AObC/dgwquRWLskA4MFm5By1tRkLKYsYfXSfZCc8wEEtXW2GbKM
         QcsV3T+E/Biprf1nijTYynxck9XYxodmAKjMrCQoal8rHGCq4SUvdPb8PmsJGhr9ld/G
         Rv3Uop4TqlEuFz0jU4NGgui4ZJTDWY4hf0TRkd19ysNbDiRkzLMwhIkqb7cZXgTM8zy1
         nGQSwEgFAySEZTY6u5lkC4Tid9bwbDKRYhTc+FzrCqCNCfCJqG7XsvQpEGk0Z92BRSPQ
         EtV4wz+pqkauOcb0EqGFBjOPeT4yNcgrUnIvGTjwGhtr7zQ/wKMS4f/8P9IHiHOSOmnT
         rUgA==
X-Gm-Message-State: AOAM531n5Qs4NtbtYN9KyG7bUe55MXvtbIvzz260+pxb9+lHR3t+c+3/
	o5tCSxAsBcwsQru1skFs5GOo5R307gqMdQ==
X-Google-Smtp-Source: ABdhPJx5V13alA3la8WmgJo0cPSRQKqdfT4B/nUe1kst0WXlXEyVhXgrCf1IrAr/WttJAJtJ6gZYCw==
X-Received: by 2002:a17:902:d113:b029:e2:86e9:c1ee with SMTP id w19-20020a170902d113b02900e286e9c1eemr4724567plw.42.1612388481673;
        Wed, 03 Feb 2021 13:41:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2914])
        by smtp.gmail.com with ESMTPSA id r189sm3870601pgr.10.2021.02.03.13.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 13:41:21 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Enable cet
Date: Wed,  3 Feb 2021 13:41:18 -0800
Message-Id: <20210203214118.2503823-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Intel Control-flow Enforcement Technology (CET) instrumentation
support

helps with overcoming
/lib/libc.so.6: CPU ISA level is lower than required

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.33.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index 2259d60196..b39f97d656 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -74,6 +74,9 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
+EXTRA_OECONF_append_x86 = " --enable-cet"
+EXTRA_OECONF_append_x86-64 = " --enable-cet"
+
 PACKAGECONFIG ??= "nscd"
 PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
 
-- 
2.30.0

