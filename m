Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD71C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 14:15:51 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.20050.1738332944311039961
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 06:15:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HdvhDaHn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21619108a6bso35721955ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 06:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738332943; x=1738937743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JiTg7qrddR3OE9Rv0KnGHTnmQdorgHOoV4BX29Qz1KI=;
        b=HdvhDaHnpbGy1e7GTXUvkTkgPjuNJf5LAU/uhfsVC2BbliqErVGvZVF/g3I0nZup1/
         OcFZUaWhNMKrnLmEbzWrU8XoUuFMCQtVIjIiX+siYtTCbLf4qT4TgfldX44Jjil0U13g
         NVntC0wPqud7/0SS7MKqVjD8ydI9ely42rueaKLfGQdXtWd33Gx+hbcfZ7jJNRWoFyA0
         pliKgSwlbdi7sye6XuN+1THtsq9t1NaRlOwtRlAxCrTgcLEcJishgsDJKFHsS1XQbQjl
         j4mhfIYzkfyC7k8ydTrsg4QHhcM57CuBblEjNGbwyPmc0pRk2ZD0OB+VOiGVMUtmHrIU
         dxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738332943; x=1738937743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiTg7qrddR3OE9Rv0KnGHTnmQdorgHOoV4BX29Qz1KI=;
        b=sTurdEDb7a1xDwUYYnzSbN8siF5l8WbbK9PPCdH14+01AHvrpcjJmrisrGra123cYT
         mTSo++8EXMaujZz6LNElcCLcLGxP6Empj2gPwKGRpbffRweEOj2v2QGxOyBatE4/Olw0
         Mve9WewiMwgnnKinmgnWCqyXb1k+61uWOYRr0A/fFGlSZ5TxNRXuVluryFebT/oozqlI
         xM/SVHsRfHeW0I06Lp98KOKnhxkbCmLjBMAfW5EiSFd/W3yXEmD7HGdt+be+0G6Wiqsq
         v7463ZGq/Qjb7P0vHzeL71Boo9zAzM0m1q4NF8NQfZDz9PzH8jZGuFCx6S13jy0L4Ql9
         cEow==
X-Gm-Message-State: AOJu0YzXiHhZYl3Puw3AIBPH/SZ/cjYuRmLlP8EDlnxWZDISQLE7zTpW
	5TDhFcuFDpAwdRUqVz9WBRoR60HIYtLrFzioi0CInHcpSaNiQODsaEd06zzcQmgvHtkPvMj+Kzi
	pJCc=
X-Gm-Gg: ASbGncuH/XeYicmUPpvV9t/9d0FaThqUa8uQWp7NfrHPYGpbzGglz0zV4sjZE3aj4P6
	h689vN3iPNpQMwj92sXWi4O7ns3y3L186Xa5nWj42i0WIRoLQBXdkMur3eNJaYIwHkxjQC0Fa8J
	hCbsh1p2W6Cy5grUGrbYUVPVp1TiUdWsJZSX7w+72de/heLB9aLT6p0glq/1yk7WqhnhRr9TD8F
	7H4cS6jmZ5/dMKB9f7vsSECfYveT5ofmUB6tyKpCaFnnwg6voyni73Ahed4Xudcu5tPxe24fBNp
	RfGW
X-Google-Smtp-Source: AGHT+IHGuGDaFpIv7QfEysYHhqRrs/kGefaIyOXSaW72Mzjgv7/t6s4da9m/2YWaP9w6siaZIJg4lw==
X-Received: by 2002:a05:6a21:32a9:b0:1ea:f941:8d9b with SMTP id adf61e73a8af0-1ed7a623f50mr17250568637.38.1738332943440;
        Fri, 31 Jan 2025 06:15:43 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a1a958sm3412644b3a.172.2025.01.31.06.15.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 06:15:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/4] glibc: stable 2.35 branch updates
Date: Fri, 31 Jan 2025 06:15:30 -0800
Message-ID: <a397c152abf4f3da1323594e79ebac844a2c9f45.1738332771.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738332771.git.steve@sakoman.com>
References: <cover.1738332771.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 14:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210486

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

549d831579 stdlib: Test using setenv with updated environ [BZ #32588]
8b5d4be762 Fix underallocation of abort_msg_s struct (CVE-2025-0395)
525e5f13de stdlib: Simplify buffer management in canonicalize
5eae275400 realpath: Bring back GNU extension on ENOENT and EACCES [BZ #28996]
8a82a76a42 realpath: Do not copy result on failure (BZ #28815)
e369114462 misc: Add support for Linux uio.h RWF_NOAPPEND flag
3f1ab0ed66 nptl: Convert tst-setuid2 to test-driver
76adee6e0f support: Add xpthread_cond_signal wrapper
c3beedeb70 elf: Support recursive use of dynamic TLS in interposed malloc
f48d763ab8 elf: Avoid some free (NULL) calls in _dl_update_slotinfo
710057676d sysdeps/x86/Makefile: Split and sort tests
a4207d4e83 x86: Only align destination to 1x VEC_SIZE in memset 4x loop
889f99c149 elf: Fix slow tls access after dlopen [BZ #19924]
543efedcb3 x86: Check the lower byte of EAX of CPUID leaf 2 [BZ #30643]
41a3e51233 x86_64: Add log1p with FMA
0d1c70aa4c x86_64: Add expm1 with FMA
516180d399 x86_64: Add log2 with FMA
30384b91ad x86_64: Sort fpu/multiarch/Makefile
d626c31ce5 x86: Avoid integer truncation with large cache sizes (bug 32470)
7ea35e28b4 nptl: initialize cpu_id_start prior to rseq registration
47d70ca8d9 nptl: initialize rseq area prior to registration

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index dc18d20dd8..d98b6a4911 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "37214df5f103f4075cf0a79a227e70f3e064701c"
+SRCREV_glibc ?= "549d8315791aa8176ff1537db3e09c185c6e602f"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.43.0


