Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.19487.1624096733030723231
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Jun 2021 02:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TjbZRayY;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id h17so2021559edw.11
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Jun 2021 02:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ERjSR0nVE59yvg+pBOzSqIAflPeWKCbTiFEptLa13I8=;
        b=TjbZRayY7ScJuedvUwa2D3Go3X1ABHeZbyyyxDnVoO1JGg8M4sM2AZM8Bqp+4OL07N
         fT80fyvSWIC3m7p1Z3kuSFy1/fadNiSt3xv6LwPTax6hwBJQRczhqPIEvCxfBXJT5Plr
         QB5l96x5Mue2epwGlamjp9yKFJ2oh/w3YC4gs4VKchyJE1/aiQxgyrlGoE1+zIUEUMVq
         Vmmg22o93V+XxCyx/cSn3MZyQEhyy+OG86NwcSInaKWFLxGaSWLgqPZ/BhhU+wFU5nY4
         u409T7eFbw3bBd4FE0HuHWA3gB4+SpRfCBdhaqb2BU0iSeAThvkiVrK3R55U6Blpge7R
         kMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ERjSR0nVE59yvg+pBOzSqIAflPeWKCbTiFEptLa13I8=;
        b=HbfwPJoYBj1/LQYTC/hfi55GAImrg+C/Ap/meye5eZ7Q6DYbYxKBXZyCilNlV2K8co
         NxBNNpjF5Z36nqCKmpD0UJAfFbwCxGKRu5j7ZXyoz9s5d7ItgxpbwB3Q+VOC+U5FlnIR
         vN2QGt/9PS608FH1Ne/+YZ0eNoGzu/r/IuRkq9NlKjJc5hWaMsegJUBaQXNpfmAKb/4I
         pjv5dIOMFi6Wcms1HjNPBDAoCy3TuX+7DIMn/jp6hFtFkf2D2bDT0cYxatqPFV/CMhGJ
         vyCUwCrGsidSInAm8SyCK16B6TEFFD9H6dz9MfXSSLExf+5B0vjIiT0+nAIEQrClPIq8
         r3rQ==
X-Gm-Message-State: AOAM530TI4C9XdD65ZmoDn5iuVIjAya3/t6ObmYWkDlkaTEqZBb+DjZz
	fV/kLdDIeaz/qBHgipBzvw355bVw25HdBg==
X-Google-Smtp-Source: ABdhPJxbDg3sLonbWS5GKGcGcPMyQbivWJs0l5AEJuSBPtq7kMCR/M54JjrnMvYh+xKuK0STLibWxA==
X-Received: by 2002:aa7:dd81:: with SMTP id g1mr9876244edv.274.1624096731613;
        Sat, 19 Jun 2021 02:58:51 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id l11sm7517542edb.3.2021.06.19.02.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 02:58:51 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/3] glibc: do not enable memory tagging on aarch64 just yet
Date: Sat, 19 Jun 2021 11:58:44 +0200
Message-Id: <20210619095845.1853470-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210619095845.1853470-1-alex.kanavin@gmail.com>
References: <20210619095845.1853470-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sadly, it seems to break copy-on-write as reported here:
https://lists.openembedded.org/g/openembedded-core/message/153082

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.33.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index b70cd0978a..caa2e2ae18 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -90,10 +90,10 @@ EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
 EXTRA_OECONF_append_x86 = " --enable-cet"
 EXTRA_OECONF_append_x86-64 = " --enable-cet"
-EXTRA_OECONF_append_aarch64 = " --enable-memory-tagging"
 
 PACKAGECONFIG ??= "nscd"
 PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
+PACKAGECONFIG[memory-tagging] = "--enable-memory-tagging,--disable-memory-tagging"
 
 do_patch_append() {
     bb.build.exec_func('do_fix_readlib_c', d)
-- 
2.31.1

