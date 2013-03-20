Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UIOub-00058D-RA
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 20:43:02 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2013 20:26:07 +0100
Message-Id: <1363807567-27267-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH/RFC] netbase: inherit allarch
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
X-List-Received-Date: Wed, 20 Mar 2013 19:43:02 -0000

It doesn't ship any binaries, so it should use allarch,
now that ifupdown has been moved to another recipe.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
This causes the following error on my system. Notice the "r0" in the failed
path. Running "bitbake -ccleansstate netbase" doesn't help.

ERROR: Error executing a python function in /build/openembedded-core/meta/recipes-core/netbase/netbase_5.0.bb:
OSError: [Errno 2] No such file or directory: '/build/tmp/work/all-oe-linux/netbase/netbase-1_5.0-r0/packages-split/netbase-dbg'

ERROR: The stack trace of python calls that resulted in this exception/failure was:
ERROR:   File "do_package_ipk", line 194, in <module>
ERROR: 
ERROR:   File "do_package_ipk", line 45, in do_package_ipk
ERROR: 
ERROR: The code that was being executed was:
ERROR:      0190:        bb.utils.unlockfile(lf)
ERROR:      0191:
ERROR:      0192:
ERROR:      0193:
ERROR:  *** 0194:do_package_ipk(d)
ERROR:      0195:
ERROR: [From file: 'do_package_ipk', lineno: 194, function: <module>]
ERROR:      0041:        basedir = os.path.join(os.path.dirname(root))
ERROR:      0042:        arch = localdata.getVar('PACKAGE_ARCH', True)
ERROR:      0043:        pkgoutdir = "%s/%s" % (outdir, arch)
ERROR:      0044:        bb.mkdirhier(pkgoutdir)
ERROR:  *** 0045:        os.chdir(root)
ERROR:      0046:        from glob import glob
ERROR:      0047:        g = glob('*')
ERROR:      0048:        try:
ERROR:      0049:            del g[g.index('CONTROL')]
ERROR: [From file: 'do_package_ipk', lineno: 45, function: do_package_ipk]
ERROR: Function failed: do_package_ipk
ERROR: Execution of event handler 'run_buildstats' failed
Traceback (most recent call last):
  File "run_buildstats(e)", line 104, in run_buildstats(e=<bb.build.TaskFailed object at 0x73d7810>)
  File "buildstats.bbclass", line 5, in write_task_data(status='failed', logfile='/build/tmp/buildstats/netbase-qemumipsel/201303202017/netbase-1_5.0-r0/do_package_write_ipk', dev='dm-1', e=<bb.build.TaskFailed object at 0x73d7810>)
IOError: [Errno 2] No such file or directory: '/build/tmp/buildstats/netbase-qemumipsel/201303202017/netbase-1_5.0-r0/do_package_write_ipk'

ERROR: Logfile of failure stored in: /build/tmp/work/all-oe-linux/netbase/netbase-1_5.0-r1/temp/log.do_package_write_ipk.27140
ERROR: Task 13 (/build/openembedded-core/meta/recipes-core/netbase/netbase_5.0.bb, do_package_write_ipk) failed with exit code '1'

 meta/recipes-core/netbase/netbase_5.0.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-core/netbase/netbase_5.0.bb
index 03fdc38..673a139 100644
--- a/meta/recipes-core/netbase/netbase_5.0.bb
+++ b/meta/recipes-core/netbase/netbase_5.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/netbase"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
@@ -13,6 +13,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
 SRC_URI[md5sum] = "a379d9199d44d817543eddc211a29b70"
 SRC_URI[sha256sum] = "ac9424d3cb2bd3c07b6c5bc5875c434d3bc687a73cd7c54b7dc7122308afa9dc"
 
+inherit allarch
+
 do_install () {
 	install -d ${D}/${mandir}/man8 ${D}${sysconfdir}
 	install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
-- 
1.7.10.4



