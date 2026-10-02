Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 193C2CA5FD6
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 11:48:57 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9898.1790941734987271990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 04:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=SH7UcsLB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1334352-202610021148524e6f1fd0bd0002074e-gm15yd@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202610021148524e6f1fd0bd0002074e
        for <openembedded-core@lists.openembedded.org>;
        Fri, 02 Oct 2026 13:48:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8QEALJwFa30/T52orj2IiJk7QTAXA6jLEwf33krfhoQ=;
 b=SH7UcsLBAg0CsXcJy6gW0/NsDMOws42RkfAVxYmdzbROaRQwr9bCvAPQQSt5Uv3GYRzNoD
 XAMo9Gna6jWwOMs8bxPF1j3d2EuhgmM/i1W4b1onu5/FY3ixargn1XLClWElWmmMSaOXf5ff
 mITO3/U4i/OEm07LgJ8hPrIClMXasl153rTuwwhQPgKEi5djAdGaWks+YqKLxL3QcHKtaR2n
 9NatoJZahrzq2d1fdmYEEo5h+ZZfeQl6hulFNYCYIdmWxClR3CoSQrxsW8mAV19J4MxIqJHd
 ibCRWY0juuAVxtpiOTXqSQlU44rj0mmjd9Sm3HeFjKp9WlmcoOiHLd1Q==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [PATCH 1/3] qemu: enable pseudo for nfs rootfs export
Date: Fri,  2 Oct 2026 13:48:47 +0200
Message-ID: <20261002114848.1126256-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 11:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247113

Testimage.bbclass can now boot from nfs, but pseudo is globally
disabled by default in the environment. This corrupts file access
rights when qemu boots from nfs, causing failures. Explicitly
enable pseudo in runqemu-export-rootfs since it is required here.

Also export OECORE_NATIVE_SYSROOT from qemurunner so
runqemu-export-rootfs can locate pseudo without needing a second
tinfoil connection.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++++
 scripts/runqemu-export-rootfs     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 5979b52650..1a83c01ea8 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -166,6 +166,10 @@ class QemuRunner:
         if self.tmpfsdir:
             env["RUNQEMU_TMPFS_DIR"] = self.tmpfsdir
 
+        if self.native_sysroot:
+            # Needed by runqemu-export-rootfs (avoid a second tinfoil connection)
+            env["OECORE_NATIVE_SYSROOT"] = self.native_sysroot
+
         if not launch_cmd:
             launch_cmd = 'runqemu %s' % ('snapshot' if discard_writes else '')
             if self.use_kvm:
diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 150513bc50..ff19a0ccc9 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -58,6 +58,8 @@ PSEUDO_LOCALSTATEDIR="$NFS_EXPORT_DIR/../$(basename $NFS_EXPORT_DIR).pseudo_stat
 export PSEUDO_LOCALSTATEDIR
 PSEUDO_INCLUDE_PATHS="$NFS_EXPORT_DIR"
 export PSEUDO_INCLUDE_PATHS
+# Enable pseudo
+export PSEUDO_DISABLED=0
 
 if [ ! -d "$PSEUDO_LOCALSTATEDIR" ]; then
 	echo "Error: $PSEUDO_LOCALSTATEDIR does not exist."

