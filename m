Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0F7C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:34 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.6923.1645799253678200773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=drjKGtdE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 12so4834937pgd.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5FjLs2nlW2dIsfM91POnsjp1TYob1Ym9totJzJW1ng0=;
        b=drjKGtdEp69bivkwkikZav0pjrQZbrXlzIrLPrhFCSBqaFroMYGK7Q1CpWX4K5SpCk
         ekb/J/jmOZWCW3/Zr3vepZG8aOxyMF+4gRLc/LSWYzhxq/ErSpVaAkBaAPP1RVlK1G6x
         I992dFQBw9Z7evbsO2T73OAT05uihbqc1Zo6aPlH8oW4z5n7U29mqPjioI5pIijYL7gg
         itP4EfvOJkehxRup1RVA1IccPdYNsRBF2W8EnV2rIuhjdfRvUGtSAytqVU6EC2M/kK5i
         C2lTW6IfVwsJroegSg8mlttYhtcHlQWKIUWX66wNmz9m3LRN2XKuCmq28Qm4cXpQntEO
         xbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5FjLs2nlW2dIsfM91POnsjp1TYob1Ym9totJzJW1ng0=;
        b=hCCgUbj/UZOUPbyvv8wz0bgLe9XiUhAWXD3SkooYZvbAWes3xBzfZLcirUkyR3pHOY
         e5BkiDtEgSAx6FFdtHBErLOrVFhbaZmbcRGSUX7+fCRzMmd2h164Oa61qwQLU+64x2/j
         THreNsfOuQO9D9f/Dzj0X6WbgZ0Y7Sg3PpG6+EjBprMu+24NDAl6C+PnrUBV1kkOqVlL
         TUc2KzC028GCLnJEGvLVzQ5+pQsbWF8mr4u8fvzK+jKB1MPyq4RU3mKnkVEGdqVNutKR
         +orNvCk+DLuf1y0a5uw1zWMhmApF3FZkE+qYgdSZ/k9fytB23JOZpMgNdWz2H03ZYePc
         y+JA==
X-Gm-Message-State: AOAM5314NQ27D0RapIywc/Xx7rOL+UzFF3v6M2asWi06ZaRgMRGMaZ7B
	CfspvSeRMkgW/1+IM3+7PLn8AMiw12ju49lt
X-Google-Smtp-Source: 
 ABdhPJwhc3lSskRzf3ebiXY4DKNmDw1CvlmDSk2Cbxu08EdNxSunZtOiXKzr89pyIGPKGXYMco/XJw==
X-Received: by 2002:a63:b47:0:b0:373:cbfb:f4c8 with SMTP id
 a7-20020a630b47000000b00373cbfbf4c8mr6244839pgl.328.1645799252652;
        Fri, 25 Feb 2022 06:27:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/50] grub: fix a memory leak
Date: Fri, 25 Feb 2022 04:26:00 -1000
Message-Id: 
 <9fa41d5fbd1de899d1242c31d427262cd041d47c.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162366

From: Marta Rybczynska <rybczynska@gmail.com>

Add a fix for a memory leak in grub's disk/ldm. It is a part of
a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...re-comp-data-is-freed-before-exiting.patch | 128 ++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0016-disk-ldm-Make-sure-comp-data-is-freed-before-exiting.patch

