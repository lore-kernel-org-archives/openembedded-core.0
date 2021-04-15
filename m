Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.4622.1618479290679262478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 02:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DvLFFdh5;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso7059019pjg.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 02:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Mc1FnMCGBPvrm8J5JRRkgVIXAhebze2ByCjhN01J3eU=;
        b=DvLFFdh5BedtlPshQ5/WtXlCjcjAXfrNALCsWuxxJZBSrfoKG7RpqUrosVWuGVLa6G
         bbN7DlaOomHrfVw0ATGCcorHu9jFcmO0wPxO7Ibqg3ASfOABoQrVpK4z6o60GA5jwRNZ
         WKLjVzs4fEXbpWIWkKg7s5R0yGd596TIrYtGzOOhPJjcV7TfLSF9hEKYZgF/hW4HYy+j
         +akjGIIcoFXEFo7HC5MnIb2SYkrogc5czQUHHVf8AayJdYd8m+9r9qBh86TEe2uVJ5b+
         E+XMaOF5emK5uLN2b0SsT9nc3WBad/5ZWOWCB3YK+ipptkSiUclpWdYUPlkgrbRLTn5P
         AU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Mc1FnMCGBPvrm8J5JRRkgVIXAhebze2ByCjhN01J3eU=;
        b=FI6gHIVkQ0ot1I75cunJMdB7yKQEXOE/VVWfTu+JwXA0+ezZyPcjDuc23aldJNzBYq
         mo+r0FuijrOHxWfVbnK9isQunH3ftI+FehptfYhUIeH5Erc+lD34wyIWOpzz3oBUhaon
         Us0x0u1f9rvocSxVroiCchOQTN3x/qOgRi8H3lI04UPfQD4im9oR3yp8ZVl4ALUgOZNh
         nzmK86RTHsJWb9Gp1mMnqHu8sZiJqrhjZuFPGk/4LhhjfBpIOIlLqm6xnjYarnpTYHYL
         3JD5GPegUG9rc3K/kx+qVeIyHNwOLjDNzNWILXXm8ERxBBliJ1zA1oczFPdYV+phr3zh
         Eo3w==
X-Gm-Message-State: AOAM533ukBblnKJHL9Ei/PlBe9qiXUlXa5Um0KKkCKAHPanF9GwzTdQ4
	XMU51WQmdDc+KqG5eCxtquSJ4zBishBbGBFv
X-Google-Smtp-Source: ABdhPJypwBSDijDlvy5R8i/+JEqY4QEyy4u6g8knObth8hD9Xj2kwHiCCq/yxgx557A5do8tb/C2Zw==
X-Received: by 2002:a17:90b:4b92:: with SMTP id lr18mr3009888pjb.86.1618479290086;
        Thu, 15 Apr 2021 02:34:50 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id ms9sm1994851pjb.32.2021.04.15.02.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:34:49 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH 7/8] These changes are to get the rust target triplet "mips64-unknown-linux-gnuabi64" for mips64.
Date: Thu, 15 Apr 2021 02:32:26 -0700
Message-Id: <20210415093227.175608-7-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415093227.175608-1-vinay.m.engg@gmail.com>
References: <CANNYZj85zmWjRe2KR53u_eF-DDf47eR9eOJnP1Ch0Df6COoAaA@mail.gmail.com>
 <20210415093227.175608-1-vinay.m.engg@gmail.com>

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/classes/rust-common.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index ff7b9da8f3..87fa397c90 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -82,9 +82,13 @@ def rust_base_triple(d, thing):
         os = "linux"
 
     # This catches ARM targets and appends the necessary hard float bits
+    # Also, this appends "abi64" in case of mips64 target. Since, rust mips64 target triplet is "mips64-unknown-linux-gnuabi64"
     if os == "linux-gnueabi" or os == "linux-musleabi":
         libc = bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hf', '', d)
-    return arch + vendor + '-' + os + libc
+    if d.getVar('TARGET_ARCH') == 'mips64':
+       return arch + vendor + '-' + os + libc + 'abi64'
+    else:
+       return arch + vendor + '-' + os + libc
 
 # Naming explanation
 # Yocto
-- 
2.17.1

