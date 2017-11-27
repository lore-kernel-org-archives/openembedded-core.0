Return-Path: <tanuk@iki.fi>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 726307830E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 16:49:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id A476E20C7C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:39:45 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Mon, 27 Nov 2017 11:39:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=mCU0Nb5ia3xAJgi7oqZoYsZ+KcXJLAS/8Nka/Ct1sCY=; b=qXbbKp50
	xXVJwgaZyQfg7VQtdR4OuxSG4er+gW30H2N1IEfCMpixjJZnCfzanzjtZKs4hom+
	WOkVRePF9oQ4PJ3JCaoh80qd1A8w99pVp1Dj6Qrd3jRlBhOXXAssKnij403nXZzt
	HKfCfRdh4z+W9mmOMMirIoPAEVaq4TDguC6EULpGo+zGJ+DiuhN1bUpO+p0JCP6c
	CEybtA02skXBvD+jxiLZTJXN29lGmLd4QtlD590EEAchQbJWEnEx89wJ+VWiibwd
	tzElE+iSgjEHcXLIlGDdM13ftSAeJUH1SeVF9dxhzXl6JAO3JGpht58GxZzDiDib
	3+IHEaS28Kjejw==
X-ME-Sender: <xms:0T8cWsIM4hOPv-SEZNv5jTlbdJvFOs3OIs5LuPGpBIVfag10LbD5AA>
Received: from localhost.localdomain (unknown [192.40.95.17])
	by mail.messagingengine.com (Postfix) with ESMTPA id F316A7F813
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:39:44 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 18:39:29 +0200
Message-Id: <20171127163934.31597-2-tanuk@iki.fi>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171127163934.31597-1-tanuk@iki.fi>
References: <20171127163934.31597-1-tanuk@iki.fi>
Subject: [PATCH 1/6] pulseaudio: 10.0 -> 11.1
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
X-List-Received-Date: Mon, 27 Nov 2017 16:49:10 -0000

11.0 release notes:
https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/11.0/

Additional changes in 11.1:
 * Fix a crash in filter modules related to flat volumes and volume
   sharing
 * Fix a crash when the bluetooth adapter reports weird MTU size
 * Disable bluetooth MTU autodetection by default
 * Add mixer handling back for hardware that doesn't have any alsa-lib
   configuration
 * Prioritize USB devices over built-in sound cards (11.0 was supposed
   to have this feature, but the implementation turned out to be
   incomplete)

Dropped backported patch:
pulseaudio-discuss-iochannel-don-t-use-variable-length-array-in-union.patch

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...-don-t-use-variable-length-array-in-union.patch | 59 ----------------------
 .../{pulseaudio_10.0.bb => pulseaudio_11.1.bb}     |  5 +-
 2 files changed, 2 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-discuss-iochannel-don-t-use-variable-length-array-in-union.patch
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_10.0.bb => pulseaudio_11.1.bb} (61%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-discuss-iochannel-don-t-use-variable-length-array-in-union.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-discuss-iochannel-don-t-use-variable-length-array-in-union.patch
deleted file mode 100644
index 11b56abd26..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-discuss-iochannel-don-t-use-variable-length-array-in-union.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From patchwork Sat Feb  4 12:19:01 2017
-Content-Type: text/plain; charset="utf-8"
-MIME-Version: 1.0
-Content-Transfer-Encoding: 7bit
-Subject: [pulseaudio-discuss] iochannel: don't use variable length array in
- union
-From: Tanu Kaskinen <tanuk@iki.fi>
-X-Patchwork-Id: 136885
-Message-Id: <20170204121901.17428-1-tanuk@iki.fi>
-To: pulseaudio-discuss@lists.freedesktop.org
-Date: Sat,  4 Feb 2017 14:19:01 +0200
-
-Clang didn't like the variable length array:
-
-pulsecore/iochannel.c:358:17: error: fields must have a constant size:
-'variable length array in structure' extension will never be supported
-        uint8_t data[CMSG_SPACE(sizeof(int) * nfd)];
-                ^
-
-Commit 451d1d6762 introduced the variable length array in order to have
-the correct value in msg_controllen. This patch reverts that commit and
-uses a different way to achieve the same goal.
-
-BugLink: https://bugs.freedesktop.org/show_bug.cgi?id=99458
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- src/pulsecore/iochannel.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/src/pulsecore/iochannel.c b/src/pulsecore/iochannel.c
-index 8ace297ff..897337522 100644
---- a/src/pulsecore/iochannel.c
-+++ b/src/pulsecore/iochannel.c
-@@ -355,7 +355,7 @@ ssize_t pa_iochannel_write_with_fds(pa_iochannel*io, const void*data, size_t l,
-     struct iovec iov;
-     union {
-         struct cmsghdr hdr;
--        uint8_t data[CMSG_SPACE(sizeof(int) * nfd)];
-+        uint8_t data[CMSG_SPACE(sizeof(int) * MAX_ANCIL_DATA_FDS)];
-     } cmsg;
- 
-     pa_assert(io);
-@@ -382,7 +382,13 @@ ssize_t pa_iochannel_write_with_fds(pa_iochannel*io, const void*data, size_t l,
-     mh.msg_iov = &iov;
-     mh.msg_iovlen = 1;
-     mh.msg_control = &cmsg;
--    mh.msg_controllen = sizeof(cmsg);
-+
-+    /* If we followed the example on the cmsg man page, we'd use
-+     * sizeof(cmsg.data) here, but if nfd < MAX_ANCIL_DATA_FDS, then the data
-+     * buffer is larger than needed, and the kernel doesn't like it if we set
-+     * msg_controllen to a larger than necessary value. The commit message for
-+     * commit 451d1d6762 contains a longer explanation. */
-+    mh.msg_controllen = CMSG_SPACE(sizeof(int) * nfd);
- 
-     if ((r = sendmsg(io->ofd, &mh, MSG_NOSIGNAL)) >= 0) {
-         io->writable = io->hungup = false;
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb
similarity index 61%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb
index 9a34afaa7e..a50b5a08ae 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb
@@ -3,11 +3,10 @@ require pulseaudio.inc
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-padsp-Make-it-compile-on-musl.patch \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
-           file://pulseaudio-discuss-iochannel-don-t-use-variable-length-array-in-union.patch \
            file://volatiles.04_pulse \
 "
-SRC_URI[md5sum] = "4950d2799bf55ab91f6b7f990b7f0971"
-SRC_URI[sha256sum] = "a3186824de9f0d2095ded5d0d0db0405dc73133983c2fbb37291547e37462f57"
+SRC_URI[md5sum] = "390de38231d5cdd6b43ada8939eb74f1"
+SRC_URI[sha256sum] = "f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e"
 
 do_compile_prepend() {
     mkdir -p ${S}/libltdl
-- 
2.14.2


