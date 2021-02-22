Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.30623.1613968351383747427
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 20:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DWSKM/7l;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id p21so9454422pgl.12
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 20:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+BGDZEnrMaNXN4a42OfB3LgVNoeqEfwZkHEHmGil+Bo=;
        b=DWSKM/7lAG9IPHOxhm+tyK5AG+6nYD7SnUmx/0VHmrOI0hNtyHrXgD3l8lloBzpaGH
         w/utA3VSQz/ioiRNqxp68TcXOuPA3g9HtpQM9Jx1nlS0nQqQJS/pr4xYvsWPE9N1Tojd
         /L+baJLukURH0UXwt6t5rKJjW+CdGIOV56XChsAkBAGXmw7fg9Mpk496TV+zpFOmzYgP
         xzmug2IXMd6bD+Pz6wLq83y38xcURClgPcCOUJTRmKNJf5zm/6y4DqFnBowZFJtvAeqr
         iZDodDkZ68WPvuG045XRKg1jcM/juXtSWmJ1IdgIlvW15zRuogR9+xwL9dSVKXL++wTv
         NZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+BGDZEnrMaNXN4a42OfB3LgVNoeqEfwZkHEHmGil+Bo=;
        b=k4xxEcElf3OsbxKgMhlLcexPwQg6GyUH/sKEnmn1tK5RaeONFoVxYaUhhLzpD5ZF4+
         bVOhDBwD7uwx94eJvRdyvApol36dSER7ISeNgege6e1C7cw6Mh95WFFAzpA12fUbRyN/
         LPWit0Lzjc9tPBXGofw59lmXafMI10N1GOBytfMTWs3BAF+rMBJR/eP+t9GTrWVHEGhs
         c1393sPs22Yc7o7soBMj7nf5BvwPIQM0b3rjVQyDvKqa5Kkj03AVXriDvEbMnxqh/tBO
         MLoFpLDNnuZkupoDK+Axu05jvmAroRI4zStBPgUIAQkwxqFa9Y6k++LyP5aL1FR4qQzK
         OBDw==
X-Gm-Message-State: AOAM532UnLLba6WfAsipTheILlhelMS7KgmOrS8x45HEY39btfHBsNIK
	uWfPtMJD7+r4jT8wo50D8WyO6H2zSB5L+Q==
X-Google-Smtp-Source: ABdhPJxX4oqeUCawVnVyf9if7FsHcTsy1vucTFG004Xb/AyOy/Pu4bNopb47Pu/0c74wlxDx2Jke2Q==
X-Received: by 2002:a65:524b:: with SMTP id q11mr18170959pgp.207.1613968350512;
        Sun, 21 Feb 2021 20:32:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id x22sm12769818pjr.49.2021.02.21.20.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 20:32:29 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] bitbake.conf: Do not use lib64 for baselib on musl/ppc64
Date: Sun, 21 Feb 2021 20:32:24 -0800
Message-Id: <20210222043224.3691568-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

musl is configured to use /lib and /usr/lib for ppc64 unlike glibc where
it is expected to have libs in /lib64 and /usr/lib64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9b833c02a3..edd081ed3b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -10,8 +10,8 @@
 baselib = "${BASELIB}"
 baselib[vardepvalue] = "${baselib}"
 BASELIB = "lib"
-BASELIB_powerpc64 = "lib64"
-BASELIB_powerpc64le = "lib64"
+BASELIB_libc-glibc_powerpc64 = "lib64"
+BASELIB_libc-glibc_powerpc64le = "lib64"
 
 # Path prefixes
 export base_prefix = ""
-- 
2.30.1

