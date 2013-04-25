Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UVHdC-0004xe-3G
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 10:34:29 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3P8GWKL024764
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 01:16:32 -0700 (PDT)
Received: from pek-hjia-d1.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 25 Apr 2013 01:16:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Apr 2013 16:16:23 +0800
Message-ID: <6471223fe7c0d17e2a3209b58f1b1ebdba165a9f.1366802026.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366802026.git.hongxu.jia@windriver.com>
References: <cover.1366802026.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: fix do_compile failed in parallel builds with system's make 3.28
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
X-List-Received-Date: Thu, 25 Apr 2013 08:34:48 -0000
Content-Type: text/plain

The error log:
...
./x86_64-poky-linux-libtool --mode=execute x86_64-poky-linux-objcopy -O binary -j introspect.Target systemd org.freedesktop.systemd1.Target.xml.tmp && \
        x86_64-poky-linux-strings org.freedesktop.systemd1.Target.xml.tmp | gawk -f /buildarea2/hongxujia/build-20130417-systemd-exlusive-multilib/tmp/work/x86_64-poky-linux/systemd/1_199-r5/systemd-199/introspect.awk | \
        x86_64-poky-linux-cpp  --sysroot=/buildarea2/hongxujia/build-20130417-systemd-exlusive-multilib/tmp/sysroots/qemux86-64    -m64 -P -O2 -pipe -g -feliminate-unused-debug-types -I/buildarea2/hongxujia/build-20130417-systemd-exlusive-multilib/tmp/sysroots/qemux86-64/usr/include/dbus-1.0 -I/buildarea2/hongxujia/build-20130417-systemd-exlusive-multilib/tmp/sysroots/qemux86-64/usr/lib/dbus-1.0/include   -imacros dbus/dbus-protocol.h -o org.freedesktop.systemd1.Target.xml - && rm org.freedesktop.systemd1.Target.xml.tmp
x86_64-poky-linux-objcopy: 'systemd': No such file
make[2]: *** [org.freedesktop.systemd1.Manager.xml] Error 1
make[2]: *** Waiting for unfinished jobs....
x86_64-poky-linux-objcopy: 'systemd': No such file
make[2]: *** [org.freedesktop.systemd1.Job.xml] Error 1
x86_64-poky-linux-objcopy: 'systemd': No such file
make[2]: *** [org.freedesktop.systemd1.Unit.xml] Error 1
x86_64-poky-linux-objcopy: 'systemd': No such file
make[2]: *** [org.freedesktop.systemd1.Socket.xml] Error 1
x86_64-poky-linux-objcopy: 'systemd': No such file
make[2]: *** [org.freedesktop.systemd1.Target.xml] Error 1
x86_64-poky-linux-objcopy: 'systemd': No such file
make[2]: *** [org.freedesktop.systemd1.Service.xml] Error 1
x86_64-poky-linux-objcopy: 'systemd': No such file
make[2]: *** [org.freedesktop.systemd1.Timer.xml] Error 1
...

1, The error is about parallel make race, see:
http://savannah.gnu.org/bugs/?30653

2, The system's make 3.28 didn't add patch to fix this defect,
but Yocto's make 3.28 has fixed. See oe-core:
meta/recipes-devtools/make/make-3.82/intermediate-target-bugfix.patch

3, Add `make-native' to systemd's `DEPENDS' to use Yocto's make rather
than system's to compile systemd.

[YOCTO #4410]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/systemd/systemd_199.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 159dfd8..71839c2 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 PROVIDES = "udev"
 
 PE = "1"
-PR = "r3"
+PR = "r4"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 make-native"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
-- 
1.7.10.4



