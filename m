Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TbQmR-0005mK-7C
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 08:01:00 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAM6kp84018842
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2012 22:46:51 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 21 Nov 2012 22:46:50 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Nov 2012 14:46:43 +0800
Message-ID: <6ef7001b467caa7cebe92e399a94a9680265efb8.1353564658.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1353564658.git.jackie.huang@windriver.com>
References: <cover.1353564658.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, Shiqun.Lin@windriver.com
Subject: [PATCH 1/2] pulseaudio: fix compilation on RHEL-5.8 64bit machine
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
X-List-Received-Date: Thu, 22 Nov 2012 07:01:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This fixes the following issue when pulseaudio is built
with the oe-core toolchain:

../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRGetOutputInfo'
../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRGetScreenResourcesCurrent'
../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRFreeOutputInfo'
../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRFreeScreenResources'
../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRGetOutputPrimary'
../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRFreeCrtcInfo'
../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRGetCrtcInfo'
   collect2: ld returned 1 exit status

Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...ulseaudio-fix-compilation-on-RHEL-machine.patch |   35 ++++++++++++++++++++
 .../pulseaudio/pulseaudio_2.1.bb                   |    6 ++-
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-fix-compilation-on-RHEL-machine.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-fix-compilation-on-RHEL-machine.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-fix-compilation-on-RHEL-machine.patch
new file mode 100644
index 0000000..4630dea
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-fix-compilation-on-RHEL-machine.patch
@@ -0,0 +1,35 @@
+commit da81efa600ca7f5657ee4cb877e405fdfc6eee24
+Author: Aws Ismail <aws.ismail@windriver.com>
+Date:   Wed Aug 15 16:34:52 2012 +0800
+
+    Fix compilation on RHEL-5.8 64bit machine
+    
+    This fixes the following issue when pulseaudio is built
+    with the oe-core toolchain:
+    
+../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRGetOutputInfo'
+../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRGetScreenResourcesCurrent'
+../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRFreeOutputInfo'
+../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRFreeScreenResources'
+../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRGetOutputPrimary'
+../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRFreeCrtcInfo'
+../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRGetCrtcInfo'
+    collect2: ld returned 1 exit status
+    
+    Upstream-Status: Pending
+    
+    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index e3af12f..58dad5e 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -51,7 +51,7 @@ AM_CFLAGS = \
+ SERVER_CFLAGS = -D__INCLUDED_FROM_PULSE_AUDIO
+ 
+ AM_LIBADD = $(PTHREAD_LIBS) $(INTLLIBS)
+-AM_LDADD = $(PTHREAD_LIBS) $(INTLLIBS)
++AM_LDADD = $(PTHREAD_LIBS) $(INTLLIBS) -lXrandr
+ AM_LDFLAGS = $(NODELETE_LDFLAGS)
+ 
+ if STATIC_BINS
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index 811dc0f..35137a8 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,13 +1,15 @@
 require pulseaudio.inc
 
-PR = "r14"
+PR = "r15"
 
-DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
+DEPENDS += "libjson gdbm speex libxml-parser-perl-native \
+  ${@base_contains('DISTRO_FEATURES', 'x11', 'libxrandr', '', d)}"
 
 inherit gettext perlnative
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
   file://volatiles.04_pulse \
+  ${@base_contains('DISTRO_FEATURES', 'x11', 'file://pulseaudio-fix-compilation-on-RHEL-machine.patch', '', d)} \
 "
 
 SRC_URI[md5sum] = "33e85023259d530f0a763d5204e8bad9"
-- 
1.7.4



