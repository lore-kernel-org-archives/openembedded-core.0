Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.4913.1615530070657470824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 22:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fjV48don;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id g4so15196948pgj.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 22:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AsEETNbX+O4MFMV/STxLq0KxaK20OOhmwySjA9mSfrc=;
        b=fjV48donMEwEZOpXChMq20Ykl/PASa5sTaw6sM3CM93g8kPO/i/UC7hpU352SHOPM+
         VfkxKEu6R2c8nqfZFS7rIjFeuHT4aumHrvDeGgqpgAXnXsrnLILjLwmGxhxqldVhZRQe
         f/ZgIO+Jd8dau9GWRPTxFr9XcY5xuFPe6aDgdN2yJNSn8UMLWB9ztyIzSulV/ExgARJA
         w2KyMnnYCwXRqzoHYPOLVns9xVc6rWZDNbtGZbskSUmtlkdQTzYdBnuWu9zCRGYaS2l7
         Hmtz3idZcGzqBW7vXoMuoD25LsfHf6Oik6PHWbvszzAm2a6is4p2wxoYWMVJImhvNZNM
         Piug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AsEETNbX+O4MFMV/STxLq0KxaK20OOhmwySjA9mSfrc=;
        b=ixbn2jgrE9QHs7y9dMtBuZxpv8QAgU6IxP0pOyK9C4RewygaKW0LDqYwEKPvy53P+N
         LENTiMTqyROoQo55OAtRWYUQ77aci08VPowBZsi5PXWnG6VA5Ucn0ixfmM1b7aORgdQt
         ji3nzhNH+b/cmmbcQcZp4cLyqZ9Wg4iqGVROBkVcf9LP2dk9AbqKcrKaY6JS+LgPebyE
         XLvcza5Gf1jCKeCwToJuoiSW8gGUtfmPmN1/H6u5RdWCrFnDIXxVJwZKhQqchWFqmgPI
         RPUu8xTblRKLDu6uWTTZMSgLXNyEjRHkCa3DBcBkxTVMkgrvPZTPlLmlsVM3hKVjC7dH
         8aVQ==
X-Gm-Message-State: AOAM531mLLJUMm7T3iDyWq14tlf+pzOZwfxdV2xX5b0t1QaoZmwpRavm
	joxYcw4s+8I9wy/puyGAsvPe0/Ud7mT2/g==
X-Google-Smtp-Source: ABdhPJxVyKZN1I8HExZBxppwME8BsdQhQFPsbwM7QfjQuuCXbcOcEyVY5RqMG3udCw+sahh5DyPNmQ==
X-Received: by 2002:a63:4462:: with SMTP id t34mr10213886pgk.389.1615530069722;
        Thu, 11 Mar 2021 22:21:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id e1sm4180378pfi.175.2021.03.11.22.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 22:21:09 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] libucontext: Recognize ppc64le architecture
Date: Thu, 11 Mar 2021 22:21:04 -0800
Message-Id: <20210312062107.1549935-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/libucontext_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/libucontext_git.bb b/meta/recipes-core/musl/libucontext_git.bb
index 734ad9c953..11affebb49 100644
--- a/meta/recipes-core/musl/libucontext_git.bb
+++ b/meta/recipes-core/musl/libucontext_git.bb
@@ -40,8 +40,8 @@ def map_kernel_arch(a, d):
     elif re.match('aarch64_be_ilp32$', a):          return 'aarch64'
     elif re.match('mips(isa|)(32|)(r6|)(el|)$', a): return 'mips'
     elif re.match('mips(isa|)64(r6|)(el|)$', a):    return 'mips64'
+    elif re.match('p(pc64|owerpc64)(le)', a):       return 'ppc64'
     elif re.match('p(pc|owerpc)', a):               return 'ppc'
-    elif re.match('p(pc64|owerpc64)', a):           return 'ppc64'
     elif re.match('riscv64$', a):                   return 'riscv64'
     elif re.match('riscv32$', a):                   return 'riscv32'
     else:
-- 
2.30.2

