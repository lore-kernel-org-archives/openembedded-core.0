Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A62C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.9086.1645178799036407702
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X6R45FzI;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso5984692wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oLnJ3ZwPwWCokuarsihx+lWfeX96TGoaxtod25yLPG8=;
        b=X6R45FzIjWb4EiJfVo12jWS02X4aT7py8WLrd7AZiYx3j01d8bW8S0y386evemDNn5
         V6Mfk43G41LIKyOflZ57FddSNlni8YO0lgpRvnBfwc+/RTUwAaF4NDCEaYNJzeZNylUt
         jsezQ8TREjHN9/viSs9NoVm3uZP7eyHHpQVnayOzjSEL7D23w1wAMdELB0sRpKgtiDl5
         I8Me/PvNs9XJt1vnR2+2NJFyqryBGZe81gT/2qLjc5uQC5OAM85+CeZ2kqJa5nimRRgQ
         j10wi1Vn9E0Mc2lRmlnzdg9750xh+OpiPZwKalw2Nr7dUynYXrdv6QecyloF4PFYy6vn
         aXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oLnJ3ZwPwWCokuarsihx+lWfeX96TGoaxtod25yLPG8=;
        b=qYIvgTOz25QGseTvWVzETHltsgPjyYxjpm/cagMAG12ttX+9n0D8QGBythbvGTV0Ex
         6ifgYXNhOsq3qhe1r/usdW6EDai4xqT5jpYAD4E5w2O8/y+QFxJp2fgbTGzynhUemLgj
         waCLj+cYpLrYR4AFiDVMCEHsQhTgwFZn95oGqZfwx+fWg6Owr57INrIuepuwYHhMtHG2
         C9rej/IxVha7qsnOVcLNqpb20Q59JDpXZpGKW6UM7WXF5NptC0LVeLKcU6XACCQV16YP
         /DinmEZZdJ/coBPv/rDskhfqRmgLSDwVrhJskHJPMox6tr7mlG6qckXJLPb4zP2AAINd
         GYVg==
X-Gm-Message-State: AOAM533s4SUpHhjgSNyJUuBgF9L1pT1YUI+AIexuKOlFEOh0REKzyEsf
	sN4FCiYlz4p7KCY/SBzo3Ko=
X-Google-Smtp-Source: 
 ABdhPJxY6WM1iVJqxOuno16PUVwt3/kF8utpGbWUDai9ShF1RIBXnD7EvszaCgKWqg4kxRRW8jAF3w==
X-Received: by 2002:a05:600c:414c:b0:37b:c80e:e3dc with SMTP id
 h12-20020a05600c414c00b0037bc80ee3dcmr9786348wmm.116.1645178797556;
        Fri, 18 Feb 2022 02:06:37 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:37 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 20/46][dunfell] grub: add a fix for a length check
Date: Fri, 18 Feb 2022 11:05:28 +0100
Message-Id: <20220218100554.1315511-21-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161908

This patch adds a fix for a volume name length check in grub's
hfsplus. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...that-the-volume-name-length-is-valid.patch | 43 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0020-hfsplus-Check-that-the-volume-name-length-is-valid.patch

diff --git a/meta/recipes-bsp/grub/files/0020-hfsplus-Check-that-the-volume-name-length-is-valid.patch b/meta/recipes-bsp/grub/files/0020-hfsplus-Check-that-the-volume-name-length-is-valid.patch
new file mode 100644
index 0000000000..eb459c547f
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0020-hfsplus-Check-that-the-volume-name-length-is-valid.patch
@@ -0,0 +1,43 @@
+From 7c1813eeec78892fa651046cc224ae4e80d0c94d Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Fri, 23 Oct 2020 17:09:31 +0000
+Subject: [PATCH] hfsplus: Check that the volume name length is valid
+
+HFS+ documentation suggests that the maximum filename and volume name is
+255 Unicode characters in length.
+
+So, when converting from big-endian to little-endian, we should ensure
+that the name of the volume has a length that is between 0 and 255,
+inclusive.
+
+Fixes: CID 73641
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2298f6e0d951251bb9ca97d891d1bc8b74515f8c]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/fs/hfsplus.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/grub-core/fs/hfsplus.c b/grub-core/fs/hfsplus.c
+index dae43be..03c3c4c 100644
+--- a/grub-core/fs/hfsplus.c
++++ b/grub-core/fs/hfsplus.c
+@@ -1007,6 +1007,15 @@ grub_hfsplus_label (grub_device_t device, char **label)
+     grub_hfsplus_btree_recptr (&data->catalog_tree, node, ptr);
+ 
+   label_len = grub_be_to_cpu16 (catkey->namelen);
++
++  /* Ensure that the length is >= 0. */
++  if (label_len < 0)
++    label_len = 0;
++
++  /* Ensure label length is at most 255 Unicode characters. */
++  if (label_len > 255)
++    label_len = 255;
++
+   label_name = grub_calloc (label_len, sizeof (*label_name));
+   if (!label_name)
+     {
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 130f32551b..3c5274fd96 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -66,6 +66,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0017-disk-ldm-If-failed-then-free-vg-variable-too.patch \
            file://0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch \
            file://0019-disk-cryptodisk-Fix-potential-integer-overflow.patch \
+           file://0020-hfsplus-Check-that-the-volume-name-length-is-valid.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


