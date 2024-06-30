Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BD8C27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:59 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.4392.1719778136840731337
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WE12bUYw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7066c9741fbso1912245b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778136; x=1720382936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOV+lhWQ/fWHPRygv9AGZ6hEGe37EH6PJ8HAMfKK2/I=;
        b=WE12bUYwmOCdg203GDsT1DrcjJRxlSjSbQX3zbqX6RNMuu1GY7C6i5R4UH1c9h4nyr
         Yuh+c23iqFJ3oGJIjbSr+eXI4mVxGGX/XlJwatdDAUZ/FQZsj3f0xr/0ECTL9Zsk+aQ6
         gzi64onIuuCpaPyqc57QWgeJguDQP3n/lxgiS8mc3G1PA+LM3Cxzd6KPbCIeRk1T4NWL
         2e2EDW4FdSAkj93p3Ka6Z7+OHyGoVW/Hv6IfZHFr7KMe4tpYfXGP+q3AP2iaYITrPvVV
         3BXtm5N2GE9RQ/e5rKd/dUl0eykZvClDFN4xzUyx0vERQ9sn9ZKk5TKHJOawpg7gv2QN
         agaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778136; x=1720382936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOV+lhWQ/fWHPRygv9AGZ6hEGe37EH6PJ8HAMfKK2/I=;
        b=th+qxu87hmP1bnsZiEVi6FyO19+IjOqwrLkjReTgQem61XH9/Z7GD2b/YWssyY9t7d
         zYV9Zb86C1cfMuI+j5ica1Vi0vJasju0hgLH4imyHsYVd3+6Ad3QL7x+Mhz8K21cqFju
         PE9U9nw4Sng2pRCISZGfY76X/xYGMLjQDc+4SrGXqz4rGvLP4j7e+Je667FTgYsy+aej
         UNcNO+mQH5U9htd7gWAE+UhyAeuebEEQjSHDceenQFjoTaxYwjKXmKl2BgPHlhZNRwZM
         L+G8gji+TTv4qGpzbpgAaGQ0LztGFRNissjlN81/ot0oNGSqrjq6t9kX64Gt23fx87l4
         pjwg==
X-Gm-Message-State: AOJu0Yx1rT2xRwXtv62ccP87pezWa2CU7JJWnYXqe1DxVAwuT7nl8G6Q
	z092jHM/uz85LQ8pefCe3JXFEGpwbLmfqQh5/8tWR0Gr9ME3YW9x5xph8nSg4fr7gLVXomsE1Vl
	duqI=
X-Google-Smtp-Source: AGHT+IHR1DdO/+CinrqShymfcQeZ5tyYyV+BXwuCzAEmEpTxouyGUKn36IWeu4Z1dXZRiNGsBFGCqw==
X-Received: by 2002:a05:6a00:1482:b0:706:7276:6287 with SMTP id d2e1a72fcca58-70aaad2acddmr5349444b3a.1.1719778136080;
        Sun, 30 Jun 2024 13:08:56 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 35/35] classes/create-spdx-2.2: Fix SPDX Namespace Prefix
Date: Sun, 30 Jun 2024 13:07:47 -0700
Message-Id: <9abcb18014020804738dfc7d278d7097679f4d19.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201272

From: joshua Watt <JPEWhacker@gmail.com>

According to the SPDX documentation, it should be "spdxdocs" not
"spdxdoc"

[YOCTO #15398]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d1b25413ced62dc2927dae57b8d16e67d15dc220)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 486efadba9..4ea91f6499 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -28,7 +28,7 @@ SPDX_ARCHIVE_SOURCES ??= "0"
 SPDX_ARCHIVE_PACKAGED ??= "0"
 
 SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
-SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdoc"
+SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdocs"
 SPDX_PRETTY ??= "0"
 
 SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
-- 
2.34.1


