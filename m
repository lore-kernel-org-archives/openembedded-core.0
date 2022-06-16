Return-Path: <Muhammad_Hamza@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94182C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 05:55:01 +0000 (UTC)
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mx.groups.io with SMTP id smtpd.web10.14723.1655358890137249806
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 22:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.129.153, mailfrom: muhammad_hamza@mentor.com)
X-IronPort-AV: E=Sophos;i="5.91,304,1647331200";
   d="scan'208";a="80022531"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 15 Jun 2022 21:54:49 -0800
IronPort-SDR: 
 9IaNfj39MoHbDJcBySMwzKt/enovaiN+cvYcwexjWD7jOkRjD4issvwid44rvSy3TenP6zsGKv
 g7K6b+tUv6m11n0khbEBj9htNX0pA20KfL3LTqbyREyS6sqVQlevzUVSvba+P/aUgA3bpiQY8E
 NytQ+vEPzMFtOzI7V7dJ/VQIJI0HQe5yGK7Tp2s97annMlQ1Wim7HbF0jRbQDVzQRd+Fp298OD
 BktyNuLUgDuc6MDGzVTdffFshdhD5WuFVaw1iGDzApJ0kBPsM72Vu9RiMjEb7l0sL2d1bg99Em
 lI4=
From: Muhammad Hamza <muhammad_hamza@mentor.com>
To: <openembedded-core@lists.openembedded.org>
CC: Muhammad Hamza <muhammad_hamza@mentor.com>, Christopher Larson
	<chris_larson@mentor.com>
Subject: [PATCH v1] glibc-locale: work around host-user-contaminated QA
 failure
Date: Thu, 16 Jun 2022 10:54:14 +0500
Message-ID: <20220616055414.42319-1-muhammad_hamza@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jun 2022 05:55:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166999

Work around long standing periodic host-user-contaminated QA failure by
explicitly correcting the ownership.

See `glibc-locale: Rewrite do_install using install utility instead of cp`
on the oe-core mailing list for discussion. This should be dropped when
a real fix is implemented.

Explicitly disable host-user-contaminated to further work around the
pseudo bug. With pseudo acting up, even if the ownership is correct, it
may well think it is not, so just sidestep the issue until upstream
fixes the root cause.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index b8de7d3192..34c178268b 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -69,6 +69,23 @@ FILES:localedef = "${bindir}/localedef"
 
 LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
 
+# Work around long standing periodic host-user-contaminated QA failure by
+# explicitly correcting the ownership.
+#
+# See `glibc-locale: Rewrite do_install using install utility instead of cp`
+# on the oe-core mailing list for discussion. This should be dropped when
+# a real fix is implemented.
+
+do_prep_locale_tree_append () {
+	chown -R root:root $treedir
+}
+
+# Explicitly disable host-user-contaminated to further work around the
+# pseudo bug. With pseudo acting up, even if the ownership is correct,
+# it may well think it is not, so just sidestep the issue until upstream
+# fixes the root cause.
+ERROR_QA_remove = "host-user-contaminated"
+
 copy_locale_files() {
 	local dir=$1 mode=$2
 
-- 
2.25.1


