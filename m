Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web09.26366.1621876578915248076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 10:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aDDZ7iAE;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id v9so2118989ion.11
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 10:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8v79oas10zzzHY39dNMuOF+t9vdXY07wIPFyboUFop4=;
        b=aDDZ7iAEx+cdOcUDwMxIWRZsABLZ3uFNK5jtlmpVXojgYpiiS4rvJo+krplgqTjywu
         Eyerq9ZHXCrZwjKPChb9FzoFGSTEin5zJn70tbn+TaPPokK/Wq+ODs6NK/oiXwTdTsKE
         Xdtl1VXxe0NwJ0IoSiZ1U7bJDkIf9sDKQRWugT8iXlc2VYxxyFl9fZZWs+LAFIwQYwPz
         fBeDI3t6r0eY8aVd7FRhoayV9x6f0lzjRbNzeRUeKth+tXDlsgLm30XqD3wrOdsh17wt
         gQzZLuxFjq7Mkf05v2xqJPwknhwYu9zrfrKGmeaRl6wCA8la/fvkobrQm1AUIdBPdC2+
         BXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8v79oas10zzzHY39dNMuOF+t9vdXY07wIPFyboUFop4=;
        b=ADv6UY+q7gaWyShg0ZkpOaodHTgxGEKt4VJk7432QciQ+osiSUxUjY5UjgB2PDG9+8
         nsV2p4Hkl5DOJldQrXRR6P0wfihZMIrIF9n7nCJeD1dJFxN0Q9jyhJ0PCwKeprO29gE3
         TI7dndHKBKgQlMj2Z5sMEhcXvPw5R9nLmjBB97JdXOLjI/PnwvSDYlmU7X9DD8ANikor
         gppqn49qRtZemFPMtpA48OogaGKxzGKVqN5P+qgPkMldpsJaXkgKhLjX9Rz6FmHVs3Qk
         WRKg4RPOM3Qh9UnDNhMsjW4xGadEO+o3k367LD86NBN+zVLCuvdUcjE62PJx2dSmrw1A
         ugkA==
X-Gm-Message-State: AOAM533z1aWNBf5vO3gocP8QBf9PYKWN+pVjUWq5BH+u1/1nVfgCUQFZ
	4c/dKskI+dXmD2q7as67lN40RVZGJkXTTzR0
X-Google-Smtp-Source: ABdhPJy4whguzEDtAVytrOxZD0+ucEFL5nug14J3ACh0xoUACLqpcMZHfrpgs2Cf7AazXBytRN0/iQ==
X-Received: by 2002:a02:cac6:: with SMTP id f6mr26073390jap.142.1621876578000;
        Mon, 24 May 2021 10:16:18 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id j2sm11424103ioj.20.2021.05.24.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 10:16:17 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v4 5/5] rust.inc : Fix for aarch64 feature.
Date: Mon, 24 May 2021 10:15:59 -0700
Message-Id: <20210524171559.190239-5-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210524171559.190239-1-vinay.m.engg@gmail.com>
References: <CANNYZj-v-hcO19SSkYgYKSeOBj7f1u4zvSRkfcx5UAm=ndye_A@mail.gmail.com>
 <20210524171559.190239-1-vinay.m.engg@gmail.com>

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

