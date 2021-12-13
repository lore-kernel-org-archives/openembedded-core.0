Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9BAC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:17:32 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=bfNsQhDn;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369051; x=1670905051;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=O4Xpjs2s3WftdQB+wxs+0dREmtv7zC8Acodg1zldH2w=;
  b=bfNsQhDnmwyc9VoMTCtIP+KIyYAdbINF4TIi3ROr3mkZDFPMySwPZh8V
   8MN62PachTzxaurI39jpftHiK0chsM5xJ9cUndDTwpFeYtowyVq6ZYyqU
   lpc+IU8+L8yKAsFT51M/5+FIfnnIdmVSbpbWNJ2c/JcS/CygG1vmILjY+
   NcF05auPW9rhDkW26nG9XkyTCzGt2eYdttgAF4PTxR90ENS9VUa00M/j+
   nECkUQAZlkrG3Lu0DVJqUnx2xyOCmKJsAUFQu7cSHOthRYwwpgddHv6KJ
   rnifysMqfPkSEyud2t5Rj39RIhdRd6JSeKtTg5vZrL1hKWV6/bHRkLayN
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602201"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602201"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589249"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:29 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/20] rootfs-postcommands: update
 systemd_create_users
Date: Mon, 13 Dec 2021 12:17:01 +0800
Message-Id: 
 <a94e622f222253c6646f1a1157f918d8aa586866.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:17:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159592

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Process all systemd-sysusers configuration files in order to create
users/groups at build time. systemd-sysusers would try to create them at
run-time, but for read-only rootfs that's not possible and results in
warnings from different services:

systemd-udevd[166]: /lib/udev/rules.d/50-udev-default.rules:39 Unknown group 'render', ignoring
systemd-udevd[166]: /lib/udev/rules.d/50-udev-default.rules:40 Unknown group 'render', ignoring
systemd-udevd[166]: /lib/udev/rules.d/50-udev-default.rules:42 Unknown group 'sgx', ignoring

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f86ffdb1b77c6ba32ec250545a40c1c54f983f21)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index e66ed5938b..87b5751e24 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -60,7 +60,7 @@ python () {
 }
 
 systemd_create_users () {
-	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
+	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/*.conf; do
 		[ -e $conffile ] || continue
 		grep -v "^#" $conffile | sed -e '/^$/d' | while read type name id comment; do
 		if [ "$type" = "u" ]; then
-- 
2.33.1


