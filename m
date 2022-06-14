Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB65CCA480
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 13:17:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.5979.1655212620761240563
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WH3b3kzG;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: ptsneves@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id n185so4628324wmn.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jx10Eh51y4HbWngWLtUzs8P6priZADjXMkCR29+D+5U=;
        b=WH3b3kzGRE1G+mDqo8kyYB07NxRAb+8HPIqhADqIRZQ6+bbpfzaGv9VNWC5LFrrF6N
         7DLUgAQQWB0FYVIJC1WrP3Y1p9EukoFgcsA8BeizQtLEtdNXdcAz67ezoE+LwOMS87Oz
         1DOIoy8F0yatncK16nqQjRk/4wkbOgXPlhsItQQpPtXbadb+vw21PJuA0kpniaF90BSM
         AlTVUcgS8JKczj/gWBNhohUyHjCj7G8/koTHwG5gZzNFFbQvjy/HZ5//DifNF/69H0lA
         Qs5+qh8AMg/j/9afagPzoxPexNx3wzbxMe2f0j0ujHQCytUulLJtWz9EbqEMad0OOnn2
         a/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jx10Eh51y4HbWngWLtUzs8P6priZADjXMkCR29+D+5U=;
        b=3+4za7Gio3IdbkDkHkEYJJkvU4cMnA933xJQOY3KAygWbA3HDl74GXbY9gkyjmpqeY
         bg3Qe2WyXRwlyCxCL3Xo8JCQMY2+B1vrMBFjOeH+yRceA/eu3RdZNL4HhoxoA82idzaK
         CRiuVA8QTAHEaK5NOCbMPC5O1MAzwW3fa4j0sQCFRAUDcBJ73k8o93IDBTa4motMKppr
         TZVWX6O1nyTLsFrIRHPYWq8BpAhyMUkewFTRpX/cFC6d7v31EsNU5X2D5F+ojhvRMVSo
         rPvOJ2EZ9mM1ubm8Ga0I1jkIdMl+29nhfkqOGUysl+GbCk5Z8u3P2BF3Qdxqv088+sQM
         741Q==
X-Gm-Message-State: AOAM533h3euny2miKeBLoLA/yZCicBV4kjna8bmyZqRiZhFH4sYUg7Wp
	1cewxoX45eN0x0Rt3ENfGpaTegnFFQ==
X-Google-Smtp-Source: 
 ABdhPJxbA1iPipsRWQ2W/u0dCFJNmYJnqKJe3PEu4Fx80Cu9M+bwz0KEHH54/fO+VjyFh/XvSTcY6Q==
X-Received: by 2002:a05:600c:2c46:b0:39c:55a0:9533 with SMTP id
 r6-20020a05600c2c4600b0039c55a09533mr4090225wmg.104.1655212619014;
        Tue, 14 Jun 2022 06:16:59 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a5d6f0f000000b002183cf9cd69sm12161092wrb.15.2022.06.14.06.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 06:16:58 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v4 2/7] gtk-doc: Fix potential shebang overflow on
 gtkdoc-mkhtml2
Date: Tue, 14 Jun 2022 15:16:47 +0200
Message-Id: <20220614131652.566471-2-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614131652.566471-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614131652.566471-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 13:17:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166883

A native path can cause a shebang overflow on gtkdoc-mkhtml.
Replace it with /usr/bin/env.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
index 150d2c0b23..392913fcc6 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
@@ -43,6 +43,7 @@ do_install:append () {
         ${datadir}/gtk-doc/python/gtkdoc/config.py; do
         sed -e 's,${RECIPE_SYSROOT_NATIVE}/usr/bin/pkg-config,${bindir}/pkg-config,' \
             -e 's,${HOSTTOOLS_DIR}/python3,${bindir}/python3,' \
+            -e '1s|^#!.*|#!/usr/bin/env python3|' \
             -i ${D}$fn
     done
 }
-- 
2.25.1


