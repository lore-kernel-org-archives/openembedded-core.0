Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630EDE7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 21:17:44 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.31978.1736371062173964708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 13:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vrGGYt1c;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216401de828so2795185ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736371061; x=1736975861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kpy6vbbJbgf1U2Cz3lreSXdtB5K0Ohsf4oGAdkHOQxM=;
        b=vrGGYt1cNlv58tumS41Brp72RNaeKDf8ksgdQZ+MAfJfGBjBBvsVwMS0Ef7zohFkYi
         iSkSTmc2SBJmBwFg2t4XnHHXQ6mqlrCmQ0mwYuOTw41DJ7acJELct65RzQ+6uT+0itBA
         dK8GtVyld3M8FIUwOeScRuGLQLHQI8jy/aQkR8PGmKT331rwW9tjmpb1P+5frF1ZdPzf
         uGB89E0KgclAauNivWpU3V0Ahj4amgTqFuPHqCitgFGoM1mT0/o8DlPrxI/hN5Ub7XdV
         Jzwog687G9kBk6IMHoXP41y3rDKAnmzi30Nca0Z6UfA9PL+A7h4i1legv8itiP+4LGT0
         dKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736371061; x=1736975861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kpy6vbbJbgf1U2Cz3lreSXdtB5K0Ohsf4oGAdkHOQxM=;
        b=qh5CFr027w0G0y+PEJXrIWOjDhf1xq6zLs5gsMxTUneZkLLzEYuIFneBw9Bu+KwK0t
         RVNpnX/H+T3x23/FAyRyb0BUvRMQXcj8wqrMdAeeqLR63KpuvSQujOWxH804sjVedYqd
         puiuBDesDHEZDk4S6UOJHVTcbWsMcml/B2WtulRyq58jx+XX1Eeit+UdmK8CI7z9aabM
         dZlx3Lgn+UTeIkP8BRr6U5Go/OxbG5tH+wg2FAt3LKqYGVrBl9h58Sb7AAC6Rdxw8x9Q
         14KfeKc1IKepQA/OsbV02MRIVQ9fsE2LYE21FAHwnKEEuCrNdWmi0TrKyfZwgssFtvqF
         yCzg==
X-Gm-Message-State: AOJu0Yz1sbCaC+Mf5Vf1WahkDCjVEHuQvCjywKENKknRr8w7kwVBZixm
	M8u8vEu7gEMcK4OJVLWRDhMuBI902FwLEcaXlUoa8SWIlecs5j4/6duXk1ZhVQnjKgEeU2TOezE
	s/2E=
X-Gm-Gg: ASbGnct0LImUHJAcpjO0lrjext1NHjl1TRhs1sG/ABZBiabSqsXsGArLfa6N1MWJW5M
	UYZL/qJXE8dZS2y7Re0jzmhpimenwaN7E4IcJcwkWTNpkzq2QVnRRVb+LcsmD7oXmJg+1ndzFWU
	AhAwFoLOTQ8guMcAK7+ua/3bS//Mxs3XFgzwsMTDcWxKbc7VdyaQDwtBcbfiMhjOkJMv0VxtXw9
	UL5UeePv6C/q0iUIYeRxnQoaYszbOv46LIYzInJc5582Q==
X-Google-Smtp-Source: AGHT+IFMblBvdY4dbqfO1Ol5uBh+F9Or1o8Lis/33f/beQcxWa1Lj/6myxsnH1t7/JLA78+CvFU2+g==
X-Received: by 2002:a17:902:c3c5:b0:21a:8d70:3850 with SMTP id d9443c01a7336-21a8d703b5bmr10762605ad.32.1736371061364;
        Wed, 08 Jan 2025 13:17:41 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdd9bsm331403495ad.132.2025.01.08.13.17.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 13:17:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 15/18] groff: Fix race issues for parallel build
Date: Wed,  8 Jan 2025 13:17:05 -0800
Message-ID: <7d1be6ffa1ca9e6694c9549c9841e248361c4269.1736370890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736370890.git.steve@sakoman.com>
References: <cover.1736370890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 21:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209605

From: Robert Yang <liezhi.yang@windriver.com>

Fixed race issues for parallel build:
groff: error: couldn't exec soelim: Permission

And:
groff: error: couldn't exec grn: Permission denied

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
(cherry picked from commit b9ee7ea9ab05a1887c863dc9fccc65cb9e6850df)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...tbl.am-Fix-race-issues-for-parallel-.patch | 31 +++++++++++++++++++
 meta/recipes-extended/groff/groff_1.23.0.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch

diff --git a/meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch b/meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch
new file mode 100644
index 0000000000..de4a55bbab
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch
@@ -0,0 +1,31 @@
+From 771686c042d5f494550d0399f36e00b1ca557b2d Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 11 Nov 2024 14:12:51 +0000
+Subject: [PATCH] contrib/hdtbl/hdtbl.am: Fix race issues for parallel build
+
+Fixed race issues for parallel build:
+groff: error: couldn't exec soelim: Permission
+
+And:
+groff: error: couldn't exec grn: Permission denied
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/groff/2024-11/msg00097.html]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ contrib/hdtbl/hdtbl.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/contrib/hdtbl/hdtbl.am b/contrib/hdtbl/hdtbl.am
+index 9384fac..70f7bc9 100644
+--- a/contrib/hdtbl/hdtbl.am
++++ b/contrib/hdtbl/hdtbl.am
+@@ -119,7 +119,7 @@ SUFFIXES += .roff .in .ps
+ 	       -e "s|[@]EGREP[@]|$(EGREP)|" $< >$@
+ 
+ $(HDTBLPROCESSEDEXAMPLEFILES): $(DOC_GNU_EPS) groff troff eqn pic tbl \
+-  grops grn font/devps/stamp contrib/hdtbl/examples/common.roff
++  grops grn soelim font/devps/stamp contrib/hdtbl/examples/common.roff
+ 
+ uninstall_groffdirs: uninstall-hdtbl-hook
+ uninstall-hdtbl-hook:
diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-extended/groff/groff_1.23.0.bb
index 8a16321479..34a42c7e26 100644
--- a/meta/recipes-extended/groff/groff_1.23.0.bb
+++ b/meta/recipes-extended/groff/groff_1.23.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://0001-build-Fix-Savannah-64681-webpage.ps-deps.patch \
            file://0001-build-meintro_fr.ps-depends-on-tbl.patch \
            file://0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch \
+           file://0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch \
            "
 
 SRC_URI[sha256sum] = "6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13"
-- 
2.43.0


