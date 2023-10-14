Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CDCCDB482
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 21:45:31 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.75713.1697319922287663129
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 14:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Cns2M3E5;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.174, mailfrom: steve@sakoman.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-35135f69de2so12017195ab.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697319921; x=1697924721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrKHfMn6mYV+90itKWXrHqU3mQMEcqqdMcKUjfZSiiU=;
        b=Cns2M3E55WXEEftLVMuZ08MbricZAPPlU7m2XbKqlJJvqNXNadN0iV5TddJ5Sg0ky+
         TY9THpI1d5VFE5ZjJSUPS/JhUZ+gzYh9E/RPgWbSYmEmllmu3g3IElaNU532KrjvT8MI
         p3U7vFQUd3aw0Zb+ghUuhb6iJrpHADgdpT1myrjDuiXV4yqyWii8Oy8AghjLJGcnBeEo
         hpyegK6sotbLpYcM9Jf8UrBZ1h4cIzQNEhfcuPXwPo3QPPQItdU3fs+qtMSlGwKbLMOG
         DokDMw520wq3STegTIVe/nZNQhJdBKYljFM0tLt90jUreO8/UbXILT7VAgQDBzVWykxj
         bQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697319921; x=1697924721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrKHfMn6mYV+90itKWXrHqU3mQMEcqqdMcKUjfZSiiU=;
        b=UGTpW0jkBZvmINvINLMIpGkEIeMc1IE3Pn/wzPEZxzPDG136paZgh4W5HuUqGo34xV
         /CzO9NkA4MHwitf2oiZmTccEy7V605+5vaWBswRZkHYdvR9gMzmbEBdqj4rwBzN//Uv/
         zh2XiBZ+R+52+xPuIUUhuw+119MBW1U2dXp8LbzsTYTl7AD8xFadpslOyHHEQyyCClow
         x7AS4dNTJ47/8ySQZI44VacwJaLxKIZneqm1gav8PsQHCe8yMdrqxe+Nq2p+X/v7/oa3
         Km1rBU9zuXoOUKQfjWkfVvJ8XPtAjHKQ0Gytr3j+y2H2+ruBg1yYwIQl1pb8RCS3mmGv
         H/IQ==
X-Gm-Message-State: AOJu0YxKEuajiSngNgM49b4tPDvvDddubBEmiDmX18B751/7VXgZ6uh/
	MsjMhek/QLnHR13KhyT3/q7HN7JNicluZS8DqIw=
X-Google-Smtp-Source: AGHT+IGnG1iIE/gyHk247iV/VrcuAZsw6DxANhBGz3CpyIkCq8IvL4FWGCp+p1hQ8oo339MoU4DR4Q==
X-Received: by 2002:a92:d250:0:b0:357:7ca7:2ffe with SMTP id v16-20020a92d250000000b003577ca72ffemr13616ilg.0.1697319921046;
        Sat, 14 Oct 2023 14:45:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b001c898328289sm5943411plb.158.2023.10.14.14.45.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 14:45:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/13] binutils: Fix CVE-2022-44840
Date: Sat, 14 Oct 2023 11:44:48 -1000
Message-Id: <7a42ae332ebde565cc7c6fca568563f076bd26ba.1697319777.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697319777.git.steve@sakoman.com>
References: <cover.1697319777.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 21:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189127

From: Yash Shinde <Yash.Shinde@windriver.com>

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0030-CVE-2022-44840.patch        | 151 ++++++++++++++++++
 2 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0030-CVE-2022-44840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 638b1ba93d..7c5d8f79ec 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -59,5 +59,6 @@ SRC_URI = "\
      file://0029-CVE-2022-48065-1.patch \
      file://0029-CVE-2022-48065-2.patch \
      file://0029-CVE-2022-48065-3.patch \
+     file://0030-CVE-2022-44840.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0030-CVE-2022-44840.patch b/meta/recipes-devtools/binutils/binutils/0030-CVE-2022-44840.patch
new file mode 100644
index 0000000000..2f4c38044b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0030-CVE-2022-44840.patch
@@ -0,0 +1,151 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 30 Oct 2022 08:38:51 +0000 (+1030)
+Subject: Pool section entries for DWP version 1
+X-Git-Tag: gdb-13-branchpoint~664
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=28750e3b967da2207d51cbce9fc8be262817ee59
+
+Pool section entries for DWP version 1
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
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=blobdiff_plain;f=binutils/dwarf.c;h=7730293326ac1049451eb4a037ac86d827030700;hp=c6340a28906114e9df29d7401472c7dc0a98c2b1;hb=28750e3b967da2207d51cbce9fc8be262817ee59;hpb=60095ba3b8f8ba26a6389dded732fa446422c98f]
+
+CVE: CVE-2022-44840
+
+Signed-off-by: yash shinde <yash.shinde@windriver.com>
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index c6340a28906..7730293326a 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -10652,22 +10652,12 @@ prealloc_cu_tu_list (unsigned int nshndx)
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
+@@ -10773,53 +10763,55 @@ process_cu_tu_index (struct dwarf_section *section, int do_display)
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
+-	  SAFE_BYTE_GET (signature, phash, 8, limit);
+-	  if (signature != 0)
++	  prealloc_cu_tu_list ((limit - ppool) / 4);
++	  for (shndx_list = ppool + 4; shndx_list <= limit - 4; shndx_list += 4)
+ 	    {
+-	      SAFE_BYTE_GET (j, pindex, 4, limit);
+-	      shndx_list = ppool + j * 4;
+-	      /* PR 17531: file: 705e010d.  */
+-	      if (shndx_list < ppool)
+-		{
+-		  warn (_("Section index pool located before start of section\n"));
+-		  return 0;
+-		}
++	      shndx = byte_get (shndx_list, 4);
++	      add_shndx_to_cu_tu_entry (shndx);
++	    }
++	  end_cu_tu_entry ();
++	}
++      else
++	for (i = 0; i < nslots; i++)
++	  {
++	    SAFE_BYTE_GET (signature, phash, 8, limit);
++	    if (signature != 0)
++	      {
++		SAFE_BYTE_GET (j, pindex, 4, limit);
++		shndx_list = ppool + j * 4;
++		/* PR 17531: file: 705e010d.  */
++		if (shndx_list < ppool)
++		  {
++		    warn (_("Section index pool located before start of section\n"));
++		    return 0;
++		  }
+ 
+-	      if (do_display)
+ 		printf (_("  [%3d] Signature:  0x%s  Sections: "),
+ 			i, dwarf_vmatoa ("x", signature));
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
++			return 0;
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
2.34.1


