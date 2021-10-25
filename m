Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD6DC433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 14:07:19 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.32620.1635170837606972569
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 07:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=DoAUL0uQ;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635170837;
  x=1666706837;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=h5Pe4dp/zZ0RqqvmbErS4rn8YEnQ5bjJnzDLhIK+Zjg=;
  b=DoAUL0uQ/pP/I0uqxo4BHp+XZkgLDK4pLgFrxun4AVeErPtm6YT+QRgY
   PIPdqLjowjQxC5fiZDsAtE61LR4qSW5a+q/oW7ojjeu0qqs8QobffjH2b
   qPxshQ5zOkUyUUXvN9ANwPe25n3zs5ZqJTrJGuOf31cbIKvMsVnGIYltL
   S43rIJA3GRDPAlsM+tv9d68hOnKLCKje8AB2xReMYt2DAxAJqMRoykwyx
   bUYmoZRO5iBqBzF0U41EQiuTiwQI8rACbewFsjNX6SN/lO6V8OcVWgNl6
   /LSEtEQ6PTcOx2UILxtU1bmu9Iq2khPnJVsvS3cc+KkMlz3QyJCb6Jb/3
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/2] meson.bblcass: Remove empty egg-info directories before
 running meson
Date: Mon, 25 Oct 2021 16:07:13 +0200
Message-ID: <20211025140714.1784-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 14:07:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157340

sstate.bbclass no longer removes empty directories to avoid a race (see
commit 4f94d929 "sstate/staging: Handle directory creation race issue").
Unfortunately Python apparently treats an empty egg-info directory as if
the version it previously contained still exists and fails if a newer
version is required, which Meson does. To avoid this, make sure there
are no empty egg-info directories from previous versions left behind.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Ignore all errors from rmdir since apparently egg-info may be
         files rather than directories.

 meta/classes/meson.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index e124d18144..da58cb4bec 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -103,6 +103,16 @@ meson_do_configure() {
     # https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e59916c18901cde90fa2b3
     unset LD
 
+    # sstate.bbclass no longer removes empty directories to avoid a race (see
+    # commit 4f94d929 "sstate/staging: Handle directory creation race issue").
+    # Unfortunately Python apparently treats an empty egg-info directory as if
+    # the version it previously contained still exists and fails if a newer
+    # version is required, which Meson does. To avoid this, make sure there are
+    # no empty egg-info directories from previous versions left behind. Ignore
+    # all errors from rmdir since the egg-info may be a file rather than a
+    # directory.
+    rmdir ${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/site-packages/*.egg-info 2>/dev/null || :
+
     # Work around "Meson fails if /tmp is mounted with noexec #2972"
     mkdir -p "${B}/meson-private/tmp"
     export TMPDIR="${B}/meson-private/tmp"