diff --git a/meta/recipes-bsp/grub/files/0016-disk-ldm-Make-sure-comp-data-is-freed-before-exiting.patch b/meta/recipes-bsp/grub/files/0016-disk-ldm-Make-sure-comp-data-is-freed-before-exiting.patch
new file mode 100644
index 0000000000..c1687c75d0
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0016-disk-ldm-Make-sure-comp-data-is-freed-before-exiting.patch
@@ -0,0 +1,128 @@
+From 0c5d0fd796e6cafba179321de396681a493c4158 Mon Sep 17 00:00:00 2001
+From: Marco A Benatto <mbenatto@redhat.com>
+Date: Mon, 7 Dec 2020 11:53:03 -0300
+Subject: [PATCH] disk/ldm: Make sure comp data is freed before exiting from
+ make_vg()
+
+Several error handling paths in make_vg() do not free comp data before
+jumping to fail2 label and returning from the function. This will leak
+memory. So, let's fix all issues of that kind.
+
+Fixes: CID 73804
+
+Signed-off-by: Marco A Benatto <mbenatto@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=23e39f50ca7a107f6b66396ed4d177a914dee035]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/disk/ldm.c | 51 ++++++++++++++++++++++++++++++++++++++------
+ 1 file changed, 44 insertions(+), 7 deletions(-)
+
+diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c
+index 58f8a53..428415f 100644
+--- a/grub-core/disk/ldm.c
++++ b/grub-core/disk/ldm.c
+@@ -554,7 +554,11 @@ make_vg (grub_disk_t disk,
+ 	      comp->segments = grub_calloc (comp->segment_alloc,
+ 					    sizeof (*comp->segments));
+ 	      if (!comp->segments)
+-		goto fail2;
++		{
++		  grub_free (comp->internal_id);
++		  grub_free (comp);
++		  goto fail2;
++		}
+ 	    }
+ 	  else
+ 	    {
+@@ -562,7 +566,11 @@ make_vg (grub_disk_t disk,
+ 	      comp->segment_count = 1;
+ 	      comp->segments = grub_malloc (sizeof (*comp->segments));
+ 	      if (!comp->segments)
+-		goto fail2;
++		{
++		  grub_free (comp->internal_id);
++		  grub_free (comp);
++		  goto fail2;
++		}
+ 	      comp->segments->start_extent = 0;
+ 	      comp->segments->extent_count = lv->size;
+ 	      comp->segments->layout = 0;
+@@ -574,15 +582,26 @@ make_vg (grub_disk_t disk,
+ 		  comp->segments->layout = GRUB_RAID_LAYOUT_SYMMETRIC_MASK;
+ 		}
+ 	      else
+-		goto fail2;
++		{
++		  grub_free (comp->segments);
++		  grub_free (comp->internal_id);
++		  grub_free (comp);
++		  goto fail2;
++		}
+ 	      ptr += *ptr + 1;
+ 	      ptr++;
+ 	      if (!(vblk[i].flags & 0x10))
+-		goto fail2;
++		{
++		  grub_free (comp->segments);
++		  grub_free (comp->internal_id);
++		  grub_free (comp);
++		  goto fail2;
++		}
+ 	      if (ptr >= vblk[i].dynamic + sizeof (vblk[i].dynamic)
+ 		  || ptr + *ptr + 1 >= vblk[i].dynamic
+ 		  + sizeof (vblk[i].dynamic))
+ 		{
++		  grub_free (comp->segments);
+ 		  grub_free (comp->internal_id);
+ 		  grub_free (comp);
+ 		  goto fail2;
+@@ -592,6 +611,7 @@ make_vg (grub_disk_t disk,
+ 	      if (ptr + *ptr + 1 >= vblk[i].dynamic
+ 		  + sizeof (vblk[i].dynamic))
+ 		{
++		  grub_free (comp->segments);
+ 		  grub_free (comp->internal_id);
+ 		  grub_free (comp);
+ 		  goto fail2;
+@@ -601,7 +621,12 @@ make_vg (grub_disk_t disk,
+ 	      comp->segments->nodes = grub_calloc (comp->segments->node_alloc,
+ 						   sizeof (*comp->segments->nodes));
+ 	      if (!lv->segments->nodes)
+-		goto fail2;
++		{
++		  grub_free (comp->segments);
++		  grub_free (comp->internal_id);
++		  grub_free (comp);
++		  goto fail2;
++		}
+ 	    }
+ 
+ 	  if (lv->segments->node_alloc == lv->segments->node_count)
+@@ -611,11 +636,23 @@ make_vg (grub_disk_t disk,
+ 
+ 	      if (grub_mul (lv->segments->node_alloc, 2, &lv->segments->node_alloc) ||
+ 		  grub_mul (lv->segments->node_alloc, sizeof (*lv->segments->nodes), &sz))
+-		goto fail2;
++		{
++		  grub_free (comp->segments->nodes);
++		  grub_free (comp->segments);
++		  grub_free (comp->internal_id);
++		  grub_free (comp);
++		  goto fail2;
++		}
+ 
+ 	      t = grub_realloc (lv->segments->nodes, sz);
+ 	      if (!t)
+-		goto fail2;
++		{
++		  grub_free (comp->segments->nodes);
++		  grub_free (comp->segments);
++		  grub_free (comp->internal_id);
++		  grub_free (comp);
++		  goto fail2;
++		}
+ 	      lv->segments->nodes = t;
+ 	    }
+ 	  lv->segments->nodes[lv->segments->node_count].pv = 0;
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 94b89aa643..479e2f71f2 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -62,6 +62,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch \
            file://0014-zstd-Initialize-seq_t-structure-fully.patch \
            file://0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch \
+           file://0016-disk-ldm-Make-sure-comp-data-is-freed-before-exiting.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


