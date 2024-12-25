Return-Path: <code@stefan-gloor.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DA3E7718B
	for <webhook@archiver.kernel.org>; Wed, 25 Dec 2024 12:00:34 +0000 (UTC)
Received: from mxout014.mail.hostpoint.ch (mxout014.mail.hostpoint.ch [217.26.49.174])
 by mx.groups.io with SMTP id smtpd.web11.6208.1735128028659573282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Dec 2024 04:00:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: stefan-gloor.ch, ip: 217.26.49.174, mailfrom: code@stefan-gloor.ch)
Received: from [10.0.2.45] (helo=asmtp012.mail.hostpoint.ch)
	by mxout014.mail.hostpoint.ch with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1 (FreeBSD))
	(envelope-from <code@stefan-gloor.ch>)
	id 1tQQ3u-000000005ds-419g;
	Wed, 25 Dec 2024 13:00:26 +0100
Received: from [178.197.222.20] (helo=localhost.localdomain)
	by asmtp012.mail.hostpoint.ch with esmtpa (Exim 4.97.1 (FreeBSD))
	(envelope-from <code@stefan-gloor.ch>)
	id 1tQQ3u-0000000057z-3Rk4;
	Wed, 25 Dec 2024 13:00:26 +0100
X-Authenticated-Sender-Id: code@stefan-gloor.ch
From: Stefan Gloor <code@stefan-gloor.ch>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Gloor <code@stefan-gloor.ch>
Subject: [PATCH] wic: add documentation for existing options to help.py
Date: Wed, 25 Dec 2024 12:55:48 +0100
Message-ID: <20241225115547.10187-2-code@stefan-gloor.ch>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Vs-State: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 12:00:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209078

Signed-off-by: Stefan Gloor <code@stefan-gloor.ch>
---
 scripts/lib/wic/help.py | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 163535e431..9180d75a92 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -916,6 +916,10 @@ DESCRIPTION
                    will create empty partition. --size parameter has
                    to be used to specify size of empty partition.
 
+         --sourceparams: This option is specific to wic. Supply additional
+                         parameters to the source plugin in
+                         key1=value1,key2 format.
+
          --ondisk or --ondrive: Forces the partition to be created on
                                 a particular disk.
 
@@ -932,6 +936,7 @@ DESCRIPTION
              squashfs
              erofs
              swap
+             none
 
          --fsoptions: Specifies a free-form string of options to be
                       used when mounting the filesystem. This string
@@ -965,6 +970,14 @@ DESCRIPTION
                               to start a partition on an x KBytes
                               boundary.
 
+         --offset: This option is specific to wic that says to place a partition
+                   at exactly the specified offset. If the partition cannot be
+                   placed at the specified offset, the image build will fail.
+                   Specify as an integer value optionally followed by one of the
+                   units s/S for 512 byte sector, k/K for kibibyte, M for
+                   mebibyte and G for gibibyte. The default unit if none is
+                   given is k.
+
          --no-table: This option is specific to wic. Space will be
                      reserved for the partition and it will be
                      populated but it will not be added to the
@@ -1045,6 +1058,18 @@ DESCRIPTION
                            not take effect when --mkfs-extraopts is used. This should be taken into
                            account when using --mkfs-extraopts.
 
+         --type: This option is specific to wic. Valid values are 'primary',
+                 'logical'. For msdos partition tables, this option specifies
+                 the partition type.
+
+         --hidden: This option is specific to wic. This option sets the
+                   RequiredPartition bit (bit 0) on GPT partitions.
+
+         --mbr: This option is specific to wic. This option is used with the
+                gpt-hybrid partition type that uses both a GPT partition and
+                an MBR header. Partitions with this flag will be included in
+                this MBR header.
+
     * bootloader
 
       This command allows the user to specify various bootloader
@@ -1063,6 +1088,13 @@ DESCRIPTION
                       file. Using this option will override any other
                       bootloader option.
 
+        --ptable: Specifies the partition table format. Valid values are
+                  'msdos', 'gpt', 'gpt-hybrid'.
+
+        --source: Specifies the source plugin. If not specified, the
+                  --source value will be copied from the partition that has
+                  /boot as mountpoint.
+
       Note that bootloader functionality and boot partitions are
       implemented by the various --source plugins that implement
       bootloader functionality; the bootloader command essentially
-- 
2.45.2


