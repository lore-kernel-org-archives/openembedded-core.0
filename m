Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE7EC5B543
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 14:35:41 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.19542.1749306936612336295
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jun 2025 07:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=MSXf87HJ;
 spf=pass (domain: snapchat.com, ip: 209.85.128.41, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450ce671a08so18856395e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 07:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1749306934; x=1749911734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4tjtxP+/IBrctpAyzywqR4l2B+1ykZhwePHwoTOzXc=;
        b=MSXf87HJH7Xx9PKv8rc8CDeWiCcrgDKGasmb1KRaaDLBysrlDl2gv9GiyA6ZhURkFt
         G0A5JfZqs+KJqLv4ffeW0PKam/5rvf2j7DWX4csR6A/92w3U/EOMMr6yNwEsCCtyBEyf
         DJWJVUF/D/7efm3knhcaH7VDFITnjyF9FYVyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749306934; x=1749911734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4tjtxP+/IBrctpAyzywqR4l2B+1ykZhwePHwoTOzXc=;
        b=S/Wlxv76ghyuCpL+aDhuPT5jxgEfaXSp71IzDeqXB3M1XMcj0kpSCoB7+C8YeuRkJd
         oP6AlCAjr91hWjgPo/+c+8/O75VtgrgEk5oFptwS2sC/FdSctZcgBFfNUXRMi1M4nWmE
         W6H7pFTvyqayzWWQrACsgT0J693LKFQrf+rP7aN0dUWev3e0EhsVTBI3rlauQdmvUP6d
         IHbuQ0RIayGbCqdXAy1eiG+SwkzYLsi7GcvWJcW8PO1LLAuWZyMFDQ6h4oXXJfPygCR4
         Lvg1TQX+NXxtU1qGSidzcSQCKSEeE6rzfY8dnyjV5kAEDnRiZQWt1Tm7OtSWaNw0SEjc
         pWVg==
X-Gm-Message-State: AOJu0YxilX1HXraevilXdhGvMymSIcEZ14pYvEIGbaQ5625Otj7Q0/hf
	UhH2wdL7VTla80RAVynKKfIKz9jYEUVbNE5y6JKKk22lSFQuG/PEUnCS+ZQwXB1CluaFf1DCrEO
	5w6Y1Ykg=
X-Gm-Gg: ASbGnctQGwRtnm+yrMPX7dBoLyeP/WI+LcMVj2erSyK8bbRsbdz5SrXG8obX/6eo2rG
	gJlijUAxUYYSGZBKrQzpAialLcDHuFIcyTsG/IbGfah3l9N7iJfHa55LW9wezcAfbYUP5uPIEqF
	/ZuVsRQfGIs+7GARYhQvEnLQ7C9ZKHk4e0EwU3Qly3uaz7E23HIyI62YDZwr8jMbZ7Ch4qTUCmE
	dBaUElAS1bcL12F32rK34nriEaAq+OYAnBx3QNCeuB7wRm1tQOqBAHnrlvivX+HbQlJTFsVoCHN
	vMau5nhf32+2Jq/EHblpKYSsXGqhVWWHqlxkD6MqlP+v7U9gSPj7QVnHF41dcz+AJZk0hHGN8J5
	LTn5luWPQ8wfi9b8UNNnCiA2CdYazmz7okQ8Vxjbs
X-Google-Smtp-Source: AGHT+IHarPeFGaNp1ISDIyKKifdC+t7zA5zFPqTyjXr16RF1HF0F3gg59LLFFrJQZ2Nn6tkHdMTZ9w==
X-Received: by 2002:a05:600c:4ed3:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-45201436b3cmr80799065e9.30.1749306934214;
        Sat, 07 Jun 2025 07:35:34 -0700 (PDT)
Received: from localhost.localdomain (80-108-196-96.cable.dynamic.surfer.at. [80.108.196.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521370961csm57862725e9.22.2025.06.07.07.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:35:34 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH 2/3] findutils: use getlimits from findutils
Date: Sat,  7 Jun 2025 16:35:11 +0200
Message-ID: <20250607143512.484259-2-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607143512.484259-1-ecordonnier@snap.com>
References: <20250607143512.484259-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 14:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218197

From: Etienne Cordonnier <ecordonnier@snap.com>

Having findutils depending on coreutils-getlimits makes it harder to replace GNU coreutils with uutils-coreutils
using PREFERRED_PROVIDER.
Also, the findutils repository contains a version of getlimits used for the tests, so there is no need to depend
on coreutils's version of getlimits.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-extended/findutils/findutils/run-ptest | 3 +++
 meta/recipes-extended/findutils/findutils_4.10.0.bb | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/findutils/findutils/run-ptest b/meta/recipes-extended/findutils/findutils/run-ptest
index 3dec117067..0c9af47efd 100644
--- a/meta/recipes-extended/findutils/findutils/run-ptest
+++ b/meta/recipes-extended/findutils/findutils/run-ptest
@@ -5,6 +5,9 @@ ln -s /usr/bin/find /tmp/oldfind
 # make oldfind visible
 export PATH="/tmp:${PATH}"
 
+# Add findutils ptest directory to PATH for getlimits
+export PATH="/usr/lib/findutils/ptest:${PATH}"
+
 export built_programs="find xargs locate updatedb"
 
 # this gets substituted by sed during build
diff --git a/meta/recipes-extended/findutils/findutils_4.10.0.bb b/meta/recipes-extended/findutils/findutils_4.10.0.bb
index 508485bcd3..15dedb3582 100644
--- a/meta/recipes-extended/findutils/findutils_4.10.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.10.0.bb
@@ -15,12 +15,13 @@ CACHED_CONFIGUREVARS += "gl_cv_func_wcwidth_works=yes"
 EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
 
 # need od from coreutils for -t option
-RDEPENDS:${PN}-ptest += "bash sed grep coreutils coreutils-getlimits"
+RDEPENDS:${PN}-ptest += "bash sed grep coreutils"
 
 do_install_ptest:class-target() {
     mkdir -p ${D}${PTEST_PATH}/tests/
     cp ${S}/init.cfg ${D}${PTEST_PATH}
     cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    install -m 755 ${B}/find/getlimits ${D}${PTEST_PATH}/$
 
     # substitute value in run-ptest with actual version
     sed -i -e 's/__run_ptest_version__/${PV}/' ${D}${PTEST_PATH}/run-ptest
-- 
2.43.0


