Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A46C5DF81
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 15:58:20 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16815.1787500698394470038
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 08:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Z2BRDdQM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202608231558166e5b4fe77f0002072f-g_h1ly@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202608231558166e5b4fe77f0002072f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Aug 2026 17:58:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=aiWNDwJFgiT3oBsD3tVx+PBv1LwRnVz9Wjk9wtVHQC4=;
 b=Z2BRDdQMcBUzWTs26/aYsnmvkw80Krxums+A8el+r74nbjBMC+gg4d5xrRwOSiwa56t8a1
 VYQvMlBWviSUKXDAHRizz2xYYodunSSg8xUz9stLc7M4TimrE4z47ZUohuse3xWrFoT1nh2W
 eUbkdgoTrwonndI+8CVtY8jKsePhhFD3n0fKFuJHnuNMxn1QeNA4Nn/gJfWQ/xWYHUWZIXd/
 XoI/wjCwqQ154KZPvV3YvRYFyYcYXAL2khZakgcTA5L6914l2zec24wYuZATM8fZyrx4Hq1Z
 VufPNN8M+d0Q5tKVSCKUHQ1slVGdKHn60UI3T0s/Qbwfrc7KSCD0D3GA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] libslirp: patch CVE-2026-9539
Date: Sun, 23 Aug 2026 17:58:12 +0200
Message-ID: <20260823155812.2092071-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 15:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244042

From: Peter Marko <peter.marko@siemens.com>

Pick patch from NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../slirp/libslirp/CVE-2026-9539.patch        | 122 ++++++++++++++++++
 .../slirp/libslirp_git.bb                     |   5 +-
 2 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/slirp/libslirp/CVE-2026-9539.patch

diff --git a/meta/recipes-connectivity/slirp/libslirp/CVE-2026-9539.patch b/meta/recipes-connectivity/slirp/libslirp/CVE-2026-9539.patch
new file mode 100644
index 00000000000..192d2b4b26f
--- /dev/null
+++ b/meta/recipes-connectivity/slirp/libslirp/CVE-2026-9539.patch
@@ -0,0 +1,122 @@
+From 927bca7344e31fd58e2f7afaca784aad4400eb84 Mon Sep 17 00:00:00 2001
+From: Samuel Thibault <samuel.thibault@ens-lyon.org>
+Date: Sat, 23 May 2026 22:06:59 +0200
+Subject: [PATCH] oob: cap urgent data count to what is actually available
+
+so_urgc is provided by the guest sender, so can arbitrary and beyond
+what we actually have. Worse, this can lead to an sb_cc integer
+underflow leading to leaking gigabytes of data.
+
+Fixes #93
+
+Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
+
+CVE: CVE-2026-9539
+Upstream-Status: Backport [https://gitlab.freedesktop.org/slirp/libslirp/-/commit/927bca7344e31fd58e2f7afaca784aad4400eb84]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/socket.c | 40 +++++++++++++++++++++++-----------------
+ 1 file changed, 23 insertions(+), 17 deletions(-)
+
+diff --git a/src/socket.c b/src/socket.c
+index 77c5cf6..c491d0f 100644
+--- a/src/socket.c
++++ b/src/socket.c
+@@ -337,7 +337,8 @@ int sorecvoob(struct socket *so)
+ int sosendoob(struct socket *so)
+ {
+     struct sbuf *sb = &so->so_rcv;
+-    char buff[2048]; /* XXX Shouldn't be sending more oob data than this */
++    uint32_t urgc = so->so_urgc;
++    char buff[2048];
+ 
+     int n;
+ 
+@@ -345,12 +346,15 @@ int sosendoob(struct socket *so)
+     DEBUG_ARG("so = %p", so);
+     DEBUG_ARG("sb->sb_cc = %d", sb->sb_cc);
+ 
+-    if (so->so_urgc > sizeof(buff))
+-        so->so_urgc = sizeof(buff); /* XXXX */
++    if (urgc > sizeof(buff))
++        urgc = sizeof(buff);
++
++    if (urgc > sb->sb_cc)
++        urgc = sb->sb_cc;
+ 
+     if (sb->sb_rptr < sb->sb_wptr) {
+         /* We can send it directly */
+-        n = slirp_send(so, sb->sb_rptr, so->so_urgc,
++        n = slirp_send(so, sb->sb_rptr, urgc,
+                        (MSG_OOB)); /* |MSG_DONTWAIT)); */
+     } else {
+         /*
+@@ -358,7 +362,6 @@ int sosendoob(struct socket *so)
+          * we must copy all data to a linear buffer then
+          * send it all
+          */
+-        uint32_t urgc = so->so_urgc; /* Amount of room left in buff */
+         int len = (sb->sb_data + sb->sb_datalen) - sb->sb_rptr;
+         if (len > urgc) {
+             len = urgc;
+@@ -403,7 +406,7 @@ int sosendoob(struct socket *so)
+  */
+ int sowrite(struct socket *so)
+ {
+-    int n, nn;
++    int n, nn, noob = 0;
+     struct sbuf *sb = &so->so_rcv;
+     int len = sb->sb_cc;
+     struct iovec iov[2];
+@@ -413,16 +416,20 @@ int sowrite(struct socket *so)
+ 
+     if (so->so_urgc) {
+         uint32_t expected = so->so_urgc;
+-        if (sosendoob(so) < expected) {
+-            /* Treat a short write as a fatal error too,
+-             * rather than continuing on and sending the urgent
+-             * data as if it were non-urgent and leaving the
+-             * so_urgc count wrong.
+-             */
++        int noob = sosendoob(so);
++
++        if (noob <= 0)
+             goto err_disconnected;
+-        }
++
++        if (noob < expected)
++            /* Short write: either we have not yet received all
++             * urgent data, or the socket buffers are full. Leave
++             * it for later when we have data or have room.  */
++            return noob;
++
+         if (sb->sb_cc == 0)
+-            return 0;
++            /* Nothing left to write actually */
++            return noob;
+     }
+ 
+     /*
+@@ -453,12 +460,11 @@ int sowrite(struct socket *so)
+         } else
+             n = 1;
+     }
+-    /* Check if there's urgent data to send, and if so, send it */
+ 
+     nn = slirp_send(so, iov[0].iov_base, iov[0].iov_len, 0);
+     /* This should never happen, but people tell me it does *shrug* */
+     if (nn < 0 && (errno == EAGAIN || errno == EINTR))
+-        return 0;
++        return noob;
+ 
+     if (nn <= 0) {
+         goto err_disconnected;
+@@ -485,7 +491,7 @@ int sowrite(struct socket *so)
+     if ((so->so_state & SS_FWDRAIN) && sb->sb_cc == 0)
+         sofcantsendmore(so);
+ 
+-    return nn;
++    return noob + nn;
+ 
+ err_disconnected:
+     DEBUG_MISC(" --- sowrite disconnected, so->so_state = %x, errno = %d",
diff --git a/meta/recipes-connectivity/slirp/libslirp_git.bb b/meta/recipes-connectivity/slirp/libslirp_git.bb
index 334b786b9b7..820cd6e4f0c 100644
--- a/meta/recipes-connectivity/slirp/libslirp_git.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_git.bb
@@ -4,7 +4,10 @@ HOMEPAGE = "https://gitlab.freedesktop.org/slirp/libslirp"
 LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
 
-SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
+SRC_URI = "\
+    git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master \
+    file://CVE-2026-9539.patch \
+"
 SRCREV = "3ad1710a96678fe79066b1469cead4058713a1d9"
 PV = "4.7.0"
 S = "${WORKDIR}/git"

