Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0E570351
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 05:18:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6S5IqFD026313
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jul 2014 22:18:52 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 27 Jul 2014 22:18:51 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jul 2014 01:18:50 -0400
Message-ID: <1406524730-4986-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] pulseaudio: fix CVE-2014-3970
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
X-List-Received-Date: Mon, 28 Jul 2014 05:18:53 -0000
Content-Type: text/plain

From: Shan Hai <shan.hai@windriver.com>

The pa_rtp_recv function in modules/rtp/rtp.c in the module-rtp-recv module
in PulseAudio 5.0 and earlier allows remote attackers to cause a denial of
service (assertion failure and abort) via an empty UDP packet.

Fix it by picking a patch from pulseaudio upstream code.

Signed-off-by: Shan Hai <shan.hai@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../pulseaudio/pulseaudio/CVE-2014-3970.patch      | 52 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_5.0.bb                   |  4 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/CVE-2014-3970.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/CVE-2014-3970.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/CVE-2014-3970.patch
new file mode 100644
index 0000000..d5f33dc
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/CVE-2014-3970.patch
@@ -0,0 +1,52 @@
+Upstream-Status: Backport
+
+commit 26b9d22dd24c17eb118d0205bf7b02b75d435e3c upstream
+
+rtp-recv: fix crash on empty UDP packets (CVE-2014-3970)
+
+On FIONREAD returning 0 bytes, we cannot return success, as the caller
+(rtpoll_work_cb in module-rtp-recv.c) would then try to
+pa_memblock_unref(chunk.memblock) and, because memblock is NULL, trigger
+an assertion.
+
+Also we have to read out the possible empty packet from the socket, so
+that the kernel doesn't tell us again and again about it.
+
+Signed-off-by: Alexander E. Patrakov <patrakov@gmail.com>
+
+diff --git a/src/modules/rtp/rtp.c b/src/modules/rtp/rtp.c
+index 9195493..c45981e 100644
+--- a/src/modules/rtp/rtp.c
++++ b/src/modules/rtp/rtp.c
+@@ -182,8 +182,29 @@ int pa_rtp_recv(pa_rtp_context *c, pa_memchunk *chunk, pa_mempool *pool, struct
+         goto fail;
+     }
+ 
+-    if (size <= 0)
+-        return 0;
++    if (size <= 0) {
++        /* size can be 0 due to any of the following reasons:
++         *
++         * 1. Somebody sent us a perfectly valid zero-length UDP packet.
++         * 2. Somebody sent us a UDP packet with a bad CRC.
++         *
++         * It is unknown whether size can actually be less than zero.
++         *
++         * In the first case, the packet has to be read out, otherwise the
++         * kernel will tell us again and again about it, thus preventing
++         * reception of any further packets. So let's just read it out
++         * now and discard it later, when comparing the number of bytes
++         * received (0) with the number of bytes wanted (1, see below).
++         *
++         * In the second case, recvmsg() will fail, thus allowing us to
++         * return the error.
++         *
++         * Just to avoid passing zero-sized memchunks and NULL pointers to
++         * recvmsg(), let's force allocation of at least one byte by setting
++         * size to 1.
++         */
++        size = 1;
++    }
+ 
+     if (c->memchunk.length < (unsigned) size) {
+         size_t l;
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb
index 8d8c421..99f0ef3 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb
@@ -2,7 +2,9 @@ require pulseaudio.inc
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
            file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch \
-           file://volatiles.04_pulse"
+           file://volatiles.04_pulse \
+           file://CVE-2014-3970.patch \
+"
 SRC_URI[md5sum] = "c43749838612f4860465e83ed62ca38e"
 SRC_URI[sha256sum] = "99c13a8b1249ddbd724f195579df79484e9af6418cecf6a15f003a7f36caf939"
 
-- 
2.0.0


