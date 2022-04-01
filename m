Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1EAC433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 04:20:25 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.6595.1648786824951162010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 21:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WYwTTAOJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id p17so1428374plo.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 21:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=paOgGExpD92w/PiR/P0S47PZ2HsPrYVISWco35G6MMg=;
        b=WYwTTAOJjfHYgWXFEV1RJ9LIU/kR7QCrHs9ADzk0yXg1HSpP8QXhr8gUefDaTeu4DZ
         aMfOfYp8BpnUVQZCNBJ9L4A/vNSGjfcqYNSaUnZdYPwHT7PRF8A0jEVFJg5BiBuvJdHc
         I76GBhU1kPXXHUE9AmhkdeBKd3gzIlpGEQ+ZiSG6AnpG99AUiGeJfgw1vQQeAibpR+AA
         Y7Xah7aNrRv3tlAzNBsP4Kvl5PxV+8LucbugfJhMH09T7Lgcp9zaK80YX8EePOVxAlJy
         2OeUbR4QZTZBBPW+z21z+gBmyWDfTRoCCv1DnsdW+Tol7YFo+eD0Rrni/TKK9Cyz7Xul
         m13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=paOgGExpD92w/PiR/P0S47PZ2HsPrYVISWco35G6MMg=;
        b=p+FoPhnxXVMx2eXRd3eNKqHWOQLO9T+f/KszJnt4LDFqd4n9GM5mU3pzoZzr/csPlA
         JbhxFAHPUfMCAw4udKwUlpIFR5HB4gJLBreMiXUCOUOF5pClzQNDQQLxtbP0B/4JcXa7
         ztGR+no8vrZInNpb95R5/qaFvsR9pbH++FkyjT2AzIR2iFVOyefvUjlrU/OgsUFRrODm
         VF9MRHvZREf9HLWIFin6yQmiA8MPEQK1mkQh6zzolCeo+avI3sbZA8dh4g+L8q96/e7U
         1WdgxaTJ+tJrVei+higzuoaRJew97t+4qfA+nj5Ns9kr/PE5iUbi+30kEAPt2lz52sxR
         +hqQ==
X-Gm-Message-State: AOAM533KC+sBNsxJPqVxe88gl5fYdnkzb99N3I8qtlXstp0SM1/m8m+L
	PTqT8gi8vSWkuyGFn0xRFsoum12xNLCSixct
X-Google-Smtp-Source: 
 ABdhPJzsfwxANs3fKIwNiXJBeaOkqvOeSg+5wIe+cBvBXE75Lp79hIj9MwPqyo/+cE3g7SXWd1uBZw==
X-Received: by 2002:a17:902:a585:b0:14d:58ef:65 with SMTP id
 az5-20020a170902a58500b0014d58ef0065mr8294834plb.139.1648786824048;
        Thu, 31 Mar 2022 21:20:24 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 y63-20020a638a42000000b0039870096849sm852011pgd.63.2022.03.31.21.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 21:20:23 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [master] meta: scripts - relocation script adapted to support
 big-endian machines
Date: Fri,  1 Apr 2022 09:50:07 +0530
Message-Id: <20220401042007.2949717-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 04:20:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163879

relocate_sdk.py was developed for little-endian architures and when tries
to install SDK for big-endian machines errors like below will be shown.

The changes made in the script to support big-endian architecture.

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


