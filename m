Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UYFX6-00017N-3Y for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 14:56:16 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UYFFn-00022t-Av
	for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 14:38:23 +0200
Message-ID: <1367584702.14512.276.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 03 May 2013 13:38:22 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH v2] image.bbclass: Don't mark do_rootfs and do_build as nostamp
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
X-List-Received-Date: Fri, 03 May 2013 12:56:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When image.bbclass was first conceived (as rootfs_ipk.bbclass), oemake
was unable to figure out when the inputs to do_rootfs had changed in
such a way that it would need to be rerun.  Absent any reliable
information of this kind, it was necessary to adopt the conservative
assumption that images always needed rebuilding and, to this end,
do_rootfs and do_build in image recipes were marked as nostamp.  (The
nostamp annotation for do_build was added in oe-classic commit
80d622e0c1dbc284858e01d3eb670303a6d8cdf9 from January 2005; the exact
point at which do_rootfs was made nostamp is obscure, but it predates
oe-classic revision 63fad339e01d4b16105146c32a61f24460397126.)

This situation persisted for the following eight years but, during that
period, oemake evolved into today's sstate-enabled bitbake, oe itself
gained the OEBasicHash algorithm which can reliably detect changes to
the input data for do_rootfs or any other task, and OEBasicHash was made
the default for oe-core in 4199efed48005a62267fa3374c33b13627d85f44
(June 2012).  

Given these various changes in the wider landscape, there is no longer
any obvious benefit to having these two tasks marked as nostamp, and
indeed having them so marked causes needless rebuilds which can be
annoying.  Anybody who does genuinely wish to rerun these tasks when
nothing in the input has changed can run "bitbake -f", just like with
any other task.  So, let's remove the nostamp annotations and just let
bitbake figure out when to rerun them.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
v2: no code changes, expanded checkin comment at Saul Wold's request

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






