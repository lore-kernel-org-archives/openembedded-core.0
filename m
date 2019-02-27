Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id BB9627CADA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 09:11:05 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 448VKP70Rhz1rT0L;
	Wed, 27 Feb 2019 10:11:05 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 448VKP6bndz1qswl;
	Wed, 27 Feb 2019 10:11:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 2FrOJj_nDH8M; Wed, 27 Feb 2019 10:11:05 +0100 (CET)
X-Auth-Info: 0zyX4nC5qeVkjU+WT1OCIk5zTzBNRb8TeCXaT5DO7/57dwOnRcl/dp85RUgq42xq
Received: from menlobldserver.menlosystems.local
	(host-141-40-253-35.customer.izb-online.de [141.40.253.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 27 Feb 2019 10:11:05 +0100 (CET)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 09:10:55 +0000
Message-Id: <20190227091055.19107-1-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <CAJ86T=VRke7oXB6p-7UA=OCewHC=fb0xMG4Pr+f-8qvG3yof8w@mail.gmail.com>
References: <CAJ86T=VRke7oXB6p-7UA=OCewHC=fb0xMG4Pr+f-8qvG3yof8w@mail.gmail.com>
Cc: Olaf Mandel <o.mandel@menlosystems.com>
Subject: [PATCH v2] devtool: deploy-target: support "unsafe" symlinks
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
X-List-Received-Date: Wed, 27 Feb 2019 09:11:06 -0000

The bosybox version of tar in sumo considers symlink targets that start
with / or with ../ to be unsafe and refuses to unpack them unless the
EXTRACT_UNSAFE_SYMLINKS environment variable is set to 1.

As even many core packages legitimately contain such links (e.g.
coreutils-locale-*, dropbear, eudev, initscripts, kmod, ...), add the
environment variable to the remote script.
---
 scripts/lib/devtool/deploy.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index f345f31b7b..dc9b34e0ee 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -114,6 +114,11 @@ def _prepare_remote_script(deploy, verbose=False, dryrun=False, undeployall=Fals
             lines.append('rm $3')
         lines.append('mkdir -p `dirname $manifest`')
         lines.append('mkdir -p $2')
+        # Busybox tar v1.28.x (plus v1.27.2 with the CVE-2011-5325 patch)
+        # requires this env variable. The first release without this issue
+        # is thud.
+        # FIXME Remove once sumo goes out of support
+        lines.append('export EXTRACT_UNSAFE_SYMLINKS=1')
         if verbose:
             lines.append('    tar xv -C $2 -f - | tee $manifest')
         else:
-- 
2.11.0


