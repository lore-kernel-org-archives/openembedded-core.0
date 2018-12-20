Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 17E1A6BC77
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 23:10:26 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id CD35F220288;
	Fri, 21 Dec 2018 12:10:26 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Dec 2018 12:10:22 +1300
Message-Id: <20181220231022.1509-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] patch: reproducibility: Fix host umask leakage
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
X-List-Received-Date: Thu, 20 Dec 2018 23:10:27 -0000

Some patch files create entirely new files, so their permissions are subject to
the host umask. If such a file is later installed into a package with no change
in permissions, it breaks the reproducibility of the package.

This was observed on libpam, for instance: The patch file
pam-security-abstract-securetty-handling.patch creates a new file
(tty_secure.c). This file is later copied into the -dbg package with no change
in permissions.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/patch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 3e0a181821..cd241f1c84 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -153,6 +153,7 @@ python patch_do_patch() {
 patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
 
 addtask patch after do_unpack
+do_patch[umask] = "022"
 do_patch[dirs] = "${WORKDIR}"
 do_patch[depends] = "${PATCHDEPENDENCY}"
 
-- 
2.17.1


