Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.31752.1607937051728322343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 01:10:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pt3D1aMo;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id b73so16341612edf.13
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 01:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9QTGa2kL9lhsJLeNf7/MZ5Wso+CPIjalF3GjRYOQjhA=;
        b=pt3D1aMop5eMoldJOAiHpkOiLIBeuYqJ7w4wLOrtbNUqj4Frgt+2EIqpbBFIWQKJ8k
         UbEz4tMAXz7KF8v5luxWFQBMOHnedcUe8l9lBqcOaG7WIAzvOe8IAdUsXaYQ3t8ZeVY/
         1pmAYnw0EIFelQq3JFtTZyEBmKR7AzyVZdsgsj/A/pqHG4ih+tWUgU5rIbizttK4jWqe
         BZ2Hi9t1A4v9+4dKy6VBB3VMV9fukwJTTmrJUsTE35qulpxjVrQ0e5GHYke8jVzBJ8fk
         YStxlgP7ZmZwJAYCNHdHZpDVoE917ZBYsk78r1najV25aRhQx3iNG8w9PoeoV5zsy6lo
         9uFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9QTGa2kL9lhsJLeNf7/MZ5Wso+CPIjalF3GjRYOQjhA=;
        b=Rk/mzSomAi9GWJpEu7sESMEJUmITXeNBsuxHbu7wfJw/iP/67+46526rvO6pqeT95v
         4HGkB93nlyfOl+M/hZyq53t1BVBF69CiOQSXRgcHRL5Jk+lUk/gZcbhGWS4KV5g1TVb8
         HhjD+vtGlgS8GEKLptlZaLXoEsMPI1eL+4W9K7iA2Ce0gf/LXH8DvmszmXIBRbt2NJrG
         5D8yv29MNdYlz6BFPtWPlXIDj+/Jwh0FfBgEscLUF+UV/DUzZxu3LVDCtAsniz8DJEM9
         rUxoBkyjlIV8utFrYdgixnCEd5hEiIXx1yea0jWFGBnJ67hSSkja5Vf76JHHS5JykBLP
         WPCg==
X-Gm-Message-State: AOAM533CMzdUj8JzapLeDaetjTu3+H0MRp7Si0VPoEvL0Bv7MKNaSdtX
	EJb7yNsqqMsBW/i/HWYOPbsT9/FdtIX8dg==
X-Google-Smtp-Source: ABdhPJwDP3HVp7VVFyI8bRX0NhtWgjvVqD7Xh9MdlKfnH1Dx6ISqYBC3fidfCM3VRJU/QEKPzFQWOQ==
X-Received: by 2002:a50:a694:: with SMTP id e20mr23942211edc.261.1607937050384;
        Mon, 14 Dec 2020 01:10:50 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d22sm13318425eja.72.2020.12.14.01.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 01:10:49 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/4] bzip2: run ptests without valgrind
Date: Mon, 14 Dec 2020 10:10:40 +0100
Message-Id: <20201214091042.10145-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214091042.10145-1-alex.kanavin@gmail.com>
References: <20201214091042.10145-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise, valgrind significantly slows them down, and actually
even causes ptest timeouts on arm64.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/bzip2/bzip2/Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am b/meta/recipes-extended/bzip2/bzip2/Makefile.am
index d4498947e8..7338df03eb 100644
--- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
+++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
@@ -46,7 +46,7 @@ runtest:
 	else echo "FAIL: sample2 decompress"; fi
 	@if cmp sample3.tst sample3.ref; then echo "PASS: sample3 decompress";\
 	else echo "FAIL: sample3 decompress"; fi
-	./bzip2-tests/run-tests.sh --tests-dir="$(PWD)/bzip2-tests"
+	./bzip2-tests/run-tests.sh --without-valgrind --tests-dir="$(PWD)/bzip2-tests"
 
 install-ptest:
 	sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
-- 
2.29.2

