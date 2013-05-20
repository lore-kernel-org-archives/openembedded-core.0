Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=elite.brightsigndigital.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>) id 1UePP4-0002Ov-Bb
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 14:41:27 +0200
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1UeP7I-00086y-28; Mon, 20 May 2013 13:23:04 +0100
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1UeP7I-0006oh-0t; Mon, 20 May 2013 13:23:04 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2013 13:22:45 +0100
Message-Id: <1369052565-26170-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] kernel.bbclass: Add dependency on binutils
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 May 2013 12:41:34 -0000
X-List-Received-Date: Mon, 20 May 2013 12:41:34 -0000

Compiling the Linux kernel requires binutils; kernel.bbclass uses
INHIBIT_DEFAULT_DEPS so it had better depend on binutils explicitly.

(The lack of this dependency isn't always a problem because binutils
is required to build gcc-cross but if gcc-cross is reconstructed from
the sstate cache then gcc-cross's dependency on binutils-cross is
ignored due to being in the safe dependency list in
setscene_depvalid.)

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Acked-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/kernel.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ffb0b11..38973db 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,7 +1,7 @@
 inherit linux-kernel-base module_strip kernel-module-split
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross"
+DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross"
 
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
-- 
1.7.10.4



