Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BBCC369A2
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 19:26:55 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.7098.1744313205876592733
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 12:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=VWg7ltOo;
 spf=pass (domain: snapchat.com, ip: 209.85.208.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so1916340a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1744313204; x=1744918004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XXJIPIlzkepJ5syNlYdZpvD+DHxI0i/pzuELOeZipk0=;
        b=VWg7ltOoba7o5O8Klw3u1bG5x+qyZUh0xdRkfbYKxAcwqfaruwPYqj1byO52tsvZQv
         470Mk1aJ+/DYCBKVeBCBh8tCBe970pr7vbno297nhu3Q14pLCJhDNIvwdsSj7xxk+baq
         Q2ucAMBTsvrwCW1lhS+fqVPbEVrhNNfN2bOLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744313204; x=1744918004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXJIPIlzkepJ5syNlYdZpvD+DHxI0i/pzuELOeZipk0=;
        b=ia7EU6ZWn+1BzFKwJaUpm1Jbi28wTP6VNCjd8LFqlupr7+PPunt9JQXhUh5MqCA6wB
         O/WnJ0IbBsQRMky5VXvnnDV+G1uHa8C6vQg0dF2O0nItPAGdQRo3isPdtnVjBGNlnrJ6
         cyDTRzqU8s5oGcLo8hF9Ab8Ef1hv6YuhZA9gwjGG7f9BvHOlPTflfAxmJd9b6babnYZc
         lUAhflKLBk8CkX6w8nXTKfPXuuSaa2Nav8Yzy7HpuuYqhC5GLKl3fMVQ2JaeZL/0w37s
         hYXAR+zSNAdg02Jjb5J/KfBzuCFcXUw42HppAn/bMxm2Nmj2I/aHGyO5bPrYwjq9VgUi
         jM2A==
X-Gm-Message-State: AOJu0Yy3d3b/Z6mC3Z5RFpkEbis1VvSitJaopSJJkAIjtRE1z+iJlOzd
	F8A5tavjOVLwbIzJdiVLlkeqHw2+vMYQBlHxQwP4u81TT4QZLyIJDy0xPBANjkQNTt/zx27I1f3
	r6fM=
X-Gm-Gg: ASbGnctVw5q3q12UAO3Wv70tI9T55bdEU3S0hyyaEEdpJ7lpcePn3lBM2d4y6s8nhh0
	I13TuiiyWHoToNHMu3bNETACpPZbYncO8anRt+DkeiTVz+7dDKEiLwIWdiEofiMQ0eNZ7GFw5CZ
	A1xwWNmQQGg/JjONlohDMZWG1VKmAkii5JX+ur319mlee9sXtBBVPXqZ6QrwphhPijet/8m4m5b
	xl3pN8CZJm+aWT4VOWZnMI5RnpzHkCNa0KIu6UCgWbd7O4B5x5N0Evzi78r21vSXTLJj4TuoRMb
	TP7Mbvxs2txQ7Htd6OC/udhtCYz4blgEZTwDjBT2VpmT1YkItuRy3A==
X-Google-Smtp-Source: AGHT+IF4wG9/dwaorvJiA0VQhLKXQu70xMoZsXHM80FqiOoLT7t35k0sH9dndgvxVC2QZow69Al+ww==
X-Received: by 2002:a17:907:2daa:b0:ac6:b811:e65b with SMTP id a640c23a62f3a-acabd21094cmr429122666b.36.1744313203452;
        Thu, 10 Apr 2025 12:26:43 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3508sm318235366b.8.2025.04.10.12.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 12:26:42 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH 1/2] gdb: add source-highlight PACKAGECONFIG option
Date: Thu, 10 Apr 2025 21:26:31 +0200
Message-ID: <20250410192632.2818966-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 19:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214701

From: Etienne Cordonnier <ecordonnier@snap.com>

From gdb documentation:

> There are two ways that highlighting can be done.  First, if
> gdb was linked with the GNU Source Highlight library, then it
> is used.  Otherwise, if gdb was configured with Python
> scripting support, and if the Python Pygments package is available,
> then it will be used.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index c0312f0f05c..474cdf65145 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -38,6 +38,7 @@ PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
 PACKAGECONFIG[tui] = "--enable-tui,--disable-tui,,ncurses-terminfo-base"
 PACKAGECONFIG[xz] = "--with-lzma --with-liblzma-prefix=${STAGING_DIR_HOST},--without-lzma,xz"
 PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils"
+PACKAGECONFIG[source-highlight] = "--enable-source-highlight,--disable-source-highlight,source-highlight"
 
 GDBPROPREFIX = "--program-prefix=''"
 
-- 
2.43.0


