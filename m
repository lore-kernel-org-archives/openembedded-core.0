Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web08.4011.1622103099677317882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 01:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lxDwgT/L;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id r4so3908556iol.6
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 01:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8v79oas10zzzHY39dNMuOF+t9vdXY07wIPFyboUFop4=;
        b=lxDwgT/LSd2zHqO/HE627jzBXaMRvrvXspsvwLi7NdcWE+BrW32wXFwkt3I0cG/gbe
         D8YD3Se3T7s/afpn4PN+oSKq4uimebNM0+Er7rlk8PL6TO7HL8j+gwvCGwtJYapVxRE1
         TuakapOzNdLmU57WX8Tv/NPHKVDsPdqhb+l0CqtzYvex33Xx9NSUqn+v4Sm45BG1Bx2q
         jZtHDl6JLu9I0p3L3y2H0nfXDA4FXCG3sXIcYS4j2Utjt4/eI0kr0vlP02jktvfOAMIS
         9ix6dKO1hYshbGmkySra7ZSlerpUYOziau8K46efyw7eEFVHMjpNMdu6R0ER8uPVtT30
         eKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8v79oas10zzzHY39dNMuOF+t9vdXY07wIPFyboUFop4=;
        b=oTsKs5j4vkFzNWkb+YbGP1Vns5MDPKySZgUOOfLUKna42wYJrwgUCzSOLgFlhT6bEj
         zmQqwEQi7h6eu02/aa3aa+QuFMQXorU0r1DjZGkdtwWKvhcyIgP1Ya/t+qd5gNa6h5AL
         4wR/85vRuJHYlSENtioh0UU+mstQHreGMvLYKm14GmKo9JK42TSVVfkgtbkglscqpOhw
         v/IxStxzu+j7FDcwsEKdKwyoEBhw4x/Kdhl7AUDTn3XkV5VJqINsXOfhB3uYSPOqB166
         bA7PnWcHdXqiIexnEC12C8trF35uIgRqJ6VgmFnfv5YtfRsK73CLyOhbylIddGldXBXI
         a9Kw==
X-Gm-Message-State: AOAM530lT3NaNcqsnvwucRiSCdZ7il8Sc5wa4LAen3EwSbuu6R47k4UD
	QxeEu4+m7K/TcE84n914nJEdgDKUoqSyI+Kw
X-Google-Smtp-Source: ABdhPJyvrO9q3pC5+Y5w1GPO7V08If4qACHkcRGIkaic0QnCuC8J+ReJL/4OwEITVNwUfNwFAw6YOw==
X-Received: by 2002:a6b:e90a:: with SMTP id u10mr1924768iof.9.1622103098720;
        Thu, 27 May 2021 01:11:38 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id p2sm804981ilp.17.2021.05.27.01.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 01:11:38 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v5 5/5] rust.inc : Fix for aarch64 feature.
Date: Thu, 27 May 2021 01:11:00 -0700
Message-Id: <20210527081100.1213973-5-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527081100.1213973-1-vinay.m.engg@gmail.com>
References: <CANUMPcVo=iH43q+70zHnsm5ktJR4D4AO+KZEzj8=0AQNaYFv0w@mail.gmail.com>
 <20210527081100.1213973-1-vinay.m.engg@gmail.com>

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

