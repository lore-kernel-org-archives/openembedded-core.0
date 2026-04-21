Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C03F327CE
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:43:52 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19759.1776764622273967552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SXlWfS21;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so23583025e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 02:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776764620; x=1777369420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=12UVD05LTJxNfcD+qNbk4YU77woxdDMKtb5pDmCIBDI=;
        b=SXlWfS21u52TtHzXrR/ohx7bYPpCE2sOui9K22cyAhPhhbKy9L3+RrJvO7NYjFRFml
         pWZb30zCfWz5W+T3xqIfMxGvd914IFu8ExTj7jiylgZxkYfqYK4B8Pkd8ieHrhwNfimc
         vMox+nUoKBin+WmltZ2E7v7d6JKnzns96/VPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764620; x=1777369420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12UVD05LTJxNfcD+qNbk4YU77woxdDMKtb5pDmCIBDI=;
        b=cUHEtv8WM4X53ca7gna5h1dUeWjQDHktPzsekMG+iSJK9S6DflEsFLozg893n92PEX
         12JeXEm+tp4KouNv0cr8DqLWDxw1co1HxyXcnnPIjTILbFSkuQaRVRmnIXlyb6XcA2uC
         d4CntmWkPlV9OF7pMntrhTauev71HvBOhoZJiBfDcetZ+BZwu0Mkx2LOkRuPsh8+POpi
         pk6sDkihWXlWNnH8Ip+83YyoS68MeRF7cLqrfYE4erSefNuGRFpnkZdRb2Kkrpad/ZjQ
         EX+oC6MtvAXoF5l3g3qVSaAu8H8aUV03N9tHaWrhc4984NocC1hvfeqwVl0mYRFgqAnA
         TLFQ==
X-Gm-Message-State: AOJu0YwEsOxstLdRQpXP9s4gJlmLPem/oRTMS/Ed0YVJ6TIlDk7LQqRV
	h1Uz3UTcYsz9QHa//AxjPspxhlvonIaWemAlJlnR9mWADiCa/cS0pUfSAGgmCNAaGwaXt/H2Dhg
	y7g85NhM=
X-Gm-Gg: AeBDietQflso1ije+zI/iEt+DpO0RY5YyCfQzZ90sexxvLEw0rMb+rMB2F0iuHnmb6g
	4AqtkX1JHDpSEazMS2VI12XmlxWER2/RrXuPKVujpn9uEBQoqV0DjTTYLvEggtB7azBoLwYV0mv
	Mt0pRE8HI5YpfbNMAv5zobUhGMUbDXuIwewYrHzVTLJ+EYkrSVLm1KQ9lz8u7ay8ByBTOLo8i3F
	YPbQ/uKS10FjZBbLM1AU/Nj2lX7Dz/0Rb1+kfRHAXb/hHvEI37Gcocu7cBie0j2kBZ7R+TlN655
	w50HRwx2ckM8QOglAZPrh+zQrWcVHhk3mAuEL5C4m7v9Z8NwaXWMHKGz0guEZkaY3MH7ZtRQqSe
	gsYhRmiQdDnJ9L17MbIToAv4xYs8yPHJbz4FQgKjjSAvJQhI1ZJg7NzuLXpFYpKcUv1hwwDgF6L
	J1LhiWB6RsoLg/T+weDXpV6vdT+rdVRWwcZ0aNCbnP5R3VUlPCfKSfVtdGX391O9mCgrH1Hqjqt
	w==
X-Received: by 2002:a05:600c:3f0c:b0:48a:563c:c8e0 with SMTP id 5b1f17b1804b1-48a563cd16bmr21501355e9.1.1776764619917;
        Tue, 21 Apr 2026 02:43:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aba4:e0e8:1cef:1732])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4896c2a1804sm52337835e9.4.2026.04.21.02.43.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 02:43:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] groff: Fix occasional build race failure
Date: Tue, 21 Apr 2026 10:43:38 +0100
Message-ID: <20260421094338.1842939-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235607

groff-native occasionally fails to build with a build race. Add a
patch which has been submitted upstream (details in the patch).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../groff/files/builddep.patch                | 33 +++++++++++++++++++
 meta/recipes-extended/groff/groff_1.24.0.bb   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/groff/files/builddep.patch

diff --git a/meta/recipes-extended/groff/files/builddep.patch b/meta/recipes-extended/groff/files/builddep.patch
new file mode 100644
index 00000000000..1bd4914c2ba
--- /dev/null
+++ b/meta/recipes-extended/groff/files/builddep.patch
@@ -0,0 +1,33 @@
+[mom]: Fix example build dependencies
+
+We are seeing occasional failures for eqn being missing when building
+mom examples, e.g.:
+
+| groff-1.24.0/groff: error: couldn't exec eqn: Permission denied
+| pdfmom: fatal error: groff-1.24.0/test-groff exited with status 24
+| make[2]: *** [Makefile:19256: contrib/mom/examples/slide-demo.pdf] Error 1
+
+It may find eqn from the host system if installed too.
+
+Fix the build dependencies to add eqn, pic, tbl and preconv since a 
+quick strace indicates them all being used here
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/groff/2026-04/msg00040.html]
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: groff-1.24.0/contrib/mom/mom.am
+===================================================================
+--- groff-1.24.0.orig/contrib/mom/mom.am
++++ groff-1.24.0/contrib/mom/mom.am
+@@ -144,8 +144,8 @@ SUFFIXES += .mom .pdf
+ 	&& LC_ALL=C $(MOMPDFMOM) $< >$@
+ 
+ $(MOMPROCESSEDEXAMPLEFILES): $(MOMNORMALFILES) \
+-  test-groff groff troff gropdf pdfmom penguin.ps penguin.pdf \
+-  font/devpdf/stamp tmac/pdf.tmac
++  test-groff groff troff gropdf pdfmom eqn pic tbl preconv \
++  penguin.ps penguin.pdf font/devpdf/stamp tmac/pdf.tmac
+ 
+ penguin.ps:
+ 	$(AM_V_at)cp $(mom_srcdir)/examples/penguin.ps $@
diff --git a/meta/recipes-extended/groff/groff_1.24.0.bb b/meta/recipes-extended/groff/groff_1.24.0.bb
index dbc8cdf6d0d..52cb17d5ffb 100644
--- a/meta/recipes-extended/groff/groff_1.24.0.bb
+++ b/meta/recipes-extended/groff/groff_1.24.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://0001-Make-manpages-mulitlib-identical.patch \
            file://0001-groff-fix-test-groff-not-found-in-cross-compilation.patch \
            file://0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch \
+           file://builddep.patch \
            "
 
 SRC_URI[sha256sum] = "e79bbcd8ff3ed0200e7ac55d3962a15e118c1229990213025f2fc8b264727570"

