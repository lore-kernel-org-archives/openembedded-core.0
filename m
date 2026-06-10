Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322FDCD98DA
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33657.1781132128602701282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fA6dvBcS;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490be03d47bso64872405e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132127; x=1781736927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVJit5s6EhxCUmPY+Q0Dac9PN3xhT5WEMxX4SZ/GmmQ=;
        b=fA6dvBcSu3VspeThkhQKxO2ov+ImL2xSOonTc1v5pc/K/5bvQ2baCSa1PJ5XHtnN1k
         epwoTxnb+mHrQJRYdnTAyKrGcimm2Hn84UmO6lfGzatXVzZ07y3SWWte6hLqWd8dFsm6
         wViSjxOfjBTfTbicMoyUaywxUJ4yozw+MlrjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132127; x=1781736927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KVJit5s6EhxCUmPY+Q0Dac9PN3xhT5WEMxX4SZ/GmmQ=;
        b=fu2FF2xsTVaEwLBlYMVzqUR7vScDsnkQjgzPKONutq2rbXmi7IA4J4gweq67M1lL9a
         Osi25VjFZuC1DnU4ioRzNbl85xfoYHs1UHlVpZNDYn6/bQdq0L78gC2Fc+yplbvqpTrJ
         oMTktKgmBmnxDcyBDX56cnpSWTXT+8YgN7SfgrGgdAt/+2D30jGSrdWqib99lGxf2aQM
         aPYK+i6XodZk/XGvaC7oy6zXrrJutz0fOO/HGCp603jUw2FJO+oJNViSgApszrlJN9wv
         Qip5y4s6v3cTHfyNTyHf2abJqmQpYxfhlYbPc3KDJh5yfExCF9xAKPcA1bJqzDiIacVJ
         eaug==
X-Gm-Message-State: AOJu0YyZUSeCpumOYHMLaj1QTH/wm9/aXu5quHtLKFaBgOnvRGBKSAHP
	CTCulcu1GMBdwdot4E15B0pW7D6agw5olL0okWU/HGV4pL9JhSZKY0ql1jbsUJpg88XcGUU/fke
	AVJq4
X-Gm-Gg: Acq92OEq/BIL5o8CEJTO2FjY8COdLv+6BpgTUNbIEdUujBs6db0NpmEPczhIiggPPZb
	7zpxliJ6HC9m5cuW6TSSyaxBBPPsmEjVTr//wu6b0Ia//bInLjKJSLrzp3RY2H54vxXjxwDoUv5
	IO+DrX7AxO3FMLp3kdDW0haQ15Rg7+CR5cVXjta4waGao8acNkb38RbxELNfV+J5IBan051reA4
	U+xxTz+dvEawaFov2T0ZzLVDN/n6Ib0u5sBJkYPyYE/9pnL1NoMRfjbYZ+GhSNeUtaWwCiC3Jzr
	wSOo+tGQVTEhR+s2iU3Cr1PXR8GzSJ4PmX+Gj6H2p6erGQ6bo05AczQabNt0wAbgo7cvyua9+CL
	ilHMl+MwXE4j9Yia7VigoPJNaiUAsEe851ah/QtndxSAIFoUkDjy+dkats62Vj9X9Ohc358+7+d
	9/xQRsLt8nrSESg4BLya0gsT7AaAXqYBnli3w282kSE19HdHzt4MtGBGY8c8IMh5mWCaqj23p1z
	6fRKhWJCUinBougmxZCRjsFoeAt3iDHxJMTj+4=
X-Received: by 2002:a05:600c:4e4b:b0:490:bfda:7d7e with SMTP id 5b1f17b1804b1-490c258999amr439140995e9.3.1781132127007;
        Wed, 10 Jun 2026 15:55:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 19/21] python3: use += instead of :append in SKIPPED_TESTS
Date: Thu, 11 Jun 2026 00:55:10 +0200
Message-ID: <d9b52a2645c648e08479b3b942f544214905456b.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238414

From: Ross Burton <ross.burton@arm.com>

+= is less computationally intensive than :append so use it unless the
semantics of :append are needed.

Also remove the class-target override, this is not required as ptests
are only used in target builds.

(From OE-Core rev: 8ba5db86ac364b85fa6c1ee36fa5a037c0ee818a)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3_3.14.5.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-devtools/python/python3_3.14.5.bb
index 2f821b130f0..501de75fb18 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -271,13 +271,13 @@ SKIPPED_TESTS = " \
 # but not bang completion. test_bang_completion_without_do_shell() passes if
 # building with readline, but we don't want to change the default, so skip the
 # test.
-SKIPPED_TESTS:append = " \
+SKIPPED_TESTS += " \
     --ignore test_bang_completion_without_do_shell \
 "
 
 # Also fails with editline instead of readline. See:
 # https://github.com/python/cpython/issues/123018
-SKIPPED_TESTS:append = " \
+SKIPPED_TESTS += " \
     --ignore test_write_read_limited_history \
 "
 
@@ -294,22 +294,22 @@ SKIPPED_TESTS:append = " \
 # write is seeing the equivalent of:
 #
 # ANY, b"21"
-SKIPPED_TESTS:append = " \
+SKIPPED_TESTS += " \
     --ignore test_cursor_back_write \
 "
 
 # Needs IMAGE_FEATURE += \"tools-sdk\"
-SKIPPED_TESTS:append = " \
+SKIPPED_TESTS += " \
     --ignore test_find_library_with_gcc \
     --ignore test_find_library_with_ld \
 "
 
 # Fails due to differences in CFLAGS as as modified during build
-SKIPPED_TESTS:append = " \
+SKIPPED_TESTS += " \
     --ignore test_sysconfigdata_json \
 "
 
-SKIPPED_TESTS:append:class-target:libc-musl = " \
+SKIPPED_TESTS:append:libc-musl = " \
     -x test__locale \
     -x test_c_locale_coercion \
     -x test_locale \

