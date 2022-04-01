Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C266AC433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 06:00:58 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.7154.1648792856262946861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 23:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YCDgtJWj;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so4364384pjo.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 23:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EmPyOzv8yssVSLbiH3RVcFbrxN5nE5LEKSpxjeburvk=;
        b=YCDgtJWjhFg2QDt8uHu8HOaFp69VHudPplPgZ/recYnXF5xl1qJ7pLW1n2zju6jMnm
         1Ns1n08A+YxB7oeSvhdNrBfzrss8uyUM1P5CbTRyNuULiOYRpRqHIMn8YtgcrTo1VL9S
         mG+9JP55qNFVG6A06KNc4C9OfSgzVisKtH3L67t+zF/3wbNSKfuxkjAoQFl9rdBZNaiQ
         REWZqviuuzr8g7HHEd9trUbIYATCk2Os84S5od8Z3wBUlJEdaacefgdte10vqGskPxHr
         hf0T1s+RHfaNnBeMVZOGx4QxUq9yK56ZG8v0j4lz7SsFA6heYU5IoQLpYrQdCHEcg06o
         BjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EmPyOzv8yssVSLbiH3RVcFbrxN5nE5LEKSpxjeburvk=;
        b=h+5bAj1eOZuV2vh/LIDEMeK/rljar9oMuoUukHfrtCaFjsK6RVLnV41CqjvZi6BGR6
         uCZ+TA39zArt5Yx5eZYn79osFJJsqOkuHO1hlo+lLXbLPUrIjkK2kdU56wgRM65M1fL4
         VObUT7kRuujzIcZ5BZRGqfRsoOS/QJEpydIS2zg6YRpBS2TIFIc1IFrGiHY6nHnc+aWs
         mPWBdkw+icZwfe08fKOcjENohEA0JzjrV5DB1QkrMzNcqaYbaQ0UV/2XxxZg0y8pM2fY
         zYJmw/ZxU7wUzDIBVtUYVWERcf7TZdJ07Z52I8lKcoSXQQMmPFIcnPqgyDO1/zsVWd1N
         sotw==
X-Gm-Message-State: AOAM531OLecaGdS1dIzY5+l79dQ/x8MwX5EiojJaogUANpqLWMxbR3PX
	JDX3VOAVf+xk0dqKwVtVltlfdM/QvPBA3kZj
X-Google-Smtp-Source: 
 ABdhPJxfMNK/1Pwvk7OGozf91/QYfiCsltNKRCva1jnVCm8c5CzO1LhHLfIHoqgnEwyvU/AISaymLg==
X-Received: by 2002:a17:903:248:b0:155:e8c6:8770 with SMTP id
 j8-20020a170903024800b00155e8c68770mr31782781plh.129.1648792855365;
        Thu, 31 Mar 2022 23:00:55 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 s3-20020a056a00194300b004f6da3a1a3bsm1509354pfk.8.2022.03.31.23.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 23:00:54 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [meta] meta: scripts - relocation script adapted to support
 big-endian machines
Date: Fri,  1 Apr 2022 11:30:34 +0530
Message-Id: <20220401060034.7633-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 06:00:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163880

relocate_sdk.py was developed for little-endian architures and when tries
to install SDK for big-endian machines errors like below will be shown.
Error: struct.error: unpack requires a string argument of length 32. SDK could not be set up. Relocate script failed. Abort!
Error: IOError: [Errno 22] Invalid argument. SDK could not be set up. Relocate script failed. Abort!

To fix this, the changes made in the script to support big-endian architecture.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 scripts/relocate_sdk.py | 45 ++++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 10 deletions(-)
 mode change 100755 => 100644 scripts/relocate_sdk.py

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
old mode 100755
new mode 100644
index 8c0fdb986a..513b9343d3
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -30,9 +30,10 @@ else:
 old_prefix = re.compile(b("##DEFAULT_INSTALL_DIR##"))
 
 def get_arch():
+    global ei_data
     f.seek(0)
     e_ident =f.read(16)
