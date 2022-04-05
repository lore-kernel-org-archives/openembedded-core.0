Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C240FC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:46 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.4123.1649152715587266278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 02:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jqhp5r/9;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id q19so10617614pgm.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 02:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CigoK4gT+y6Yw7gi9EqbIdA0Nhn47HraU+Aa/3q4Gnk=;
        b=Jqhp5r/9505ismGkQRAE+/aKp6OEMhgtjIT4emZnSxi8smDJFdHH4X4iC1xH593lUv
         Z5HlIlxNliDutWbo6Hw8icAHnluhgwwgBzBgCkKnDuTla2kuAeFgmLVhzY+YiuKxtcXU
         9S1d6vfC+8nyAOrfmCqwM6c3ZjMWpeO1vJsw5nrF8HmmOt4t0JXXh/CTfBRq147DgoI+
         IwRsyJ52A2DimWcRua9Y+uftD3H2R0N4Y9bWCAm95BLUbphyEoghLWKeavdJdtIwmxcd
         Y7T26rXQSRpqbqkoHDZFqWJel3kddMAqrbPjb8h7k8AYdMeG+7U2adxsok+WbYGtv2eA
         bShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CigoK4gT+y6Yw7gi9EqbIdA0Nhn47HraU+Aa/3q4Gnk=;
        b=47zrXjHT27g0rg2b3l90JJkzKsdgarAY0s6BzZwf4EoqR+R9fTTFIa8MsNkMEBeRAJ
         z6MREfHmqyZNERfQED5WCDK6LA8Nk2MADXMJPW6/wM9sfEZhG/Y4zHYzXremEs+eTHfS
         momMIF/Rfjg3l4dvSG8cG2aqX05cNVeEsugpe2vg0z1hdispD2vwfTVT1bj2xySmejYW
         4YSu5TX60ogGjKITD2qN+nzqk9v1BJRraEIWdnaCytcuD2eBj/UGWOU/HZbx0G8itLdX
         Owf9zTulFXFPrxHciRNXbOR/1xWb3NMRrUf9AOf5m4Xf92AXFYplVKy6dbjomDMmakBv
         N2Fw==
X-Gm-Message-State: AOAM5323pWcAE5XjcILQvW4+FV9N7wezCIn8uKfqyzk0vET5wflpsSxy
	/d0Bbw6akQM/HcoUVo+VOvdrGDgUHsxHRO+l
X-Google-Smtp-Source: 
 ABdhPJzEwLv0h+MyV8ZAsc2P3MCVc7a6IhMPGyJD0tEzVvVtglBHFe+jC3/LrmgBFScS1vAGvkkBCA==
X-Received: by 2002:a62:cd83:0:b0:4fa:7410:6d86 with SMTP id
 o125-20020a62cd83000000b004fa74106d86mr2820766pfg.52.1649152714599;
        Tue, 05 Apr 2022 02:58:34 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 207-20020a6217d8000000b004fdd5af8885sm14510813pfx.22.2022.04.05.02.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 02:58:33 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: pgowda.cve@gmail.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: meta: scripts - relocation script adapted to support big-endian
 machines
Date: Tue,  5 Apr 2022 15:28:19 +0530
Message-Id: <20220405095819.533001-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164012

relocate_sdk.py was developed for little-endian architures and when tries
to install SDK for big-endian machines errors like below will be shown.
Error: struct.error: unpack requires a string argument of length 32. SDK could
not be set up. Relocate script failed. Abort!
Error: IOError: [Errno 22] Invalid argument. SDK could not be set up. Relocate
script failed. Abort!

To fix this, script is modified to support big-endian architecture.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 scripts/relocate_sdk.py | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 8c0fdb986a..4ed8bfc0d1 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -30,9 +30,16 @@ else:
 old_prefix = re.compile(b("##DEFAULT_INSTALL_DIR##"))
 
 def get_arch():
+    global endian_prefix
     f.seek(0)
     e_ident =f.read(16)
-    ei_mag0,ei_mag1_3,ei_class = struct.unpack("<B3sB11x", e_ident)
+    ei_mag0,ei_mag1_3,ei_class,ei_data,ei_version = struct.unpack("<B3sBBB9x", e_ident)
+
+    # ei_data = 1 for little-endian & 0 for big-endian
+    if ei_data == 1:
+        endian_prefix = '<'
+    else:
+        endian_prefix = '>'
 
     if (ei_mag0 != 0x7f and ei_mag1_3 != "ELF") or ei_class == 0:
         return 0
@@ -51,11 +58,11 @@ def parse_elf_header():
 
     if arch == 32:
         # 32bit
-        hdr_fmt = "<HHILLLIHHHHHH"
+        hdr_fmt = endian_prefix + "HHILLLIHHHHHH"
         hdr_size = 52
     else:
         # 64bit
-        hdr_fmt = "<HHIQQQIHHHHHH"
+        hdr_fmt = endian_prefix + "HHIQQQIHHHHHH"
         hdr_size = 64
 
     e_type, e_machine, e_version, e_entry, e_phoff, e_shoff, e_flags,\
@@ -64,9 +71,9 @@ def parse_elf_header():
 
 def change_interpreter(elf_file_name):
     if arch == 32:
-        ph_fmt = "<IIIIIIII"
+        ph_fmt = endian_prefix + "IIIIIIII"
     else:
-        ph_fmt = "<IIQQQQQQ"
+        ph_fmt = endian_prefix + "IIQQQQQQ"
 
     """ look for PT_INTERP section """
     for i in range(0,e_phnum):
@@ -105,17 +112,17 @@ def change_interpreter(elf_file_name):
 
 def change_dl_sysdirs(elf_file_name):
     if arch == 32:
-        sh_fmt = "<IIIIIIIIII"
+        sh_fmt = endian_prefix + "IIIIIIIIII"
     else:
-        sh_fmt = "<IIQQQQIIQQ"
+        sh_fmt = endian_prefix + "IIQQQQIIQQ"
 
     """ read section string table """
     f.seek(e_shoff + e_shstrndx * e_shentsize)
     sh_hdr = f.read(e_shentsize)
     if arch == 32:
-        sh_offset, sh_size = struct.unpack("<16xII16x", sh_hdr)
+        sh_offset, sh_size = struct.unpack(endian_prefix + "16xII16x", sh_hdr)
     else:
-        sh_offset, sh_size = struct.unpack("<24xQQ24x", sh_hdr)
+        sh_offset, sh_size = struct.unpack(endian_prefix + "24xQQ24x", sh_hdr)
 
     f.seek(sh_offset)
     sh_strtab = f.read(sh_size)
-- 
2.25.1


