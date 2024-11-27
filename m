Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDA9D6D229
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 18:50:42 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.78799.1732733432338358345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 10:50:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KJ4kMRAr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7253bc4d25eso90995b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732733431; x=1733338231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZrENFngfW2X4gynVh5g9yUxj3wwToqsy6RIxHOF/x4=;
        b=KJ4kMRArETwenEZjtrdSC5+TV9NdxCllzH29+5KQxjiCKJPLdONKnMeoG9yluQ6mjz
         LQBiMZ6fdv7EIYP+JbzEVjeOIqhVqk2FJt8klP5F2MvkQbAtjlvSv89GW2i6lAFTyFQ1
         R+MUfEAHUoaYI8ud1BuyCFkdVSKet1k84E4jOHRTOaitdisEH9vzjHARxGJzmDUrBSwH
         oSwbHVo+nfawAL9VkFKalHrvykYOSNHy271RJpAKz1MBP0MHFyeasw+Py4KuZiwJumEF
         1NxdxiSGa237XfNegBpW+VSABIIoCDVbtUsmgaNxsLWaCAZxoshmLTZUV1vxFxA/Xn6r
         R85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733431; x=1733338231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZrENFngfW2X4gynVh5g9yUxj3wwToqsy6RIxHOF/x4=;
        b=Eb5EjRx20woAEnFTFt9NjbVO19d8QUT+tJ8Nr9ApK4Bp8hNoFRieqyocftGraB1egZ
         8ffK/On+FTV5riU5ExV+KxhmpUC7OENXwV4sUWoBWgSYLRhCiuBAXpNBknNMxldqcKK4
         ASStaaC9Plpr2H4cpwI3wZsoKPH8AifDg4RHE391E6rWLPJZXMEAovXAdFhsvI81aAYs
         HN5SHuoeI9i/UN9weEnvVSZUp54UdIAcdWQ2PA2++z8DmHU6H0lyIrNm5yhKzEUTNdUl
         ECZM7OqDdl79F1N7JKH4EhWRpLkL1G0qEGn7pBXVOf38Lun2Gn6A5OtcYaC526O4cpeL
         B54w==
X-Gm-Message-State: AOJu0YzwJiWy0lj4Dwf+vKMkTgU7Q/0SclKajXeop8JggZ6+tGsqCe5n
	yMOHWhDC/g1dlAIYQNtUY6kyfXPlkAjHFMjRhN7ScZdwjp9BL9YKXcFX41b3GiQdiuVu/mHKE5z
	Y
X-Gm-Gg: ASbGnctVGLU116oDEg/k/zZ2SgQdNPBCRhpyFQC2GLgWCo1fnm9TIDFvq3fR6pHPnj0
	3LXS13/+IgAx0ka+Gp5bePLgaH6iPDkA92ZXKPndRVz0mW/6D6WfCfuc2VAQIQ/anNuLsestUHG
	RqzByUmzrzIgVVyeuY5vsjlGS7QGCtd3N1+ZoXmBxe8zAzE42ivos5vhTqlOsTCAhlo0Fn0bFVA
	07PwB6thndcizIZwAfM2Vggdi0ZGbRg+/h2XaM=
X-Google-Smtp-Source: AGHT+IHrkrgtx5NG5hbb4I2syD4huheTvdwHFeWDLKpepBE+sUfByq638CJPSEUJTo9c42Svjzhntg==
X-Received: by 2002:a05:6a00:1782:b0:724:d733:a7ee with SMTP id d2e1a72fcca58-7253f34a2ccmr532327b3a.7.1732733431507;
        Wed, 27 Nov 2024 10:50:31 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72522e0375asm3403519b3a.94.2024.11.27.10.50.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:50:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/14] gstreamer1.0: improve test reliability
Date: Wed, 27 Nov 2024 10:50:07 -0800
Message-Id: <13b13b81b91f618c13cf972067c47bd810de852f.1732733274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732733274.git.steve@sakoman.com>
References: <cover.1732733274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 18:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207956

From: Ross Burton <ross.burton@arm.com>

First, libcheck has the ability to increase all test timeouts by an arbitrary
multiplier. Because we run our tests on loaded build machines,
increase all timeouts by 10x to reduce the chance of load causing failures.

Second, use GST_CHECKS_IGNORE to list test cases that should be skipped.

Drop skip-aggregator-test.patch as this is now redundant, and also skip
gstnetclientclock.c:test_functioning as this is very sensitive to load.

[ YOCTO #14808 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 669d0df81f651f7c033c8cb7872cac5bfe670a4f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gstreamer/gstreamer1.0/run-ptest             | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index 0cfa955f03..7d0312005f 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -1,2 +1,16 @@
-#!/usr/bin/env sh
+#! /bin/sh
+
+# Multiply all timeouts by ten so they're more likely to work
+# on a loaded system.
+export CK_TIMEOUT_MULTIPLIER=5
+
+# Skip some tests that we know are problematic
+export GST_CHECKS_IGNORE=""
+# gstnetclientclock.c:test_functioning is very sensitive to load
+GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,test_functioning"
+
+# aggregator.c:test_infinite_seek_50_src_live is known to be flaky
+# https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/410
+GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,test_infinite_seek_50_src_live"
+
 gnome-desktop-testing-runner gstreamer
-- 
2.34.1


