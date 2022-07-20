Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9304DC43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 16:08:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.56219.1658333337013350572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 09:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 075861570;
	Wed, 20 Jul 2022 09:08:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F55F3F766;
	Wed, 20 Jul 2022 09:08:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] perf: fix reproduciblity in older releases of Linux
Date: Wed, 20 Jul 2022 17:08:52 +0100
Message-Id: <20220720160852.1840005-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 16:08:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168369

If you build perf from Linux 5.4 it still contains buildpaths (pointing
to the sysroot's Python) as the existing fixes don't apply to the lines
in that old release.

Add further expressions to remove the final buildpaths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/perf/perf.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
index 603d3f9eeed..95e7eae9fee 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -227,6 +227,9 @@ do_configure:prepend () {
         # reproducible.
         sed -i -e 's,$(call get-executable-or-default\,PYTHON\,$(PYTHON_=
AUTO)),$(notdir $(call get-executable-or-default\,PYTHON\,$(PYTHON_AUTO))=
),g' \
             ${S}/tools/perf/Makefile.config
+        # The same line is in older releases, but looking explicitly for=
 Python 2
+        sed -i -e 's,$(call get-executable-or-default\,PYTHON\,$(PYTHON2=
)),$(notdir $(call get-executable-or-default\,PYTHON\,$(PYTHON2))),g' \
+            ${S}/tools/perf/Makefile.config
=20
 	# likewise with this substitution. Kernels with commit 18f2967418d031a3=
9
 	# [perf tools: Use Python devtools for version autodetection rather tha=
n runtime]
--=20
2.34.1


