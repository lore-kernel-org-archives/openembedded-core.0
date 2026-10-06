Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF954CA5FFC
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:28 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5172.1791319468155845667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ybsfANV+;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-486e70f2457so1520746f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319466; x=1791924266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NClo3ZxwUhRh72JWEe/3HSd4Nsp5zNodkUT05ok58Nc=;
        b=ybsfANV+vT8tFaoOuSxuiV7m+YgZKT0pcDqBU1wuFsyvmA3G4tuEOk6KEUAxFHCtE5
         e3nyChLVHy5dhA/SF7BFoojvUCb8SKJyXYGjMsk0ZlM7PDSPM0aR3PqWODeBaGYozFcL
         oRTpC8G9xT06cpqRjBdWehDLQisCx7mpKwkDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319466; x=1791924266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NClo3ZxwUhRh72JWEe/3HSd4Nsp5zNodkUT05ok58Nc=;
        b=W4Ealu93mg8vkeN3WTZB4FFU70m1d3oA9zL/igneWzi+Sn9JZ/hOn7M1AXSgbPpJLF
         tdM10SecjGMpMAf/kB7N8L2L6k/Cb0k6JqQ47V8TFINe+/zTMvaij/I3TKH2N/wSqH/d
         SEZ/i/JJP5KAs5eu/LOPIgRVfarqmxh23c8rZHqVs3g0JO9VLj3Q0lNuvf0KrVoWK6m+
         Ueyo1Zgz/gYO9euyvCkUxLpimYP7hivHoo0hlZaOtJPNkfEfwiXLMXqm6YZPsBwglW3m
         u7AGAve1UVw6kaSpg19tcn8/AuE72DFePWdGdGapDCUJOJPqf98rPn7jlIxnd/x3FyN+
         A8YQ==
X-Gm-Message-State: AFq9FYLz86RAPW3huLsemwxigljaO5NR+zg6uYH9cF/xiypdbRb0U++j
	8idxAw3m7cfbKjt4l5U6XmrA8KNwaPp/6X3Ihiy6zJGhaw+RBUWSv8EkP8k6ruICZRAkwkFqRSS
	cENTcrGE=
X-Gm-Gg: AYBFou0mXgfMumT6vQvg3j5fKICFA/Hf11AIl7QsZNz4HROAsbsAsEmO62BfjkP+EYN
	b1j8Z+T7xyJw9QenJUWoi/gMGUqkSqe9TKQLrroutNJd9Iogl+Sk+4fb5R38SLJU/4qvMMUrf9u
	GmJ5dbsR2Yp95OTwVcLjIxM97A6AUk6a9v4oqTj1op8+fBtkYIkzK9vAZtj3/npyi23Yc01xqkB
	dzLpiM8Pr/KI686OlzNGw3ioZ56tDRpEEZpYUfg1NhiW1SGFcNuzi4aBXRVPf24q9Eqj/Dt/zov
	zWDEHm9eITXH6ZmTS3+Vqqh5nZg0xQD4WLJ/bxc3t1/414prenvHOKHfSWsMvGW7Yuz+iYwxAkE
	UOGUiKNmS0rsimMZlqojA2bOx29ghFc6H4w0j7DIGmM7FRVWjFP3FrcOfpW9liRBtJ2cLL7A2QS
	NmQ3pkj8/XpjMZaSkrmraIgnMhlCoZoxYY7VzfWUefLsHePV4/LVlDvfiub6QBCq/TDtWyxcGeb
	xJvvgQMno999OLCbzIxiqWPuyWZNNpIvz3jwF0DhFMJdlwhLHSMcfizYzq2ZsZJzjg=
X-Received: by 2002:a05:6000:24c6:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-48c7288ae96mr978457f8f.25.1791319466353;
        Tue, 06 Oct 2026 13:44:26 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 06/18] libpcre2: upgrade 10.48 -> 10.49
Date: Tue,  6 Oct 2026 22:43:41 +0200
Message-ID: <1c45d0aa0a527d85220404f1adb11823d9b6986e.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247343

From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Version 10.49 28-September-2026
-------------------------------

This is a security-only release, to address GHSA-r9hj-j2rw-4q3m.

Compared to 10.48, this release has only a minimal code change to prevent an
out-of-bounds write with arbitrary data. An attacker-controlled regex pattern
is required, and applications are only affected if using the
pcre2_jit_stack_create() and pcre2_jit_stack_assign() APIs to provide a growable
JIT stack, and then matching against a pattern with unusually high JIT stack
usage, such as a large number of capturing groups.

The implications of an out-of-bounds write could include arbitrary code
execution.

The issue is not a regression and affects releases 10.48 and earlier.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fd7f3e10c98a1dc75473efae8ab14ea5bcfb1819)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: See: https://github.com/PCRE2Project/pcre2/compare/pcre2-10.48...pcre2-10.49 ]
---
 .../libpcre/{libpcre2_10.48.bb => libpcre2_10.49.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.48.bb => libpcre2_10.49.bb} (96%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.48.bb b/meta/recipes-support/libpcre/libpcre2_10.49.bb
similarity index 96%
rename from meta/recipes-support/libpcre/libpcre2_10.48.bb
rename to meta/recipes-support/libpcre/libpcre2_10.49.bb
index 56791171c23..5fa7c3db3b4 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.48.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.49.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b5146491d12003f2c8ed"
+SRC_URI[sha256sum] = "53c156e1ba416a20da8e65395daa132da0d80e76910424caca3fcdae7831d384"
 
 CVE_PRODUCT = "pcre2"
 

