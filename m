Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.504.1621543751319154070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Piki5jc3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id u133so9945355wmg.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/oEqGyn77zUeXH9UTJ6MnLCqnf0EjXp79ffxtP/pr/U=;
        b=Piki5jc3aO4gvTOaInZiPKs0Uy5ePBwZbZX9wJR9M/K9WSvR/flFhK2Fpz3zjpm6hW
         PC7RgrSPZbEsrPs2GdAkj4WB5FyAUPsXnnigvXbCLwqyRs8rpr+tWAjMMxUUwsGQdzEr
         V7GPCXmO+3KnQ5bDX9oQ7KaphR19yNR1nE9Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/oEqGyn77zUeXH9UTJ6MnLCqnf0EjXp79ffxtP/pr/U=;
        b=QTbhsn7qOfr6EZt4Lj6YuucpMz+wr6s9JhyAOg+rbuEiCyo04Bg4rOd3OHIxe9u6+y
         tnz+5cvMEwC9lk1Ef0D7ZUPQpyYx9CjCbF08IxJTcCGjElLtRFxu3VSqf0tnxvFV055c
         ZimidJfZiHlHWbvwQV3XRQpkxT5vjXs34D3g6vMt73MJN51RKL78YibHkjtIYY3+qTUS
         1gxNJLLRQvHJCl9dsaQmQFjDJeD6a2XJyU41P00T1iqsey8tRZkuqLAH4W8sqNvw2AK3
         VVf40DL82d/dI64UePOT78WY2YMNY1ky1o86booOw1QbeCCZhIMdH+VHZaiSRxyeWcxb
         4dFA==
X-Gm-Message-State: AOAM531j5J1ueFcN/Gs3Zzca/HY+TU6IhXpI3+5ZhoQK70bm25RsBlGD
	7+2KOL4VdXgH9JCHNSTBu55Al2j95JIL9Q==
X-Google-Smtp-Source: ABdhPJzwEHNBJJyFOE+19L6AUjwopa41xOtkiSTmNxeobeTehOu5oMNI+aNgYgOVxR50UosUXQa43g==
X-Received: by 2002:a1c:a949:: with SMTP id s70mr5908662wme.30.1621543749871;
        Thu, 20 May 2021 13:49:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:09 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [hardknott] [PATCH 12/28] qemu: Exclude CVE-2017-5957 from cve-check
Date: Thu, 20 May 2021 21:48:46 +0100
Message-Id: <20210520204902.2527687-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CVE applies to virglrender before 0.6.0 which we don't have.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9b5355375d028577de0b98e05992de6a088cb972)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8b8cecd7a0a..e1c1bfdbfe5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -65,6 +65,9 @@ SRC_URI[sha256sum] = "cb18d889b628fbe637672b0326789d9b0e3b8027e0445b936537c78549
 SRC_URI_append_class-target = " file://cross.patch"
 SRC_URI_append_class-nativesdk = " file://cross.patch"
 
+# Applies against virglrender < 0.6.0 and not qemu itself
+CVE_CHECK_WHITELIST += "CVE-2017-5957"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.30.2

