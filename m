Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.3913.1603919193543151630
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K8XpGuh1;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id t25so826582ejd.13
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gOV8Jt+6AXz1Xjz2Q3dOwbVVTTTSYki9BFDzxMV+ZsA=;
        b=K8XpGuh1R+1OevoVq3xVfAqaAmy7xlZ2IUydnUX9K5MxWjy8/0KHpj7OyhNm9e44lF
         V6/oe/ZSvRNwu2kdxXRHRCyNHlUfgEynvU7T3wQatALQ1Dub4Tbl+3rQ08sKiXbXE8LV
         0ve37APuBRCdn7kvUyvSbLg8uBgrFk2nsfltIDpAxVEMnTcSqicTeIa5COL+jmmhY3o3
         W7dANiYLk8basy4Pmo9dQbWh0mXnFalYCz8sn1P/AzMF/sY6rbptvA68XFn0n7I8Xun4
         4c91FB1vTMBE6p0bQiBKt0Ch8DCOJA/aqqK8x8EeL1nPlSB1QBSHLbrljDtUPepGss84
         nzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gOV8Jt+6AXz1Xjz2Q3dOwbVVTTTSYki9BFDzxMV+ZsA=;
        b=uoMWPq6/hrKaQqLDHp3uCQh1iIuhavrJ7XLsChSsx/R14hFxQUow62Zx1yNLNF+rEb
         y7wwdghYhC/P1Zr9/EnSJ8I4sEXoPD9N2Ms8GOby+b7IKl2nftuQUdV4/nN/0frhXhai
         6iwR5vhv9b6/XoPcyO9WYUuOvg+0LTHkXgWULYSelPilJy63V8HT4DC2w0EtQoq3sNFN
         Uw/O+HKbO8brrzSHS8GZFX4ZFlqa3aESdpoc+kiO1LIhv4JD7jq/4KA6PT6pmTY6OSkc
         GVim5aQhfZFmsT7bwOsYlJNwIpttWcUAESq+MRNFoPtjU4cz9hNUVNemSkgO1kK7pWnm
         3CSw==
X-Gm-Message-State: AOAM532RkcgLgscxVaatfy3ANxqF8CfTSjFynnXaj90lLt8S15BkMx9d
	OOcNFQhOO/kGMNB9RhGVhqGJmEWMOSkjxg==
X-Google-Smtp-Source: ABdhPJxNP+7e4DCcWvVYOnZlJveyq5Kbb9jK3hJQr+81SiANOFOeqwxKotT0JmU3+JQATZfjzdhuSg==
X-Received: by 2002:a17:906:564d:: with SMTP id v13mr1008078ejr.217.1603919191887;
        Wed, 28 Oct 2020 14:06:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 29/33] rpm: adjust MIPS64 N32 support
Date: Wed, 28 Oct 2020 22:05:54 +0100
Message-Id: <20201028210558.21070-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

upstream has switched from libmagic to elfutils to determine
file 'colors', and so this adapts the existing patch accordingly.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...olor-setting-for-mips64_n32-binaries.patch | 28 ++++++++++++-------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
index ac6dcaf101..331ea849e6 100644
--- a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
@@ -1,20 +1,21 @@
-From e3eff024826550aec4a6a5baef7210a29faf299d Mon Sep 17 00:00:00 2001
+From 5492ac3c716020a27a25253bbffe810db43202bf Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 9 Mar 2017 18:54:02 +0200
 Subject: [PATCH] Add a color setting for mips64_n32 binaries
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- build/rpmfc.c | 1 +
+ build/rpmfc.c | 4 ++++
  rpmrc.in      | 2 ++
- 2 files changed, 3 insertions(+)
+ 2 files changed, 6 insertions(+)
 
 diff --git a/build/rpmfc.c b/build/rpmfc.c
-index d38a10916..c8e2f876a 100644
+index 10c380ee9..b7655aa93 100644
 --- a/build/rpmfc.c
 +++ b/build/rpmfc.c
-@@ -622,6 +622,7 @@ exit:
+@@ -639,6 +639,7 @@ exit:
  static const struct rpmfcTokens_s rpmfcTokens[] = {
    { "directory",		RPMFC_INCLUDE },
  
@@ -22,11 +23,21 @@ index d38a10916..c8e2f876a 100644
    { "ELF 32-bit",		RPMFC_ELF32|RPMFC_INCLUDE },
    { "ELF 64-bit",		RPMFC_ELF64|RPMFC_INCLUDE },
  
+@@ -1149,6 +1150,9 @@ static uint32_t getElfColor(const char *fn)
+ 		color = RPMFC_ELF32;
+ 		break;
+ 	    }
++            if (ehdr.e_machine == EM_MIPS || ehdr.e_machine == EM_MIPS_RS3_LE)
++                if (ehdr.e_flags & EF_MIPS_ABI2)
++                    color = RPMFC_ELFMIPSN32;
+ 	    elf_end(elf);
+ 	}
+ 	close(fd);
 diff --git a/rpmrc.in b/rpmrc.in
-index abc08fc31..f5bc820d8 100644
+index 5bd9ba3e5..f15bb8dad 100644
 --- a/rpmrc.in
 +++ b/rpmrc.in
-@@ -133,6 +133,8 @@ archcolor: mipsr6el 1
+@@ -137,6 +137,8 @@ archcolor: mipsr6el 1
  archcolor: mips64r6 2
  archcolor: mips64r6el 2
  
@@ -35,6 +46,3 @@ index abc08fc31..f5bc820d8 100644
  archcolor: m68k 1
  
  archcolor: m68kmint 1
--- 
-2.11.0
-
-- 
2.29.0

