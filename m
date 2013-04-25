Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UVLZ8-000395-D8 for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 14:46:24 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UVLI1-00045a-86
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 14:28:41 +0200
Message-ID: <1366892920.14512.80.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Apr 2013 13:28:40 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH v2] gdb: Disable hard-coding of library rpaths
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
X-List-Received-Date: Thu, 25 Apr 2013 12:46:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

GDB's configury has a tendency to hard-code the path where it found
libexpat using "-Wl,--rpath".  This is undesirable and leads to QA warnings.

Fortunately, the helpful GDB maintainers have provided a "--disable-rpath"
switch to turn this behaviour off.  Let's use it and profit.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
v2: fewer tabs, more spaces

 meta/recipes-devtools/gdb/gdb-common.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 9eb6b60..f574d5c 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -42,6 +42,7 @@ EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x --disable-werror \
                 --with-curses --disable-multilib --with-system-readline --disable-sim \
                 ${GDBPROPREFIX} ${EXPAT} \
                 ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
+                --disable-rpath \
                "
 
 GDBPROPREFIX = "--program-prefix=''"
-- 
1.7.10.4





