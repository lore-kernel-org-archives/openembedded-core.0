Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57354C04A94
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:25:03 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.138760.1692116695447850378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=sV4l59Bs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1bda9207132so43981615ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116694; x=1692721494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwF7vwBIE/kzDzWe4o+egqpzsGDkYj9t7DvIh7Op38k=;
        b=sV4l59Bsx6gyiHiWOOVMR23BN0cal6GoLVPJ0My7gbpAtdxKviGLMzKn2fM7FW19f+
         8tKBN6GlVJTdLoTiHZpC7GC/HfKtn3eS0Y7dxADDpzdk81iYIioQphOFVt8dfd06eJMy
         UNi0AmuyzMrkPvWGhmpMx8Oglfa2qAF9TBAhf9kLu/iCVArfZ46JfburVsJmBCrckp72
         TM9+2+bj07E1r7y21RStbT8PbA/9FFtpgTJTalg+jfqGKj/iTx1ZxLvBib9NhnXuMzNa
         FMELYaZlj/EuEWFwMZKs2tYAq8bJm626Zcryb1dZBEgJ7YITJONfz2R4dThglBGtCwZ+
         cvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116694; x=1692721494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwF7vwBIE/kzDzWe4o+egqpzsGDkYj9t7DvIh7Op38k=;
        b=FvaB8XeFMw63GyJGnerdGc+HRtK8mGMTKH+WclfdfLiYvE8877UD+VwcV9cPJwEB6F
         nDWhhfAXUkmFO63Ebl4SJ0DFNN0cAm8N+r++ZlM+oHZVKdOrwMBq1dLlZDkR6qHx3VTu
         qpF9vuCJccusC9PIowNh9fpE4tqlpEKQI+ochwG8N0vczxPIyhkxoUpzXCuLnsU9LsT6
         jcsNarDo9qSrzQKC4YZ95XjXci+gZUvoXMvxMbp3txeYsTGnwzSeL3LFmrfI61C0OKqq
         GST1u+MWQLTKjp7cPK6ArIOws5DPbSh1uTAPe1/H/DXkBwo2OnQNMq7DB0HY6JjpdJQQ
         7ovQ==
X-Gm-Message-State: AOJu0YwxArpadSrlklenwjuHyX013OmF1X9OCYOkKkxhhkelWRWmtxAx
	Fi6brHC44ZQit7Vg1x07NxOyIT/lex6TYsFmS1c=
X-Google-Smtp-Source: AGHT+IEjZVV0AQLyHyJupZQlqKFtiLY42R3+a+jgc0MiPcSZ8FKILw0mOANYgpkztw/vmPX5sIgR+A==
X-Received: by 2002:a17:902:6b4b:b0:1bc:532f:1bf8 with SMTP id g11-20020a1709026b4b00b001bc532f1bf8mr14327930plt.45.1692116694592;
        Tue, 15 Aug 2023 09:24:54 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.24.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:24:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/18] glibc-locale: use stricter matching for metapackages' runtime dependencies
Date: Tue, 15 Aug 2023 06:24:20 -1000
Message-Id: <bab7cbaa728736cecdfe64bf250df1872231569c.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692116535.git.steve@sakoman.com>
References: <cover.1692116535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186090

From: Alexander Kanavin <alex.kanavin@gmail.com>

This resolves two issues:

1. metapackages were depending on themselves (except -binaries which wouldn't match against 'glibc-binary').

2. for the nativesdk variant, due to a non-empty dependency list at parsing time caused by
issue 1, map_depends_variable() from meta/lib/oe/classextend.py was forcibly setting PACKAGES
to the initial parse-time value (e.g. missing the dynamically created packages). This meant that
three out of four nativesdk- metapackages were entireyly missing the dependencies on the
respective dynamic package sets.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a90fd3afe9184aa1870b34a826e3ba0563477d4b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 760de9437b..289f58d4df 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -37,22 +37,22 @@ PACKAGES_DYNAMIC = "^locale-base-.* \
 # Create a glibc-binaries package
 ALLOW_EMPTY:${BPN}-binaries = "1"
 PACKAGES += "${BPN}-binaries"
-RRECOMMENDS:${BPN}-binaries =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-binary") != -1])}"
+RRECOMMENDS:${BPN}-binaries =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-binary-") != -1])}"
 
 # Create a glibc-charmaps package
 ALLOW_EMPTY:${BPN}-charmaps = "1"
 PACKAGES += "${BPN}-charmaps"
-RRECOMMENDS:${BPN}-charmaps =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-charmap") != -1])}"
+RRECOMMENDS:${BPN}-charmaps =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-charmap-") != -1])}"
 
 # Create a glibc-gconvs package
 ALLOW_EMPTY:${BPN}-gconvs = "1"
 PACKAGES += "${BPN}-gconvs"
-RRECOMMENDS:${BPN}-gconvs =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-gconv") != -1])}"
+RRECOMMENDS:${BPN}-gconvs =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-gconv-") != -1])}"
 
 # Create a glibc-localedatas package
 ALLOW_EMPTY:${BPN}-localedatas = "1"
 PACKAGES += "${BPN}-localedatas"
-RRECOMMENDS:${BPN}-localedatas =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-localedata") != -1])}"
+RRECOMMENDS:${BPN}-localedatas =  "${@" ".join([p for p in d.getVar('PACKAGES').split() if p.find("glibc-localedata-") != -1])}"
 
 DESCRIPTION:localedef = "glibc: compile locale definition files"
 
-- 
2.34.1


