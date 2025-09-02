Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B96CA1002
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 01:45:24 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.67817.1756777516602012975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 18:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ECbIcuZV;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-327ae052173so2919856a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 18:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756777516; x=1757382316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qj+VKXj7PSyzcDk3tUhX2rTmnxlTV9yvAwExHRb7Yw0=;
        b=ECbIcuZVuJc0l+oVRv3kyd+GG6i97r3GXZsd+wRf2glypqW+bomb/QP/QTtJ6mZ4H+
         LiA0RpE/gGvP4qygGINpPsTyoMksys4Z8puFe3bsbf88lNorv4xhtCIP2KOJmGA1q+ky
         rnuWixYgV4NdlaxDd7xZ8IyZ+1IGDPH53ja+mYjI3CYIF3j0ObbMbE1T36Z8zV+IUEpx
         11xWcZ2NSTMmJOjNY692pQegpsgC86XJVkJ8ph8w70u+PxbyHNpQVo6hc/o/3MQ/P4+J
         Yce28RZ/2IRqgIXxFwud3gySHYm4MQu38Luef/y/Frlov/YdJjU5xjSZhj5wg6MyWi/2
         uMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756777516; x=1757382316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qj+VKXj7PSyzcDk3tUhX2rTmnxlTV9yvAwExHRb7Yw0=;
        b=BGFmz4BeZMpux/89FjQzrcAVDlvzJy3Qi4jQcpeOSPxEoKL00UHFAZh+Z62HSG3sp+
         1OcFig2FDjnouTL/Aq3sJhsAPHMU2S3dcxB3SlWVWumVWvwhpCAahoJ9O6kkyCwQ6RXw
         SYmJCAtgsUTDHM4gNhLEYn+leV1yG+T1DyOlvEFtJ1LhzQB6sZY7jfoETcC3TNL/FNlX
         EtwFbHuh3Ded7qWNyJIROIOpKrK+XWgKgekEr1p66CuHv6PEPci+eQn5UJq6Pwqe2547
         cZkHlV2v/09BWpfZZ9ZUZqJO5RVm+URT1oHUfoxCykjzCALlFC3GsjJTmbSMOIFRqoAT
         ZISA==
X-Gm-Message-State: AOJu0YyA4T2Hgi+/uOYCpC84FOS80j4HxM6jJkPY2qJ4GRgrMefHGUub
	Mp4+MHQYX38LHHBsqSdni5ZI9PMHoU7qFXoHqyu7s+FM+8WMr4lhvZuqtv39w7hH
X-Gm-Gg: ASbGncuKASQo/wFWHOMwEoHM+bY64z9j/a9c5JQaKpY98Tb543q+pOyWwd4JCAmnkVV
	RlmjYVKcgj8LffLxMt2qmm71vpHI+/ND39O+Opy740d0cdkj9TneLVCp4JqsMhIvfSEZUSDZzdd
	nUwPM+LykgJFAQvcdhk6jAEGdM82ZmyTTrP86cVm6XujF/4B3vWDJPxM8JxppJ1mXdDSZ1pflTy
	DGLWusUVLNHo0HY7A+T3MavBA5HNBpr+HfdnBUtUJi4unhMUoJrk3hCzOgECKuGCFDg0R6cONA9
	UxMQHHojjL188m+dgvGXHgVV916msN8k9pxEuui/vAUF8lnslAsMT4CPTWiTjPeFS3rXllGwahr
	wuRdk5WxW8zYJ4/DrivsFJ5OCIOgzirrRKDbzG2BCocELbycv9NMDAz0OTvttOZ/zl7fFnwzHUT
	GPxBPZ2GA0HvfwuSAb8AQBAC7udYhvtjjqODWTbTzQ0UGF0LxGjus=
X-Google-Smtp-Source: AGHT+IFRN5VanOgm5ub20SVNLwtIuvFk56dsTm/sdex+G00qGYopRSs20TxoAr/kt6bruPP+fII1/Q==
X-Received: by 2002:a17:90b:1d48:b0:327:75c9:bea9 with SMTP id 98e67ed59e1d1-328156b638amr13782814a91.24.1756777515601;
        Mon, 01 Sep 2025 18:45:15 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::c2de])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f8a0a3948sm2692899a12.27.2025.09.01.18.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 18:45:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] lttng-tools: Add link to issue reported upstream  for musl failures
Date: Mon,  1 Sep 2025 18:45:11 -0700
Message-ID: <20250902014511.3492629-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 01:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222681

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
index e706e87c060..fc586ccae46 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
@@ -208,6 +208,7 @@ do_install_ptest () {
 
 do_install_ptest:append:libc-musl () {
     # filter-out running regression testsuite on musl systems, it hangs
+    # Keep it until https://bugs.lttng.org/issues/1432 is fixed upstream
     sed -i -e '$a\' -e 'SUBDIRS := $(filter-out regression,$(SUBDIRS))' ${D}${PTEST_PATH}/tests/Makefile
 }
 

