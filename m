Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2904FC77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 01:24:05 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.6543.1685064239125033217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 18:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=I7AeWes3;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5341737d7aeso170806a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 18:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685064238; x=1687656238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TUPu/w6uRIg5+5NLvS+vHh7Ed4p5MH7w2EBWh7mSRIY=;
        b=I7AeWes3BDZcujZq6+L2paucSi9f8yWWXFn6rSuqXRCcvvAWTYK5DpjYSes54T9fHb
         Tacqp0KqDPFmgUsKqV7YePsRqlAvEbNtglznnWmTThTGyxdjX/yGOfzcoziJ2JZDynWJ
         vBz5zGJUf/TGwTjAMfYnbwVCAClzki92+xjxRmpCVDqdvwBtxdKMTZHanweODaRzE9OF
         NJZkzjFo7hWCaHtJiImDjGX2q8skgaYherxBggdLeQ7u8KWBENFPM8RoonR6uycZ1im6
         KsDGveqKDSODGd/uuA275HnxEYzEW4yfW71WM9pCq+RE+K0gGG90D9jWRFDgvDEMH4Ob
         MSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685064238; x=1687656238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUPu/w6uRIg5+5NLvS+vHh7Ed4p5MH7w2EBWh7mSRIY=;
        b=OMKwARwTcu2G2szTA8bf3u2yDtFIwH5mgtVoRHcjmLQAIyi95CvifyomBo/sAnmK3Q
         b09NwBJRSYqu6TGtAVfMRpMbLfjPB+6ERbuuwO+gHErBvKHD0sEG+XAQUWVAlsDxLcBe
         iD6wHOodH6xVkOrRdNFYRANIvoM4pmvlLByNM+cxNuBdl0982yUj/+Ue//jMhoeyY42N
         UWRDoX4q3bdelK4HR8pELXk5Nij7yVYuY9yY0mRylPV/du8KikO5mdhaxX6moZMAsA5w
         x6Y8Hm9oUlzJMqTsfUuWF3+0NnC3k2HeojuPPPnsl2wr6U79ZXbEqLsCA+xAd5thl/1+
         O5NA==
X-Gm-Message-State: AC+VfDxxjLiRATE/JRzFx88Ukvr2v40U7KrhG2GjPLXnGXa97nhIaxI9
	cOw+BtDmASmj9c2lc6XFxt4dd43BerY=
X-Google-Smtp-Source: ACHHUZ4p0FVYlEBxlLFhzitsJ4h1pwcKKetahY/rx6PAS3qENTRIOuQK7D636KWfl5yFoW9q/I+CLw==
X-Received: by 2002:a17:902:c44c:b0:1ac:6c26:c32f with SMTP id m12-20020a170902c44c00b001ac6c26c32fmr564560plm.46.1685064238177;
        Thu, 25 May 2023 18:23:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id g18-20020a170902869200b001b0034557afsm721159plo.15.2023.05.25.18.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 18:23:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH] perf: Make built-in libtraceevent plugins cohabit with external libtraceevent
Date: Thu, 25 May 2023 18:23:56 -0700
Message-Id: <20230526012356.175746-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 01:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181731

This will package the plugins built by perf into kernel specific dir
under libdir, so it does not conflict with plugins from newly added
libtraceevent recipe

Fixes
do_sdk_depends: The file /usr/lib/traceevent/plugins/plugin_cfg80211.so is installed by both perf and libtraceevent, aborting

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 67b01a7f65a..d31f59f460b 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -137,6 +137,8 @@ PERF_EXTRA_LDFLAGS:mipsarchn64el = "-m elf64ltsmip"
 do_compile() {
 	# Linux kernel build system is expected to do the right thing
 	unset CFLAGS
+	sed -i -e 's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g' ${S}/tools/lib/traceevent/plugins/Makefile
+	sed -i -e 's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g' ${S}/tools/perf/Makefile.config
 	oe_runmake all
 }
 
@@ -364,7 +366,7 @@ RSUGGESTS_SCRIPTING = "${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}
 RSUGGESTS:${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
 
 FILES_SOLIBSDEV = ""
-FILES:${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent ${libdir}/libperf-jvmti.so"
+FILES:${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent* ${libdir}/libperf-jvmti.so"
 FILES:${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
 FILES:${PN}-tests = "${libdir}/perf/perf-core/tests ${libexecdir}/perf-core/tests"
 FILES:${PN}-python = " \
-- 
2.40.1


