Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.10405.1622218161672246200
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 09:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E3IzFQLB;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id k132so4706116iof.4
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 09:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8v79oas10zzzHY39dNMuOF+t9vdXY07wIPFyboUFop4=;
        b=E3IzFQLBrJKr7mMLTcfHngJVqHlLBCRbtYzxPFByl67Bs7q5isbFOKXxsgkPc+evh1
         3iibW5XSx2Ai+YfSjCv+LSDoWlC3P7e/y3/9TU4uiMMzv8Rql2TwMTMO5/jRbnlmMCx3
         p4QoLqZFlt4hxU+fh8R4ctkxql05CeRSC/ybU0LvEqThE6VPCDqgic/7KXJeEHF7+apf
         4yxHI5/09X2b+g3iKx4Vo86qebIjpCa9uqkpPwggqR9344JiBjDQGaC59nYEI71wC6Zh
         Fone9wiHTAHBgXSzrqwFrJ/4vYSL4P5KFqYrN6cDPB9hyfqr9sq0Ac9c7wsNbgHt6iV/
         AJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8v79oas10zzzHY39dNMuOF+t9vdXY07wIPFyboUFop4=;
        b=q1RcbDFVBj8NiMxAQwaiZ6gY9MyA8FkLIfEpsa0Wn64ykqZIg/JvpEpDY4OwjUYlFZ
         vGTeMPSgteG7Z6bzp6P5xZ6Zcf2Cem0/eY+cyAESZQiSCIDGqesP/WGisfGlMa3cZ5oV
         UnNVErQRPas3qMtZR0cFkSYr2z1GhAfGMq6J60yur11Fe6qCoZoSMBC641Q5Eeq0BmrN
         w3p4hAPBMSs4oYgp4lrOVCnhViGF/IzKVTWM9Pt15BwWfBvNRmkknkISn7tMpDKiLx8H
         CNKhO3HNF+8lXkzUnxL4jQ9w+3qy2Po0DIR57lChAL40SfW07blJevQFaSVjH/wHDns7
         c5rw==
X-Gm-Message-State: AOAM531QIM6sfsdKcH6d+L0PBnyxMRO097mDgy6Qol/kZPCMZii02Gzw
	wmPxHp1ZfF7l77PwUt0PcK9RsL811oe7NYvn
X-Google-Smtp-Source: ABdhPJy0J++6Axo0iQo7EJl14htXT58WzGRBGtSfGqoZYeKD3up3NpeELgf6DUYdNNeC7+uLuWjTBw==
X-Received: by 2002:a5d:804f:: with SMTP id b15mr7602933ior.187.1622218160737;
        Fri, 28 May 2021 09:09:20 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id l21sm2975022iol.22.2021.05.28.09.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 09:09:20 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v7 5/5] rust.inc : Fix for aarch64 feature.
Date: Fri, 28 May 2021 09:09:08 -0700
Message-Id: <20210528160908.394290-5-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210528160908.394290-1-vinay.m.engg@gmail.com>
References: <CANNYZj_RNDuTY2+dMuQBAByh_01Yj7_nWwwv2iO_sU-r+qvw_Q@mail.gmail.com>
 <20210528160908.394290-1-vinay.m.engg@gmail.com>

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

