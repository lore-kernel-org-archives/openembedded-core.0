Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.12137.1599702461531039452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 18:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VpKe6pnq;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id b124so3674256pfg.13
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 18:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+7R+Qt8z2D7OCWlTbsRanlsI3lABQkVsM4mPbe6HpOw=;
        b=VpKe6pnqimF3DCgXPRJMUO75tb9AkfGNOIOIrSZKVi9zpZeADDhuOj8tIf3h6ovxGC
         wfuTEWVHGY3n1kdSTYKcCOB4XocGn0yA9IktegtMBnmYD+v/+mzJm1Af5zt1UZ8eecvS
         AdFJfFgI6p+f/ZWIKyHgEV7v4gnuaqP+3P07xiO9cr5WhZIY1X2T5q7DEOUioj4J9cr9
         0OU5De6LeO8FSommb0gl1szyBR9hMpPPUI3x4daxHttzqYf1alJk2ba/WQgwKZhKlddP
         ypadmowQzsnTif3J2ETFpOtfrNAT59fDw/h5/ixH2d+Mu6B+lYwEM0XQTfbssMreHdW0
         i/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+7R+Qt8z2D7OCWlTbsRanlsI3lABQkVsM4mPbe6HpOw=;
        b=DcbR4mMxJQ7VCazz35WSuAWLak5fEdyjkVc1QiwUUbrg+6hHx9fQJL7MwOxfvFOImJ
         ppXqvpb1RQ1sdF+OzMu7ZN/XwLhxtSSMIyCQIMIn0Tcy32bsZYKB1zy1HLJeCay7gaBC
         QrsJJ+lMV/BLejnQgNeqBDq7xD0WjTD2oSHLjsVugRzJ1iNHruo2Evi2CTlv2Jk5M5L2
         fJXFhTHpaUgyA93LSfcX0j7WOGk9HKa1PeTWt4L/zxmFw5FLC9ffySPoFVqRCJffZ+9G
         lMrTJ4N++1TrpfRfLCwIaAL6nSFnQlSLyW/Rzde9tm0IG7VQ8xr0/va9LBCJ9hBd58e7
         Fekw==
X-Gm-Message-State: AOAM530rnl5+BjHYByirRENuAoTGvyWe4lTVNHKAFBLfYCX+frDra9xT
	gwxyMyWzDN5yMmMcQmFOO+gYi55qxWCM0w==
X-Google-Smtp-Source: ABdhPJyg66uCSFxS7xu1jqyOB4TwzTAJvBmTFetFK4DWrU3SJBNKx0jwurBOQq1EJSWr0f4yv3IcTA==
X-Received: by 2002:a63:d242:: with SMTP id t2mr2690654pgi.47.1599702460701;
        Wed, 09 Sep 2020 18:47:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id br22sm352852pjb.35.2020.09.09.18.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 18:47:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] libucontext: Recognise riscv32 architecture
Date: Wed,  9 Sep 2020 18:47:36 -0700
Message-Id: <20200910014737.779020-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910014737.779020-1-raj.khem@gmail.com>
References: <20200910014737.779020-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/libucontext_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/musl/libucontext_git.bb b/meta/recipes-core/musl/libucontext_git.bb
index ec988f1920..734ad9c953 100644
--- a/meta/recipes-core/musl/libucontext_git.bb
+++ b/meta/recipes-core/musl/libucontext_git.bb
@@ -43,6 +43,7 @@ def map_kernel_arch(a, d):
     elif re.match('p(pc|owerpc)', a):               return 'ppc'
     elif re.match('p(pc64|owerpc64)', a):           return 'ppc64'
     elif re.match('riscv64$', a):                   return 'riscv64'
+    elif re.match('riscv32$', a):                   return 'riscv32'
     else:
         if not d.getVar("TARGET_OS").startswith("linux"):
             return a
-- 
2.28.0

