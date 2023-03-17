Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34900C7619A
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:43:09 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.448.1679092983394495070
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=a2GA9Ir+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id o11so6842299ple.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4daizuM18z2yeix3M+QKNJjgogZqnSQtT+iP8Bo5Ro=;
        b=a2GA9Ir+byTEVNXcoTZO0CoHYVr4++b2ZyQ+Ae+3avJusPY7OYL97G23kp5PhLpmKH
         EGLdc2jHedAWGSDrTeykQHsSRTttkSQD7W4gjOIUg+hAalJhTQR3kBujThQbAesthB0X
         UFLYyD56nqmHdWvS1Xu1OoLwfvb3y9lj5I1o6DMFJ/4uCP+EvEqkZRxePv6WdN7h/YjR
         +Enr+7lOO2hSyXGRKBtxq5lPqbM6PGpTAgqpTp/2ZA+FtigNUBVui2NYUB5SxSHthWKl
         6H6hY6u110iPzm1mrKhYYCvctHse3oi/wbdDWockT5gwBqki0kPqWQy8uP2ALOmPacZ7
         tCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4daizuM18z2yeix3M+QKNJjgogZqnSQtT+iP8Bo5Ro=;
        b=bxaPFuaaNEsM9VeZK0/QKwhhxnV9oxix0cqEdj7jyxKIVDan4+M8iTc/2hBMxtmk02
         XJVmAWyW4OXotsxTdQ/Pl4KI0WAAZF7+n7BV9j0rIrH9+bHCQ5gPaN/9JhRBf3king7U
         ugT0wKEzvlKAKoGm26SVYquRsHO3clVTfrLQM83l06VIr1yvGMsgTRsJ2P5XmqUb1qnN
         hEjTUotZDnXjwJg6zAylqbZrSCGHPloINvmoUKRjBJ1z81zpW+QcCbqk6Jjh7EkbPAFr
         2iAUqzWWoMxlOoUJw1em7sUEpil3zrX0OXu6bAPx2mpA85LyQAm3UeM72dZE+E+9VHqA
         vb3g==
X-Gm-Message-State: AO0yUKW3XUWR8prqlALqrRaJHXZ7XrIBOkG8eSsWR5uy9vH13LTDaxua
	8oyl8wmWeJYQVqIJuGbu7k+zzXkBb37v71TrgvQ=
X-Google-Smtp-Source: AK7set+bRQEebM3+UH25fpZpdWZb8kX/ZJ9qaWWLb2B4/pu3YbMM+5ODlQC2du5ZjnkomibDc8mwvQ==
X-Received: by 2002:a17:903:32c9:b0:196:595b:2580 with SMTP id i9-20020a17090332c900b00196595b2580mr10830637plr.0.1679092982521;
        Fri, 17 Mar 2023 15:43:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.43.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:43:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/21] glibc: Add missing binutils dependency
Date: Fri, 17 Mar 2023 12:42:25 -1000
Message-Id: <de967efc52b858fd51b857d8de731692287430d7.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178772

From: Richard Purdie <richard.purdie@linuxfoundation.org>

glibc has it's dependencies handled more manually due to it's place
in the toolchain bootstrap. It depends upon the compiler and indirectly
through that to binutils. This did mean that if binutils changes and the
compiler does not, sstate and hash equivalence could mean that glibc
wouldn't rebuild.

Add a direct dependency on binutils that if it changes, it forces glibc
to rebuild, as it should.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c4a7b3decff636292f5e76e95406a22b6fe4a994)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index fdd241d973..3b940b8ab2 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -1,7 +1,9 @@
 require glibc-common.inc
 require glibc-ld.inc
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}binutils${BUSUFFIX} libgcc-initial linux-libc-headers"
+BUSUFFIX= ""
+BUSUFFIX:class-nativesdk = "-crosssdk"
 
 PROVIDES = "virtual/libc"
 PROVIDES += "virtual/libintl virtual/libiconv"
-- 
2.34.1


