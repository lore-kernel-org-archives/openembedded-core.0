Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED4CC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 12:17:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.5649.1753791416301832340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 05:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ClBHJOqc;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: fbberton@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45619d70c72so7115655e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 05:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753791414; x=1754396214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A6jl1+EU1kw59r5SDYqLt4k8rozt9ODRqj7mV4bkAOE=;
        b=ClBHJOqc9PYA0a4iZja3Zss3PXgfitcqPK4QIZTU4BPlmeTES9QTXYj3B1lOtjVjyy
         gqoJ+n2RekN8O4qX4Z7dBbKnOLlT2g0kgDrN0Te+9mFW8NVDqrJDlyslTLQEvS9JOqix
         HE8cxbapFNMcPYjfAD0UT5sEBEYmbxQ9G1GUwaMtXT2dNJQEb4J1rhv9GJCOWDw9gILe
         78fqSMr2g5f2D8KLy3JfCV8yQg2/U9Uafiw777Y6gm6xYyLWZG+/iWp8zNAJ+W9S0An7
         bM/9120d/WgcNcAs3EcLb2kTj4c9i93PvFWpKOCwz2f9Uhh0RqZRQ5wHLmfSIFTyX0/f
         DxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753791414; x=1754396214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6jl1+EU1kw59r5SDYqLt4k8rozt9ODRqj7mV4bkAOE=;
        b=unzIjGBkFKIiSUT8f445f0MQ61B7kC5C5myWXt1IPiNy4cyjmwwomwJcygROo9bGgz
         uzN1qvxl1z7YfdsgxozWO9EIKkujxc+aSXXN5vSaidTVI/4X7gFgKJzYHNIBOVl5tH6C
         Esw9mfuU9gUOl+lwnepsxqoyxNWrfWmQDHP3yZh1j0Ks1bTBRJqqhSHhDMZyJRA67sCq
         dh3RuBmQQ7zaF88VVDYLoNZRQSeGXEVKwAXDSpELduhoeF/2o1jfvFtXgJM0kZgSXzVj
         TaCCO6iI+MIdBkKhgMjhZyv69bOXUfRia426kCktb2MZyyAdI+i+VfCKL0Vsu079wSV2
         Ws2g==
X-Gm-Message-State: AOJu0YzTY3yIKVac8zSqt1ppxtcSCw2WVLTIdcDZhbZi5ItrjqJtRAMR
	zHITwKJVwP0D44F6U6WyYLsTqDl/BCKyzpsNGJGONEitfNeXUQTs/iwZ3x8+rA==
X-Gm-Gg: ASbGnctTNIANr97O1IY5G0HRopNhQ6VHI85svkGcktS75wL1j+4XP69seg3FZWWPgRL
	zqi2i+P9j8YaQxgDkGwoTTrjV0vwVWze+pe4f2iiV/DCkFSjW6Y9L6doJTeLW+0HdIZOL5pALlA
	BteyeFvnUZqr36zX640fOIwnX7XsW9l9ON4Sv33ezqw9QFrOOqZ2CZH/RZ82IMxWFDUwTeEaLjs
	FDYfgNPBc89DYJSnH3usCgyiNcaN56XqtMZYYRlvcY5i0jvERc6kVPtyibEzqHhfJT6or6DJiTQ
	iDYvzdl14dMhj9cD7dmcW+wBCNNf9Npa43lcHNPlahJHlv/gI3kVB7lgtBifJlKayDG5T1NVZW7
	h9mVBsX98SqB3WTeMAwS/OS3DJqmd9BgbVXtmm/0fl9EhBA==
X-Google-Smtp-Source: AGHT+IEYbPWOWtPhX9IGxVWP55LKk6tf+eJbL6uqbumw7/PAR676s8ac4o95QuffYcEY30VxKnsNcQ==
X-Received: by 2002:a05:600c:420c:b0:456:22f8:3aa1 with SMTP id 5b1f17b1804b1-4588d1104e6mr15846065e9.2.1753791413914;
        Tue, 29 Jul 2025 05:16:53 -0700 (PDT)
Received: from CTW01359.criticaltechworks.com ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4588e5e4aeasm26215085e9.29.2025.07.29.05.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 05:16:53 -0700 (PDT)
From: Fabio Berton <fbberton@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [OE-core][scarthgap][PATCH] linux-libc-headers: Fix invalid conversion in cn_proc.h
Date: Tue, 29 Jul 2025 13:16:52 +0100
Message-ID: <20250729121652.265566-1-fbberton@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 12:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221061

Backport 'connector: Fix invalid conversion in cn_proc.h' commit to fix
error:
/
|/usr/include/linux/cn_proc.h: In function 'proc_cn_event
| valid_event(proc_cn_event)':
|/usr/include/linux/cn_proc.h:72:17: error: invalid conversion from
| 'unsigned int' to 'proc_cn_event' [-fpermissive]
|   72 |         ev_type &= PROC_EVENT_ALL;
|      |                 ^
|      |                 |
|      |                 unsigned int
\

Change is already merged in kernel branch linux-6.6.y [1].

1 - https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=06e785aeb9ea8a43d0a3967c1ba6e69d758e82d4

Signed-off-by: Fabio Berton <fbberton@gmail.com>
---
 ...-Fix-invalid-conversion-in-cn_proc.h.patch | 40 +++++++++++++++++++
 .../linux-libc-headers_6.6.bb                 |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch
new file mode 100644
index 0000000000..e245d97de0
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch
@@ -0,0 +1,40 @@
+From 06e785aeb9ea8a43d0a3967c1ba6e69d758e82d4 Mon Sep 17 00:00:00 2001
+From: Matt Jan <zoo868e@gmail.com>
+Date: Tue, 14 May 2024 12:10:46 +0800
+Subject: [PATCH] connector: Fix invalid conversion in cn_proc.h
+
+The implicit conversion from unsigned int to enum
+proc_cn_event is invalid, so explicitly cast it
+for compilation in a C++ compiler.
+/usr/include/linux/cn_proc.h: In function 'proc_cn_event valid_event(proc_cn_event)':
+/usr/include/linux/cn_proc.h:72:17: error: invalid conversion from 'unsigned int' to 'proc_cn_event' [-fpermissive]
+   72 |         ev_type &= PROC_EVENT_ALL;
+      |                 ^
+      |                 |
+      |                 unsigned int
+
+Signed-off-by: Matt Jan <zoo868e@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=9258d795978f398ecf2d222a8388cff81d37d34d]
+---
+ include/uapi/linux/cn_proc.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/include/uapi/linux/cn_proc.h b/include/uapi/linux/cn_proc.h
+index f2afb7cc4926..18e3745b86cd 100644
+--- a/include/uapi/linux/cn_proc.h
++++ b/include/uapi/linux/cn_proc.h
+@@ -69,8 +69,7 @@ struct proc_input {
+ 
+ static inline enum proc_cn_event valid_event(enum proc_cn_event ev_type)
+ {
+-	ev_type &= PROC_EVENT_ALL;
+-	return ev_type;
++	return (enum proc_cn_event)(ev_type & PROC_EVENT_ALL);
+ }
+ 
+ /*
+-- 
+2.50.1
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb
index d68de6ec7e..11e7524fed 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb
@@ -8,6 +8,7 @@ SRC_URI:append:libc-musl = "\
 
 SRC_URI += "\
     file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.patch \
+    file://0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-- 
2.50.1


