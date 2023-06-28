Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3075EB64DC
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:17 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.17364.1687961591949717053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=VN4B9YqU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b7f2239bfdso36610135ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961591; x=1690553591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CclzGX0dvdFc9MEpSOU9PmBwTw4mnPhvoHoARqwPQe8=;
        b=VN4B9YqU8CkcRMLNsoFSHJvSlc/Fr6FKxevDg90o59LF7CPKa85rK5n7cAUHTC3Mis
         ISzCO6F3SLhGg6gzdTwTg7Z1D64RNSxGtFVln/CzQ4Ny1t8aKW1bxSE9LDUOTy6Ae7ZX
         /xEy2+qE6KpeY+kCSg2jKUH2AxHYdER1Sr8UP+9xQD/ILNXDQH4K+z9wMgmrcLkJqxUu
         QiIZRtROmZaFvuINmyQtYo3Phw66ZnNtWlO5cssORLtEcooSfU7V8HpGMkC8X5UJ2e0h
         CrDhZkz5cIG3M2oTJvY14/svMaSHJnIrOh+TCjTGjh6afB6WglcC0v2ETFgjZmTxrxlJ
         sXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961591; x=1690553591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CclzGX0dvdFc9MEpSOU9PmBwTw4mnPhvoHoARqwPQe8=;
        b=Ows4xSseUkdpEoXAOjIeEkLQIGGgG+ol34dJjGpiuRUdGBn0rlJV2T2xnHp3p6QTqt
         LyYk6ysee4SHwFy5k8R3rGcL65kFbyjB+9/yAI5GZ9HQAVXWLlfsUvnYZ00N9n/O8zGf
         pyfNqYySyKqUHqxNs+rNIHAPBt9gamWRg8JmhwIGV+VJ0RfWpdFzSbrbvfEYyn1seuCR
         ZJgFolvRMyjtIcEsmdWaEV1OgUR9TNtGBy/s/E6hB0oWq7jigCDSQyYYD311+mZfA8cl
         0wLjAlBaeBLVobLX8yDZJ8YhACKAdGT+bNrfJBjuQegwfC/QIii2VFexkDNWH7CIztvq
         pSmQ==
X-Gm-Message-State: AC+VfDwMqMgnAc0AsES62TQTomT1542gTD827tHP92PXt9MwoHJYO36U
	maU6WgiTwgB7j2AG5pUWje5dU7GjjQLgC99hS15OAQ==
X-Google-Smtp-Source: ACHHUZ5PGVlLRM/ev7aFHAqwjEcmSGW8cbSjDKQ9vrRYTzmdjK0FmqLpmLQlYQ1EKCiOJhDh7S4faQ==
X-Received: by 2002:a17:903:32c9:b0:1b0:f8:9b2d with SMTP id i9-20020a17090332c900b001b000f89b2dmr16177730plr.29.1687961591003;
        Wed, 28 Jun 2023 07:13:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/29] babeltrace2: upgrade 2.0.4 -> 2.0.5
Date: Wed, 28 Jun 2023 04:12:31 -1000
Message-Id: <56121b2378899b928bec3a4eb8abe487789aff17.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183561

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
index b48f07ea0d..146fe0b835 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0 \
            file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
            "
-SRCREV = "23e8cf4e6fdc1d0b230e964dafac08a57e6228e6"
+SRCREV = "66e76d1ea601705928899138f02730a3a2a3153d"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


