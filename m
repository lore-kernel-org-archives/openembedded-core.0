Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79148C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:51 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.9113.1645178810056936439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FKyc6nzH;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso6010275wme.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ld4Vd7paVlgpIYs0spnttIapWU3983q3+Z+ZWa+VILk=;
        b=FKyc6nzHwpfTj6nBYHTdfnbSoAdawROD29WhDadTcdnNIc+5zUewuQx2ogg1qM55Kn
         bDD58qFFfn8wD+UrJtrT97KPj5zNhaX+qLfNfqvuYqcFojc65z8w892sGct0fms+IuAM
         IG+6MSJ0BR/NYKy3Xr/4xf1Vb1XmLkQzJN0nHhYdCNYcVOJmKVVzIq9krff5qhou9dyJ
         xBQo2LoHm4/pxeBHrVPa7Rjjq/jX9UHYckDZJsN9AKYVI6Lvahk8iES8+YvAuWUd0qfu
         Or/PRiLTGs68RAFAC+ko7UvWXVRpyip7LIXwIVYvMrn789FFyxy35m/am8DhtsVfDhsu
         r8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ld4Vd7paVlgpIYs0spnttIapWU3983q3+Z+ZWa+VILk=;
        b=6nQqxgbf2231a6ymzTc3MgqPC7Sy/V2WKlm5LS89cvXW/HjSU668CM6L+PPArohT3V
         JZIr9uL+fMWxDzJwXSl0LJ8mo9/tCr5DHeZssa6DuyuqoWtwU4V50sCHXihmajx6vb4O
         AMu3m0jvKfZiPyRIXoJaY6jLhnGBcjCzdxICNLWvUVgLkVBUY6xGk4alqBN6XpXUQD9D
         zaiyye8qTClpoZ74cYHdJ/7zWvxCWcgU0smJY+NB/9vN4JA24UAKIyKkK5JItuzBFltV
         BdeDQX3585jlb8jxAQbAe4Rb6U1H3o+zx/R7LVH6VvZmFvNi7mXo1/sOk2Eg/3NsNYgZ
         PvUA==
X-Gm-Message-State: AOAM533RxjW+f7FMfVh1zFi53LVbTxaEX1Q7UEGrUQNH2/1KEg5vZpc6
	VsyqV2BYzps+iYhWST6Qwyw=
X-Google-Smtp-Source: 
 ABdhPJyJhuO9WE1M/TwGvy+KVIGbodLt2z2LJQwxe2ahFo5ijRDijALbJqOZpMY4MiNf0/OelkcmuA==
X-Received: by 2002:a1c:a514:0:b0:37b:b7c8:6091 with SMTP id
 o20-20020a1ca514000000b0037bb7c86091mr6467169wme.133.1645178808553;
        Fri, 18 Feb 2022 02:06:48 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:48 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 30/46][dunfell] grub: fix a memory leak
Date: Fri, 18 Feb 2022 11:05:38 +0100
Message-Id: <20220218100554.1315511-31-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161918

Add a fix of a memory leak in grub's commands/hashsum. It is a part
of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...0-commands-hashsum-Fix-a-memory-leak.patch | 56 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0030-commands-hashsum-Fix-a-memory-leak.patch

diff --git a/meta/recipes-bsp/grub/files/0030-commands-hashsum-Fix-a-memory-leak.patch b/meta/recipes-bsp/grub/files/0030-commands-hashsum-Fix-a-memory-leak.patch
new file mode 100644
index 0000000000..e34a19e12c
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0030-commands-hashsum-Fix-a-memory-leak.patch
@@ -0,0 +1,56 @@
+From b136fa14d26d1833ffcb852f86e65da5960cfb99 Mon Sep 17 00:00:00 2001
+From: Chris Coulson <chris.coulson@canonical.com>
+Date: Tue, 1 Dec 2020 23:41:24 +0000
+Subject: [PATCH] commands/hashsum: Fix a memory leak
+
+check_list() uses grub_file_getline(), which allocates a buffer.
+If the hash list file contains invalid lines, the function leaks
+this buffer when it returns an error.
+
+Fixes: CID 176635
+
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=8b6f528e52e18b7a69f90b8dc3671d7b1147d9f3]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/commands/hashsum.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/grub-core/commands/hashsum.c b/grub-core/commands/hashsum.c
+index 456ba90..b8a22b0 100644
+--- a/grub-core/commands/hashsum.c
++++ b/grub-core/commands/hashsum.c
+@@ -128,11 +128,17 @@ check_list (const gcry_md_spec_t *hash, const char *hashfilename,
+ 	  high = hextoval (*p++);
+ 	  low = hextoval (*p++);
+ 	  if (high < 0 || low < 0)
+-	    return grub_error (GRUB_ERR_BAD_FILE_TYPE, "invalid hash list");
++	    {
++	      grub_free (buf);
++	      return grub_error (GRUB_ERR_BAD_FILE_TYPE, "invalid hash list");
++	    }
+ 	  expected[i] = (high << 4) | low;
+ 	}
+       if ((p[0] != ' ' && p[0] != '\t') || (p[1] != ' ' && p[1] != '\t'))
+-	return grub_error (GRUB_ERR_BAD_FILE_TYPE, "invalid hash list");
++	{
++	  grub_free (buf);
++	  return grub_error (GRUB_ERR_BAD_FILE_TYPE, "invalid hash list");
++	}
+       p += 2;
+       if (prefix)
+ 	{
+@@ -140,7 +146,10 @@ check_list (const gcry_md_spec_t *hash, const char *hashfilename,
+ 	  
+ 	  filename = grub_xasprintf ("%s/%s", prefix, p);
+ 	  if (!filename)
+-	    return grub_errno;
++	    {
++	      grub_free (buf);
++	      return grub_errno;
++	    }
+ 	  file = grub_file_open (filename, GRUB_FILE_TYPE_TO_HASH
+ 				 | (!uncompress ? GRUB_FILE_TYPE_NO_DECOMPRESS
+ 				    : GRUB_FILE_TYPE_NONE));
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 1460e559b9..d18e329b96 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -76,6 +76,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch \
            file://0028-syslinux-Fix-memory-leak-while-parsing.patch \
            file://0029-normal-completion-Fix-leaking-of-memory-when-process.patch \
+           file://0030-commands-hashsum-Fix-a-memory-leak.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


