Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C82CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:28 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8235.1778224346980659464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=skz3Og7n;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so1752453f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224345; x=1778829145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3wv9nwsrzZWMPevZgWN8mdOVpQvjpqK+Xw6s6FexR0=;
        b=skz3Og7nm7pfFOJfE3j5iEfXs28bn3xLD1+w/RSOLgElQFMEb2yx/L4KZXQhVHT27Y
         L4k6Llzl0T6LvO37WDkSz0c9QxIFdvYl6OQAMCvVHq1FpxKkludsVKfnfUZfBBfJjrwI
         RdlWdtd3iOB99QNoyteO8QRZslKSXUZoUvqTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224345; x=1778829145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s3wv9nwsrzZWMPevZgWN8mdOVpQvjpqK+Xw6s6FexR0=;
        b=rn3Y6U11OsMOOBGnM2QYZ508yjOM8pmMM/gnkkhFvd1198WOYPpzaDqWYO2ynyB+nO
         QbMEEMmCpytp4U4goDDCv9+qh5yVC+l9u/a072L+WrRu8nsEFE8XDtPcclItXZyRI0iW
         mukCm1hP1T1Ygwzvv5U2q5tcE5cbtYIcCwreuNDNYYh+AYRNRFoxphnGBWr4UkcjH+6H
         rJFl+q+9ZXsc/7ZYdehGf1rWrcrEQRcg047CGsDZrfiIKMrOzJso6bm+lEmnSBf1ZYQl
         rYg23+B6yaUQArpDDBD5PghmO/PPXZ4wdp3LIwQkTwjiu8uPjZJPUuzFAIGSJzSkul+m
         JoWg==
X-Gm-Message-State: AOJu0Yz8tZwevLohK7uGnRJJUfBCoH1WA36zR1nlJL6dhVxbnbalJagB
	pfvVzyydFaotY0ZodHzwB6kexw01gLygeIZXVz2jdAf/nzMJOobW6Q8n7dkgZbOpBgy65+BVhLn
	OuPBgtp8=
X-Gm-Gg: Acq92OHDT6ur2F09TO+5OqyHIcMMa/3R4wZsGfZ9V2xn3N+eE6robnEuJk9w9uLS0uB
	e7YBKmuQf/FK0xTbgiLb7nTK3h1OTh6f95j3211S+67JpIXpHUu+K58nn4hp6ldqhuv23Tv0qFt
	GwHfQ/aYJ4ckRanIunn/b8Dd+5pf1sNsxMz3A001XmXDoZn8lm8D//wmykpLJ5D6BEL4+LrHdWZ
	mmkyUz3gICobxHk+yeolUfGDYtYMBYjENLlkt4Pcd4HQ8C5Wkbl8wBLFPXtQDAZ8VfYmRctx7BL
	DQ4ZxutzDdil7J6CFST9ZuHnMWb7eyLUTaYGevnmCrWhVbI+ICGP7UfdE6o3GGoiIiO5gR15cxu
	cu3hRmYsEl5x0e8kZx5vbe7yeQIWPPWjSXX1ZuVpZEZNnapGxwJ3tUwe4HormD4lb8SZl3UdlPB
	YEE1oiiktKgDZv7O7nMy67Vb18g8M8se86mdaJIzWwro//q+C3yWPY/5f18Nk+bcJ0o8m/ujUyB
	jy4GaOtToibX5e5tXsxcqyyIHvSZOn0jxZO+g==
X-Received: by 2002:adf:fa0c:0:b0:451:b3ca:674f with SMTP id ffacd0b85a97d-452e78b3e99mr7315998f8f.1.1778224344747;
        Fri, 08 May 2026 00:12:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/52] ccache: upgrade 4.13.2 -> 4.13.3
Date: Fri,  8 May 2026 09:11:13 +0200
Message-ID: <ac33aa04e24d80516bb42aca7b9683ebe8b6fbdb.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236662

From: Wang Mingyu <wangmy@fujitsu.com>

Release notes: https://ccache.dev/releasenotes.html#_ccache_4_13_3

> Ccache 4.13.3
> Release date: 2026-04-12
>
> New deliverables
>
>     Added glibc binary release for Linux riscv64.
>     [contributed by Ludovic Henry]
>
> Bug fixes and improvements
>
>     Fixed handling of empty responses from remote storage backends: a
>     response with an empty body is now treated as a storage error rather
>     than a cache miss.
>     [contributed by Björn Svensson]
>
>     Fixed PCH invalidation when the MSVC toolset is updated.
>     [contributed by Philipp Kolberg]
>
>     Fixed base_dir path rewriting when using MSVC’s /Yc option: paths
>     are no longer rewritten to relative when creating a precompiled header,
>     since MSVC then does not like relative paths for the /Yc and /FI
>     arguments.
>     [contributed by Joel Rosdahl]
>
>     Fixed handling of a directory-less path to the MSVC /FI option.
>     [contributed by Joel Rosdahl]
>
>     Added support for -fsanitize-ignorelist (which replaced
>     -fsanitize-blacklist in Clang 13).
>     [contributed by Joel Rosdahl]
>
>     Fixed detection of type for compiler with . in the name (e.g.
>     hppa2.0-unknown-linux-gnu-gcc).
>     [contributed by Joel Rosdahl]
>
>     Fixed install.sh to correctly use sysconfdir and other configuration
>     variables from the Makefile.
>     [contributed by Joel Rosdahl]
>
> Build improvements
>
>     Changed cmake/FindCppHttplib.cmake to use settings from the system’s
>     CMake config if available, supporting systems where cpp-httplib is not
>     provided as a header-only library.
>     [contributed by Jiri Slaby]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 30f9f7aa9e3e3fad9d755f71d54263f3753f63c3)
[YC: Added changelog]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ccache/{ccache_4.13.2.bb => ccache_4.13.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.13.2.bb => ccache_4.13.3.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.13.2.bb b/meta/recipes-devtools/ccache/ccache_4.13.3.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.13.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.13.3.bb
index 9fe82f5ee0e..ec440900f64 100644
--- a/meta/recipes-devtools/ccache/ccache_4.13.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.13.3.bb
@@ -16,7 +16,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "e87efda8ae54f94b1cb0e8dbfdf26397bd7d0a9c0c4f38b18dde73f4ec9ac721"
+SRC_URI[sha256sum] = "c149d71f47f6fe08e4f2e43db4b0b091c61e8ea3daa23aa998b094bd84ecdfe8"
 
 inherit cmake github-releases
 

