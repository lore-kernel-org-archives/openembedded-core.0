Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A10DC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:49 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.7074.1645799268565479172
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Rgv+wp21;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 12so4835548pgd.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6IEfsP6tnfxlyz1yicSEulfAJxBLkCOgheOwjUbxRTA=;
        b=Rgv+wp219qHysZz5ecpkutJoa06ezaGc0DGe+1oaB3btGHYJr0KBIAwX//So7CHX9i
         ofp2PPgLs73vgo9xALUws8AtfurPjdBFD+QtwC394rfW0RDv03TYBhGrnTi5KgKb/ISj
         O87sDoH6Vdbu/KzSlxn4H809pTGb6vfDeOXOxB3RMlDrH+F9vX6HoAK+Fdm8BupTru0m
         0u7VcI4BGd2BmOvvzchB+2T/FBLmWo0RhrLTAIQhSHuT9KmxEWrjxJ66SAx0DH4SxSNF
         eX8XtG2/wA6BnDT4oJhngDwf6INvbWzcSZgH4+FLqrQviBmxLV02PwAKl4EcBU+V1UQ6
         epTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6IEfsP6tnfxlyz1yicSEulfAJxBLkCOgheOwjUbxRTA=;
        b=rxRcctL73Jc859iBN7jteBmzmp6WdmW9Kox2bl9/EunErBa/m5PI113Y2ejJ7bWM6e
         aBpQ+yuhnLSf6H9ZRjat45hzLyW9y2+AaVYXAdxfVX8gnqMgn1LqKn138ZEgMoEOtOAu
         KuTAr7t5o36DUXQXgFhH92AOI59ovRta9ABwlHoSTgXg1KXCIaMQZVRyKJN7YozHXeEV
         qURQvPZUppSE7Wi01XZ8g7fguVtdhT3KMj5MRWhQ8O2Sqwef4E/P+W6UNOf9As1lVKLr
         75BROKWoiygj/colRBqpfLA3xa9IKfscS1FM1MktI0vad/SdFAyOidfudHCPttZkaOt9
         qGTw==
X-Gm-Message-State: AOAM530UeZsWSaAZY5owqmWCkjdfciZZCwjSyxqNIPB7lO8wL66DSsew
	wruhyhayh4kFteoGheB5GBcYF/z/N9RZ/8Qp
X-Google-Smtp-Source: 
 ABdhPJwCXcJyrNL9Jytj7ludyA8bBejIwyy982Y8tQP9lT3xO947LgMR/Bx3tOMfJN2/od8+bt9wtg==
X-Received: by 2002:a62:7c41:0:b0:4e1:3185:cb21 with SMTP id
 x62-20020a627c41000000b004e13185cb21mr8067619pfc.82.1645799267539;
        Fri, 25 Feb 2022 06:27:47 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/50] grub: add a fix for a memory leak
Date: Fri, 25 Feb 2022 04:26:06 -1000
Message-Id: 
 <f2a474545b8ba61a43fcbcd3c375c5db9f0303ca.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162372

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for a memory leak in grub's path construction
in zfs. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...source-leaks-while-constructing-path.patch | 121 ++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0022-zfs-Fix-resource-leaks-while-constructing-path.patch