-    ei_mag0,ei_mag1_3,ei_class = struct.unpack("<B3sB11x", e_ident)
+    ei_mag0,ei_mag1_3,ei_class,ei_data,ei_version = struct.unpack("<B3sBBB9x", e_ident)
 
     if (ei_mag0 != 0x7f and ei_mag1_3 != "ELF") or ei_class == 0:
         return 0
@@ -51,11 +52,17 @@ def parse_elf_header():
 
     if arch == 32:
         # 32bit
-        hdr_fmt = "<HHILLLIHHHHHH"
+        if ei_data == 1: # ei_data = 1, little endian
+            hdr_fmt = "<HHILLLIHHHHHH"
+        else:   # ei_data = 0, big endian
+            hdr_fmt = ">HHILLLIHHHHHH"
         hdr_size = 52
     else:
         # 64bit
-        hdr_fmt = "<HHIQQQIHHHHHH"
+        if ei_data == 1:
+            hdr_fmt = "<HHIQQQIHHHHHH"
+        else:
+            hdr_fmt = ">HHIQQQIHHHHHH"
         hdr_size = 64
 
     e_type, e_machine, e_version, e_entry, e_phoff, e_shoff, e_flags,\
@@ -64,9 +71,15 @@ def parse_elf_header():
 
 def change_interpreter(elf_file_name):
     if arch == 32:
-        ph_fmt = "<IIIIIIII"
+        if ei_data == 1: # ei_data = 1, little endian
+            ph_fmt = "<IIIIIIII"
+        else:   # ei_data = 0, big endian
+            ph_fmt = ">IIIIIIII"
     else:
-        ph_fmt = "<IIQQQQQQ"
+        if ei_data == 1:
+            ph_fmt = "<IIQQQQQQ"
+        else:
+            ph_fmt = ">IIQQQQQQ"
 
     """ look for PT_INTERP section """
     for i in range(0,e_phnum):
@@ -75,7 +88,7 @@ def change_interpreter(elf_file_name):
         if arch == 32:
             # 32bit
             p_type, p_offset, p_vaddr, p_paddr, p_filesz,\
-                p_memsz, p_flags, p_align = struct.unpack(ph_fmt, ph_hdr)
+            p_memsz, p_flags, p_align = struct.unpack(ph_fmt, ph_hdr)
         else:
             # 64bit
             p_type, p_flags, p_offset, p_vaddr, p_paddr, \
@@ -105,17 +118,29 @@ def change_interpreter(elf_file_name):
 
 def change_dl_sysdirs(elf_file_name):
     if arch == 32:
-        sh_fmt = "<IIIIIIIIII"
+        if ei_data == 1: # ei_data = 1, little endian
+            sh_fmt = "<IIIIIIIIII"
+        else:   # ei_data = 0, big endian
+            sh_fmt = ">IIIIIIIIII"
     else:
-        sh_fmt = "<IIQQQQIIQQ"
+        if ei_data == 1:
+            sh_fmt = "<IIQQQQIIQQ"
+        else:
+            sh_fmt = ">IIQQQQIIQQ"
 
     """ read section string table """
     f.seek(e_shoff + e_shstrndx * e_shentsize)
     sh_hdr = f.read(e_shentsize)
     if arch == 32:
-        sh_offset, sh_size = struct.unpack("<16xII16x", sh_hdr)
+        if ei_data == 1:
+            sh_offset, sh_size = struct.unpack("<16xII16x", sh_hdr)
+        else:
+            sh_offset, sh_size = struct.unpack(">16xII16x", sh_hdr)
     else:
-        sh_offset, sh_size = struct.unpack("<24xQQ24x", sh_hdr)
+        if ei_data == 1:
+            sh_offset, sh_size = struct.unpack("<24xQQ24x", sh_hdr)
+        else:
+            sh_offset, sh_size = struct.unpack(">24xQQ24x", sh_hdr)
 
     f.seek(sh_offset)
     sh_strtab = f.read(sh_size)
-- 
2.25.1


