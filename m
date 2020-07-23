Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.10968.1595507228697382726
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 05:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=R4qYZZL6;
 spf=pass (domain: linaro.org, ip: 209.85.216.66, mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f66.google.com with SMTP id cv18so4266189pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2020 05:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=zH+LcDQ5X6t10X4b9fS3TANnpT54bHz0AR9oABqhl6M=;
        b=R4qYZZL6bP53gk8+qukgpyxjvllOONpKksHqODVF6SYhq1O4rCPVKiXa4HRkoavORr
         chjvQYwsvjZ1uADsrO8DUY/O6ePzh0pTWT0W8Lan+RRmXaHH0T9A60W56FzAf0lokzJD
         BQPpbTgZNjl1CcsxeBvRQBPg7c/F5DjCL5S61CR/j0MfN9uKhnQSZB48C5qvrlPDSz2i
         aNBoNW041EqZjCtcRBBFrVabTm2N12EoY0PhMZXdwzfxTAkggMLeuGttXEp4FvMTKYL+
         eWe5nJ56HSJuApA5YIX6CIKbjxQgCWh7oztEaAQUZidJsLdAbYi/DxZqwjVFo5m2s7Bw
         rDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zH+LcDQ5X6t10X4b9fS3TANnpT54bHz0AR9oABqhl6M=;
        b=SH0LU7B1Ycnp6V72VypL/hOkFG6JLhNc40ab+s2VjmS0cYRs2SJlg/HXLoSKgVxD33
         SR82tSsmJ2a+AE/nb8JIh3F52cu2QoCZC0Uv3Ljk7/fywAglgfz9G/YHCY5F1AleHs85
         ygzDLHESjY92OdMouIGNh+IZmz4GXDMvhJYbEXGnA9qxTq9G/Gq6+dwvmvYo3vuAYTWg
         3GCgnOXdUCwzRnwPsHIfP5d7TBA8w4qBPHuJ1HN0pD7C4A14b/oCfeZKOraBAQ/7QiOz
         0DxM0BgOO5xgPmBKIGFc1UAUn0KNzTFJKXUnMpO6MUuLvABLQnIhbnxdGHQx7OqcoTh8
         OFHw==
X-Gm-Message-State: AOAM530Udm3G2NgBzDfJ1kySSTQi0buQzkRn0cTxhpebyqczjB8RZ6ok
	p6vGc/rnfekQeZbH36oirYJHlawVJTw=
X-Google-Smtp-Source: ABdhPJzbNSBtwMgEQEp88HgwsKseWt+9WW0CTQbxHvPRt1gptzb4bRHRuiSPvu35LZmZgM6U2ZIQCQ==
X-Received: by 2002:a17:902:a981:: with SMTP id bh1mr3639989plb.280.1595507227632;
        Thu, 23 Jul 2020 05:27:07 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.210.210.40])
        by smtp.gmail.com with ESMTPSA id k92sm2827696pje.30.2020.07.23.05.27.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jul 2020 05:27:06 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [meta-oe][PATCH] image.bbclass: fix rootfs size computation
Date: Thu, 23 Jul 2020 17:56:42 +0530
Message-Id: <1595507202-20625-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4

Currently we rely on disk usage to compute rootfs size that may vary
depending on build machine filesystem type.

Consider following case:

Build machine 1: ext4 filesystem:

$ du -ks tmp-rpb-glibc/work/qemuarm64-linaro-linux/rpb-console-image/1.0-r0/rootfs/
403024	tmp-rpb-glibc/work/qemuarm64-linaro-linux/rpb-console-image/1.0-r0/rootfs/

Build machine 2: zfs filesystem:

$ du -ks tmp-rpb-glibc/work/qemuarm64-linaro-linux/rpb-console-image/1.0-r0/rootfs/
240353	tmp-rpb-glibc/work/qemuarm64-linaro-linux/rpb-console-image/1.0-r0/rootfs/

So, this leads to build failures during ext4 image creation on build
machine 2 as allocated ext4 image size is less than what is actually
required.

In order to fix this we need to rely on "--apparent-size" option
provided by "du" utility that provides the actual size. See below usage
text:

$ du --help
<snip>
Mandatory arguments to long options are mandatory for short options too.
  -0, --null            end each output line with NUL, not newline
  -a, --all             write counts for all files, not just directories
      --apparent-size   print apparent sizes, rather than disk usage; although
                          the apparent size is usually smaller, it may be
                          larger due to holes in ('sparse') files, internal
                          fragmentation, indirect blocks, and the like
<snip>

With option "--apparent-size":

Build machine 1: ext4 filesystem:

$ du -ks --apparent-size tmp-rpb-glibc/work/qemuarm64-linaro-linux/rpb-console-image/1.0-r0/rootfs/
379576	tmp-rpb-glibc/work/qemuarm64-linaro-linux/rpb-console-image/1.0-r0/rootfs/

Build machine 2: zfs filesystem:

$ du -ks --apparent-size tmp-rpb-glibc/work/qemuarm64-linaro-linux/rpb-console-image/1.0-r0/rootfs/
377455	tmp-rpb-glibc/work/qemuarm64-linaro-linux/rpb-console-image/1.0-r0/rootfs/

Although there is still little difference in actual reported size but
that can very well be covered by IMAGE_OVERHEAD_FACTOR.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3b5600e..bf0685f 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -516,7 +516,7 @@ def get_rootfs_size(d):
     initramfs_fstypes = d.getVar('INITRAMFS_FSTYPES') or ''
     initramfs_maxsize = d.getVar('INITRAMFS_MAXSIZE')
 
-    output = subprocess.check_output(['du', '-ks',
+    output = subprocess.check_output(['du', '-ks', '--apparent-size',
                                       d.getVar('IMAGE_ROOTFS')])
     size_kb = int(output.split()[0])
 
-- 
2.7.4

