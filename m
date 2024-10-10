Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557DFCFC5F2
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 18:44:32 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.51926.1728585871334457155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 11:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0clbAs6Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71e1a715c72so991787b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 11:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728585870; x=1729190670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jlcKjpkREp5tkr9zu4u+ry/iaOrf5+S/rF+ymEbeAOw=;
        b=0clbAs6Y07EUbQo7Pmv7tY+c+bpBVGhlADMH5O+Ph6sPMTusACfbjrFlBHFIN9aywn
         YvrzmqCzhQ2149kuo+41flmWSe2l8rQ7A0UyYvT1YR2ble/hWD/wsjq6KNtbIxiazwih
         4G8FxycfQn6NGyFyQ2oG/8Yj2QmxGcIORVCTE6NCb/nEDh0bJPddbzxtfQqBJ9KSu4J9
         abJiqh9uIkkwzpK+fl2LZGlyYXttzLZH/viy60sPTB0KidTrp14oVW0/Sdx8A4BTn0Ji
         2Fk6U6yCYEChx5gT99LustWj7heAFfKA8s2uKwhlNXMRFgcdxSM6NI+7ttL1zu94kPej
         EJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728585870; x=1729190670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlcKjpkREp5tkr9zu4u+ry/iaOrf5+S/rF+ymEbeAOw=;
        b=EYixKl5MGSSXyvDuwHZWQk67V2HLtyOdUHKFB40VzJsjCfpvEF1/Eot11IOucjiLi2
         1bAVk92rCSqED6xhk/x3xSluXOhdnBKGk70N3OKzgVu7uEy1PhW/cVrzVuaVPBYf8pR+
         hxgTlI3JrbIZhQMwQWqycyqQTbpjEHiCQ5vLrP0/pNGq6/lt0L2u+7uVGeJ870huT7Px
         9tgZDd/Ofqie7xNES27pEZMiCZ0ZV+0zdVJQM7XDuKm5wFV89x4Deg/j4SfaeEcfFG/G
         ZppQtii7nKPRNmtj1oi8/Pp4sJGqr1WvC860RUTQnEAGlQQybV4eqj1P3Hh9cvoJzr6T
         4rsg==
X-Gm-Message-State: AOJu0YzIIPBOTBQ3s/rP5MNmxon3asHagjVEhMNhefkYKmRklwP4cGgv
	lhBPdpoZioE8lkx+HuHFmtGIDySEPKwZ0IZoqIIGb/NSYlRtGSajUjqoz/E4CLrMF0QBIqQQOR7
	M
X-Google-Smtp-Source: AGHT+IEEL2dEaqocL3HUOBlcKNUU9duOfNB8CmqSs4g7rBfn2XPcQMhxq+AyxV2ojRU3moYd4wuVBw==
X-Received: by 2002:a05:6a00:1749:b0:717:945e:effd with SMTP id d2e1a72fcca58-71e37e278c8mr32598b3a.1.1728585870415;
        Thu, 10 Oct 2024 11:44:30 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2aa9390dsm1331454b3a.129.2024.10.10.11.44.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:44:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/2] valgrind: disable avx_estimate_insn.vgtest
Date: Thu, 10 Oct 2024 11:44:20 -0700
Message-Id: <9269edb63d3c68de62326f5960ffff0c1068e709.1728585736.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728585736.git.steve@sakoman.com>
References: <cover.1728585736.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 18:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205424

This test fails consistently on the new valkyrie autobuilder cluster

The estimate instructions (rcpss, rcpps, rsqrtps, rsqrtss) are, as the
name suggests, not expected to give a fully accurate result. They may
produce slighly different results on different CPU families because
their results are not defined by the IEEE standard.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.18.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
index 0c297ad6b9..2a1bf19da5 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
@@ -237,6 +237,14 @@ do_install_ptest() {
     # This is known failure see https://bugs.kde.org/show_bug.cgi?id=435732
     rm ${D}${PTEST_PATH}/memcheck/tests/leak_cpp_interior.vgtest
 
+    # This test fails consistently on the new valkyrie autobuilder cluster
+    # It tests the avx estimate instructions
+    # The estimate instructions (rcpss, rcpps, rsqrtps, rsqrtss) are, as the
+    # name suggests, not expected to give a fully accurate result. They may
+    # produce slighly different results on different CPU families because
+    # their results are not defined by the IEEE standard
+    rm ${D}${PTEST_PATH}/none/tests/amd64/avx_estimate_insn.vgtest
+
     # As the binary isn't stripped or debug-splitted, the source file isn't fetched
     # via dwarfsrcfiles either, so it needs to be installed manually.
     mkdir -p ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/${BP}/none/tests/
-- 
2.34.1


