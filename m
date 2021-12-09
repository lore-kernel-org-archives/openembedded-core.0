Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C37DC433FE
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:29:48 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5654.1639013381253925301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235503958"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235503958"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:29:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298042"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:29:46 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 06/33] rootfs-postcommands: update
 systemd_create_users
Date: Thu,  9 Dec 2021 09:29:05 +0800
Message-Id: 
 <c25d9d2dae45805fa985f1c541cacfb0230f9522.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:29:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159407

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
index 7fe9e3d8c8..a3f96ef7ed 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -62,7 +62,7 @@ python () {
 }
 
 systemd_create_users () {
-	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
+	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/*.conf; do
 		[ -e $conffile ] || continue
 		grep -v "^#" $conffile | sed -e '/^$/d' | while read type name id comment; do
 		if [ "$type" = "u" ]; then
-- 
2.33.1


