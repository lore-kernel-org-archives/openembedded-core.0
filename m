Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DE7C83F34
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:50 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.5368.1752611806281233762
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2BzoG4XY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-315cd33fa79so4441239a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611805; x=1753216605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GdyOVRr1lkLrJqioRRwoTkDADGNE+Y9uf2Py8+BPH1Y=;
        b=2BzoG4XYDGAxubzVRzwYjkl8drcedEwm8zUqIqbGHAyL+pQtpt/ZOBGj3W8QZ8mUgH
         iJgf/cjbTF04+2a2maF8MAGjNxTnAPZ7l91RRcKBksftcM/X5McnQdhTH1rU7IDltDDC
         HKLK05Gx+Abh67H5Fe9XooU/F91Be71kfqCEuUB3jLiegYDYFgTYj+deqoOfpQ3X5bnD
         Y8VrXjSPZ3UpqBjtYPAEnvqZJvklXTxLb8m/i/U41iQ/3pWqCXrm9TiOQxXEcxB1Afym
         ycjGM+IsQe/cks3RCQhJZfjw9iOr8/dw6EXiOGEMuvZrhv3lUPkem82/uBmVIns+l3ZF
         MvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611805; x=1753216605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdyOVRr1lkLrJqioRRwoTkDADGNE+Y9uf2Py8+BPH1Y=;
        b=qlI6NwSARiEYatd1PBuVOc+N8adbiCIdioAAK3O+b9v/i3f/Tfs6BufYp0ydMMEI5Y
         392o3LVn+SpIOjbdF6amQTSo0PmiztvkdP38UnlpLXpRekPxSKU2WYm1SFo0kCZouQdS
         3rDIH4rV9SDnTtC7ZmOPgwAr2iS0ZeZ56yY/SXT80z/6gf+q9Z1Bzzi9enTv6aLENI4v
         0M7yPbtln1lD0ZDJiGUaTfXiazAWjhY0MLyMDI+GqzPLrpmXMqoZoo24/pAD6k9v9zH6
         fEUsXpPaBcOgkbRszi4VRUzSYp4zobtbv304Z6FrD+5Mc0Mm6fSvG/QHN1dA/DUi+ijP
         PlpA==
X-Gm-Message-State: AOJu0YzZmI8z+5eVfIXo2Fm03QHcQRIfrKUHkdhPeou5WhARZVvIk/4j
	/PlPTpXJ0otS6/22uTo4VLE1qUBKlQg+OPo37n/T9x+vBi+NOpQ9z357W9b+WAgYei09BVzVJme
	bhOA6
X-Gm-Gg: ASbGnctrG47zvkNedSfr5zBTS29hgxL6Aj/3/Q9KJ6HEzjo3ka/gueIMF11XxgLz3/o
	jj8FJQGbnP2FpbRdGnO8gr3yVWeuszvV9tLN/hUFDMSjVYngJxKtFzh2JfhDGGcKEBABr4rAYI2
	IfSbAKaONdrgFBV/SpNaavl4HyxnfcIbrgK4v4vliV2zMYz9AK6bNLPOIS7ma+N3/1VEU0Jvq/P
	ebD/qFdnB+83V230etPx5yLnIMSKayi/GVc60u1IbsGc+Usz6o6l7Dac4lofGhSN59bDdqRsQCc
	+HaT1LRtZSvj+OVSvMUywi/1+7XWzpO6T5yawcHoDWZEk8KMet2LmLmm2t9xNoL9CkV57mFKqDO
	u5kzl/hHte3KHyQ==
X-Google-Smtp-Source: AGHT+IEcT9G+IlPfHsAx7xUsh3Asjqpqe2H0rDi/MxGObsBKYGnNLu3bPaDXm2jskeEHkRn4aNpfKA==
X-Received: by 2002:a17:90b:5289:b0:315:af43:12ee with SMTP id 98e67ed59e1d1-31c9e761501mr804002a91.16.1752611805530;
        Tue, 15 Jul 2025 13:36:45 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/16] bintuils: stable 2.38 branch update
Date: Tue, 15 Jul 2025 13:36:15 -0700
Message-ID: <7ac807166dfb6723f4e0b53c21f434e21d25563e.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220423

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commit on binutils-2.38 stable branch are updated.

9bee8d65d32 x86: Check MODRM for call and jmp in binutils older than 2.45

                                 Before  After  Diff
No. of expected passes            280     280    0
No. of unexpected failures        2       2      0
No. of untested testcases         1       1      0
No. of unsupported tests          7       7      0

Testing was done and there were no regressions found

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index f1c29015bc..e25f52e171 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "4d71e17a9fd8d319359ded891eb3034a2325d4c0"
+SRCREV ?= "9bee8d65d32ac1480997c13ce76ae7991180f1ed"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.43.0


