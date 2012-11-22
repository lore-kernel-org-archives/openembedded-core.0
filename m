Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TbQmT-0005mo-5O
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 08:01:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAM6ktXs009180
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2012 22:46:55 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 21 Nov 2012 22:46:54 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Nov 2012 14:46:44 +0800
Message-ID: <6d176cf5137ef3e9bb4ff3ac701cafbf14911301.1353564658.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1353564658.git.jackie.huang@windriver.com>
References: <cover.1353564658.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, Shiqun.Lin@windriver.com
Subject: [PATCH 2/2] pulseaudio: The audio over Adipts ALC888 audio effect chip on Sabino does not work
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
X-List-Received-Date: Thu, 22 Nov 2012 07:01:03 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

root cause:

the default settings for audio devices are installed by the udev script
90-alsa-restore.rules.  This script is installed into /lib/udev/rules.d,
but a recent change moved the udev files to /usr/lib*, so the alsa script
doesn't get run.

the configure of package pulseaudio set the udev rules default directory to
"/lib/udev/rules.d", while its bb file specifies "${base_libdir}/udev"
as udev rules directory. So the file in "/lib/udev/rules.d" will be missing when
packaging on 64bit platforms.

solution: set parameter "udevrulesdir" to "${libdir}/udev/rules.d" for configure
of pulseaudio

Signed-off-by: Shiqun Lin <Shiqun.Lin@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../pulseaudio/pulseaudio_2.1.bb                   |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index 35137a8..b41addb 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r15"
+PR = "r16"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native \
   ${@base_contains('DISTRO_FEATURES', 'x11', 'libxrandr', '', d)}"
@@ -15,6 +15,9 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.
 SRC_URI[md5sum] = "33e85023259d530f0a763d5204e8bad9"
 SRC_URI[sha256sum] = "ef6b347bf47abfb98080795f1583018ac959b4aeb4df916b879f9e1eaba0ca7f"
 
+EXTRA_OECONF += "--with-udev-rules-dir=${libdir}/udev/rules.d"
+FILES_${PN}-server += " ${libdir}/udev/rules.d/*.rules"
+
 do_compile_prepend() {
     cd ${S}
     mkdir -p ${S}/libltdl
-- 
1.7.4



