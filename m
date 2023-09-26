Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ED2E7D254
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:22:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.14088.1695716543014385960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=N2jvjL4b;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695716543; x=1727252543;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=AtiiSnEnC9z0z5HldIelDQYjmBNuG0Pt+OPGSJ/Sdf0=;
  b=N2jvjL4bsiy7smukGjAh6LRxqCUffeRV02C9Fgc+GDXWEyrX4/Ci1lhJ
   5lX3/PZEKyiZIpD+udwEEhxKqjcrZkAuEQU0wxMIrxs6uBj9KoWfV6GTR
   9T4btnwVAA7sPMEliJPCTF0u9SA8mGCxsoRGsRIZ9YnCcKdqla4t3eI5B
   MMaXGlo23h7orUdXHvXNj209Id6DArw9C/f3JaDYT7RPfYkUO666e6Gn1
   3i2ND9yYyG16i5dbfvHfHfLF4Gen6c7ECe+/tOSsst9LA+nahBUUAeqe+
   J2F+DnQrL9no5oAQs1m4hK6RKYf4PX9QzuU7Hphn2/1yvHF5CgHQl3mAH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467799836"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="467799836"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 01:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="725361704"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="725361704"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga006.jf.intel.com with ESMTP; 26 Sep 2023 01:22:22 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][PATCH 2/3] bind: update to 9.18.19
Date: Tue, 26 Sep 2023 16:02:42 +0800
Message-Id: <20230926080243.2169021-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230926080243.2169021-1-chee.yang.lee@intel.com>
References: <20230926080243.2169021-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188222

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
2.37.3


