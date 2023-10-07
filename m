Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84ABCE95A74
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:25:42 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.27676.1696717536092290987
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LrL/NpcU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-690bc3f82a7so2644674b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717535; x=1697322335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6M9W8QtDL5Q7ju7mnRho6W1+UyjxL4t+xExeoLSb/Ug=;
        b=LrL/NpcUmSNS1Taw89msbG7hmygv24/rrYSup2y1/kPwK2ziwJBzmlEIlaupWB+ek4
         CbnG47mPqz6AF1xQCPAwHJEPKQoYiaLeiFBM37iHfvPJ2mJyjXCXzAfP2XFrywOIwhmq
         oiI4YFowbsGZHRLG0jROiFEs1dNhCvRbtvA4ftBycbwGUHBoVG9lS5M/hTw5Lzv3freo
         MLP8xtNBvgCxtGrk3fCZsAGKN3RCQsITYoQJEdyOKms+gK3lqrWfBep7t5gMV5KhJkEw
         EJo23FGIqm8vkdoaEYhRxA+d1KL7WjyRkBVtbET8Ac7tnvd8bDYKjQYlVfn7M5an6TbR
         aZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717535; x=1697322335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6M9W8QtDL5Q7ju7mnRho6W1+UyjxL4t+xExeoLSb/Ug=;
        b=w+AMVUSuDHrTn8cDLGTLQpB4mIGWlEZDE7v52cK4XBcUhFlu3X2o+fw8Z/FHn4+M0w
         ClmXQuqYmNPCCqFNKlsn9OVlcdtkspNB89XFYO0OFqzHr6wrMv195PEYqfLIhDZSzSyL
         yzzTNoZy+6vCQ/h+lpS1hHlan9XkRiPDonLFu5Fk+0gqz6GKAGNrsuCp0GQmd4SSouct
         OXe6gjmZRXyYuL6QlquQGKs4E42UBTbrEI5Y5Q5KzxShS3C9B9d+2JKnCSTU0lyEWKn1
         HrFjFZOmJgAkA9DR8iZZZNgzCG4XUgpqCSCpEUwv0TRjxjEFJi+i6dWxLDtpmJRxLdsA
         MXSw==
X-Gm-Message-State: AOJu0YxdKN30j0RDOj+qKs1mgCnLGCWaOoPu4UH/y9yE5nr6LBnteFH8
	pZuiK7n+Kh6e75++v7JLn86dqDMsadTx4VL9PYs=
X-Google-Smtp-Source: AGHT+IH6vSwf6c7gyO0/lcuU2jgrJ/mYPpgWKMpwbw1/5b8ypAsog2bKGOThS6c4xyzT2gWgvNL4SA==
X-Received: by 2002:a05:6a20:3d8e:b0:15e:6614:5b40 with SMTP id s14-20020a056a203d8e00b0015e66145b40mr13499247pzi.26.1696717535260;
        Sat, 07 Oct 2023 15:25:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/19] mpfr: upgrade 4.2.0 -> 4.2.1
Date: Sat,  7 Oct 2023 12:25:03 -1000
Message-Id: <8bf18487eaf2a385794bf8f2b958e8d9eb11899e.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188808

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Bug fixes (see <https://www.mpfr.org/mpfr-4.2.0/#fixed> and/or the
  ChangeLog file).
- Improved MPFR manual.
- Configure tests: replaced the test of the link with GMP, in order to
  avoid the use of a function without a prototype (Autoconf issue), as
  this is obsolescent in ISO C. The new test should be more robust.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7d0699e176ad1b50c26c5981c0ee976615994729)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/mpfr/{mpfr_4.2.0.bb => mpfr_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/mpfr/{mpfr_4.2.0.bb => mpfr_4.2.1.bb} (91%)

diff --git a/meta/recipes-support/mpfr/mpfr_4.2.0.bb b/meta/recipes-support/mpfr/mpfr_4.2.1.bb
similarity index 91%
rename from meta/recipes-support/mpfr/mpfr_4.2.0.bb
rename to meta/recipes-support/mpfr/mpfr_4.2.1.bb
index 31804382e0..a2067e1036 100644
--- a/meta/recipes-support/mpfr/mpfr_4.2.0.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.2.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 DEPENDS = "gmp autoconf-archive-native"
 
 SRC_URI = "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
-SRC_URI[sha256sum] = "06a378df13501248c1b2db5aa977a2c8126ae849a9d9b7be2546fb4a9c26d993"
+SRC_URI[sha256sum] = "277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2"
 
 UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
 
-- 
2.34.1


