Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F179BCD1292
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 15:27:47 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.14161.1712158060436421622
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 08:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=p0qkUnMx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-432b5b3dad7so36202921cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 08:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712158059; x=1712762859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ae1V2RAuTnAztE1UcS5Q46632GGCPEnYCKn6T4gdaHg=;
        b=p0qkUnMxEW4tSEkqsz14XckxWJo6POE531zbPAqHwutBnWsOkgS4/gsgsZGPMyEBh8
         cTE9K6KuvlpHocZxwCzH2ndwtrEMqfJXs+0W7+30BhX288c1YANMSDlhSu9MCD961ZNt
         qJjZyp0pvlHjBs36DJ781fYJ8eEeSF8ZoPvxtppsm3FNwOooNIbluzEW7u+phdMJ/NR1
         PiyoOIgwF7xNTFk/vlZyvMswqm8xGdfAonxzMMpjk1wFDWqKM0hHtcIQcCgE82ZZGmSY
         cKoPihpJF4tYzmHGnUaPB+MjekBkFCboYNFG/NL22fADqEYw9wnDSmTzEVoFouQ5ch3Q
         XY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712158059; x=1712762859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ae1V2RAuTnAztE1UcS5Q46632GGCPEnYCKn6T4gdaHg=;
        b=SPrSNer1bdrqGSyEOHdlzmH2+T1GBnFnSAI714QSBEOSsnGmJaRo+XH1kZF6dVFhCm
         SmNnm0zzqVYbtmQPtJ3soae1uSYjmm+MEigPZa/WGxfO+D1qT1fKQvemVxJitjCZDBuT
         NfXkcSTEn/rGryjoikasswJOGiud1zpPh2wkXOAK6ZJVQBfRi6SBlA2VQ2RPeP4/UpJL
         hViQTriCt3nWseKPTIV1lmcERtevPkYpmffr3ohrQRW8nyWT65CWLGo7Gmu2wlY5od4r
         C7KK245V+ZBLE31enT1SYUO7iGzMwNH2KRcmhjMnBRbj8qN5R0hxAf1eFP/K4OiTONOG
         iSGg==
X-Gm-Message-State: AOJu0YwVkJc2A4hW3LyTmncPJelThpivWhXVipSPMQ/OCRnchxYFDe+C
	ACrZNnX7fODyQiq6+8TVltUC8eSaiTZz0R6hcqGft7if8biwqWXO+5E+IKVz6+WQEtuNfkceNsc
	=
X-Google-Smtp-Source: AGHT+IHbiPETS0Y0NR/bOSWUOuZ1Z8zc3uBn/jSPkvAK3hoNwCAB8S+97wPUJj9a0OPoh+HjVZxZvA==
X-Received: by 2002:a05:6214:1642:b0:690:a95e:fb5b with SMTP id f2-20020a056214164200b00690a95efb5bmr15910731qvw.29.1712158059293;
        Wed, 03 Apr 2024 08:27:39 -0700 (PDT)
Received: from localhost ([2605:a601:a699:ba00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id a1-20020a0562140c2100b00696804c73c5sm6543032qvd.115.2024.04.03.08.27.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 08:27:39 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] acpica: use github for SRC_URI
Date: Wed,  3 Apr 2024 11:27:26 -0400
Message-Id: <20240403152727.2247873-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240403152727.2247873-1-jdmason@kudzu.us>
References: <20240403152727.2247873-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 15:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197926

Github is now the location of the ACPICA source code, per
https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/download.html
Update to this location.  Also, this allows for devtool check for new
versions (in theory), and allows for an easier collection of the
changelog when updating versions.

Using the SRCREV SHA that matches the tarball release.  So, this should
match what is currently being used.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-extended/acpica/acpica_20230628.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/acpica/acpica_20230628.bb b/meta/recipes-extended/acpica/acpica_20230628.bb
index 8974bdc1f1a6..e63faebf0901 100644
--- a/meta/recipes-extended/acpica/acpica_20230628.bb
+++ b/meta/recipes-extended/acpica/acpica_20230628.bb
@@ -16,13 +16,13 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
-SRC_URI = "https://downloadmirror.intel.com/783534/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "86876a745e3d224dcfd222ed3de465b47559e85811df2db9820ef09a9dff5cce"
+SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master"
+SRCREV = "f16a0b4d0f0edd7b78a332fcf507be2187fac21e"
 
-UPSTREAM_CHECK_URI = "https://www.intel.com/content/www/us/en/download/776303/acpi-component-architecture-downloads-unix-format-source-code-and-build-environment-with-an-intel-license.html"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases/"
+UPSTREAM_CHECK_REGEX = "releases/tag/G?(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/acpica-unix-${PV}"
+S = "${WORKDIR}/git"
 
 inherit update-alternatives
 
-- 
2.30.2


