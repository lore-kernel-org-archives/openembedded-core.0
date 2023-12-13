Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF9FC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 03:54:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.25923.1702439641288059366
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 19:54:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Gg9xBfnz;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702439641; x=1733975641;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=VN2WXfF6TIx6p4sJD4hNbpBVY6daqCT2JpS3HKX1GwE=;
  b=Gg9xBfnz+bXDWsZANisGBj4jFCB2JCCEMAJBNF9+0KWlJWQcmJ12kfQo
   JDiOqSvuzBhMalVBWH+ELT6sLP42505vJh1WtM+zrqKEsJx8O+QS+9f6s
   /DjFk8qXRqP3pn0NzvNolvzN0K2J3n8CkWzgJJrIPKjJzG7P9bMA75Xxf
   /S6ipoe1cDn8D6cSjIGlHgrO1Qp8FoidMhpg1UOEvZIp3HarX8vZcwEwa
   2QQ8/Q6f7AnmNidr9sXM5ro1MvEbeLMrRdgn6rvQB6Gu0yAcWila4lCYX
   dP3tZ2hHAkHYlc6Z6NxoKrN15JFe4KG9O3VeUB6ownTkk87dsBCxsYj51
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="481109799"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="481109799"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 19:53:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917523944"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="917523944"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2023 19:53:51 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][patch 6/6] perf: lift TARGET_CC_ARCH modification out of security_flags.inc
Date: Wed, 13 Dec 2023 11:34:09 +0800
Message-Id: <20231213033409.2101308-6-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231213033409.2101308-1-chee.yang.lee@intel.com>
References: <20231213033409.2101308-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 03:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192265

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Building perf without security_flags.inc being included in one's
distro results in the buildpaths warning

WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/bin/trace in
package perf contains reference to TMPDIR

because the ${DEBUG_PREFIX_MAP} does not get used. Most recipes get
that from CFLAGS, but the perf recipe explicitly unsets that.

Now ${SELECTED_OPTIMIZATION} of course contains more than just
${DEBUG_FLAGS}/${DEBUG_PREFIX_MAP}. For most TUs, perf's build system
adds its own optimization flags (-O6 for odd reasons), so for those
including the -O2 or -Og doesn't change anything. But looking at the
.o.cmd files show that there are some TUs which currently get built
without any -O flag. So for those adding the distro's
SELECTED_OPTIMIZATION seem to be the right thing to do.

(cherry-picked from Oe-Core rev: aa01c9122ef4a2159df503ef6ed25e802277f13a)

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/conf/distro/include/security_flags.inc | 1 -
 meta/recipes-kernel/perf/perf.bb            | 9 +++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 2972f05b4e..d97a6edb0f 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -69,4 +69,3 @@ SECURITY_LDFLAGS:pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
 TARGET_CC_ARCH:append:pn-binutils = " ${SELECTED_OPTIMIZATION}"
 TARGET_CC_ARCH:append:pn-gcc = " ${SELECTED_OPTIMIZATION}"
 TARGET_CC_ARCH:append:pn-gdb = " ${SELECTED_OPTIMIZATION}"
-TARGET_CC_ARCH:append:pn-perf = " ${SELECTED_OPTIMIZATION}"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 675acfaf26..a392166e73 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -73,6 +73,15 @@ SPDX_S = "${S}/tools/perf"
 # supported kernel.
 LDFLAGS="-ldl -lutil"
 
+# Perf's build system adds its own optimization flags for most TUs,
+# overriding the flags included here. But for some, perf does not add
+# any -O option, so ensure the distro's chosen optimization gets used
+# for those. Since ${SELECTED_OPTIMIZATION} always includes
+# ${DEBUG_FLAGS} which in turn includes ${DEBUG_PREFIX_MAP}, this also
+# ensures perf is built with appropriate -f*-prefix-map options,
+# avoiding the 'buildpaths' QA warning.
+TARGET_CC_ARCH += "${SELECTED_OPTIMIZATION}"
+
 EXTRA_OEMAKE = '\
     V=1 \
     VF=1 \
-- 
2.37.3


