Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDD3C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:07 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.6928.1645799286744115681
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IP/y4zF+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id z16so4834363pfh.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0jiF8oVkVd7mgs9s4ZJJcz+a4pH2dFWABa0KuJRrY7o=;
        b=IP/y4zF+T9qI+trbzDFQKRKYMFicP6hjPXSimTE+O9bY0oNEW1RKroZ7/oPLbpgygO
         ZNeJbV6VBWhQLJAvHRjSkaPxM0SNI/zvSn1MMqEjNrkiGbXLaUkMdjYn8qvrws+qclyp
         5OpPxUVLwsIGGjmGZ7UxTs3gCs09oHB+INRt3IIZzC1CHh/T/ga0McwB7karsKqfZAUf
         2ajToOUM7DSF3GA0mUjz8y4aP1QTtwqsTIcVofJbqbPS4wvLsIh/UNpVd6SexhFGehFG
         LDwTYw03eO2YqT2Vq1o9FBX08hehTSwJ3TmwIvzZDwDZcYWszk3cyhBJSK6oPaSBK5oZ
         V0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0jiF8oVkVd7mgs9s4ZJJcz+a4pH2dFWABa0KuJRrY7o=;
        b=Oy/86B/Pi1PQTfR3XTCAYas19/QU6yYYnd/YzwmGbkcQriDVlwDwrc/rp+7e/LYbrr
         clwUjOT5PxDDYEiadfL2sMRawlewp6TXlWGc48l91tPpjg48AJzR3L9eQcODZoZnVr5E
         GC3gE5e6KjUt09zyGGOpu5x6gitYZ11aso7Btx08sxVHybmIgi/BE3erXlmqmwsYMVLK
         pMPAAMwK7CHkOLofa8E7GSO5mNmAEbKtDd/9Mz9vVygfhGKtyZ7gxHjxfJsRGfAPk+Q+
         0+IXwJ7HrLUtwL3SIP7yOMPoA4QRwtB9u1xawmhq+1uKQyWlZ6svJTwcF6qkakDZHjQp
         Z6Cg==
X-Gm-Message-State: AOAM532stG0OCdnHsoA9j17/ywfR9Mq0iITtmWZN4Ln7SFOLiQ2mZbHy
	9sECTrp1xoGIC+GUq1InjQWKo6thytnujEws
X-Google-Smtp-Source: 
 ABdhPJy8igm7BtuesF841W9be526OSqDoLwqjFx9DC7Zjf0JA31Glsl8tmjpNEjnNEDXZmAm4EaZ/Q==
X-Received: by 2002:a63:4d52:0:b0:343:8d41:eb12 with SMTP id
 n18-20020a634d52000000b003438d41eb12mr6452059pgl.527.1645799285729;
        Fri, 25 Feb 2022 06:28:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 34/50] grub: fix a memory leak
Date: Fri, 25 Feb 2022 04:26:14 -1000
Message-Id: 
 <de075f9421a16e1728968349ba16b0d68d47efea.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162380

From: Marta Rybczynska <rybczynska@gmail.com>

Add a fix of a memory leak in grub's commands/hashsum. It is a part
of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


