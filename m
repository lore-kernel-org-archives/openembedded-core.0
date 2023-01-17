Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D73C678D8
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 14:09:14 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.196996.1673964549411908304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 06:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=kOZYyUN4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso37309923pjt.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 06:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMuqTJ9F1Lh24mj68upDfuFS7zX4RfgfO4aSkgIk8Tk=;
        b=kOZYyUN4ATpBpU1Ji9TKoYwaLsDTv3bScEKmjbsNcr5o4uScvtvoXOKy/D1w0vbW8K
         2NnKfHwHxEMmARH/mYvvMCeOexA4VcUnqNC0kXf8wefeoJUdWFXjOr8b4kEikce6Ty75
         uXOFAwgfrMPCTjLEIuLLGtyfzUzpy9vaSchTMYJk0tI89rNPs9KZfIKbN3BpLoIxzqhF
         p8IYuzbuiZqhJQgZQiQcl1hCQWcVF6cEgQhSKbgsyn5Wbmphdfe+ZNTLXVtzFHegEzC8
         +dpB3it3GWxRbjA+b1tI4EtkJXrRsPZH4D8Mr7c9SC7TCirUL4CM6whjFaKnUGANcxom
         qHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMuqTJ9F1Lh24mj68upDfuFS7zX4RfgfO4aSkgIk8Tk=;
        b=7MmWvbdMmbP6toUqqlPDoCljJvBLLqqTkcK2n7rM35vHnEwgy2cWiV8sSV44wQ8Boc
         TPAlrgUqMaQWFBdvkWSIYH6XoNlWlnSvjzR7WbdaIv6FmHWITQI5eCJwbfgTIeNsz1rc
         33KlxwJ7QPSvuXGKT5LmkX36NN89v1srNUKOn+LQ0RUr5TuPc/sxrCSuC6kyVfgtrp5r
         2IMk2RgTFIBhviR45ZxLJe8c+HtRb4vlrp9FccZsV1emULvL8VIMIIRfjDDz/G/y260k
         YcnmUMUdnXByLv8C4QBaA5LA40g/rjwv57f9eq7XzA5ByThVaFAJazrWeD1yeC01myNy
         FD4A==
X-Gm-Message-State: AFqh2kq/aU0DANIYYfBtV/qT4avDsBe/nY+xN59z8M4eXcBx3gOAm+vY
	MdQmyZP/UYMtpQojt/1NRN5JyroHtKOhTB+mXoI=
X-Google-Smtp-Source: AMrXdXvWolXy9autYgzIsSMYH/AeN7owiGCm+3Po2Gqusk/ajO8siNJH3dFEhA5JwzUxTmcDa9OPqA==
X-Received: by 2002:a17:903:2789:b0:194:97cd:c04b with SMTP id jw9-20020a170903278900b0019497cdc04bmr3561473plb.16.1673964548499;
        Tue, 17 Jan 2023 06:09:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b001930b7e2c04sm18197788pli.287.2023.01.17.06.09.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:09:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/9] glibc: stable 2.35 branch updates.
Date: Tue, 17 Jan 2023 04:08:43 -1000
Message-Id: <4db5727a0b44d471382c95c3897b68af5ab1a3b4.1673964419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673964419.git.steve@sakoman.com>
References: <cover.1673964419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 14:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176045

From: Yash Shinde <yashinde145@gmail.com>

Below commits on glibc-2.35 stable branch are updated.

293211b6fd time: Use 64 bit time on tzfile
26c8278889 nscd: Use 64 bit time_t on libc nscd routines (BZ# 29402)
f75f61b659 nis: Build libnsl with 64 bit time_t
ca97201c24 Apply asm redirections in syslog.h before first use [BZ #27087]
cad7947db7 elf: Fix wrong fscanf usage on tst-pldd
e9eb987894 Allow for unpriviledged nested containers
2636fbb7ef elf: Fix wrong fscanf usage on tst-pldd
e7019eeeb5 x86: Fix wcsnlen-avx2 page cross length comparison [BZ #29591]
fb73a40981 elf: Fix rtld-audit trampoline for aarch64

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 7d7db46c2f..d36da0ce3f 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "8d125a1f9145ad90c94e438858d6b5b7578686f2"
+SRCREV_glibc ?= "293211b6fddf60fc407d21fcba0326dd2148f76b"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.25.1


