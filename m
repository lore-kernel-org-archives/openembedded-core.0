Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.6711.1621744253052875881
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 May 2021 21:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aEKmmlFk;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id q25so18775pfn.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 May 2021 21:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e1UQrg6Ony7FOWXz1mjA9e4DmVi/jrgfQTaLcWIY8D0=;
        b=aEKmmlFkpNkBHNUXaoLpssnfB7HZ9VXei49Ed7pS8mEB/UrJW3eyB4ZTMUNbAOhxHG
         P1p5nQLAxw8uXFDcDhlNeyj8RYbb64K49D34Hk7oVnGjhVPfIuQAScugQeMJ3yVTqoNy
         M/m8LBVd6x4W7ChF5IYNJbGQa9GJICMWaIpLH/k583kRFvPn0mkuqKjpsGxyoDcmw/Tu
         8LPxFuIkvMDG84BrV8+i709g5tsrp+zAH8mwxMNLgp2dOTK6nJE3kF6jGmNX6s2MFd3/
         ppIvEAHYtVEN5u/gzBj5fVKMdr5U2XUkSCojbR8YWdYjbzgEcO6upZe0b3e6RuF/dZSS
         MyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e1UQrg6Ony7FOWXz1mjA9e4DmVi/jrgfQTaLcWIY8D0=;
        b=RG5QmQ+j/6sNiy7PWk+G9xXw+J8xoFm/TtdA07WAVvdUsnLg9I8B6iysZUKx3aZn29
         vu37v2OgIJes7fSzTcOfJjGMakV3QOKa0NTtHuMGr2voD7sdKtM/5z0vFjj4V2Ou27qF
         lr6VCrCohmIpM3NRjNJkTXztT2AuYGEaxBlEqbAu7odteXa8oRPNZCrcotXhwlE1kFf8
         C/iX4DloWFeuD+T4tXU5gu2DZLmMUarmsatV8qf94eNgSWm4MRqN02nxbQO6XyM7y84m
         d0JZT6Oa2G/gi45rv9Jkbg8055ijM7U4nfiqsf8KH6RfzHqvE2YAkdjiIoCm5rf8Btbq
         OOzw==
X-Gm-Message-State: AOAM53186yKOnHlL2dC1UpF7xfr3gA8vRPmcc71zkoXwIx0Th/GnFTSR
	uoM2jJtCGWBlTEDcL1i4dN8SpTr/0JMHqg==
X-Google-Smtp-Source: ABdhPJxEGVxEeU3PPIJC55alPXNMfMoHdSWJkapqBtndWNpmLHjlMndt5OyonShwNhEkhY8ngi5+yg==
X-Received: by 2002:a65:6a05:: with SMTP id m5mr6941566pgu.319.1621744252182;
        Sat, 22 May 2021 21:30:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::db30])
        by smtp.gmail.com with ESMTPSA id o24sm8186891pgl.55.2021.05.22.21.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 21:30:51 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Enable memory tagging for aarch64
Date: Sat, 22 May 2021 21:30:47 -0700
Message-Id: <20210523043047.2398841-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Glibc on aarch64 has a memory tagging option that can be enabled
via GLIBC_TUNABLES="glibc.mem.tagging=$SOMETHING" when glibc
is built with memory tagging support and the kernel/HW supports
MTE. There should be no side effects unless the user turns it
on with approprate HW support

Linux 5.4 headers and binutils 2.33.1 or newer is needed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.34.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index 0deb727ae4..37cf8ed85f 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -91,6 +91,7 @@ EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
 EXTRA_OECONF_append_x86 = " --enable-cet"
 EXTRA_OECONF_append_x86-64 = " --enable-cet"
+EXTRA_OECONF_append_aarch64 = " --enable-memory-tagging"
 
 PACKAGECONFIG ??= "nscd"
 PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
-- 
2.31.1

