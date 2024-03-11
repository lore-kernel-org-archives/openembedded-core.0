Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33977C54E67
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 08:40:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by mx.groups.io with SMTP id smtpd.web10.57746.1710146410684632311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 01:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=PYiMYdPm;
 spf=pass (domain: intel.com, ip: 198.175.65.19, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710146414; x=1741682414;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=5sfiEyX015GJBikLiOmt+56Lw4JsoXKAMO5/tK4pvvI=;
  b=PYiMYdPmkey2dTwEMaqPgkGdpTE6SMX66RmHJubocUXB+wD6ZEk/HTwI
   siGJ/D2+bP7gS9WQmTB8kd6APq7xgggH6umlMx4j9E1QzjYkSKC+VgWi8
   D1eBPjRlcqWjpKHsEZMbxmSFZF3ockEQPbnOg7lQ/nHQDGF+fCvoY6IVV
   P5jkd5pplMdwqfwxbJwGLezzri+xnVJXR0PYpKQnHnCe+NoVOLqKrdRna
   Q1BinKXvGhOKzS7BAAlfFP4q41xMeXj75s6Jx+HsbMG1RDmu+tXaa38OX
   47pkk5UFNchyLITxGmjvknUcut71pqyz5k9mshONRrT9yz+1KinAoMLEK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4656133"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4656133"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 01:40:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="15594001"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2024 01:40:12 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][PATCH 5/7] bind: Upgrade 9.18.21 -> 9.18.24
Date: Mon, 11 Mar 2024 16:39:52 +0800
Message-Id: <20240311083954.418271-5-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240311083954.418271-1-chee.yang.lee@intel.com>
References: <20240311083954.418271-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 08:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196924

From: Soumya Sambu <soumya.sambu@windriver.com>

Changelog:
=========
9.18.24:
	- Fix case insensitive setting for isc_ht hashtable.
	[GL #4568]

9.18.23:
	- Specific DNS answers could cause a denial-of-service
	condition due to DNS validation taking a long time.
	(CVE-2023-50387) [GL #4424]
	- Change 6315 inadvertently introduced regressions that
	could cause named to crash. [GL #4234]
	- Under some circumstances, the DoT code in client
	mode could process more than one message at a time when
	that was not expected. That has been fixed. [GL #4487]

9.18.22:
	- Limit isc_task_send() overhead for RBTDB tree pruning.
	[GL #4383]
	- Restore DNS64 state when handling a serve-stale timeout.
	(CVE-2023-5679) [GL #4334]
	- Specific queries could trigger an assertion check with
	nxdomain-redirect enabled. (CVE-2023-5517) [GL #4281]
	- Speed up parsing of DNS messages with many different
	names. (CVE-2023-4408) [GL #4234]
	- Address race conditions in dns_tsigkey_find().
	[GL #4182]
	- Conversion from NSEC3 signed to NSEC signed could
	temporarily put the zone into a state where it was
	treated as unsigned until the NSEC chain was built.
	Additionally conversion from one set of NSEC3 parameters
	to another could also temporarily put the zone into a
	state where it was treated as unsigned until the new
	NSEC3 chain was built. [GL #1794] [GL #4495]
	- Memory leak in zone.c:sign_zone. When named signed a
	zone it could leak dst_keys due to a misplaced
	'continue'. [GL #4488]
	- Log more details about the cause of "not exact" errors.
	[GL #4500]
	- The wrong time was being used to determine what RRSIGs
	where to be generated when dnssec-policy was in use.
	[GL #4494]
	- The "trust-anchor-telemetry" statement is no longer
	marked as experimental. This silences a relevant log
	message that was emitted even when the feature was
	explicitly disabled. [GL #4497]
	- Fix statistics export to use full 64 bit signed numbers
	instead of truncating values to unsigned 32 bits.
	[GL #4467]
	- NetBSD has added 'hmac' to libc which collides with our
	use of 'hmac'. [GL #4478]

(cherry-pick from Oe-Core rev d7f31aba343948dbaadafc8c0c66f78e6ffb46e3)

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../bind/{bind_9.18.21.bb => bind_9.18.24.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.21.bb => bind_9.18.24.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.21.bb b/meta/recipes-connectivity/bind/bind_9.18.24.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.21.bb
rename to meta/recipes-connectivity/bind/bind_9.18.24.bb
index f5fb4bd1e5..2874990320 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.21.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.24.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "a556be22505d9ea4f9c6717aee9c549739c68498aff3ca69035787ecc648fec5"
+SRC_URI[sha256sum] = "709d73023c9115ddad3bab65b6c8c79a590196d0d114f5d0ca2533dbd52ddf66"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.37.3


