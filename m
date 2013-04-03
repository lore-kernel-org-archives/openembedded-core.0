Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UNS17-0002QB-W3
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 20:02:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r33HjQWY020063
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Apr 2013 10:45:26 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 3 Apr 2013 10:45:24 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Apr 2013 12:47:30 -0500
Message-ID: <1365011250-24355-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] Enable additional kernel parameters for syslinux
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
X-List-Received-Date: Wed, 03 Apr 2013 18:02:38 -0000
Content-Type: text/plain

From: Konrad Scherer <Konrad.Scherer@windriver.com>

Add additional parameter 'SYSLINUX_KERNEL_ARGS' in order to allow
for specific kernel parameters to be set when using syslinux.

Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/syslinux.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 0b90eab..1eca4f8 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -13,6 +13,7 @@
 # ${SYSLINUX_OPTS} - additional options to add to the syslinux file ';' delimited
 # ${SYSLINUX_SPLASH} - A background for the vga boot menu if using the boot menu
 # ${SYSLINUX_SERIAL} - Set an alternate serial port or turn off serial with empty string
+# ${SYSLINUX_KERNEL_ARGS} - Add additional kernel arguments
 
 do_bootimg[depends] += "syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot"
@@ -150,6 +151,10 @@ python build_syslinux_cfg () {
         for btype in btypes:
             cfgfile.write('LABEL %s%s\nKERNEL /vmlinuz\n' % (btype[0], label))
 
+            exargs = d.getVar('SYSLINUX_KERNEL_ARGS', True)
+            if exargs:
+                btype[1] += " " + exargs
+
             append = localdata.getVar('APPEND', True)
             initrd = localdata.getVar('INITRD', True)
 
-- 
1.8.1.2.545.g2f19ada



