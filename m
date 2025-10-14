Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C882CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 18:03:58 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.2712.1760464406837625519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 10:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f4+XyAWI;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: phanirajkiran.a@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781251eec51so4684357b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 10:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760464406; x=1761069206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PeJTjISmy0NwVHAJkc+pvsZOSWmczLE7XtZk2R+UYgE=;
        b=f4+XyAWIZfm1VOi1v+gtQhacC4KoyA801KJ5RYG06Y1bU4V8B2217cxK361P77WUtL
         TEdglEzNuE7Ar4/Ja+y3c2vKjL3un6KiTZulNZVbj1oVwX/F65zDjq8/zhv3b97YrEaD
         PScrcolWQzLIlmvUjN5f1Pt1hjlq/TtgRuHAjPeCsT/glx80VyJNZPpocviLikYTS+7M
         7uLSKVWKpgiOfwFzQ7V2Ht7DE4hZkHfkI/2i1Cor+WdrqpCSgp0Oi5pfP54EkKV/BG1l
         q9mmyCTVgo+kIpWKauqk/nMK9jz0fYIX22DdF/TojZAHQmL3OsJrfmUW5JRdyJT4DGz4
         Pe/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760464406; x=1761069206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PeJTjISmy0NwVHAJkc+pvsZOSWmczLE7XtZk2R+UYgE=;
        b=dcvQ63haO+i7QjyLIbLkGpgBq6E7La2bBni2rU7i58If7FkWMxZYH57cUeRovRZ4e6
         h6mGeCtKmoxx2u4dFTPkrj3Rv6qiblG0ZDQyLI05rbQUbVO04FdR4GQq/GFgScV2rHKO
         DdniH5bRkDDDWOr4pwFgZqLVt/QC8/yUzgnd3xNh+5knikZR+EW3Uuoe7BCBK7fwBwwy
         TJScK4gEHB2S5I6SWY08hyRdrv9R8HcEtbUAI+UYst7s2XW0ov3b20vktxkzDYxQaU26
         CLPLN3+JKrUlRoNxYBLtxvtRg1vPZ4HsxRSh5RTcFucZbLcMgKLUfmCdF5jTqNwzV+dH
         erhA==
X-Gm-Message-State: AOJu0YxTochAYhDE2+iQAznO7u7KVP145RkZgrhngi+qTy6hbVwA9AXF
	Jyp8gUIzNODL/Rbl0WDWzC2taagTisApYsq9RA6MkLXItm3N1TSL6giepVFQvQ==
X-Gm-Gg: ASbGnct0J7/+W8u6/J68n7a1W1X5TvnuKjQv53aTnZxu+MAhLTXEGxrqTwY+yrDOz+a
	E/sSPOe+8zWDRkuXJqU/A8tIiiiIj7TS2/1ywDcHm1By/UJn2bXKBlp6Gr3IuAznvl7xPGqJy2p
	IwFlthq5fczLo0iHDxIIoyM0ImbbZZm/bsjBS1BXgdIY4znyIJCzEN98BR0raRAx9IY5eJU6JsO
	VfpXzCPGom+MKLVdMrbh1/pWUsUGi1ogSCHXiNhex4obK+Pc2oWp8+b7tRNuW3dU+0d8J3QMXUR
	nz2wnNg3xnhub2xLBzGTIiIsbEA/TU0KmxF9yOqro996uMGO1iGKauQWjpCcRJUD5j+mo21dTxI
	DomS0ep5gcOP0EbtA5TsodLahF6Tzl9scsT9s1XtnX2DulQkrgNuQ
X-Google-Smtp-Source: AGHT+IH0FK/WzIBUOHcE06M0ZVk82JXHMy/oynqp1eB1L+if8Y2Dwosnoq9NLPRQfJidzX/Ugim7LQ==
X-Received: by 2002:a17:903:1b4b:b0:271:479d:3dcb with SMTP id d9443c01a7336-29027213537mr333534315ad.6.1760464405722;
        Tue, 14 Oct 2025 10:53:25 -0700 (PDT)
Received: from pop-os.. ([59.93.89.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f93ea2sm169727135ad.126.2025.10.14.10.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 10:53:25 -0700 (PDT)
From: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>,
	Gunda Swetha <swetha12g@gmail.com>
Subject: [[openembedded-core,scarthgap] musl: backport fix for CVE-2025-26519 to LTS branches 1/2] [openembedded-core,scarthgap] musl: backport fix for CVE-2025-26519 to LTS branches
Date: Tue, 14 Oct 2025 23:23:10 +0530
Message-Id: <20251014175311.4547-1-phanirajkiran.a@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 18:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224847

Fixes [YOCTO #15932]

The musl libc code in LTS (Scarthgap) is missing
the fix addressing CVE-2025-26519.  This patch backports the upstream
changes (or applies the required fix) so that LTS builds include it.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-26519

Upstream-Status:
[https://git.musl-libc.org/cgit/musl/commit/src/locale/iconv.c?id=e5adcd97b5196e29991b524237381a0202a60659]
[https://git.musl-libc.org/cgit/musl/commit/src/locale/iconv.c?id=c47ad25ea3b484e10326f933e927c0bc8cded3da]

(From OE-Core rev: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b)

Signed-off-by: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
Signed-off-by: Gunda Swetha <swetha12g@gmail.com>

Reported-by: Cristian Morales Vega
---
 meta/recipes-core/musl/musl_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 324269a968..1142c04530 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.etalabs.net/git/musl;branch=master;protocol=https \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
            file://0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch \
+           file://0001-scarthgap-musl-backport-fix-for-CVE-2025-26519-to-LT.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


