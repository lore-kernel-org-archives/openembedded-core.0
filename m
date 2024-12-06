Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486A8E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 19:43:03 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.45965.1733514174920563264
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 11:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=J3BfNdvK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202412061942517f25a79b5c94dd4ffa-vuy3tn@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202412061942517f25a79b5c94dd4ffa
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Dec 2024 20:42:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=huAnPflIL9PAewMS5Lp7R0TSQ8/3FYkJR3UkVeH9mLc=;
 b=J3BfNdvKcsi4uG2UjQJ8k2sNCKFCT8C72hOp9RGBxhCn4oXeqCCxUdjbZ+0+RNknAw6xLG
 TYEUXjiFgIixhu99ZuOApeecPkYkJ2ffJu/XdSnot2NbtJAIQUsg9B4O8tPX46+/CC0ssfRv
 0cHBpZU449Lcw1olxkeees/75xOv2BJwb5d5rPlHeTpX/TaeU2cmtbIw6duexEJjk1FgZYIs
 NMybHDaIRgVPtke1lk03xjGWUN0WtZooWVHHJ7uW71ZvgKabszJ9X4r5gwIGmPJpEIww4qtO
 q1xj8NKXN1/b+dqVBudSTZaS/Tj4r4DAGiQ610rjg6tTMUT9ZKj9+BMA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][kirkstone][PATCH] rootfs-postcommands.bbclass: make opkg status reproducible
Date: Fri,  6 Dec 2024 20:42:05 +0100
Message-Id: <20241206194205.292674-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 19:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208439

From: Peter Marko <peter.marko@siemens.com>

opkg stores the current time as Installed-Time in its status file when
installing packages to the rootfs. Make this reproducible by replacing
Installed-Time with ${REPRODUCIBLE_TIMESTAMP_ROOTFS}, which then also
matches the files' datestamps.

Based on OpenWrt's approach for the issue [1].

[1] https://github.com/openwrt/openwrt/blob/main/include/rootfs.mk#L103

(From OE-Core rev: 61a9b1b1cb618ce90ba7886036f41263075c07df)

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/rootfs-postcommands.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index f7517c66dc..83bf265a68 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -377,6 +377,10 @@ rootfs_reproducible () {
 			find ${IMAGE_ROOTFS}${sysconfdir}/gconf -name '%gconf.xml' -print0 | xargs -0r \
 			sed -i -e 's@\bmtime="[0-9][0-9]*"@mtime="'${REPRODUCIBLE_TIMESTAMP_ROOTFS}'"@g'
 		fi
+
+		if [ -f ${IMAGE_ROOTFS}${localstatedir}/lib/opkg/status ]; then
+			sed -i 's/^Installed-Time: .*/Installed-Time: ${REPRODUCIBLE_TIMESTAMP_ROOTFS}/' ${IMAGE_ROOTFS}${localstatedir}/lib/opkg/status
+		fi
 	fi
 }
 
-- 
2.30.2


