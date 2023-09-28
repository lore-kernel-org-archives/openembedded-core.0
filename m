Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31E3CE7AF2
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 02:49:18 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.6182.1695869357760131424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 19:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x75yiyG8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-690fe10b6a4so11085326b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695869357; x=1696474157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JV/yMsyzEaAAriZMoutQjXaCdgsdLXE6H57pD57XjyI=;
        b=x75yiyG8jnYtgSpRLmzWFH2H/aKEM8XfBG0BOyqVih3ExFyDHLPzotyHQhSdW9FNvV
         rZ+W4KkuTRV8rynfYOXQbF25Dk+XpvxngGvtb8FeegKAYKn6hyLzvTeRfnXDpUsVQawj
         3axGoVW4p60TllKHvCKizlpNDb4UafCI5QH4vSmDrcBI4yuub9lv/6tVbKYFkjkSahm2
         lYveIxR0eV6PG+IrunFDOpBZsdocimGhfAPIgQl5KvswukSUJV+ftWHPZaPaBXz0zeBf
         ShIVPXmSvBeRqr7RvHK/n+7fK7crIouQJf82LS7GfI0nV4v0X11nlMDa1AJ/KoNTF2AR
         X2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695869357; x=1696474157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JV/yMsyzEaAAriZMoutQjXaCdgsdLXE6H57pD57XjyI=;
        b=SP42xKUC2M0cX3iKvAYo6eLVdv7TMH/HjN+4tRVC1IMhS3vREYPOSjTSuIlK8thWEs
         9i9uXy59+kR1k7llnC9ZF2zD1a0lP/M8hzDKygJUvrR85U41WwddlfpyTvy8TR2hQDfs
         GVggRIcvFUM7WD23SF7EJ+Pt1YgaWekIJ9ntz+EpOER+SuVN1jEuO+DkaxvbZwV0XT/o
         zPRisTK4WVlc7FScZC3N5kpz+yPLB+gyKGE/RUywXLEkAwzzzDiKZAA2QxBo59tSHc22
         /yq+X8IcgshKLYdsF9BKsRbP3XUOX63INOdHD3BPJWxARzqX3KCOyRs/QFuFXrgJKm4z
         98Kg==
X-Gm-Message-State: AOJu0Yxou244Q74QbA7n76g4t5p2uWs8O+iNdKmzArh8Pb1cAMMrQOAx
	sbhL8j+Tky5IbG6iS/pw009a2ZtYT2K2FVB/ZCg=
X-Google-Smtp-Source: AGHT+IGjRff/b+3WZrV9i0VWEblormHyxrk7zQQcvUmv3hPL54CypgW8CC5wmziBFLQKR3glTxhllA==
X-Received: by 2002:a05:6a00:244d:b0:68f:f741:57a1 with SMTP id d13-20020a056a00244d00b0068ff74157a1mr4197283pfj.7.1695869356759;
        Wed, 27 Sep 2023 19:49:16 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0068e12e6954csm1850214pfo.36.2023.09.27.19.49.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 19:49:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/17] bind: update to 9.18.19
Date: Wed, 27 Sep 2023 16:48:44 -1000
Message-Id: <b88fe4581a48c1639764266380921d452a9b6132.1695869144.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695869144.git.steve@sakoman.com>
References: <cover.1695869144.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 02:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188365

From: Lee Chee Yang <chee.yang.lee@intel.com>

Notes for BIND 9.18.19
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

Notes for BIND 9.18.18
Feature Changes
When a primary server for a zone responds to an SOA query, but the
subsequent TCP connection required to transfer the zone is refused, that
server is marked as temporarily unreachable. This now also happens if
the TCP connection attempt times out, preventing too many zones from
queuing up on an unreachable server and allowing the refresh process to
move on to the next configured primary more quickly. [GL #4215]

The dialup and heartbeat-interval options have been deprecated and will
be removed in a future BIND 9 release. [GL #3700]

Bug Fixes
Processing already-queued queries received over TCP could cause an
assertion failure, when the server was reconfigured at the same time or
the cache was being flushed. This has been fixed. [GL #4200]

Setting dnssec-policy to insecure prevented zones containing resource
records with a TTL value larger than 86400 seconds (1 day) from being
loaded. This has been fixed by ignoring the TTL values in the zone and
using a value of 604800 seconds (1 week) as the maximum zone TTL in key
rollover timing calculations. [GL #4032]

Known Issues
There are no new known issues with this release. See above for a list of
all known issues affecting this BIND 9 branch.

Link to release notes:
https://bind9.readthedocs.io/en/v9.18.19/notes.html#notes-for-bind-9-18-19

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/bind9     | 0
 .../recipes-connectivity/bind/{bind-9.18.17 => bind}/conf.patch | 0
 .../bind/{bind-9.18.17 => bind}/generate-rndc-key.sh            | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../{bind-9.18.17 => bind}/make-etc-initd-bind-stop-work.patch  | 0
 .../bind/{bind-9.18.17 => bind}/named.service                   | 0
 .../bind/{bind_9.18.17.bb => bind_9.18.19.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.17.bb => bind_9.18.19.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.17/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.17/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.17/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.17/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.17/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.17/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.17/bind9 b/meta/recipes-connectivity/bind/bind/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.17/bind9
rename to meta/recipes-connectivity/bind/bind/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.17/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.17/conf.patch
rename to meta/recipes-connectivity/bind/bind/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.17/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.17/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.17/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.17/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.17/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.17/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.17/named.service b/meta/recipes-connectivity/bind/bind/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.17/named.service
rename to meta/recipes-connectivity/bind/bind/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.17.bb b/meta/recipes-connectivity/bind/bind_9.18.19.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.17.bb
rename to meta/recipes-connectivity/bind/bind_9.18.19.bb
index b6fa279360..a829cc566d 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.17.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.19.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "bde1c5017b81d1d79c69eb8f537f2e5032fd3623acdd5ee830d4f74bc2483458"
+SRC_URI[sha256sum] = "115e09c05439bebade1d272eda08fa88eb3b60129edef690588c87a4d27612cc"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


