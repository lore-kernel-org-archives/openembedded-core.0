Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F4DD6395A
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:54 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.13953.1732111070970606497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=B2Qr04Rn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21260209c68so6517055ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111070; x=1732715870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xR3XzQwId3B78T0KDvXSYIVDvrN6ffT3J6X+udF+pTA=;
        b=B2Qr04RnKu240ivlDCUkvZ0CsW/UTB59t2jM31noMYVk1EKTuSsOt4a0/SxnRZvPFD
         Q8PC/CIy/sZMhqmTN1tp/LE2+W5KU9UM2kgrhH4OUHzlqvxdOjR8PcpJWALFVs1le5KV
         qT6jFEPmNs9bZUeT78NmefcmMZhR4Wme0kzVqVlRNT3xqfFTxkwy44F4cVuTan0nBNtl
         G1ADiMS8IBLBjmvKRLHBFNctfx1G7z3U3Ejb1y/Q1uhPwXI1TLvb13B9fKJpfrwzkbdY
         2NUZoRiQQJJ8iSJ7KZq7q1d9IehPHo/1tMx7nsEbVb6TiPlCZV2igfWGRI04cV86yBz+
         v4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111070; x=1732715870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xR3XzQwId3B78T0KDvXSYIVDvrN6ffT3J6X+udF+pTA=;
        b=Fzob+J0kZP0E+FrFKzHDOvw5ybcKbr3hItzuwyRKQDB1QQcJrW/RSEW365Vw+ylsuz
         Fk4IDFGgWH1d+3mgpRvI5CrpltD3BlJEUfhgYcHR7OpaGf+BTckPvNznEvfEqrgknuSw
         YLlzDZ2TdwaBDR+TU+I6Z+x19i1gma5o+k7BVKk8Sk3BkOedo/DI1OMMi76P/M0AtYRF
         PSaJ6YzpgDlwDkj6BaamAGu1AL3y1CYxArpHFtlAE8dd+aSpTTADvAy8l74JSRoqyNpn
         P5zp9m9L6meWDfhqqRL5V+Wr/LsTsQKO59COh4gGdCzejVJY7NfHhYDTHqqtmO3ZaEAd
         zBVQ==
X-Gm-Message-State: AOJu0Yxx1H0Q0jT5Gzwvg1Qs73OpNI+yucmCL9RtVSKdtIHiZKIswcx9
	hR2CCQRaeE7LN/NpThwRNzvb8X4hnWC4DTHqRWmKQq/qYH3a34QSkPyo2XhP+zgPLj70yZJXjS0
	K
X-Google-Smtp-Source: AGHT+IHMOjjWrGXR9JNFQZuCLe2X/N0VeKAyHipi2QpWuE+BEpvt/hi3DhjdS2yqhE8OxI5Yk2/VCg==
X-Received: by 2002:a17:902:db0b:b0:20c:7e99:3df2 with SMTP id d9443c01a7336-21269e68f3cmr46654645ad.23.1732111070250;
        Wed, 20 Nov 2024 05:57:50 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 23/31] groff: fix rare build race in hdtbl
Date: Wed, 20 Nov 2024 05:56:55 -0800
Message-Id: <3dcc6fbc5fca38b14e61967bfdf92f8c29d95be1.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207447

From: Ross Burton <ross.burton@arm.com>

It's possible to build the hdtbl examples before grn has been build:

groff: error: couldn't exec grn: No such file or directory

Backport a dependency fix from upstream.

[ YOCTO #15610 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d590a32423d05cefc4e7282f971f633b3fa0b941)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...l-Fix-Savannah-66316-missing-grn-dep.patch | 38 +++++++++++++++++++
 meta/recipes-extended/groff/groff_1.23.0.bb   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch

diff --git a/meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch b/meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch
new file mode 100644
index 0000000000..d9455af2ac
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch
@@ -0,0 +1,38 @@
+From 12169aa269341753d491a69e9adb86c58dca039a Mon Sep 17 00:00:00 2001
+From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
+Date: Thu, 10 Oct 2024 18:17:08 -0500
+Subject: [PATCH] [hdtbl]: Fix Savannah #66316 (missing `grn` dep).
+
+* hdtbl.am (HDTBLPROCESSEDEXAMPLEFILES): Declare dependency on `grn`;
+  because `-I` flags are used, it is dragged in even though not
+  explicitly needed.  Resolves race against `grn`'s availability in the
+  build tree.
+
+Fixes <https://savannah.gnu.org/bugs/?66316>.  Thanks to Ross Burton for
+the report.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ contrib/hdtbl/ChangeLog | 10 ++++++++++
+ contrib/hdtbl/hdtbl.am  |  3 +--
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/contrib/hdtbl/hdtbl.am b/contrib/hdtbl/hdtbl.am
+index b6c334c18..3c37174f2 100644
+--- a/contrib/hdtbl/hdtbl.am
++++ b/contrib/hdtbl/hdtbl.am
+@@ -119,9 +119,8 @@ SUFFIXES += .roff .in .ps
+ 	&& sed -e "s|[@]fontdir[@]|$(fontdir)|" \
+ 	       -e "s|[@]EGREP[@]|$(EGREP)|" $< >$@
+ 
+-
+ $(HDTBLPROCESSEDEXAMPLEFILES): $(DOC_GNU_EPS) groff troff eqn pic tbl \
+-  grops font/devps/stamp contrib/hdtbl/examples/common.roff
++  grops grn font/devps/stamp contrib/hdtbl/examples/common.roff
+ 
+ uninstall_groffdirs: uninstall-hdtbl-hook
+ uninstall-hdtbl-hook:
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-extended/groff/groff_1.23.0.bb
index 0fc4f831d8..8a16321479 100644
--- a/meta/recipes-extended/groff/groff_1.23.0.bb
+++ b/meta/recipes-extended/groff/groff_1.23.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://0001-Make-manpages-mulitlib-identical.patch \
            file://0001-build-Fix-Savannah-64681-webpage.ps-deps.patch \
            file://0001-build-meintro_fr.ps-depends-on-tbl.patch \
+           file://0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch \
            "
 
 SRC_URI[sha256sum] = "6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13"
-- 
2.34.1


