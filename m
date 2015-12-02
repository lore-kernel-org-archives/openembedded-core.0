Return-Path: <vz@mleia.com>
X-Greylist: delayed 555 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 02 Dec 2015 04:58:00 UTC
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	by mail.openembedded.org (Postfix) with ESMTP id C9785601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 04:58:00 +0000 (UTC)
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 760C9398;
	Wed,  2 Dec 2015 04:50:33 +0000 (GMT)
From: Vladimir Zapolskiy <vz@mleia.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 06:48:38 +0200
Message-Id: <1449031718-3786-1-git-send-email-vz@mleia.com>
X-Mailer: git-send-email 2.1.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20151202_045033_505927_F662CFE6 
X-CRM114-Status: GOOD (  11.24  )
Subject: [PATCH] package_ipk: allow to specify OPKG_ARGS in local.conf
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
X-List-Received-Date: Wed, 02 Dec 2015 04:58:01 -0000

If user specific parameters to opkg are set in local.conf, they are
rewritten in package_ipk.bbclass and ignored, instead append
package_ipk specific arguments to the user defined ones.

The change is needed, if a user has to pass an alternative path to a
temporary directory for opkg, e.g.

  OPKG_ARGS = "--tmp-dir=${TOPDIR}/tmp-opkg"

The default /tmp directory may be unusable for do_rootfs task, for
example if there is no enough space or /tmp is mounted with noexec
mount option, then an alternative path allows to complete do_rootfs
and fix the problems like this:

  ERROR: Unable to install packages.
  ...
  sh: /tmp/opkg-5jPLag/run-postinsts-UsUtaI/preinst: /bin/sh: bad interpreter: Permission denied
  sh: /tmp/opkg-5jPLag/base-files-4hFwQS/preinst: /bin/sh: bad interpreter: Permission denied
  sh: /tmp/opkg-5jPLag/run-postinsts-UsUtaI/preinst: /bin/sh: bad interpreter: Permission denied
  sh: /tmp/opkg-5jPLag/busybox-syslog-sJmfbw/preinst: /bin/sh: bad interpreter: Permission denied
  ...

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 meta/classes/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 4dd7a7e..51bee28 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -10,7 +10,7 @@ PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
 # Program to be used to build opkg packages
 OPKGBUILDCMD ??= "opkg-build"
 
-OPKG_ARGS = "--force_postinstall --prefer-arch-to-version"
+OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS", True) == "1"]}"
 OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKAGE_EXCLUDE', True) or "").split())][(d.getVar("PACKAGE_EXCLUDE", True) or "") != ""]}"
 
-- 
2.1.4


