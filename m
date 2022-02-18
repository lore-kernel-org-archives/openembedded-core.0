Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B25C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:42 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.9110.1645178801320654077
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T8M2nNqP;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id d27so13637839wrc.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DAMDGn2h+wuKexum5WWIIZnRvyoYO6DvB1Tz3SllIHg=;
        b=T8M2nNqP61U5Ge4ZRL7HQghKSqPgmaeD3ZqjwpqGpoQe5ej1ODi76gKi0WuJH0RIrX
         gB0L9oOxCNgYK+QUREBkeoc7qvJWv5rgDtnoseR2bW98G4/1ardyiOxSWPXXkKNIZmaq
         KpkrQBjO9QIgzVMOOpi6bdzXZicEod3pbjo0oDNKuqnt6t022LSKmRD8g+Kl+RE9Kk3d
         KGQ2kyPqvZqH4IBBNgorqsoACGh76g/bHk4ZccXnTg/FGxlpTIwVEE2leiOC3NrRmhZS
         rUI5fRz+ObYhVfOaxD7GnHkdFsoELso+W+HMMnNfDm9k3o+JbI9FlkoiCb/fpMPSJaeT
         vKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DAMDGn2h+wuKexum5WWIIZnRvyoYO6DvB1Tz3SllIHg=;
        b=VSUsmo2FCLCkJm7OY7UT2aFxQJ1iKEU61+UNykwZIvV16LiIN2kHvf+BiHqWn5MbzY
         0wVytDs5p86vynCz/TOHt8BaXZroArNhcVerRdyjRn04XaYEhBbjEt47lDvQe0MG+AmK
         xzqvMr4ddaFDL5pqDadRNbUNiq0k4uRsTwWYUk+lmrZhryiOvaILe9+mlYY7vtUSW1SC
         VY/UqTig6r7LTZK79dxp5BvjJT20AfJUmZEa3FDrnbLkLyiWsH5S0dZ+v/YoTbCPy6Tl
         gZaRIBOpOH3OZyz5oQSP3v1CwIpJJc4ct3l4MAcK2sdCkpxu6IPSA1asFw72HoA8M6EP
         /kaQ==
X-Gm-Message-State: AOAM5309aeQC6R1MfjgqWJFTg5Nh4Jmx8zUSpGr8GpSm1Ai36XiHy1vI
	HPrxnv5q1SVLaae3J3luKJAmpDUlQW4=
X-Google-Smtp-Source: 
 ABdhPJzAkOA64ldcqoISkcNPdppuhIsxkFTWjyaq2OVxsXQ9hOUidc8+J79FtMLe6mLFBHxYwYC1MA==
X-Received: by 2002:adf:ecc5:0:b0:1e5:7908:966b with SMTP id
 s5-20020adfecc5000000b001e57908966bmr5285263wro.661.1645178799820;
        Fri, 18 Feb 2022 02:06:39 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:39 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 22/46][dunfell] grub: add a fix for a memory leak
Date: Fri, 18 Feb 2022 11:05:30 +0100
Message-Id: <20220218100554.1315511-23-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161910

This patch adds a fix for a memory leak in grub's path construction
in zfs. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
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
2.33.0


