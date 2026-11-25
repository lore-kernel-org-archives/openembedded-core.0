Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2155.1795642598575885169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 13:36:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lZ26myOq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026112521363648865bf92a0002072d-ybeswj@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026112521363648865bf92a0002072d
        for <openembedded-core@lists.openembedded.org>;
        Wed, 25 Nov 2026 22:36:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=M1dCxRtXn5T4ANelv4u0TbZzS6VdQot6M2xOM6lHHKM=;
 b=lZ26myOqVHPRxIu073qZnfXExF5dNlAKe/Oot9yObH+laHawo+CT5KovIgx1m5jltmBpu2
 6hM1rWYUsNCCMpiJbTeNbZMGmJQn5URztnSCI3bLLiEP5duYGzpi0/N4935lr6o3jFTL7p1/
 +kVsT5EW6aBc6DKKoCwFVVYO8tVaMq7cRGwNelsBIVFAY9Fp0L1QChSz8Nsg6YeurEUWgAAp
 Ko+JU1Fz0N4nJ0GGpsOe1zYs8REOiD73otHZKQt0a7F+8bsJKWtD7arMlz2OoG0NgJ9loxCt
 S8yFusg1IagXr1kaZqUTdawA0JZfSagFd+y2yB3u3OV5R1k5OLzlLgsw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] inetutils: patch CVE-2026-95510
Date: Wed, 25 Nov 2026 22:35:58 +0100
Message-ID: <20261125213558.3584807-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 21:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251258
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../inetutils/inetutils/CVE-2026-95510.patch  | 40 +++++++++++++++++++
 .../inetutils/inetutils_2.5.bb                |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-95510.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-95510.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-95510.patch
new file mode 100644
index 00000000000..9160b0b618c
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-95510.patch
@@ -0,0 +1,40 @@
+From f756321da9b964fc27fc43652b73913117883047 Mon Sep 17 00:00:00 2001
+From: Brian Mak <brian.mak@hpe.com>
+Date: Mon, 14 Sep 2026 15:44:23 -0700
+Subject: [PATCH] libinetutils: zero-initialize sigactions and sigvecs
+
+This commit fixes CVE-2026-95510.
+
+* libinetutils/setsig.c (setsig): Initialize the siactions and sigvecs
+to zero.
+Copyright-paperwork-exempt: Yes
+
+CVE: CVE-2026-95510
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=f756321da9b964fc27fc43652b73913117883047]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libinetutils/setsig.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libinetutils/setsig.c b/libinetutils/setsig.c
+index de7fa7a5..29c6980e 100644
+--- a/libinetutils/setsig.c
++++ b/libinetutils/setsig.c
+@@ -30,7 +30,7 @@ sighandler_t
+ setsig (int sig, sighandler_t handler)
+ {
+ #ifdef HAVE_SIGACTION
+-  struct sigaction sa, osa;
++  struct sigaction sa = { 0 }, osa = { 0 };
+   sigemptyset (&sa.sa_mask);
+   sigemptyset (&osa.sa_mask);
+ # ifdef SA_RESTART
+@@ -42,7 +42,7 @@ setsig (int sig, sighandler_t handler)
+   return osa.sa_handler;
+ #else /* !HAVE_SIGACTION */
+ # ifdef HAVE_SIGVEC
+-  struct sigvec sv, osv;
++  struct sigvec sv = { 0 }, osv = { 0 };
+   sigemptyset (&sv.sv_mask);
+   sigemptyset (&osv.sv_mask);
+   sv.sv_handler = handler;
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
index 2e1d2a30d7a..4b11dc1a996 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://CVE-2026-28372.patch \
            file://CVE-2026-32746.patch \
            file://CVE-2026-32772.patch \
+           file://CVE-2026-95510.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo
