Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web12.10066.1622217204673012596
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 08:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GQLx2pcD;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id f16so1826272ilj.10
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 08:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8v79oas10zzzHY39dNMuOF+t9vdXY07wIPFyboUFop4=;
        b=GQLx2pcDYDDI2Nvrvp6ghfjG0fRg+65X61SLPO8waI7t9lN6a5uk/WKoVejEToMauQ
         pDT0dSyUUDppPWMce/Ku426aGKccQjYx/98C5a8/1Oq5gT8uqz3zZS3vXpErXQBZk0IP
         XOdj3FDBpr4fj4XNwcj++Y/cE/XKpNbEyOPZ+5Nm9w6UJthpoEyxBYE6Ogj08Id2NDCi
         cijNnfX+9N09EU79oDa1eNMxXgaKsFFJdPD/3I+5rMbt56ahu+Gyo7U8mzbY4DtwYwNt
         RfDs+N2TEVvCkAeO5tnj2fP8s+oUCGnnyxwD5FT4bdjc0B0hB4VDWWDH6wH02uLZV2kw
         /42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8v79oas10zzzHY39dNMuOF+t9vdXY07wIPFyboUFop4=;
        b=iSAnCQ52enGFUZHn7ITSMvlkYgosdZ9X7dxByvEMxY0FdvqCH/zmaoWXbYiqsniDN3
         kncyIwOEKC7cW1lKJmJLZ7qa3tm54fv+r23PAfZepTEH531BPOZuP3+efUnytUZfTa3y
         XtggsePCOJSHbVePrYFCVjWvfORPjDpQPYryUG4h2sx6RJAmDqlJ1KQb+wFR/Uj7EHNR
         YXknPEo52qQMHoCq7Q/9gR2cvjUFjdUuV8lZ625/8U97PGTd+NxCYfzon+c77qMdcd4W
         8XZUR9vB1b9FAuae9iEbNEJGPUuinM+lrGKTj3b5YgrdTu99QUDrdd3rTfVI/4ujxh7B
         jqYw==
X-Gm-Message-State: AOAM533wRtLxNiPMw2XxSdPzEEUnDDR9sfvyDQVJ20KphEjK9iqeLcNX
	wJrvfpN2KlBFQvvxefMzk2WyjyFkIxRrMhvG
X-Google-Smtp-Source: ABdhPJwnuLZ1MU2+w5fPJ+bMl3EM4bzq+pkhddWSjk8WIVmbbK9DoCrQ/cDLzg7LkNyfwswF3BYuVw==
X-Received: by 2002:a92:d48d:: with SMTP id p13mr8036271ilg.236.1622217203763;
        Fri, 28 May 2021 08:53:23 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id z8sm3367965ilq.30.2021.05.28.08.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 08:53:23 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v6 5/5] rust.inc : Fix for aarch64 feature.
Date: Fri, 28 May 2021 08:53:08 -0700
Message-Id: <20210528155308.354567-5-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210528155308.354567-1-vinay.m.engg@gmail.com>
References: <CANNYZj_RNDuTY2+dMuQBAByh_01Yj7_nWwwv2iO_sU-r+qvw_Q@mail.gmail.com>
 <20210528155308.354567-1-vinay.m.engg@gmail.com>

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

