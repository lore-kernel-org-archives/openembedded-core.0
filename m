Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5AFC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 14:10:51 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.8832.1742393442460657092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 07:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xwNbEKDb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224191d92e4so133915295ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 07:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742393442; x=1742998242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tGzMYBFfvt3Ny9MwIzWfQ3bL17loVAwmthn0ESIA5k=;
        b=xwNbEKDbI+I3CNJ3PvKoKY3+TU6gu8WWcbmY696KD+YpGTSTCcBiQlb46jixik/Pk+
         jsQhhvHksollgUcSwKXYPDVQmshuyj5ewizsYFBUZaoY1RavDlSOHTvRjA6T/cr/GGET
         GNWYFsx/arxaXUfL4yi+dsnIYkcLUc2XrLJUENF6/Cy9/ysu6tA0s4hNWMzvbf/mtzpx
         VH/iRxFlQPdTlu63s5KiqR/a2iQ2GSAgYgosbyvY25b46pu+WT7ZQRNKtVfiXVmBfSdQ
         M3jY9Hwnz3KfXKWKNo5Lfp0rCdtvQcLIviJZq8mcywn17JyoBih2DvLtz2DI8v1PdVwv
         RbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742393442; x=1742998242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tGzMYBFfvt3Ny9MwIzWfQ3bL17loVAwmthn0ESIA5k=;
        b=u9mpi0P1ukx+Nfte/TzevNik5+XOkJrEA+5p29C4tAf2IV9qCDXc4wI2/UlDcU16Tf
         InO5ffYWEp4UvgnayDuYm2HtOV/TaXa91hY7iv0nCMKs2Nl1E85A7G0lfAj+CGwcqcbi
         cTbPvXKlOyP8cVT0j/dMnbytahQr7ekYaU5LRrDIjCWynx3im5YN2hMrY2q+NMs/xOdy
         3lGQsZgBB/AVvdtZr/UyO+E/u28z+aKt9IT/az/QmKhJGClD5tUTsqF9/lacVapCnLhl
         BjLKRpF+IyMRx1V6W5LKGwRe3C3JV/a+LVvLW0BWpF1B9jUbZJH6OKYwANyF7awxdy5q
         dK+Q==
X-Gm-Message-State: AOJu0YzKXqR3UJ+JqhdRgf/W4IvapAJfAm1gwTdEjaSEJkezShj4lKVm
	1tY+ajpuTj9kAp/T2c3+EL/ne1vwwI6ILIKtkYMFlfKc+gEEpO284jvvso24LZVy/xyhY1nndFw
	/
X-Gm-Gg: ASbGncss+/G7McDMNAAylpqhrDytUi/wWGQsHJFmA8A+x2K8Qf4ejuD3ExjUlwdNDE9
	s8H5i0LpKkWfgBj3VvstZGPkh9ZK5MQiGTpLPrvZkFOHis0C7QMmLHgNpEOR3+zhpo974I+4x0d
	pvmvE4OW446+HQOo5yfXte8q4v7XAvR1Lk3pvodxZkQ+umzn/4qF31Yhp2HfY9JhLEPxf7dmP/O
	tRxGGyj5l3wSkwLcqpUmwIp931ql2O3hzEKebVLV0Tq8+Jzav/m+NFH4dAT5M29lrqrfx8QP9LZ
	8e4WzDecgiwud/jmAwbfX8OcKgtKm4Q4MOta
X-Google-Smtp-Source: AGHT+IEd34P49+zz+uLKH+iEkMyFU9ASgobH3Ppazim2G8Z+yaMrvu3LOFT2zJipv9rr/gcvyQM1uA==
X-Received: by 2002:a05:6a20:8424:b0:1f5:9cb2:28a0 with SMTP id adf61e73a8af0-1fbed40cbf1mr5821250637.40.1742393441503;
        Wed, 19 Mar 2025 07:10:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b10e1sm11557214b3a.165.2025.03.19.07.10.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:10:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 4/4] icu: Adjust ICU_DATA_DIR path on big endian targets
Date: Wed, 19 Mar 2025 07:10:18 -0700
Message-ID: <1689c4fe872540c48af07b482e65646928eaf516.1742392880.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742392880.git.steve@sakoman.com>
References: <cover.1742392880.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213338

From: Makarios Christakis <makchrbiz@gmail.com>

On big-endian systems the preprocessor define ICU_DATA_DIR
is currently being set to a path ending with the ${PV} of
the recipe.

The PV version string has changed to a '-' separator
since oe-core commit cebe8439cdc656d53355506a31a3782312bf03c5
whereas the build system installs the data files into a
path ending with the dot-separated version of ICU.

This causes the ICU data file to not be detected at runtime,
consequently breaking any dependant applications.

We therefore substitute ${PV} with the dot-separated version
string of ICU, as returned from the icu_install_folder function,
on the ICU_DATA_DIR define on big-endian targets.

Signed-off-by: Makarios Christakis <makchrbiz@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 28cdc0110def011e3d690da1d591076385267ef7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/icu/icu_75-1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu_75-1.bb b/meta/recipes-support/icu/icu_75-1.bb
index 8f7f5e6cc7..73d4a7cf6c 100644
--- a/meta/recipes-support/icu/icu_75-1.bb
+++ b/meta/recipes-support/icu/icu_75-1.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF:class-native = "--disable-icu-config"
 EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config"
 
 EXTRA_OECONF:append:class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
-TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
+TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${@icu_install_folder(d)}\\""', '', d)}"
 
 ASNEEDED = ""
 
-- 
2.43.0


