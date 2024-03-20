Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A709DC6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:11:23 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.49292.1710951075853360218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pW1ur0ty;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dd955753edso56185755ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951075; x=1711555875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idGLRTU/UEG6lDVbIB6zPkXlraYyUd8nCm+qfx6PAbg=;
        b=pW1ur0ty+DbLvnwwCU40fNg/8to496x9XEI0N/XS4eXo1tfueqTDAZZZzGAwGY0LRV
         o/c5ie7Enqqc+eKTQ5kTP919ISoV8uih5KGJcESkCdVBY/cyE7bTHYb/lP9I0Gj4u00C
         HH+0uWgDSlhXb7xW+v2umpMUBL02kyPV5ewYX+XLrHyiaWfncoL4hfnaDe4SVlzneQIl
         4qvjC9mGXKOYcUPJ6XMorCmuw9tR7IkiCUFOGZzB3aY/maH2Y9HMflx2wNv4QCN4d4/n
         2Dz38faYRGk8Sh1/WWRN1A9TJoyW10Or8B5pKCU5b88t+Ne10WsA9p495N3bONQy6Yef
         jFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951075; x=1711555875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idGLRTU/UEG6lDVbIB6zPkXlraYyUd8nCm+qfx6PAbg=;
        b=hZLHdsn14kf/OrM5wII40gz0vNJtGaC7XanpHwCN3iuyVWn+u3RT3KB9V9maoZyICJ
         47gdiRyMIWbE63QuoKBknmt5DNaIpl/4ileEQx4VXdHD4Bpljr4SgwffdQLJNTkVPI3q
         mGra5hhITveOJtyV4Vt5cyVqUJstZbxUYMGeL9FQGK1icG1qf6cEnkSnaPFmAzxqBHL2
         mai7CX+4o7WF6syBSB4UakY4XxvwFsijCmtWLGKBKd9Uke4xXJ3D5/PiyhVrPtYEE+eS
         NHibPod0QXyNmqA9pMm1RCmSySbdbiSoxk0izhB7iCr2H0bteMajeNiPT8HQp3p32RRf
         b/1w==
X-Gm-Message-State: AOJu0YypOmKFhAQMM89WvImjXES7dpI0c5oeWNPSb4Ddp3DtGERygAy1
	O3uPBp/A6R9wiR3uMOoLXehIb7gEecFAh/dJTn26tqar+E9NtBj+LkY5Mx/7zOGCn+22evlVKxs
	u2NU=
X-Google-Smtp-Source: AGHT+IGJcsxy2XFuZQrLqIdyaGAzId5wmPfdvm7u1LbbmnW89lCW0dusbqH2DmQUUv8bvzB6eLWMbg==
X-Received: by 2002:a17:903:22cd:b0:1dd:a7a7:4bc1 with SMTP id y13-20020a17090322cd00b001dda7a74bc1mr23225969plg.5.1710951074945;
        Wed, 20 Mar 2024 09:11:14 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.11.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:11:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/15] glibc: Fix subscript typos for get_nscd_addresses
Date: Wed, 20 Mar 2024 06:09:53 -1000
Message-Id: <1b5405955c7c2579ed1f52522e2e177d0281fa33.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710950846.git.steve@sakoman.com>
References: <cover.1710950846.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197386

From: Haitao Liu <haitao.liu@windriver.com>

Fix the following error:

root@intel-x86-64:~# wget -6 http://localhost
--2024-01-12 07:18:42--  http://localhost/
Resolving localhost... failed: No IPv4/IPv6 addresses for host.
wget: unable to resolve host address 'localhost'

Reference:
https://sourceware.org/bugzilla/show_bug.cgi?id=29605

Upstream-patch:
https://sourceware.org/git/?p=glibc.git;a=commit;h=c9226c03da0276593a0918eaa9a14835183343e8

Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...dresses-Fix-subscript-typos-BZ-29605.patch | 40 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch

diff --git a/meta/recipes-core/glibc/glibc/0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch b/meta/recipes-core/glibc/glibc/0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch
new file mode 100644
index 0000000000..629298c23e
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch
@@ -0,0 +1,40 @@
+From 707a878b655395f41b954bbed78008d1d9252f1a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Sonnenberger?= <joerg@bec.de>
+Date: Mon, 26 Sep 2022 13:59:16 -0400
+Subject: [PATCH] get_nscd_addresses: Fix subscript typos [BZ #29605]
+
+Fix the subscript on air->family, which was accidentally set to COUNT
+when it should have remained as I.
+
+Resolves: BZ #29605
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=c9226c03da0276593a0918eaa9a14835183343e8]
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
+---
+ sysdeps/posix/getaddrinfo.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/sysdeps/posix/getaddrinfo.c b/sysdeps/posix/getaddrinfo.c
+index f4c08d6e3b..fa333ad6ec 100644
+--- a/sysdeps/posix/getaddrinfo.c
++++ b/sysdeps/posix/getaddrinfo.c
+@@ -549,11 +549,11 @@ get_nscd_addresses (const char *name, const struct addrinfo *req,
+ 	  at[count].addr[2] = htonl (0xffff);
+ 	}
+       else if (req->ai_family == AF_UNSPEC
+-	       || air->family[count] == req->ai_family)
++	       || air->family[i] == req->ai_family)
+ 	{
+-	  at[count].family = air->family[count];
++	  at[count].family = air->family[i];
+ 	  memcpy (at[count].addr, addrs, size);
+-	  if (air->family[count] == AF_INET6)
++	  if (air->family[i] == AF_INET6)
+ 	    res->got_ipv6 = true;
+ 	}
+       at[count].next = at + count + 1;
+-- 
+2.35.5
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 3ec6610d01..751427517f 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -60,6 +60,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
+           file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.34.1


