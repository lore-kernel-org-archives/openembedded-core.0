Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D2B346080F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 15:19:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 04 Jan 2016 07:19:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,521,1444719600"; d="scan'208";a="853210242"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 04 Jan 2016 07:19:02 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 2E1696A4002
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 08:06:58 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jan 2016 17:20:57 +0200
Message-Id: <1451920857-2487-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] matchbox-keyboard: export GTK_IM_MODULE_FILE location
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
X-List-Received-Date: Mon, 04 Jan 2016 15:19:02 -0000

This commit in gtk+ moved the cache files below <libdir>
"
commit c8849046860a9b17fa943247d85ddadb29262b48
Author: Matthias Clasen <mclasen@redhat.com>
Date:   Thu Jul 4 09:27:17 2013 -0400

Move the module cache files below libdir

These files contain architecture-dependent paths, and thus placing
them into sysconfdir causes unnecessary hassle. Now the immodule cache
file is looked for in libdir/gtk-2.0/2.10.0/immodules.cache.
Belated backport of a change that was done in the run-up to 3.0.
"

Since gtk-immodules-cache.bbclass creates the cache file in
"/etc/gtk-2.0/gtk.immodules", the environment variable "GTK_IM_MODULE_FILE"
can be set to point GTK+ at the file.

[YOCTO #6774]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
index 6cf188b..63d9b8d 100644
--- a/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
+++ b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
@@ -1,6 +1,7 @@
 #!/bin/sh
 
 . /etc/formfactor/config
+export GTK_IM_MODULE_FILE="/etc/gtk-2.0/gtk.immodules"
 
 CMD=""
 
-- 
2.4.0


