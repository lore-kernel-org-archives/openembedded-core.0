Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC47C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 07:35:10 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.13166.1713857703681249898
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 00:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dVezgZda;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so3603281a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 00:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713857702; x=1714462502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AnvJ3UTX3Y3km84B6PTdL04HjcfQ34x9YQoRC6L2R3E=;
        b=dVezgZdaeqxrcNJoaObRJnIgzsEU63gHZW7OEb9xCydcHuqqG5t4y7aupf7IeDQelo
         HUwfF/uf2C0HA/SKNAGvVp7kMzHriWlVjQ8w0KWfz/XDnjiObpz2bxoYto1xb2cUTGeM
         OtDxURpe+9eDmyrkYxks90k/Pn56DrMAwjjkJb+e2cOCEIJ1Yjxysd+2DMFzctLsoFqz
         jZZkH1j4K8YGDHBf+7T4//KJ8VS/3ANp3KpkqoGmTQbThZZAbyUXWdaO9qqzzulpcJ8x
         YDjb53xoLpygchMrbjEoMwe0MwfkBcgkovC5hS/yKItBH9H3KpPFKCJdDpb+u64EYOKF
         ji3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713857702; x=1714462502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnvJ3UTX3Y3km84B6PTdL04HjcfQ34x9YQoRC6L2R3E=;
        b=FAVeDzztJQZ67JMJ6EZmFrK24nzunsCpr8sf1vfWHTPV29gQ0LVGgrDXCeuWUEWW+2
         7GFl/3KrO8hR7WC/IftrkAEnf88XVUG2DP6fhs+BYH/fB5i3h40zMksx+0gNtJOVvkX3
         xgDbEoP4J/1dPirnYwJvj5zCPD/L+INjzPxFkC6ZWAz1C3L0O1tBaLBPiWsoIVbHDqUK
         Rqn5BVkQvzgB287U2UHbaWZ0SWQ8sPQ0rExYcIFHs1r3yp298nkhZtOhNgOdaujM9XED
         CQwGfWbE+bMUpLkNn0KirNNsFQapsJKhVHfX2MfnSoqZf5gvHL6Zn8EKIdL93yERdPuz
         Ybyg==
X-Gm-Message-State: AOJu0Yw+YdWdmmxpgPE3oA5iyGI4T0v90RJKFNbnT6/J3dy804amhOXI
	ZOeokMDzgLQajZEVQ3UcKqS99+5LxVG6vb+pd3qURspGiAGLy2JS2NEJVg==
X-Google-Smtp-Source: AGHT+IFh4JgL8kG0bv94K97wXj5jO6K7bJnRGbsg+goFo+bIKEZYjkAvwqxn0FMmqTZ3EjuwLmoeBg==
X-Received: by 2002:a17:90a:5513:b0:2a5:be1a:6831 with SMTP id b19-20020a17090a551300b002a5be1a6831mr2692945pji.19.1713857701560;
        Tue, 23 Apr 2024 00:35:01 -0700 (PDT)
Received: from L-18076.kpit.com ([223.233.81.5])
        by smtp.gmail.com with ESMTPSA id t13-20020a17090ad50d00b002a5dbfca370sm10539761pju.48.2024.04.23.00.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 00:35:01 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Subject: [OE-core][dunfell][PATCH 1/4] binutils: Fix CVE-2022-44840
Date: Tue, 23 Apr 2024 13:04:39 +0530
Message-Id: <20240423073442.48274-1-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 07:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198606

Add patch file to fix CVE-2022-44840

