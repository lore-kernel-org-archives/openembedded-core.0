Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA6CE810DC
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 12:06:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.15780.1695816400126947556
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 05:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Rd6WA2C4;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695816400; x=1727352400;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7RF4f7AiVquqWNSgzeglWIzF3NAvGLzvp9W7SmDLw3Y=;
  b=Rd6WA2C4V92ZkESuj1vOXB6p/mWBBcBWocq/bukv582lJ2PJRaSjoU8s
   IKw9XCZfkDHGOgQDF87K0jS0Oy6+lM1gdJSe8EoOsXKozMkC5ku+xR8O0
   1cQNu8IGYauyngs46xi30rGVYPCLeuy5ORDO6LfDOz0wDU2eyCB3uQyP9
   +rH1WOjYrdjbdvnhOvHN6EHstOEA/qyZ6jq1qGSihmHO5T2ui/qDVc9Gm
   cNB95+7gamHyuWdqdB5EbFK7zKE7T/F9PwHI50AxW+ffIVyCr+3Q1fO4i
   yDmcavcw+YDBvGoyTbRnqt4x6WgmZ2l65LloAnX0WGKZNhbhscboDIAI6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="384595475"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="384595475"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 05:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892579514"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="892579514"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2023 05:05:32 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 2/3] bind: update to 9.18.19
Date: Wed, 27 Sep 2023 19:47:00 +0800
Message-Id: <20230927114701.131513-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230927114701.131513-1-chee.yang.lee@intel.com>
References: <20230927114701.131513-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 12:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188311

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
index b6fa279360c..a829cc566d2 100644
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
2.37.3


