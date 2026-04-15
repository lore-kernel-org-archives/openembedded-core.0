Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE67F42135
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 18:23:30 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1969.1776277398831654170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=eVSlWCPo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260415182315286b407c8300020716-8imsyg@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260415182315286b407c8300020716
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Apr 2026 20:23:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Th1uPDykidxoD7/IWGj0IOKbngkB7RQ+zkSA8ZuPxaM=;
 b=eVSlWCPotOJucRpcGWSkX6hcOz+KXzySLcDSImju7NACAvBjDVYSlpFb9rSMKx7LxLVOoR
 vc41eZHp2Y+nobDu76vzlhX2jJ9tTYmycN5Bc1Kl9uaLBDVMKEW1WMBF1Nde2cxC4cDnbs9G
 Cj7fi3phGtxKTwC6AbMDH/cg88mozdlJHqNSPTRNd1nNJXH4aG2jExhAGhX4GcUturna5x6+
 bpAVfMDI0f2jTUsOLPlpBnaakIw/+31QMcp5S2p90o3Yk/6AGfo/Hh16NrQTHLy3g0JPtK8d
 k/9HkZXkK4zWTGJdqD/z9deremJHfwUmbtWC49Noo02G0QeImuZSKgmg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] inetutils: patch CVE-2026-32746
Date: Wed, 15 Apr 2026 20:23:11 +0200
Message-ID: <20260415182311.1815613-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 18:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235317

From: Peter Marko <peter.marko@siemens.com>

Pick patch [1] as mentioned in [2].

[1] https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=6864598a29b652a6b69a958f5cd1318aa2b258af
[2] https://security-tracker.debian.org/tracker/CVE-2026-32746

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../inetutils/inetutils/CVE-2026-32746.patch  | 55 +++++++++++++++++++
 .../inetutils/inetutils_2.7.bb                |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
new file mode 100644
index 0000000000..63dd8b8c58
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
@@ -0,0 +1,55 @@
+From 6864598a29b652a6b69a958f5cd1318aa2b258af Mon Sep 17 00:00:00 2001
+From: Collin Funk <collin.funk1@gmail.com>
+Date: Wed, 11 Mar 2026 23:06:46 -0700
+Subject: [PATCH] telnetd: fix stack buffer overflow processing SLC suboption
+ triplets
+
+Previously a client could write past the end of an internal buffer using
+an SLC suboption with many triplets using function octets greater than
+18, possibly leading to remote code execution. Reported by Adiel Sol,
+Arad Inbar, Erez Cohen, Nir Somech, Ben Grinberg, Daniel Lubel at DREAM
+Security Research Team at:
+<https://lists.gnu.org/r/bug-inetutils/2026-03/msg00031.html>.
+
+* telnetd/slc.c (add_slc): Return early if writing the tuple would lead
+us to writing past the end of the buffer.
+* NEWS.md: Mention the fix.
+
+CVE: CVE-2026-32746
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=6864598a29b652a6b69a958f5cd1318aa2b258af]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ NEWS          | 6 ++++++
+ telnetd/slc.c | 3 +++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/NEWS b/NEWS
+index 5fe1e4c5..c03d22f4 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,5 +1,11 @@
+ GNU inetutils NEWS -- history of user-visible changes.
+ 
++** telnetd no longer allows clients to write past the end of a stack
++allocated buffer, possibly leading to remote code execution, using an
++SLC suboption with many triplets using function octets greater than 18.
++Reported by Adiel Sol, Arad Inbar, Erez Cohen, Nir Somech, Ben Grinberg,
++Daniel Lubel at DREAM Security Research Team.
++
+ ** Prevent privilege escalation via telnetd abusing systemd service
+ credentials support added to the login(1) implementation of util-linux
+ in release 2.40.  Reported by Ron Ben Yizhak in
+diff --git a/telnetd/slc.c b/telnetd/slc.c
+index f45e7725..2dfef22f 100644
+--- a/telnetd/slc.c
++++ b/telnetd/slc.c
+@@ -162,6 +162,9 @@ get_slc_defaults (void)
+ void
+ add_slc (char func, char flag, cc_t val)
+ {
++  /* Do nothing if the entire triplet cannot fit in the buffer.  */
++  if (slcbuf + sizeof slcbuf - slcptr <= 6)
++    return;
+ 
+   if ((*slcptr++ = (unsigned char) func) == 0xff)
+     *slcptr++ = 0xff;
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
index e555e318a8..a3b0b20768 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://CVE-2026-24061-01.patch \
            file://CVE-2026-24061-02.patch \
            file://CVE-2026-28372.patch \
+           file://CVE-2026-32746.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo

