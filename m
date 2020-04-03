Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.6941.1585949160656722636
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 14:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=etFerFJ2;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: jpuhlman@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id v23so1293297pfm.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 14:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EFckN2uSUPffGJQsyfk4b55vG0Cs7E/MdO7w7LPHv0M=;
        b=etFerFJ27h/TEopPMB1r9hVJCgki3WgL1nDSkSu4TVmJ0A7ekNByxzCNFmGA7W+p1S
         gq+P3jWOUx8x+UY3ZUMrfdRg8tuZfBmTAMamNsgESOsTsA7He0pGKCqKLSs7fDF2sq3k
         Jyo6qAwazFhqSg9OrLrKTIUQoLgLoI8mfEDtiwyHaJ0UvmE6SOmdvNZf8YVjzEf7mFw0
         gtg05zXyrht/uhT8HJkhHbH5Pzvf97vkTDbikkfRIhfj8xXV0TIio5evU7VnX4LWI75R
         wvTkl1L85XllErnsfhQTTqBDUiW9tjia7lNHmFzsxAnHccOt3hi4hufNnsI3eZLuFCL8
         jTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=EFckN2uSUPffGJQsyfk4b55vG0Cs7E/MdO7w7LPHv0M=;
        b=FasbcC4CM4Yrw+8b7prJs9P2yJ0cgT51kD4b2piuTbr6Mr3wbD/AdnFfrEoZvv15ik
         Qm0aOU4jy58m7WREwqCWKJL7hSPNnbr6eshD8mWSqR+1din/DEn0oj6HseoZER2t4tIW
         HLuO25VxpTCK8XCrtr1uGBI+M72cmwhA/W2Tq46DKsp/wGS0qSgGYBq1y3SP6uvLhyxX
         Vdre/ljMB+f+IqkrkEriwmx5GNRHsjL6Veqspc791d30iyvYK9hRgjx43z7JofYdSJlS
         WnZXhTA07ciu84HYbs3wa1VJ6lL6yzyBXnFnPHglu9Ptv6qt9S/Ro51KBvoBW1M0xKFl
         xR3A==
X-Gm-Message-State: AGi0PuaSaLs3e4x5Gk/zt7ZScxgVkgu4CrO5TDlaaNH4SX2ODG0wv/FQ
	0I/TOwLrRpFzz7RVkMWln9nHeWU94sc=
X-Google-Smtp-Source: APiQypKVBB6muxNwoPlYD0E/B/WXnDFrbGueQ+qZVMNVyW/TG8cjzl6j7wQA8Q/sA5fq01VBTEcX4w==
X-Received: by 2002:a62:2b07:: with SMTP id r7mr9837311pfr.273.1585949159822;
        Fri, 03 Apr 2020 14:25:59 -0700 (PDT)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain ([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
        by smtp.gmail.com with ESMTPSA id w69sm6425822pfc.52.2020.04.03.14.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 14:25:59 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id E69CC2A05B9; Fri,  3 Apr 2020 14:25:57 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH] nativesdk-binutils: correct path to ld.so.conf
Date: Fri,  3 Apr 2020 14:25:55 -0700
Message-Id: <20200403212555.27475-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

The alternative ld.so patch is set up so the linker will search
the nativesdk sysroot before searching the host filesystem.

However the patch concatenates <sysroot>/etc and /etc/ld.so.conf
leading to a path that does not exist:

3061991 openat(AT_FDCWD, "/buildtools/sysroots/x86_64-pokysdk-linux/etc/etc/ld.so.conf",
O_RDONLY) = -1 ENOENT (No such file or directory)

In native-nspr, the build uses -lpthread, which triggers a search for librt, but because
of the above it drags in the system librt leading to errors as follows:

/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/
9.3.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1:
undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'

update concatenation to correctly construct the path to the nativesdk ld.so.conf

[YOCTO #13853]

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 ...3-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
index 8b59ba5dec..4b4d73d21d 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
@@ -65,7 +65,7 @@ index 2e27cf48a8..a095d6aac5 100644
        info.path = NULL;
        info.len = info.alloc = 0;
 -      tmppath = concat (ld_sysroot, prefix, "/etc/ld.so.conf",
-+      tmppath = concat (ld_sysconfdir, "/etc/ld.so.conf",
++      tmppath = concat (ld_sysconfdir, "/ld.so.conf",
  			(const char *) NULL);
        if (!ldelf_parse_ld_so_conf (&info, tmppath))
  	{
-- 
2.20.1