Reference: https://answers.launchpad.net/ubuntu/+archive/primary/+sourcefiles/binutils/2.34-6ubuntu1.8/binutils_2.34-6ubuntu1.8.debian.tar.xz

Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/binutils/CVE-2022-44840.patch    | 162 ++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-44840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 032263fe63..64f66a30a9 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -62,5 +62,6 @@ SRC_URI = "\
      file://CVE-2022-47011.patch \
      file://CVE-2022-48063.patch \
      file://CVE-2022-47695.patch \
+     file://CVE-2022-44840.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2022-44840.patch b/meta/recipes-devtools/binutils/binutils/CVE-2022-44840.patch
new file mode 100644
index 0000000000..288219871d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2022-44840.patch
@@ -0,0 +1,162 @@
+[Ubuntu note: commit af2ddf69ab85 is not included in this version of the code,
+ so adjustments had to be made to the 2nd hunk in order for it to apply
+ cleanly and in order to have the added code match correct macro usage for
+ this version of binutils (SAFE_BYTE_GET64 is called with signature_high and
+ signature_low in this version of the code, but not in the added lines of the
+ original patch).
+ -- Camila Camargo de Matos <camila.camargodematos@canonical.com>]
+
+Origin: backport, https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=28750e3b967da2207d51cbce9fc8be262817ee59
+
+From 28750e3b967da2207d51cbce9fc8be262817ee59 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 30 Oct 2022 19:08:51 +1030
+Subject: [PATCH] Pool section entries for DWP version 1
+
+Ref: https://gcc.gnu.org/wiki/DebugFissionDWP?action=recall&rev=3
+
+Fuzzers have found a weakness in the code stashing pool section
+entries.  With random nonsensical values in the index entries (rather
+than each index pointing to its own set distinct from other sets),
+it's possible to overflow the space allocated, losing the NULL
+terminator.  Without a terminator, find_section_in_set can run off the
+end of the shndx_pool buffer.  Fix this by scanning the pool directly.
+
+binutils/
+	* dwarf.c (add_shndx_to_cu_tu_entry): Delete range check.
+	(end_cu_tu_entry): Likewise.
+	(process_cu_tu_index): Fill shndx_pool by directly scanning
+	pool, rather than indirectly from index entries.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=28750e3b967da2207d51cbce9fc8be262817ee59]
+
+CVE: CVE-2022-44840
+
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+ binutils/dwarf.c | 90 ++++++++++++++++++++++--------------------------
+ 1 file changed, 41 insertions(+), 49 deletions(-)
+
+Index: binutils-2.34/binutils/dwarf.c
+===================================================================
+--- binutils-2.34.orig/binutils/dwarf.c
++++ binutils-2.34/binutils/dwarf.c
+@@ -9454,22 +9454,12 @@ prealloc_cu_tu_list (unsigned int nshndx
+ static void
+ add_shndx_to_cu_tu_entry (unsigned int shndx)
+ {
+-  if (shndx_pool_used >= shndx_pool_size)
+-    {
+-      error (_("Internal error: out of space in the shndx pool.\n"));
+-      return;
+-    }
+   shndx_pool [shndx_pool_used++] = shndx;
+ }
+ 
+ static void
+ end_cu_tu_entry (void)
+ {
+-  if (shndx_pool_used >= shndx_pool_size)
+-    {
+-      error (_("Internal error: out of space in the shndx pool.\n"));
+-      return;
+-    }
+   shndx_pool [shndx_pool_used++] = 0;
+ }
+ 
+@@ -9578,54 +9568,55 @@ process_cu_tu_index (struct dwarf_sectio
+ 
+   if (version == 1)
+     {
++      unsigned char *shndx_list;
++      unsigned int shndx;
++
+       if (!do_display)
+-	prealloc_cu_tu_list ((limit - ppool) / 4);
+-      for (i = 0; i < nslots; i++)
+ 	{
+-	  unsigned char *shndx_list;
+-	  unsigned int shndx;
+-
+-	  SAFE_BYTE_GET64 (phash, &signature_high, &signature_low, limit);
+-	  if (signature_high != 0 || signature_low != 0)
++         prealloc_cu_tu_list ((limit - ppool) / 4);
++         for (shndx_list = ppool + 4; shndx_list <= limit - 4; shndx_list += 4)
+ 	    {
+-	      SAFE_BYTE_GET (j, pindex, 4, limit);
+-	      shndx_list = ppool + j * 4;
+-	      /* PR 17531: file: 705e010d.  */
+-	      if (shndx_list < ppool)
+-		{
+-		  warn (_("Section index pool located before start of section\n"));
+-		  return 0;
+-		}
+-
+-	      if (do_display)
++	      shndx = byte_get (shndx_list, 4);
++	      add_shndx_to_cu_tu_entry (shndx);
++	    }
++	  end_cu_tu_entry ();
++	}
++      else
++	for (i = 0; i < nslots; i++)
++	  {
++	    SAFE_BYTE_GET64 (phash, &signature_high, &signature_low, limit);
++	    if (signature_high != 0 || signature_low != 0)
++	      {
++		SAFE_BYTE_GET (j, pindex, 4, limit);
++		shndx_list = ppool + j * 4;
++		/* PR 17531: file: 705e010d.  */
++		if (shndx_list < ppool)
++		  {
++		    warn (_("Section index pool located before start of section\n"));
++		    return 0;
++		  }
+ 		printf (_("  [%3d] Signature:  0x%s  Sections: "),
+ 			i, dwarf_vmatoa64 (signature_high, signature_low,
+ 					   buf, sizeof (buf)));
+-	      for (;;)
+-		{
+-		  if (shndx_list >= limit)
+-		    {
+-		      warn (_("Section %s too small for shndx pool\n"),
+-			    section->name);
+-		      return 0;
+-		    }
+-		  SAFE_BYTE_GET (shndx, shndx_list, 4, limit);
+-		  if (shndx == 0)
+-		    break;
+-		  if (do_display)
++		for (;;)
++		  {
++		    if (shndx_list >= limit)
++		      {
++			warn (_("Section %s too small for shndx pool\n"),
++			      section->name);
++		        return 0;
++		      }
++		    SAFE_BYTE_GET (shndx, shndx_list, 4, limit);
++		    if (shndx == 0)
++		      break;
+ 		    printf (" %d", shndx);
+-		  else
+-		    add_shndx_to_cu_tu_entry (shndx);
+-		  shndx_list += 4;
+-		}
+-	      if (do_display)
++		    shndx_list += 4;
++		  }
+ 		printf ("\n");
+-	      else
+-		end_cu_tu_entry ();
+-	    }
+-	  phash += 8;
+-	  pindex += 4;
+-	}
++	      }
++	    phash += 8;
++	    pindex += 4;
++	  }
+     }
+   else if (version == 2)
+     {
-- 
2.25.1


