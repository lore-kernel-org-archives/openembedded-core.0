Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951E4C74A4B
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:42 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.35736.1678494452980715894
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hxi9pnKt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id l1so6539722wry.12
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7wpyWjXAFm9CB2B46OLpF01Tcyh5fq1Cra21K4TKNY=;
        b=hxi9pnKtYkcHkvGLTI3xjS2C/hEkNF8QGPOmM7gbSbM6vTudE2kJzanc25of9ePCVG
         Hdhv/XqP15S4+KmrpUf8s5LhkDoL4/gtz3W9wbdltCESLRwMfhznBRWDHjUJVk7BSYqv
         nbBg6WB41kteGjw5QPgbUa/eMyXOUsDaNqyCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7wpyWjXAFm9CB2B46OLpF01Tcyh5fq1Cra21K4TKNY=;
        b=LQ1llMFSpSOsw0q311yttJWYm9/UHtoLoMl9cQYiASV0LTEPsvYhTC7HNdqhYQRzBd
         5/oIgpUVVvT4Fwt9ZWXjppYqYQE5XwNsUiiEcgPL0Y6euFAQDRc8QBIDO3KNdY/+g/ey
         btKsEIu4/LUAuXWUUwM6gxPi2OoUXDuITL6j1Aie+OVnmqXsGDe+ehd3dRGKIcySQd91
         wnb73FXZw1rGZ9vRyNrj4M+pG+fDnuDeL5LdZU6LxlAGo2YlWnk+qhBgZYXUWvFp3xfv
         v+SxbadarWekv8PC9SIFTQ75Nm3F/ahIa5o8D5IcOA+3/Is/nMAZXtrlIot3fhp+dKGV
         pgMA==
X-Gm-Message-State: AO0yUKVr+StzZzBehv9pDIjQnjOjSASb6Fjfen8N+2U04LGb+PvELoc0
	MaWZKt3NV1M2aHfgqmBCDQijQw5oH3GWLN1sAfM=
X-Google-Smtp-Source: AK7set9/JEP1v51ctfnvFFXSmtVIgUJsIVJCpUiOW9qvI0SrSjv+IJ625UlkU5XeMcxpjaOwl46TuQ==
X-Received: by 2002:a5d:4991:0:b0:2c7:1c08:121a with SMTP id r17-20020a5d4991000000b002c71c08121amr18145087wrq.68.1678494451306;
        Fri, 10 Mar 2023 16:27:31 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/16] babeltrace2: Fix ptest execution in minimal images and add debug info
Date: Sat, 11 Mar 2023 00:27:19 +0000
Message-Id: <20230311002722.3211118-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178357

Tweak the ptest dependencies so they work correctly in minimal images. There
appears to be some usage of find or xargs that doesn't work with busybox.

Also improve the test runner so the test-suite.log is dumped upon error
which makes debugging much easier.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng/babeltrace2/run-ptest | 12 +++++++++++-
 meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb  |  3 ++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
index 72fe2234362..71a9c81bfbe 100755
--- a/meta/recipes-kernel/lttng/babeltrace2/run-ptest
+++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
@@ -6,4 +6,14 @@
 # test plan to raise ERRORs; this is just noise.
 makeargs="LOG_DRIVER_FLAGS=--ignore-exit abs_top_srcdir=$PWD abs_top_builddir=$PWD GREP=grep SED=sed PYTHON=python3"
 
-exec make -C tests -k -s $makeargs $target 2>/dev/null
+exec 2> error.log
+make -C tests -k -s $makeargs $target
+exitcode=$?
+if [ -e error.log ]; then
+    cat error.log
+fi
+if [ -e tests/test-suite.log ]; then
+    cat tests/test-suite.log
+fi
+
+exit $exitcode
\ No newline at end of file
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
index b48f07ea0df..04c2a279041 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
@@ -29,7 +29,8 @@ FILES:${PN} += "${libdir}/babeltrace2/plugins/*.so"
 
 ASNEEDED = ""
 
-RDEPENDS:${PN}-ptest += "bash gawk python3"
+# coreutils since we need full mktemp
+RDEPENDS:${PN}-ptest += "bash gawk python3 make grep coreutils findutils"
 
 do_compile_ptest () {
     make -C tests all
-- 
2.38.1


