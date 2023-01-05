Return-Path: <felix.moessbauer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D7CC3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 12:52:51 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.12024.1672923167119253449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 04:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=felix.moessbauer@siemens.com header.s=fm1 header.b=Pza9LUBp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-72506-20230105125245027c9688fce0ce4c84-sz1ide@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20230105125245027c9688fce0ce4c84
        for <openembedded-core@lists.openembedded.org>;
        Thu, 05 Jan 2023 13:52:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=felix.moessbauer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=x593Qa4+XMsxlmZAEuRRgpslFuaYY5GxzbP2Wcjpe1Y=;
 b=Pza9LUBpxOgcA4FW7V/AA0azsoWGAiemt/pep8xtoWEO7bwm+++n2hKri4578AvJgJ7eCP
 CWJsy3RUkIX1In4hSAxDt6QcVfkU0W0VvWV3gcjUjCq66GEe4XS7ohsQHHMLSvgsMEYcmPaH
 c8vRhYz5GVmXC9/6Ad4qfeldYED6U=;
From: Felix Moessbauer <felix.moessbauer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	alexandre.belloni@bootlin.com,
	richard.purdie@linuxfoundation.org,
	henning.schild@siemens.com,
	tobiasschmidl@siemens.com,
	luca.ceresoli@bootlin.com,
	Felix Moessbauer <felix.moessbauer@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [OE-core][PATCH 1/2] wic/plugins/images/direct: replace fstab entries
Date: Thu,  5 Jan 2023 12:52:22 +0000
Message-Id: <20230105125223.398216-2-felix.moessbauer@siemens.com>
In-Reply-To: <20230105125223.398216-1-felix.moessbauer@siemens.com>
References: <20230105125223.398216-1-felix.moessbauer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-72506:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 12:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175519

This patch extends the imager direct class to check if the mountpoint of
a to-be-added entry in the fstab is already there. If it is, the old
entry is removed and the new entry is appended.

This solves issues with duplicated entries that come from the rootfs
itself. One example where this happens is when generating images for
both direct kernel boot and EFI. In this case, the rootfs mountpoint
needs to be in the fstab of the rootfs and needs to be replaced in WIC.

With this logic, the reverted commit 20d43a2 can be included again.

Reviewed-by: Florian Bezdeka <florian.bezdeka@siemens.com>
Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index dfaa901567..085bf8b463 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -104,6 +104,14 @@ class DirectPlugin(ImagerPlugin):
 
     def update_fstab(self, image_rootfs):
         """Assume partition order same as in wks"""
+
+        def _get_mountpoint(line):
+            """return the mount point of an fstab entry or None"""
+            parts = line.split()
+            if line.startswith('#') or len(parts) != 6:
+                return None
+            return parts[1]
+
         if not image_rootfs:
             return
 
@@ -142,6 +150,8 @@ class DirectPlugin(ImagerPlugin):
             line = "\t".join([device_name, part.mountpoint, part.fstype,
                               opts, "0", passno]) + "\n"
 
+            # if this mountpoint is already in the fstab, replace it
+            fstab_lines = [item for item in fstab_lines if _get_mountpoint(item) != part.mountpoint]
             fstab_lines.append(line)
             updated = True
 
-- 
2.34.1


