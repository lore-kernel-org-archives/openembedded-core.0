Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF74DE7F13C
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 21:43:39 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.3550.1695764616775121808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 14:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=M5Buxi2Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c5bf7871dcso76080275ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695764616; x=1696369416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVycdgI/7LcVGM16kwbUq+D+xh7kwnj+qSIhl5H8p+c=;
        b=M5Buxi2Z1B6D1NCXiNJH9Ode5zl2tP45fAb6qaRX+Q2/tSJMtzNKFhqwW/W5o1Fj8f
         V+kMaVLzGO3nQZFpmvRqTYa3QHXo96vZutrEJ3m/AtWUtZr0eZwUfq1cEJALN12rAnoB
         SqlYUSwzENQiM56YBXqYqaOtZu2yiQOW8xkrmPWJHXh2AsceSGwcDPoaVPM+p4kese3L
         iBunRiCOncwxH7cYsjESCVMz0NOGI1lqwfsV5L4+JdYcgwcbHvvnLpXAQo6bbSaeKn9S
         WDuPTbXqvrz9mNB6Sz1qXyu61acra4Uemi/2aH8h+gDRKkMhNrsAnd01lc5pNUcje6Nj
         93Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695764616; x=1696369416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVycdgI/7LcVGM16kwbUq+D+xh7kwnj+qSIhl5H8p+c=;
        b=aR3Q13vlbbhNXbXW8dEWrvtsjGi3+PPxLUVGyUYWfgopXJW9Cw1DdOtQmjYcOEfL1y
         gj5B1bdaebwwb3o3vy2BHieL1e/6gau2pRuE3zQs3zaHfd5r5+sgENMh9VelQq/fvW64
         HuoWn73VvtlWM4Qd6fs+bSCQIprFWKtplnIkBYQly91RvNa5UE+iiSb568qK+F3A4O9j
         +pMOoOw8wE6SOon068W400jAZsbhMiuTfoUTA9YhrBUzZANHBosNJ/czBi9xmr50oNxK
         KqXYL8Q0sC8bAD6UxyDy3/AsmQitlT7xLcess1FoAYxALeRcD2J3eLUyXGVbKK21qVB5
         ZvtA==
X-Gm-Message-State: AOJu0YxDejVoGDtVF5jqJlu2IkBeS5r1Uy+J6H2s7K/SfMuNbXmr+Fo6
	06Ys98QB4R0l8LtcneJKx7e8n8pWrNflN1knkpE=
X-Google-Smtp-Source: AGHT+IEWnF0qkuBexwK9JsJccU/qmKKOEH/rYIebRipMVp6Pf551lfJXGyoH+HhEob+CFswZYBjTXQ==
X-Received: by 2002:a17:902:b949:b0:1c4:4c0f:8d91 with SMTP id h9-20020a170902b94900b001c44c0f8d91mr7552416pls.69.1695764615927;
        Tue, 26 Sep 2023 14:43:35 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001b5247cac3dsm11487713pli.110.2023.09.26.14.43.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 14:43:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/10] bind: update to 9.18.19
Date: Tue, 26 Sep 2023 11:43:15 -1000
Message-Id: <663397edba278184a736e97aa602d3f96d2d937a.1695764457.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695764457.git.steve@sakoman.com>
References: <cover.1695764457.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 21:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188274

From: Lee Chee Yang <chee.yang.lee@intel.com>

release notes:
https://downloads.isc.org/isc/bind9/9.18.19/doc/arm/html/notes.html#notes-for-bind-9-18-19

Security Fixes

Previously, sending a specially crafted message over the control channel
could cause the packet-parsing code to run out of available stack
memory, causing named to terminate unexpectedly. This has been fixed.
(CVE-2023-3341)

ISC would like to thank Eric Sesterhenn from X41 D-Sec GmbH for bringing
this vulnerability to our attention. [GL #4152]

A flaw in the networking code handling DNS-over-TLS queries could cause
named to terminate unexpectedly due to an assertion failure under
significant DNS-over-TLS query load. This has been fixed.
(CVE-2023-4236)

ISC would like to thank Robert Story from USC/ISI Root Server Operations
for bringing this vulnerability to our attention. [GL #4242]

Removed Features

The dnssec-must-be-secure option has been deprecated and will be removed
in a future release. [GL #4263]

Feature Changes

If the server command is specified, nsupdate now honors the nsupdate -v
option for SOA queries by sending both the UPDATE request and the
initial query over TCP. [GL #1181]

Bug Fixes

The value of the If-Modified-Since header in the statistics channel was
not being correctly validated for its length, potentially allowing an
authorized user to trigger a buffer overflow. Ensuring the statistics
channel is configured correctly to grant access exclusively to
authorized users is essential (see the statistics-channels block
definition and usage section). [GL #4124]

This issue was reported independently by Eric Sesterhenn of X41 D-Sec
GmbH and Cameron Whitehead.

The Content-Length header in the statistics channel was lacking proper
bounds checking. A negative or excessively large value could potentially
trigger an integer overflow and result in an assertion failure. [GL

This issue was reported by Eric Sesterhenn of X41 D-Sec GmbH.

Several memory leaks caused by not clearing the OpenSSL error stack were
fixed. [GL #4159]

This issue was reported by Eric Sesterhenn of X41 D-Sec GmbH.

The introduction of krb5-subdomain-self-rhs and ms-subdomain-self-rhs
UPDATE policies accidentally caused named to return SERVFAIL responses
to deletion requests for non-existent PTR and SRV records. This has been
fixed. [GL #4280]

The stale-refresh-time feature was mistakenly disabled when the server
cache was flushed by rndc flush. This has been fixed. [GL #4278]

BIND’s memory consumption has been improved by implementing dedicated
jemalloc memory arenas for sending buffers. This optimization ensures
that memory usage is more efficient and better manages the return of
memory pages to the operating system. [GL #4038]

Previously, partial writes in the TLS DNS code were not accounted for
correctly, which could have led to DNS message corruption. This has been
fixed. [GL #4255]

Known Issues

There are no new known issues with this release. See above for a list of
all known issues affecting this BIND 9 branch.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.18.18.bb => bind_9.18.19.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.18.bb => bind_9.18.19.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.18.bb b/meta/recipes-connectivity/bind/bind_9.18.19.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.18.bb
rename to meta/recipes-connectivity/bind/bind_9.18.19.bb
index b9579ab52a..6936c1c6ad 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.18.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.19.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "d735cdc127a6c5709bde475b5bf16fa2133f36fdba202f7c3c37d134e5192160"
+SRC_URI[sha256sum] = "115e09c05439bebade1d272eda08fa88eb3b60129edef690588c87a4d27612cc"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


