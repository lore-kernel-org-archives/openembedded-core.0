Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF17C87FD2
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 18:44:47 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.26637.1753469082969256436
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 11:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f4zArm4A;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b3bcb168fd5so2392572a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753469082; x=1754073882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7m5wsfoBhApr3F1QDW3hUj+XHNdMwWHBucmZMerAAXM=;
        b=f4zArm4Az+/keDGgTpxNQ6xjs9TXQl9G5/yZBdzpG8bJaW/2wslmR1sLFWSlOAcimx
         F2NthiExXTQNNfqWzrw8EyweI3/X0kypbwZZhBN3IIs67Pkf6lK5GQ7qlAlN8WXuXMw6
         T+qK9MiZ0HzxJ6Mtk278ttO47bXY/kOl21OFwmp+qDV7nAaLURUnNHkAFcrNeSHwYyvJ
         wx1PK+nIuc6q0wFJcZm76dN7T83FyDjnhCF8Qy5d0SD4UDRF5mLsUp6EBPKaVQut9CyR
         Rhp9JpmPa045FnvMdqGFWH+i12Epwto7ZTv8VkUPi6Hq2TjWPd4lUKyoWdbn/GK2X24N
         nG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469082; x=1754073882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7m5wsfoBhApr3F1QDW3hUj+XHNdMwWHBucmZMerAAXM=;
        b=qcKy3rFyZb9Pec/qw3LeoQnEuDaZoH1rbrOyAxWqSg2EvMLgE7O5DOOXHleyE5QBjG
         t9V3yW/zJnBVM6QM+HlvJVxFTDKUYYsYR+XCxErHtJFoPcr1ihlXpz150P8Z4KuoRYG9
         ndil2K4AgbQw+j3vyNa7u6GQp7tA+UhewNtPw+75RIJ1Cd4tXuaQ6YR4KcmCPdmfSYqQ
         QIU7ufba4Go/WoSSxAaRx5MCO8+43gi3MLcGn+rYr7gBDaTcQkypcZcHrlSUILjdvvyQ
         aETSKYdns8elteYgyUV58kniEmR/afVgl+XfCtMVQBTItz9tfi8r4s+lbe2ucIuU6Am8
         6F4Q==
X-Gm-Message-State: AOJu0YxZ/N6dXmbj+IHqePpnDpC7RgKhdTFi4ycucbSSKKYnRNFWaGFo
	CVoeMrvAF2yYvZaTX1AIAEcCNzWXO1ilD9DJGsoYH4C3SiooonYrDXLs8RoTPaj3z1PaKLV9fFZ
	C1Ftr
X-Gm-Gg: ASbGncvoOYZY9kD5bS6IKwopNkzIpvzmfOT/lYf6Xtu5nT+TLZTiRDl/vr5nKB1Ei/4
	oC4gJxMIKoTHIViQdGfZP3cK+glWVVjRDWIn8n71VdWaKmP5o9/y5NFc6RYh8jrvQjF1M1l1tEP
	0vRnLXv63SmbBIxEzjUaj1zPR/E4GHJV1hDos0qEDzK0sHTGwHw7OArmbJtDObGrFzEXLv5VLSl
	LVSq+Qi9bMEQmX8V5OnCaQKrZXrIrNYB+JHIVhilYp1gJG5UB3tivsH5nKk3oyG+8YhaRYzy2EE
	2qLFccGmNjqkd/mlO5hkE2vG6Hrjq48hc6THnytjb/Vlfm6JO/EJYp/txYhmsxRCLtPZWjc0DNM
	LJNFJeFWD6r89pQ==
X-Google-Smtp-Source: AGHT+IFuWjaiJ1wliHD+uIGYp6Z5t2bP2ZyRPqlaRkme/9mFYCIXT9E4eg+8y8TY2KR98X5NR6Rb1w==
X-Received: by 2002:a17:903:1446:b0:234:d7b2:2ab9 with SMTP id d9443c01a7336-23fb306bcbfmr52826675ad.12.1753469082089;
        Fri, 25 Jul 2025 11:44:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b695:a542:567c:1988])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm2451225ad.167.2025.07.25.11.44.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:44:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap V2 03/16] binutils: Fix CVE-2025-7545
Date: Fri, 25 Jul 2025 11:44:17 -0700
Message-ID: <128e40c39d8eafdd32fea71b902b38801afec202.1753468892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753468892.git.steve@sakoman.com>
References: <cover.1753468892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220919

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

objcopy: Don't extend the output section size
Since the output section contents are copied from the input, don't
extend the output section size beyond the input section size.

Backport a patch from upstream to fix CVE-2025-7545
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0023-CVE-2025-7545.patch         | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index a3ad655dbe..fb34ea9763 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -54,5 +54,6 @@ SRC_URI = "\
      file://0022-CVE-2025-5245.patch \
      file://0022-CVE-2025-5244.patch \
      file://0023-CVE-2025-7546.patch \
+     file://0023-CVE-2025-7545.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch b/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch
new file mode 100644
index 0000000000..de132f74fc
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch
@@ -0,0 +1,39 @@
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 21 Jun 2025 06:36:56 +0800
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]
+CVE: CVE-2025-7545
+
+Since the output section contents are copied from the input, don't
+extend the output section size beyond the input section size.
+
+	PR binutils/33049
+	* objcopy.c (copy_section): Don't extend the output section
+	size beyond the input section size.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/binutils/objcopy.c b/binutils/objcopy.c
+index a85d2620..18cd1bfd 100644
+--- a/binutils/objcopy.c
++++ b/binutils/objcopy.c
+@@ -4547,6 +4547,7 @@ copy_section (bfd *ibfd, sec_ptr isection, void *obfdarg)
+ 	  char *to = (char *) memhunk;
+ 	  char *end = (char *) memhunk + size;
+ 	  int i;
++	  bfd_size_type memhunk_size = size;
+ 
+ 	  /* If the section address is not exactly divisible by the interleave,
+ 	     then we must bias the from address.  If the copy_byte is less than
+@@ -4566,6 +4567,11 @@ copy_section (bfd *ibfd, sec_ptr isection, void *obfdarg)
+ 	      }
+ 
+ 	  size = (size + interleave - 1 - copy_byte) / interleave * copy_width;
++
++         /* Don't extend the output section size.  */
++         if (size > memhunk_size)
++           size = memhunk_size;
++	  
+ 	  osection->lma /= interleave;
+ 	  if (copy_byte < extra)
+ 	    osection->lma++;
-- 
2.43.0


