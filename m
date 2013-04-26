Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UVh8Y-00073c-NS for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 13:48:24 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UVgrP-00063h-B4
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 13:30:39 +0200
Message-ID: <1366975838.14512.99.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2013 12:30:38 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] image.bbclass: Don't mark do_rootfs and do_build as nostamp
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
X-List-Received-Date: Fri, 26 Apr 2013 11:48:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There doesn't appear to be any compelling reason for these tasks to be nostamp
and having them re-run on every build can be irritating (for example, when the
image is an initramfs which your kernel image depends on).

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/image.bbclass |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ffb372a..667d03d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -168,11 +168,9 @@ LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IM
 
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}"
 
-do_rootfs[nostamp] = "1"
 do_rootfs[dirs] = "${TOPDIR} ${WORKDIR}/intercept_scripts"
 do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
 do_rootfs[cleandirs] += "${S} ${WORKDIR}/intercept_scripts"
-do_build[nostamp] = "1"
 
 # Must call real_do_rootfs() from inside here, rather than as a separate
 # task, so that we have a single fakeroot context for the whole process.
-- 
1.7.10.4





