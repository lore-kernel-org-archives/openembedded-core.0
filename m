Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 44F0F7CCA4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 09:40:04 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 447v1K3kpVz1rNlp;
	Tue, 26 Feb 2019 10:40:05 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 447v1K3Swyz1rVx1;
	Tue, 26 Feb 2019 10:40:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id W9HTmvP3b6vJ; Tue, 26 Feb 2019 10:40:03 +0100 (CET)
X-Auth-Info: vyKQkAPw7p34fjr5SV4Ge+4QQmObpU37WfEJfrrRaT5ufc9LUc8FO76+1lgra2Fx
Received: from menlobldserver.menlosystems.local
	(host-141-40-253-35.customer.izb-online.de [141.40.253.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 26 Feb 2019 10:40:03 +0100 (CET)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2019 09:39:49 +0000
Message-Id: <20190226093949.32671-1-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.11.0
Cc: Olaf Mandel <o.mandel@menlosystems.com>
Subject: [PATCH] devtool: deploy-target: support "unsafe" symlinks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2019 09:40:05 -0000

The bosybox version of tar considers symlink targets that start with /
or with ../ to be unsafe and refuses to unpack them unless the
EXTRACT_UNSAFE_SYMLINKS environment variable is set to 1.

As even many core packages legitimately contain such links (e.g.
coreutils-locale-*, dropbear, eudev, initscripts, kmod, ...), add the
environment variable to the remote script.
---
 scripts/lib/devtool/deploy.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index f345f31b7b..9617388f90 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -114,6 +114,7 @@ def _prepare_remote_script(deploy, verbose=False, dryrun=False, undeployall=Fals
             lines.append('rm $3')
         lines.append('mkdir -p `dirname $manifest`')
         lines.append('mkdir -p $2')
+        lines.append('export EXTRACT_UNSAFE_SYMLINKS=1')
         if verbose:
             lines.append('    tar xv -C $2 -f - | tee $manifest')
         else:
-- 
2.11.0


