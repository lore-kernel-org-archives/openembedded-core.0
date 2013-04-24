Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UV1hP-0006pw-C1 for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 17:33:37 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UV1QJ-0002Wx-Hf
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 17:15:55 +0200
Message-ID: <1366816554.14512.45.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 16:15:54 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] gdb-cross: Adjust ${datadir} to avoid file conflicts in sysroot
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
X-List-Received-Date: Wed, 24 Apr 2013 15:33:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

GDB wants to install a bunch of files in ${datadir}/gdb/python/gdb
and ${datadir}/gdb/syscalls.  These pathnames are invariant with
TARGET_ARCH which means that if you build gdb multiple times for
different targets they will all try to write to the same location
and you get a lot of warning spew about manifest conflicts.

Prevent this by factoring the target specification into ${datadir}
so that different copies of GDB install their files into different
paths.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-devtools/gdb/gdb-cross.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index 33feb58..a92d032 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -10,3 +10,5 @@ GDBPROPREFIX = ""
 
 inherit cross
 inherit gettext
+
+datadir .= "/gdb-${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
-- 
1.7.10.4





