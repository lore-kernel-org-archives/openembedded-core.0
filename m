Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94665C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 14:11:12 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.8577.1634739071378851983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 07:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=oYVJUQVR;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1634739072;
  x=1666275072;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nB6ez58bhQAcwkbNhfVHLGWBeZ1ymPcJEyQ0VNmtdQ0=;
  b=oYVJUQVRM0a0FVHTOB7jui/itQQcLO8+o2uQuSantrkIvYEBm4/C/Ou3
   sxQrN48XbKqvJdSMGqg6BYZfOhBjTzwuldHddEvlsUdpdCz96t6KRny0f
   NJ4vL8SG4CubjMeeJBfZoA65fzS/8SAzefqRFR0Uhx1AmWg5HCztVXhSR
   eVKuqrxu9+75OaLtiRLvmNbwcqC/8oqttQA2vMaWeUM82Duq0ZQG3iOFN
   M5fqjm+MFPOukUdhDb+PbnMdIpXtU/8/owIIbwON0f0R94RHTy6ejSHHi
   Ygd+2ri43w+K3H9hHjEHOHNBTskFfFohGsWScJ7827trXNYXxLAEjEZ2f
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] meson.bblcass: Remove empty egg-info directories before
 running meson
Date: Wed, 20 Oct 2021 16:11:04 +0200
Message-ID: <20211020141104.27627-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 14:11:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157262

sstate.bbclass no longer removes empty directories to avoid a race (see
commit 4f94d929 "sstate/staging: Handle directory creation race issue").
Unfortunately Python apparently treats an empty egg-info directory as if
the version it previously contained still exists and fails if a newer
version is required, which Meson does. To avoid this, make sure there
are no empty egg-info directories from previous versions left behind.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

RP: This is the solution I came up with regarding our discussion at the
meeting yesterday. With this in place the upgrade to meson 0.59.1 now
went without a hitch.

 meta/classes/meson.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index e124d18144..d07b34fc5e 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -103,6 +103,14 @@ meson_do_configure() {
     # https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e59916c18901cde90fa2b3
     unset LD
 
+    # sstate.bbclass no longer removes empty directories to avoid a race (see
+    # commit 4f94d929 "sstate/staging: Handle directory creation race issue").
+    # Unfortunately Python apparently treats an empty egg-info directory as if
+    # the version it previously contained still exists and fails if a newer
+    # version is required, which Meson does. To avoid this, make sure there are
+    # no empty egg-info directories from previous versions left behind.
+    rmdir --ignore-fail-on-non-empty ${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/site-packages/*.egg-info
+
     # Work around "Meson fails if /tmp is mounted with noexec #2972"
     mkdir -p "${B}/meson-private/tmp"
     export TMPDIR="${B}/meson-private/tmp"

