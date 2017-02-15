Return-Path: <geoffrey.levillain@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 2190D71E0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 17:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 2C1221EE19B4;
	Wed, 15 Feb 2017 18:33:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id L22wLUkla-q6; Wed, 15 Feb 2017 18:33:55 +0100 (CET)
Received: from Mirage.daviel.idf.intranet (fw-alt.idf.smile.fr
	[109.190.187.143])
	by idris.smile.fr (Postfix) with ESMTPA id 058AA1EE199A;
	Wed, 15 Feb 2017 18:33:55 +0100 (CET)
From: Geoffrey Levillain <geoffrey.levillain@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 18:33:23 +0100
Message-Id: <20170215173323.10466-4-geoffrey.levillain@smile.fr>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170215173323.10466-1-geoffrey.levillain@smile.fr>
References: <20170215173323.10466-1-geoffrey.levillain@smile.fr>
Subject: [PATCH v2 3/3] rm_work.bbclass: Do not remove fetching and install_overlay stamps
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
X-List-Received-Date: Wed, 15 Feb 2017 17:33:55 -0000

In order to keep do_install_overlay to reexecute it's needed to keep
stamps of fetching tasks.

Without that do_install_overlay would reexecute and do_image as well but
do_image will crash since there is no rootfs.

Signed-off-by: Geoffrey Levillain <geoffrey.levillain@smile.fr>
---
 meta/classes/rm_work.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 054c93716e..c0e7c2a0a6 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -71,6 +71,10 @@ do_rm_work () {
                 i=dummy
                 break
                 ;;
+            *do_fetch*|*do_unpack*|*do_patch*|*install_overlay*)
+                i=dummy
+                break
+                ;;
             *do_rootfs*|*do_image*|*do_bootimg*|*do_bootdirectdisk*|*do_vmimg*|*do_write_qemuboot_conf*)
                 i=dummy
                 break
-- 
2.11.0