diff --git a/meta/recipes-bsp/grub/files/0022-zfs-Fix-resource-leaks-while-constructing-path.patch b/meta/recipes-bsp/grub/files/0022-zfs-Fix-resource-leaks-while-constructing-path.patch
new file mode 100644
index 0000000000..5ded5520e9
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0022-zfs-Fix-resource-leaks-while-constructing-path.patch
@@ -0,0 +1,121 @@
+From 83fdffc07ec4586b375ab36189f255ffbd8f99c2 Mon Sep 17 00:00:00 2001
+From: Paulo Flabiano Smorigo <pfsmorigo@canonical.com>
+Date: Mon, 14 Dec 2020 18:54:49 -0300
+Subject: [PATCH] zfs: Fix resource leaks while constructing path
+
+There are several exit points in dnode_get_path() that are causing possible
+memory leaks.
+
+In the while(1) the correct exit mechanism should not be to do a direct return,
+but to instead break out of the loop, setting err first if it is not already set.
+
+The reason behind this is that the dnode_path is a linked list, and while doing
+through this loop, it is being allocated and built up - the only way to
+correctly unravel it is to traverse it, which is what is being done at the end
+of the function outside of the loop.
+
+Several of the existing exit points correctly did a break, but not all so this
+change makes that more consistent and should resolve the leaking of memory as
+found by Coverity.
+
+Fixes: CID 73741
+
+Signed-off-by: Paulo Flabiano Smorigo <pfsmorigo@canonical.com>
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=89bdab965805e8d54d7f75349024e1a11cbe2eb8]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/fs/zfs/zfs.c | 30 +++++++++++++++++++++---------
+ 1 file changed, 21 insertions(+), 9 deletions(-)
+
+diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c
+index 0c42cba..9087a72 100644
+--- a/grub-core/fs/zfs/zfs.c
++++ b/grub-core/fs/zfs/zfs.c
+@@ -2836,8 +2836,8 @@ dnode_get_path (struct subvolume *subvol, const char *path_in, dnode_end_t *dn,
+ 
+       if (dnode_path->dn.dn.dn_type != DMU_OT_DIRECTORY_CONTENTS)
+ 	{
+-	  grub_free (path_buf);
+-	  return grub_error (GRUB_ERR_BAD_FILE_TYPE, N_("not a directory"));
++	  err = grub_error (GRUB_ERR_BAD_FILE_TYPE, N_("not a directory"));
++	  break;
+ 	}
+       err = zap_lookup (&(dnode_path->dn), cname, &objnum,
+ 			data, subvol->case_insensitive);
+@@ -2879,11 +2879,18 @@ dnode_get_path (struct subvolume *subvol, const char *path_in, dnode_end_t *dn,
+ 		       << SPA_MINBLOCKSHIFT);
+ 
+ 	      if (blksz == 0)
+-		return grub_error(GRUB_ERR_BAD_FS, "0-sized block");
++                {
++                  err = grub_error (GRUB_ERR_BAD_FS, "0-sized block");
++                  break;
++                }
+ 
+ 	      sym_value = grub_malloc (sym_sz);
+ 	      if (!sym_value)
+-		return grub_errno;
++		{
++		  err = grub_errno;
++		  break;
++		}
++
+ 	      for (block = 0; block < (sym_sz + blksz - 1) / blksz; block++)
+ 		{
+ 		  void *t;
+@@ -2893,7 +2900,7 @@ dnode_get_path (struct subvolume *subvol, const char *path_in, dnode_end_t *dn,
+ 		  if (err)
+ 		    {
+ 		      grub_free (sym_value);
+-		      return err;
++		      break;
+ 		    }
+ 
+ 		  movesize = sym_sz - block * blksz;
+@@ -2903,6 +2910,8 @@ dnode_get_path (struct subvolume *subvol, const char *path_in, dnode_end_t *dn,
+ 		  grub_memcpy (sym_value + block * blksz, t, movesize);
+ 		  grub_free (t);
+ 		}
++		if (err)
++		  break;
+ 	      free_symval = 1;
+ 	    }	    
+ 	  path = path_buf = grub_malloc (sym_sz + grub_strlen (oldpath) + 1);
+@@ -2911,7 +2920,8 @@ dnode_get_path (struct subvolume *subvol, const char *path_in, dnode_end_t *dn,
+ 	      grub_free (oldpathbuf);
+ 	      if (free_symval)
+ 		grub_free (sym_value);
+-	      return grub_errno;
++	      err = grub_errno;
++	      break;
+ 	    }
+ 	  grub_memcpy (path, sym_value, sym_sz);
+ 	  if (free_symval)
+@@ -2949,11 +2959,12 @@ dnode_get_path (struct subvolume *subvol, const char *path_in, dnode_end_t *dn,
+ 	      
+ 	      err = zio_read (bp, dnode_path->dn.endian, &sahdrp, NULL, data);
+ 	      if (err)
+-		return err;
++	        break;
+ 	    }
+ 	  else
+ 	    {
+-	      return grub_error (GRUB_ERR_BAD_FS, "filesystem is corrupt");
++	      err = grub_error (GRUB_ERR_BAD_FS, "filesystem is corrupt");
++	      break;
+ 	    }
+ 
+ 	  hdrsize = SA_HDR_SIZE (((sa_hdr_phys_t *) sahdrp));
+@@ -2974,7 +2985,8 @@ dnode_get_path (struct subvolume *subvol, const char *path_in, dnode_end_t *dn,
+ 	      if (!path_buf)
+ 		{
+ 		  grub_free (oldpathbuf);
+-		  return grub_errno;
++		  err = grub_errno;
++		  break;
+ 		}
+ 	      grub_memcpy (path, sym_value, sym_sz);
+ 	      path [sym_sz] = 0;
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 360e86685b..1630235edd 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -68,6 +68,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0019-disk-cryptodisk-Fix-potential-integer-overflow.patch \
            file://0020-hfsplus-Check-that-the-volume-name-length-is-valid.patch \
            file://0021-zfs-Fix-possible-negative-shift-operation.patch \
+           file://0022-zfs-Fix-resource-leaks-while-constructing-path.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


