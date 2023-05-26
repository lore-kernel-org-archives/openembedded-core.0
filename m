Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCC0C77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 05:26:02 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.2046.1685078758819047067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 22:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=buZ1q1kY;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-64d24136685so373483b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 22:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685078758; x=1687670758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ALLSY3s4yBHh0rByhqTKAlfEYLMHuMaq30KpXvLbLsw=;
        b=buZ1q1kYNPNGPu5H5uZqd8yb6LIPLfVqnpAj8KjpukkKwCiIFtGOJ8koJY8ok4vaRq
         DDs94MJQanNFNE2xV9EywP2PjGnF+yWnnj18iD8fiZwuWQB4P2GC0FM7avmLx0IdDr3P
         rzgTQwHZsnKufwD9J1eKV+prM3HWk1SD6yU6/yWwSQmaAEWeCXu9deM6+8+SLid4Yyxo
         q1rF/L4V7OYWZcPbdmnQG72QmLTfJo3sA2ASY4QYv0LKYfGaJEwf045b2XuBiHxAG4Ni
         YRCYK//5+neRmwAVeRhBMQKcyYNU1RKEZ6Scpl8h9vjD0y4feMMQUYEdhMmtEQ/3z3Ew
         W94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685078758; x=1687670758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALLSY3s4yBHh0rByhqTKAlfEYLMHuMaq30KpXvLbLsw=;
        b=Uf3rA37BLjZwZlDgmGjR2IPY+qGzD0PVb8AKJab3voCJh3QeQViDDsmDBiCGXbYmbe
         sUvfCAq8EhBeAezVE3E2Zc+RS5RT4pwWbtgPJGexROkPtWbG09M6xKriKLSvpl7lGpMS
         Y+pGKEEYH2F2XWvZy56dTYoisQBA2WD3U1CqfvmLd3/NzWphJly8NfyZw0/zQszPjUN9
         emRcCvvWN7DIs3aEfk3CLZSs8rFLB/s1MOMASlQBJVgXMniNlw7+MD98M6+tqB4/K14i
         SgNtl9sdWvXHf9J5qxG3Z0Q5GpdabsopK2o27Q3m/AP2EyRxIn5OMSM+l2BC4lS+CQV/
         Bc2g==
X-Gm-Message-State: AC+VfDyZ6MgpwC73DXEqd8MpD55tVNUEHjY7eV3cSKBdyC1C8a/4piVG
	e6MMb5yy7pEg/HC4NHOyoike2KuRJIU=
X-Google-Smtp-Source: ACHHUZ5CLwzh2uJeHIvSnW7R+P5ltY38IcRijReeo+Z6mVp8u3vMGODtOq9tNXn/NrXFVpFXQ9fHqg==
X-Received: by 2002:a05:6a00:1d0d:b0:64d:2d26:71c with SMTP id a13-20020a056a001d0d00b0064d2d26071cmr5841569pfx.1.1685078757934;
        Thu, 25 May 2023 22:25:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id c19-20020aa78813000000b0064d6b6aac5dsm1961636pfo.73.2023.05.25.22.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 22:25:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH v2] perf: Make built-in libtraceevent plugins cohabit with external libtraceevent
Date: Thu, 25 May 2023 22:25:55 -0700
Message-Id: <20230526052555.381043-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 05:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181759

This will package the plugins built by perf into kernel specific dir
under libdir, so it does not conflict with plugins from newly added
libtraceevent recipe

Fixes
do_sdk_depends: The file /usr/lib/traceevent/plugins/plugin_cfg80211.so is installed by both perf and libtraceevent, aborting

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
---
v2: Check if files exist before sed'ing them

 meta/recipes-kernel/perf/perf.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 67b01a7f65a..2d803381bb4 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -137,6 +137,10 @@ PERF_EXTRA_LDFLAGS:mipsarchn64el = "-m elf64ltsmip"
 do_compile() {
 	# Linux kernel build system is expected to do the right thing
 	unset CFLAGS
+        test -e ${S}/tools/lib/traceevent/plugins/Makefile && \
+            sed -i -e 's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g' ${S}/tools/lib/traceevent/plugins/Makefile
+	test -e ${S}/tools/perf/Makefile.config && \
+            sed -i -e 's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g' ${S}/tools/perf/Makefile.config
 	oe_runmake all
 }
 
@@ -364,7 +368,7 @@ RSUGGESTS_SCRIPTING = "${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}
 RSUGGESTS:${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
 
 FILES_SOLIBSDEV = ""
-FILES:${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent ${libdir}/libperf-jvmti.so"
+FILES:${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent* ${libdir}/libperf-jvmti.so"
 FILES:${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
 FILES:${PN}-tests = "${libdir}/perf/perf-core/tests ${libexecdir}/perf-core/tests"
 FILES:${PN}-python = " \
-- 
2.40.1


