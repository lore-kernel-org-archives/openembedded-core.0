Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBC0C41535
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 15:03:44 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.53376.1699715021740197430
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 07:03:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3bwDOCSL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ccbb7f79cdso23936135ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 07:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699715020; x=1700319820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3V724EwI/qKPAMf9RyM4vGt8ZqUGM8Nnuw1wHp0zS4=;
        b=3bwDOCSLdEdTi/IsUjF4bVcGML3n4VnBvmEyR3tXOboVzmGFUWAxeV/bK93hesusrR
         u6U2xy8bm72zk9TvRzhMlDJWPBZRD3h0cHvKU77C35ByAsRxUp1T/gxt+K9Ix+m2wu6Q
         siCKJHY2mBQxB7+ChQyxBAeLfLObYkBnZ+I9FTnjPidJU8vZSjmrg6VlxccL6V0i98a+
         JDgKsCrs8cEI1aQOn6Z8ih5J6Ml/5J6S5mhNVQB0Ac67jbN6XW6BPjOX4KNXodo5TCMT
         uxMYtszSNVEZTq+oXlnkw9QFa/hN9TyMO87+PAAcEGrWT/plcJYwAhEIGEgzZwAk9OzE
         MTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699715020; x=1700319820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3V724EwI/qKPAMf9RyM4vGt8ZqUGM8Nnuw1wHp0zS4=;
        b=tCRvKwU90TDlbUzer29T+deEwiJ3dQnmCZcoEhCUHT0w7FDbxpLqrL7GSMa+olC8pa
         4SjPdKrO85csjhsQziKcF7YRcG4YPcKpMc9FvGgp9hy0fSgWOBdktwh2A4OmQcsabz1y
         41xNTrSKZBtuW2GpFrxqymrd1c/uZJGA2RhcTP1LNwxVJE1w5TMp4zmQUjVvsrM45Bo8
         PDw+ZSR2I+TK7k7jgOKVBKFmh7F2H9G4AhX/yTRXQZZFzx8YSKQO0fqE6oLvg1qKdqqG
         gUz3wXGV9U5pbFOQs56J7Haycn2Ee+V3qIMhYmR3pjVwTStr9Jb1wTQbWmOV56ceg/jS
         hFnQ==
X-Gm-Message-State: AOJu0YwWEihbJscy5Pyvt7/MA995yUpnkqIs9KMSqKOtZwlDFG9nYZoV
	KyHJ4FI9+nVNicYcRtI90WvgkVwBKBaA9zk07TkOzQ==
X-Google-Smtp-Source: AGHT+IEd5qONpAzMjM1Yhfp3bEKeQbm7oHQn3cYgKbTFhBdweSFB6motUqSn6IZDmOjsa1vXc2dEmw==
X-Received: by 2002:a17:903:2387:b0:1cc:6597:f41e with SMTP id v7-20020a170903238700b001cc6597f41emr2054919plh.0.1699715020270;
        Sat, 11 Nov 2023 07:03:40 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm1379200pll.30.2023.11.11.07.03.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 07:03:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/15] lz4: specify gnu17 in CFLAGS to fix reproducibility issues
Date: Sat, 11 Nov 2023 05:03:04 -1000
Message-Id: <ce826b01d93ac99ce089c2212cb0cbff61cee1e4.1699714834.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699714834.git.steve@sakoman.com>
References: <cover.1699714834.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 15:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190430

We are seeing reproducibility issues where gcc-cross sometimes defaults
to gnu11 and other times to gnu17.

Specify std=gnu17 rather than leave this to chance.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/lz4/lz4_1.9.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index c2e24b518c..8cf71fdc04 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -23,6 +23,7 @@ S = "${WORKDIR}/git"
 # Fixed in r118, which is larger than the current version.
 CVE_CHECK_WHITELIST += "CVE-2014-4715"
 
+CFLAGS_append = " -std=gnu17"
 EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' CFLAGS='${CFLAGS}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
 
 do_install() {
-- 
2.34.1


