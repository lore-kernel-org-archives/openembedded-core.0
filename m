Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA53C433EF
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 00:19:41 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.5703.1640909972187616253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 16:19:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=BfBlXbxa;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640909972; x=1672445972;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XXJQQchx/1gQD2O5udUxWjaJIZI/HF2SswlEk9NfSd8=;
  b=BfBlXbxaD5j1gRt4EgUo9PvVGOB/gALpQQl11mxJvMWUkSn5P+xSHu5o
   jG6pTejGJYsG2OIfQ2icHeTEWQYR3nCLcq5FlJugajUV8P4oqD5FbdPY5
   umZJ6HOVrfFNpBEz/5p1uJhYyY4vzin+2NAvqF+SxLSq3rqlPci7otZIs
   q9lqYv/HWR8YFQZAnMO7k9cEBWukGRN9yH9+MGaSqBP/MaItc7Gsfq1nm
   axzEW1fJszs5aj1UohSR+zXVgVrLgHHThU/Oa+YACh1n2lahES0t24gd3
   7eCcfySM5btgUflHzWq/bMeoGQo9hh0DvlNvZ088DD8MJikfTunYvvLDd
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="228573092"
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="228573092"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="619502239"
Received: from jiayingk-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.231.141])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:30 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 01/11] systemd: Fix systemd-journal-gateway
 user/groups
Date: Fri, 31 Dec 2021 08:19:14 +0800
Message-Id: 
 <10db2106122b02c7d1cfca065c3bd9c8ff7d19f8.1640909776.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1640909776.git.anuj.mittal@intel.com>
References: <cover.1640909776.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 00:19:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160069

From: Florian Amstutz <florian.amstutz@scs.ch>

The systemd-journal-gateway user and group are never added to an image
since the package name added to USERADD_PACKES is wrong.

Signed-off-by: Florian Amstutz <florian.amstutz@scs.ch>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 495dc879b1eff4f70da6f783341b9a3085180a22)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/systemd/systemd_249.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_249.7.bb b/meta/recipes-core/systemd/systemd_249.7.bb
index f8c85dabf0..c94a18140e 100644
--- a/meta/recipes-core/systemd/systemd_249.7.bb
+++ b/meta/recipes-core/systemd/systemd_249.7.bb
@@ -385,7 +385,7 @@ SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfm
 SYSTEMD_SERVICE:${PN}-binfmt = "systemd-binfmt.service"
 
 USERADD_PACKAGES = "${PN} ${PN}-extra-utils \
-                    ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gateway', '', d)} \
+                    ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gatewayd', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-remote', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
 "
@@ -397,7 +397,7 @@ USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--syste
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /sbin/nologin systemd-resolve;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /sbin/nologin systemd-timesync;', '', d)}"
 USERADD_PARAM:${PN}-extra-utils = "--system -d / -M --shell /sbin/nologin systemd-bus-proxy"
-USERADD_PARAM:${PN}-journal-gateway = "--system -d / -M --shell /sbin/nologin systemd-journal-gateway"
+USERADD_PARAM:${PN}-journal-gatewayd = "--system -d / -M --shell /sbin/nologin systemd-journal-gateway"
 USERADD_PARAM:${PN}-journal-remote = "--system -d / -M --shell /sbin/nologin systemd-journal-remote"
 USERADD_PARAM:${PN}-journal-upload = "--system -d / -M --shell /sbin/nologin systemd-journal-upload"
 
-- 
2.33.1


