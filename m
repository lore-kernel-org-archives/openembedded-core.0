Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1429ECA9EDD
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 16:03:38 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16966.1791821008582939528
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 09:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=f64CCFjY;
 spf=pass (domain: snapchat.com, ip: 209.85.128.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so15216755e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 09:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1791821007; x=1792425807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRfp7wuqKidjN6rqIFHvWfL2OKAcAFcFQ1vZdcdFvds=;
        b=f64CCFjYaq1r8AQsxbMWDwEqoVHuvxtT0+JhAdCrhn1iDvlIWw8PKNzPnfJUW3Lreq
         +2JXAje5ymy7N01dbn9nnIaqLpskBTEC+ttFI3n91bW1QtbhPkNw++XVutT1IfYtiE3J
         esRgAZOLkTxshhWXNLsZW5SlIbmz40nzJA+jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821007; x=1792425807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRfp7wuqKidjN6rqIFHvWfL2OKAcAFcFQ1vZdcdFvds=;
        b=la3EI2X4uQ0+egqZRrBr87pnH00Fgeu7+Sd08OzJJ538EO+QgB+OG6M1a4GZIZZgYj
         GfoDVNtlTAyDLDhudmHDFO14uHlxSDyh5WvGAmL37fdSCxbe2MBUBV15DcMAq2U+ZcZq
         TRV1iMEifsinkKa9+Rg1D3hNZdcQb6wwG77OXyVL6UZwFgfDZQjqV7mA4Tp+h3KgoOHr
         VA5GCnvoAbM7hE03DSTLtmaJfB8gWLMo8ql8jvF5vsPihgIHZXC7/TiFzk0RQ7qfSjpB
         2/pJI3vlg3LN7K0zKaeCWLn28J5TsmBx0sqZzDWbTbq7uLbrPYOM8sQ6ypEqkbamoA4+
         q3fg==
X-Gm-Message-State: AFq9FYL2gnD3iPSsUlRGJWcf0PFDCpFi0A9oipgSiINbxGKR3QWl0NdZ
	HNKkj5Dx4Xu+Kkz3cOSGaSavMIlf26FZNdFa3L9y7xYR792u5E28W1CarngzLjknF1Ep1AEHBd1
	mLJ+T+e8=
X-Gm-Gg: AYBFou2QdpeafF/KG6kkpg303uqTcyQPDfqtYqFlVfTZrDxFJdRldWXOFdmBM7bnAlW
	rfZoWpwwuOIxLT/LDqGqgDgknrRiAzsx6N9QbDBPDQWajs/6O8o6iezi6qrrdoa1Ci/LQFaXQNm
	8Bf+n4jdzsuC4S1dI8yyahwX1itz4BlHyTCcDYjCSTKDQfR1tRp+NKjyIXN/jObJ7PdN8hL2Gvw
	aoookxNK5NMSRhk2MTModRhZhZARBhcjxlFTmMLAKyoXQ6dMJhe3KPOCOQLRleaVArKWOdArEK2
	X4O+2oYFV2/x0H3RiXpUgtwmlhf0eDpCf/kdaskXqL/H1pKSZTgdAXvLyyT40+H6/PhP1PbMLRm
	VnbDSsGU7qpDzG/uJzixisfqZmyybzw3CGXMQPZFC1UGLS2FMKIFMtblddkZVdufFZ7RJBQc8IC
	SvaATw2q0L8IvdNLuSx2GFicPA6HkUyjeSBGPovPBvJqgGNt5LDp7eEpijKdcGHra21lJiHl7TH
	CPusB0qSoX6SkmMOY13OKPLjV8MtQdTfBZaFK/DGn1bhXcX8xZ8ow==
X-Received: by 2002:a05:600c:4747:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4a18e49d65dmr192179215e9.5.1791821006465;
        Mon, 12 Oct 2026 09:03:26 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm474071045e9.8.2026.10.12.09.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:03:25 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] sqlite3: use SOLIBS and SOLIBSDEV in FILES
Date: Mon, 12 Oct 2026 18:03:19 +0200
Message-ID: <20261012160319.1965203-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 16:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247669

From: Etienne Cordonnier <ecordonnier@snap.com>

The lib package and its -dev package hard-code the ELF ".so.*" and ".so"
globs, so the shared libraries aren't packaged on platforms where
SOLIBS/SOLIBSDEV differ (e.g. ".dylib" on Darwin). Use the variables, as
other recipes do. No change for Linux targets, where they default to
".so.*" and ".so".

AI-Generated: Claude Sonnet 5.5
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 137ec26207..3e13dbdbfd 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -69,8 +69,8 @@ CFLAGS += "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DSQLITE_BYTEOR
 PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-staticdev ${PN}"
 
 FILES:${PN} = "${bindir}/*"
-FILES:lib${BPN} = "${libdir}/*.so.*"
-FILES:lib${BPN}-dev = "${libdir}/*.la ${libdir}/*.so \
+FILES:lib${BPN} = "${libdir}/*${SOLIBS}"
+FILES:lib${BPN}-dev = "${libdir}/*.la ${libdir}/*${SOLIBSDEV} \
                        ${libdir}/pkgconfig ${includedir}"
 FILES:lib${BPN}-doc = "${docdir} ${mandir} ${infodir}"
 FILES:lib${BPN}-staticdev = "${libdir}/lib*.a"
-- 
2.43.0


