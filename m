Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.7370.1589644727882253577
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 May 2020 08:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gl4+JVeY;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id ms17so2472793pjb.0
        for <openembedded-core@lists.openembedded.org>; Sat, 16 May 2020 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4bZd4eKvv9O8TiL0Ku/zEB4K3mQbYSd0zvrt7UAuSp4=;
        b=gl4+JVeYbvErR2XLtlhqUp9RUUsGrYwvQdzYDOrs7QWsKrbflrQd/Pao5Krpwr+h0Y
         Aqlnn2ObDjcimV3QKAV29A6Tf7sr+O3KKgvnG+GVmPH6b3iQQyWZopYt5kqQ9VeJ8Tpd
         keYC8pEDLqEjthtd9mFQ1hOVZq3H1wFZzewvyiV0n93IeiG4SUJRB0IGmQy9HfVY/3yF
         2PhFU05Ew6+wVHh4WSauv65P2HJpQNEVOQpl0BzK/NfIY1LbtN0+fTU3WB9bYK38wFub
         SZ37JQGjyF97ynYvp/M0/9B0yHVLcFZf8lbRJzLNftf/eSRdUL3+7yQDHpnmO+Ged3vR
         5MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4bZd4eKvv9O8TiL0Ku/zEB4K3mQbYSd0zvrt7UAuSp4=;
        b=rdpegLCGoxm4XLsYTwrAKjnkCxoQ5I23bog/NuXWVgtBb/6U+88J/1qlAVIoHnZFeN
         OtmxTzWGC2TFqFoxM5aZ2Yhz0NGDB1vosb4OmUQvkrgltd8723dre6MUvIm6T4O+KywF
         W+R2o9T/ehDIqErLmufEGwF8Twh6Opj9RxSS9BgdgrSbLH8uGO6ey+8+NDu4P1ZInXp7
         5WV6ARajjWoEMjQQICKHjIeiwzcaHAgN5D91renkryYquXh+P2qwq45Xk+4GzXqBxqCI
         iSPSXqtHM+2FILgBXU71Zu4demwX9S2SUk4TT4+Re+7LG8uGJAAg/wItFJfQkzfp9TU5
         iFgQ==
X-Gm-Message-State: AOAM530MAWErVC8giJI6QtWFJmNmi+rxX7GgoFN6cnPqT/FoyDErrNmP
	JhczeDdMQYvAgKtYhwyzV2iYUvjPdTg=
X-Google-Smtp-Source: ABdhPJzZS5+E/Xeu+dq4cHDLWH0eOGa0DdglNT/lr7pYLWQae7LUnwzHQ9SfhwOQMyYOlG+uekeILg==
X-Received: by 2002:a17:90a:1b67:: with SMTP id q94mr9625598pjq.84.1589644727140;
        Sat, 16 May 2020 08:58:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id jz3sm4202003pjb.40.2020.05.16.08.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2020 08:58:46 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/6] glibc: Do not synthesize wordsize.h for arm multilibs
Date: Sat, 16 May 2020 08:58:39 -0700
Message-Id: <20200516155843.1811017-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200516155843.1811017-1-raj.khem@gmail.com>
References: <20200516155843.1811017-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This has been constant source of trouble, because it is fundamental file
which sets machine word length and everything else builts on top of that
so when it is sythesized like this, where the sythesize template itself
needs wordsize.h to determine machine word length, it creates the
catch-22 problem, which is seen when building things like bpf, or
running clang-tidy etc. where compiler internal defines may not be used
this ends up in all sorts of problems. Now that glibc provides exact
same header for arm and aarch64, its no longer needed to be multilibbed
here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 3e92ce0629..ff25fd4187 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -152,7 +152,7 @@ do_install_append_armeb () {
 }
 
 do_install_armmultilib () {
-	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
+	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h
 	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h bits/pthreadtypes-arch.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
 	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/typesizes.h
 	oe_multilib_header bits/procfs-id.h bits/procfs.h bits/shmlba.h
-- 
2.26.2

