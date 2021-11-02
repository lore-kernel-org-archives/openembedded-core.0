Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89A9C43219
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:45:14 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.482.1635871513977062421
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="294769982"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="294769982"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:56 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575263"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:55 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 23/24] meson.bblcass: Remove empty egg-info
 directories before running meson
Date: Wed,  3 Nov 2021 00:44:11 +0800
Message-Id: 
 <0abc761e84ea25a4acc7633eb9b5c8ae73120116.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:45:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157785

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

sstate.bbclass no longer removes empty directories to avoid a race (see
commit 4f94d929 "sstate/staging: Handle directory creation race issue").
Unfortunately Python apparently treats an empty egg-info directory as if
the version it previously contained still exists and fails if a newer
version is required, which Meson does. To avoid this, make sure there
are no empty egg-info directories from previous versions left behind.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 47d9d90b4ec7d04d6f3f1a9b97c0ab7f1264a88e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
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
-- 
2.31.1


