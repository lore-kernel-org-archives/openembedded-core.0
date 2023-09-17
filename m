Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE57CD3422
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:26 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.27150.1694943563493293568
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WwgkkVj8;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-99bf3f59905so464811266b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943562; x=1695548362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7iWulFnPZiLrNDvXNsbGRfD7UwKG4ybIy2Q6RV+vAs=;
        b=WwgkkVj8tA4O3cdVIgH0jEO2bEKEqxbHhJEPSmObb/ayPCbQ7qkq1tVJelibR3d6Ij
         yUutJMyOMXy0Uc27gckGVj8qJkDu74SoOHOfAm0On8hQJ/xpCBZKilnJozNx5A0+6YA3
         44sjtZqQYngkywm4eYGZMBfHTGF+JiYxoGBbVice9sQx0txy0bI2YAc30UEjOkLAC1Ru
         G39QQJeOQRw1aYdy6iAZJnQpejCY+XpBzRDPM+JF+sJc/Ax5EWZi1CC4TENPGT22KDvU
         W0M+y2+sEChPtPPaa8MoWmAiPdhnKFZ/XBIYRG0Bi42iayP6yIXtZkv78lxq0SbWsw0p
         zD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943562; x=1695548362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7iWulFnPZiLrNDvXNsbGRfD7UwKG4ybIy2Q6RV+vAs=;
        b=NtFvCQOTv/o4Xk6nGqsHZ++FpB+JUIqq1PsxxDh7FrbvlPaPZv1FApBRussjF1KCcm
         1hKdRWwFj8N7FlQG1HiksaxG+mw4aruscJ+NTQogkhDb5vj09nUf9/k0qaJLfjtYFRta
         o09zSY9LP0pnWLvjtOIbPthDMcMEdR2v9TnMYP3bsz9mDJMC1lcbwLWb3k6rcgrt/fRN
         YJ1N7nZy0L7y5I+qW+Eh5zvccHpRFX1+E4DlSSUWyHmVUpifOg1mFaW7a4E6cXqLfJOV
         M1P6OyVzvHGIV7uBAgVgHOmqVm2W3nBCJ56bJk3E+kU74WaAjLkTzDtjdQorumHdk7Ia
         Wfsg==
X-Gm-Message-State: AOJu0Yzn7NMjXCX71f24A7vpIOr/Tyi8h+kub4+d2F6ewtQezdl5eMHO
	qPeshRGWl3AMaJiXa1MWOOL/+xxEG0I=
X-Google-Smtp-Source: AGHT+IElJCme0gx7G3ZVJEKNPRZjyv+PgCvIqrZDBho9+Tdhdi2SH/bBqfb2/CsrcjyD5X8CPlf7ag==
X-Received: by 2002:a17:906:53da:b0:9a9:e659:a8aa with SMTP id p26-20020a17090653da00b009a9e659a8aamr5380893ejo.57.1694943561746;
        Sun, 17 Sep 2023 02:39:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/29] groff: add a patch to resolve build races
Date: Sun, 17 Sep 2023 11:39:01 +0200
Message-Id: <20230917093901.428214-29-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187802

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...d-Fix-Savannah-64681-webpage.ps-deps.patch | 51 +++++++++++++++++++
 meta/recipes-extended/groff/groff_1.23.0.bb   |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-extended/groff/files/0001-build-Fix-Savannah-64681-webpage.ps-deps.patch

diff --git a/meta/recipes-extended/groff/files/0001-build-Fix-Savannah-64681-webpage.ps-deps.patch b/meta/recipes-extended/groff/files/0001-build-Fix-Savannah-64681-webpage.ps-deps.patch
new file mode 100644
index 00000000000..eae5dc99982
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-build-Fix-Savannah-64681-webpage.ps-deps.patch
@@ -0,0 +1,51 @@
+From c75965053124149381ada3c394da74be078076cf Mon Sep 17 00:00:00 2001
+From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
+Date: Sat, 16 Sep 2023 16:28:00 -0500
+Subject: [PATCH] [build]: Fix Savannah #64681 (webpage.ps deps).
+
+* doc/doc.am (doc/webpage.ps, doc/webpage.html): Update and parallelize
+  target dependencies.  Resolve race by requiring "grn" and "soelim" to
+  be built first.  Also add dependency on `$(TMAC_PACKAGE_MS)`.
+
+Fixes <https://savannah.gnu.org/bugs/?64681>.  Thanks to Alexander
+Kanavin for the report.
+
+ANNOUNCE: Acknowledge Alexander.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ doc/doc.am | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/doc/doc.am b/doc/doc.am
+index cddc51907..d3c9ab6b7 100644
+--- a/doc/doc.am
++++ b/doc/doc.am
+@@ -346,6 +346,9 @@ doc/pic.ps: $(doc_srcdir)/pic.ms eqn pic tbl
+ 	$(GROFF_V)$(MKDIR_P) `dirname $@` \
+ 	&& $(DOC_GROFF) -pet -Tps -ms $(doc_srcdir)/pic.ms >$@
+ 
++# groff(1)'s `-I` implies `-g` and `-s`, so we must depend on grn and
++# soelim even though the document doesn't require them.
++doc/webpage.ps: grn soelim
+ doc/webpage.ps: $(DOC_GNU_EPS) tmac/www.tmac tbl
+ doc/webpage.ps: $(doc_srcdir)/webpage.ms
+ 	$(GROFF_V)$(MKDIR_P) `dirname $@` \
+@@ -365,11 +368,12 @@ doc/pic.html: $(doc_srcdir)/pic.ms
+ 	&& $(DOC_GROFF) -pet -P-Ipic -P-Dimg -P-jpic -Thtml -ms \
+ 	  $(doc_srcdir)/pic.ms > pic.html
+ 
+-doc/webpage.html: tbl
+-doc/webpage.html: tmac/www.tmac
+-doc/webpage.html: $(DOC_GNU_EPS)
++# groff(1)'s `-I` implies `-g` and `-s`, so we must depend on grn and
++# soelim even though the document doesn't require them.
++doc/webpage.html: grn soelim
++doc/webpage.html: $(DOC_GNU_EPS) tmac/www.tmac tbl
+ doc/webpage.html: $(doc_srcdir)/groff.css
+-doc/webpage.html: $(doc_srcdir)/webpage.ms
++doc/webpage.html: $(doc_srcdir)/webpage.ms $(TMAC_PACKAGE_MS)
+ 	$(GROFF_V)$(MKDIR_P) $(doc_builddir) \
+ 	&& cd $(doc_builddir) \
+ 	&& $(DOC_GROFF) -t -I $(doc_srcdir) -P-jwebpage -P-nrb \
diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-extended/groff/groff_1.23.0.bb
index 1dcd0bb605c..370817c9f27 100644
--- a/meta/recipes-extended/groff/groff_1.23.0.bb
+++ b/meta/recipes-extended/groff/groff_1.23.0.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://groff-not-search-fonts-on-build-host.patch \
            file://0001-Make-manpages-mulitlib-identical.patch \
+           file://0001-build-Fix-Savannah-64681-webpage.ps-deps.patch \
            "
 
 SRC_URI[sha256sum] = "6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13"
-- 
2.30.2


