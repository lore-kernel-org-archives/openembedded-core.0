Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3729FEB64DC
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:23 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.1233.1687401374366930203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Zwl1apaK;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-543c692db30so5231220a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401373; x=1689993373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lDhh2bYPWVk1KtpOILPNkfhBy9gDBTR4fuCdpHBvvw=;
        b=Zwl1apaKjkq1fuJ3JX9xkCTPwlWUZOsGDjzcQBymm2NqwIQY95mXk1asuSk1YJJ86N
         oFSZc9dvvTd/ev90DptktYyamykace3+reIfb07mKHZhYdf5dSxDUnItFdglOtHfwqvM
         laRn+qwG6SSQxuPFQqkXe/S1DYXdzHUx9fOonMbKywl2Wo2HulOU/hm/3Q1mhFsiuZ6o
         NmmZJAS6jLNuq2Opmd2gAo/rZcMJBQq6DIYZqbVVb3cMk9R4xpMw4WSYOvt82+cOnYO3
         xvhcQ2ds/jh9AGMDrGpLoikp78zzFOX6+eIwyC57tuqxrWRIQLC7QjrlsfBwRjwiiIuE
         GVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401373; x=1689993373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lDhh2bYPWVk1KtpOILPNkfhBy9gDBTR4fuCdpHBvvw=;
        b=Z+sScywohW7pUfa/UTuACGgDfFK4GZSaq6dsdQd/IqqlkDQ6sBvkMREHIXmcICQUpd
         nK03jHFcb3rUYEl3fNgz77ykCj28mjvRiSp/OXNuwsYTRHgiSODZbiD6loM+Xnkboio6
         pyavFoy4e511szxxf+wACxM6wTIJdwL5sGB2qvHmcRobRONs+/2Q7yROL00c8Nw3L3ZB
         YWLyjttbLeuLPwqy0Afzl8qYfFnFt89Bjz+7IgtQJLJsfm5EUDIMoGj7UWg0ndZAomIy
         RBUdmoGnbTvCs7PnLlcSB0GTvWXNq9f4JRtuz+15ZLrdThtdFIeZQ0jScteeasBJrbps
         udig==
X-Gm-Message-State: AC+VfDx4HFkzDZ71vWsYDGkZLHY1Mv17orc/V2g8T3FRJfc9JBUzfHU8
	OGZ7QVsGUgT77DtI8fiecNAL6ZEKgJj4ZfJ4U8o=
X-Google-Smtp-Source: ACHHUZ51YTy4h5YcIls74H+td8Ssj9AjxBvvPyfkZHcbZES3kqBARtRY59m+pAeWqXZjAgWURUsZow==
X-Received: by 2002:a05:6a20:3caa:b0:121:4f94:654 with SMTP id b42-20020a056a203caa00b001214f940654mr15238352pzj.25.1687401373305;
        Wed, 21 Jun 2023 19:36:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/23] babeltrace2: upgrade 2.0.4 -> 2.0.5
Date: Wed, 21 Jun 2023 16:35:35 -1000
Message-Id: <f520637c1b2593a338754c072045b486f3d154bd.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183203

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * bt2: honor build system compiler/linker preferences
 * Fix: clear_string_field(): set first character to 0
 * Fix: src.ctf.fs: Not resolving event common ctx
 * debug-info: fix -Wenum-int-mismatch problem in copy_field_class_content_internal
 * fix: pass exec-prefix to python bindings install
 * fix: document proper Bison version requirement
 * cli: use return value of g_string_free
 * babeltrace2-query(1): erroneous parameter used in example
 * Fix: tests: print real values in a fixed format
 * Fix: bt2: autodisc: remove thread error while inserting status in map
 * tests: src.ctf.fs: add test for metadata with invalid syntax
 * tests: shorten names of session-rotation trace
 * bt2: ignore -Wredundant-decls warning
 * ctf: fix -Wformat-overflow error in ctf-meta-resolve.cpp
 * ctf-writer: fix -Wformat-overflow errors in resolve.c
 * Fix: src.text.details: use write_uint_prop_value to handle unsigned values in write_int_range
 * Add `dev-requirements.txt` for pip
 * Fix: src.ctf.lttng-live: consider empty metadata packet as retry
 * Fix: ctf: wrongfully requiring CTF metadata signature for every section
 * Fix: src.ctf.lttng-live: session closed before any metadata is received
 * fix: obsolete warnings with autoconf >= 2.71
 * fix: explicitly disable '-Wsuggest-attribute=format'
 * fix: set stable branch in gitreview config
 * Fix: ctf-writer: list of reserved keywords
 * compiler warning cleanup: is_signed_type: compare -1 to 1
 * Update working version to Babeltrace 2.0.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ae47b6c2a4bdee031d42687582049c15614faa6d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{babeltrace2_2.0.4.bb => babeltrace2_2.0.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.4.bb => babeltrace2_2.0.5.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
index 16d8b945a4..6123456c30 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=http
            file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
            "
-SRCREV = "23e8cf4e6fdc1d0b230e964dafac08a57e6228e6"
+SRCREV = "66e76d1ea601705928899138f02730a3a2a3153d"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


