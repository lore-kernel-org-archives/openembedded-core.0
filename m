Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.2745.1585764799023001520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 11:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SYj7DE9n;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id s23so239288plq.13
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 11:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ScnSzqbj/DQN9to2+TbaFXNQTOHjcgCuXmnwecdKUY=;
        b=SYj7DE9nd2IznZfDWkMOzuxuFo062A/10aOp6nelLmN3RYi7CyxEAcj59A0Bs12N+q
         YDNtqebSYQQGdlhzNMBeRNiGKcd030SwWaQqvArohYNvgnzlgXHA4/Aea6JRCKZWsiv5
         v92u07IouI4LZw4f0KdKFq9aCwEB2Qxw/j3NaMX4a88Y0ddXINAQdKPNmgDIyb/SfnbI
         ljD2a8uNqDN3MyHujTtLaLDdv3Xxs8C3w32wZwdiEImrInITtuue4lES8R5O8P4VW/tT
         Xfwe/2BqnMSWaZ6Vv2K4wHCqbJpXOB4UpDZ/3QjhPCvahRtyGrRPJ3QFFO8gY5PTLwAP
         IOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ScnSzqbj/DQN9to2+TbaFXNQTOHjcgCuXmnwecdKUY=;
        b=Zlk/aHp6Z11oit+2cTwY9/AQaTqhbZFAQ0/TIYRcv4PZMgf6OW26Hlx9nmkuB+qVTK
         9fPEaLt54AXhJr6ZDPE/mrBfNFdeEOC/sLCuDq+5g/Pm8FkxkTK+n62CI5hvK04Phvl0
         G5dlF1WSlzERMi0n1OGWMEetfHvZbtDs+IJogQid45m+rM3J4uRFwewGsnyfTKTZTznG
         n8DqQDWk5qNMLyNqKn4hJnwD9XBNjAUGzqkGAt/DHtm0pFqeAFnNbwcdHnzBbn+kImKe
         GuGyXq+oR52s7XNtj7GKOTTXsaHnJBytkKgutocLXaCXHS6FHj0D1SKh8rVxxDQs5D9J
         jCiw==
X-Gm-Message-State: AGi0PuZLmnvC2pDSVdwTS1lwybLnCJ8SWl6YAP1rULS9vkpZK8uuM54g
	yjFz8Ave53kJh1n3y4GtbFzViLnTIf0=
X-Google-Smtp-Source: APiQypIKeNMbU712cOwMdZbKRuWpweYse+zvoWH/m9VorxRWJTMEiY9sYDcEBu6w8ckQJ565/3KAyQ==
X-Received: by 2002:a17:90a:feb:: with SMTP id 98mr6437932pjz.72.1585764797961;
        Wed, 01 Apr 2020 11:13:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id f64sm2140232pfb.72.2020.04.01.11.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 11:13:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Do not build gold linker on mips/glibc
Date: Wed,  1 Apr 2020 11:13:31 -0700
Message-Id: <20200401181331.1939188-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using gnu_hash style is unsupported on gold for now therefore disable
building gold on mips/glibc

Certain applications poke for presence of gold linker and silently use
it (webkit), therefore its best to disable building it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 53f46bb611..f6c20fc229 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -38,6 +38,7 @@ FILES_${PN}-dev = " \
 LDGOLD_ALTS ?= "ld.gold dwp"
 LDGOLD_ALTS_riscv64 = ""
 LDGOLD_ALTS_riscv32 = ""
+LDGOLD_ALTS_libc-glibc_mipsarch = ""
 
 USE_ALTERNATIVES_FOR = " \
 	addr2line \
@@ -84,6 +85,7 @@ EXTRA_TARGETS_class-native = ""
 
 LDGOLD_class-native = ""
 LDGOLD_class-crosssdk = ""
+LDGOLD_libc-glibc_mipsarch = ""
 LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '--enable-gold --enable-ld=default --enable-threads', d)}"
 
 
-- 
2.26.0

