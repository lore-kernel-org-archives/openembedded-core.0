Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.9144.1621603775670049555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 06:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dM1Uo0yP;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e14so18181074ils.12
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 06:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8v79oas10zzzHY39dNMuOF+t9vdXY07wIPFyboUFop4=;
        b=dM1Uo0yPeb/ifkkLw2WdPyrvtsZDufXX3V1Ur9ci6WyQvcqs+qEi4rLduxQdocd9Dr
         261yGYjQt7Z9kHPbXMCq/hj+M0IwUeuAU51lUIyNEGmw0HoeEZ5atPQ0xsRoYM52N6Ct
         gzV/Jbz66bOMPfa5pCgsJtpGBowlKuoBC6fQnYjnCgyZBIdrEDwUdBDg0oxTfFGlrIbK
         BFmWsZD2PNeWeixPI5yeyds0kCMTnx50UVky+xuEUFC/VyKI62FuAhx/niMuWrACCWlt
         4niLrWl3IhOMn4ACPSPKsGoiMVjmf2Vfm6yxi6dUwiE+kKC/Hswmu17bPoGGFPtdQRkR
         UGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8v79oas10zzzHY39dNMuOF+t9vdXY07wIPFyboUFop4=;
        b=Fp0xH6vH5S+BOTritXefzJYF4z89HEvQ9RrjNmkxqKYoK139Sd2t7hroN1nLOMmiTS
         3+a4Gvy0UPJ3lb7tmlihnFGxlwvjgUC9IfJvTfuubEvieAfGVHVwfiVlM0PZoJgm1APb
         ZF4tKFrmwhwgfOPa9olXMvBBDW0P6Dp4LydWb5yhMOU68G0qqHztot1cBed8t7M42Qj7
         fyykKR+41KBoqQAj921OeLt3yoaQL+bg7xus1lJWLuNPRWwtEnUbsbSF1aZyIcQ9WAXu
         z6E+DrAjpWBb5qPsoiJsrA5WILBbXcJzLif+MXeHqlYL3TESOaCJVvlyNLfLiKHsmFY7
         s2bQ==
X-Gm-Message-State: AOAM531wysIVXYgYrNDR3SdijQOTRkxjch/JBrVOMf00eqxJDpcI7by4
	Tko4aq/dq/B393waNqH4ooixvjE+BXOjUjve
X-Google-Smtp-Source: ABdhPJxWpcW7yu96vzxXxhgnhDZB/ArdBHS3CMlj2eXvyQQ1Mv65/S1BYLSljbdKL0KVTV31wDMdAQ==
X-Received: by 2002:a92:ce07:: with SMTP id b7mr13331179ilo.94.1621603774701;
        Fri, 21 May 2021 06:29:34 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id f8sm1165202ilr.12.2021.05.21.06.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 06:29:34 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v3 5/5] rust.inc : Fix for aarch64 feature.
Date: Fri, 21 May 2021 06:29:14 -0700
Message-Id: <20210521132914.140884-5-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210521132914.140884-1-vinay.m.engg@gmail.com>
References: <CANNYZj-yODhEEFErtUxBeiw3O1YvEfV-hGOOW_uPNvo6x8mNYQ@mail.gmail.com>
 <20210521132914.140884-1-vinay.m.engg@gmail.com>

While executing ui testing observed failures due to below warning,

"'+v8' is not a recognized feature for this target (ignoring feature)"

Same got fixed by backporting below patch,
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rmacleod/rust-wip-2021-02-16&id=f243e4bbd5414ce519336753a68c53ee60cbe89e

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/rust/rust.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index ee3176b559..fb20bbd0fb 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -64,9 +64,6 @@ def llvm_features_from_tune(d):
     if 'neon' in feat:
         f.append("+neon")
 
-    if 'aarch64' in feat:
-        f.append("+v8")
-
     if 'mips32' in feat:
         f.append("+mips32")
 
-- 
2.17.1

