Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9C6C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:08 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.26624.1646662445881657083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=oEZoXtAw;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662447; x=1678198447;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/p9R6hXVx4uXqPRujg36lCPXMTuJHqbubzbkQmxpzFo=;
  b=oEZoXtAwLZiWcNnByJ1A1bEKVPvLdVXT6uAXnQF4vj6il0DGo3W6b+KB
   8ssni5PAZaEg1y4IXoVPQZLOeiOF6s/GNshfO0jz/Tx+8Pkx76TEZ+KYE
   VQzR3WQpYpoW2ZbQQ5m7nybI/kb6ki1kBkD3Df9ymgkXWCaql4ks4L7Bq
   Moc7PbwvLM28h1cHqTOuRu8ctepfON8NsLbvXItnvZODiZjx3JbdUx9y2
   Q2K9akHEVtWjA9VhABZMmA8i7zt1bdh9Y04zwayxlSrIhz+aXunoD+HUo
   Vpxf3rdqKvYFFH6hYdL8l8qqEDEmoTvunUNvEFgijO5F0VY4cY6Uo34Yw
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112580"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112580"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:37 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070916"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:36 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 19/25] rootfs-postcommands: amend
 systemd_create_users add user to group check
Date: Mon,  7 Mar 2022 22:09:55 +0800
Message-Id: 
 <5f53e232f92011e131abff6128fa25812c3744ac.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162840

From: Tean Cunningham <tean.cunningham@digi.com>

Currently when adding a user to a group ('m' type), the conditional
check to only create a user/group if it does not exist always resolves
to true. This causes a build exit failure if the user and/or group
defined in the sysusers configuration file were already created prior to
the execution of systemd_create_users().

This logic has been updated to instead fail silently (consistent with
'u' and 'g' type). Additionally, if a user doesn't exist it will be
created without the default group.

Signed-off-by: Tean Cunningham <tean.cunningham@digi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 65649be6b2196ab964c69605d0306bfc2481da33)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 74035c30b7..0452fe4b27 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -78,12 +78,8 @@ systemd_create_users () {
 			eval groupadd --root ${IMAGE_ROOTFS} $groupadd_params || true
 		elif [ "$type" = "m" ]; then
 			group=$id
-			if [ ! `grep -q "^${group}:" ${IMAGE_ROOTFS}${sysconfdir}/group` ]; then
-				eval groupadd --root ${IMAGE_ROOTFS} --system $group
-			fi
-			if [ ! `grep -q "^${name}:" ${IMAGE_ROOTFS}${sysconfdir}/passwd` ]; then
-				eval useradd --root ${IMAGE_ROOTFS} --shell /sbin/nologin --system $name
-			fi
+			eval groupadd --root ${IMAGE_ROOTFS} --system $group || true
+			eval useradd --root ${IMAGE_ROOTFS} --shell /sbin/nologin --system $name --no-user-group || true
 			eval usermod --root ${IMAGE_ROOTFS} -a -G $group $name
 		fi
 		done
-- 
2.35.1


