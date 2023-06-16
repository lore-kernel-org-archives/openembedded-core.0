Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA1FEB64D8
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:58 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.233.1686926269764836552
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Ft4gkkXl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b539102474so2434785ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926269; x=1689518269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXw4G5Cg1E0l/2MMjvT3rmPUmFnOaYU5Ik/NerOp+MM=;
        b=Ft4gkkXlyWH0j9i1vHuLvJZ073GjfXBBBWqIpV9xh2dSdv1NlJ2R5OQlBimac+CH5M
         ndeDPgCnlpIRwySdh+tv5MemWDhFaaglLghcPBaccF0s7ux8YFTdY7nIQo7HrIaJL7Cm
         ok3XPcTCNu6Q9z5T2BAVWH6pD1mdhonmXf91JTNyIHw7O4HX32m3/TArPl8vndogaR/V
         3ld5a5LVDja1atLZEoeC/P1QRw9Ymb+tdaVA9oNooZTMoucxT7EgyFNW37NeZ2GqBEen
         2OscDHV75/HCfEodVdiN4vvjb1de/0yiLRMrcLQb+YG/W9zN0sNQhiIvbHVAePOT1HYE
         0uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926269; x=1689518269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXw4G5Cg1E0l/2MMjvT3rmPUmFnOaYU5Ik/NerOp+MM=;
        b=OHIpejRQbogEoD1mwDjXKmKJoR3bXr4m68GBX5wUN/qsgOw7Tffod5P9WfZwyYSl/t
         xyoPFLu8pokjj7f1T4PzlqMl0op93A5QqMiPFoaFaEggA5Kzgn7alg98f5RLFayP9ynU
         m6jrIiy7dVASjsvShvthxw1hEit7Nf/RRjdYhRQB/selirN6ORXCyiyi88nnbFk9YpbA
         sZetdxfCDcFIJWaSZMaRJNi0oOQKVo4zi4REP4RRJQe/mJbRKqe25EEEtMmz7r1iK+3W
         FeDFzSCNU1wyM9xu0e0jDWuVdR/MGGEAGZ9HLRzAEcEBqXfPy01azCUnp7RFvcsgGrIg
         W1+A==
X-Gm-Message-State: AC+VfDx0+2jKwaEBmy3RW1rJN3VW5h1/PiyqzsTN956FHqHeCb5IiOIq
	f44q1nXjuRX/2xgsJxH0l/6+PDImsfeRfLxfjJA=
X-Google-Smtp-Source: ACHHUZ4JnCLllF6pEknDx8oGVxtVUv6pxE3azesPK915kyFDawgSwaR8NX6ZhPkQGNfkkuFxXMk9qg==
X-Received: by 2002:a17:902:650e:b0:1b0:74f5:bf10 with SMTP id b14-20020a170902650e00b001b074f5bf10mr1674810plk.65.1686926268762;
        Fri, 16 Jun 2023 07:37:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/24] perf: Make built-in libtraceevent plugins cohabit with external libtraceevent
Date: Fri, 16 Jun 2023 04:37:07 -1000
Message-Id: <68733d5467134370f036480b0cc11e6b97efe4ad.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183037

From: Khem Raj <raj.khem@gmail.com>

This will package the plugins built by perf into kernel specific dir
under libdir, so it does not conflict with plugins from newly added
libtraceevent recipe

Fixes
do_sdk_depends: The file /usr/lib/traceevent/plugins/plugin_cfg80211.so is installed by both perf and libtraceevent, aborting

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 28f39769c27d257a60ff0152acc0c76f0276fa6a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index e41fcc4798..420286e1ab 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -135,6 +135,10 @@ PERF_EXTRA_LDFLAGS:mipsarchn64el = "-m elf64ltsmip"
 do_compile() {
 	# Linux kernel build system is expected to do the right thing
 	unset CFLAGS
+        test -e ${S}/tools/lib/traceevent/plugins/Makefile && \
+            sed -i -e 's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g' ${S}/tools/lib/traceevent/plugins/Makefile
+	test -e ${S}/tools/perf/Makefile.config && \
+            sed -i -e 's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g' ${S}/tools/perf/Makefile.config
 	oe_runmake all
 }
 
@@ -361,7 +365,7 @@ RSUGGESTS_SCRIPTING = "${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}
 RSUGGESTS:${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
 
 FILES_SOLIBSDEV = ""
-FILES:${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent ${libdir}/libperf-jvmti.so"
+FILES:${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent* ${libdir}/libperf-jvmti.so"
 FILES:${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
 FILES:${PN}-tests = "${libdir}/perf/perf-core/tests ${libexecdir}/perf-core/tests"
 FILES:${PN}-python = " \
-- 
2.34.1


