Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F46C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 05:10:43 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web09.24368.1643260217446113039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 21:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=KZtOSdo6;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643260242; x=1674796242;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2KUhSM/GpN/jsi91YxijxsGr7P2dCYlN7AFQj/0ThSY=;
  b=KZtOSdo6t+bqyDd45jJbyc3dLdsVq9VKRUx0yhKYoyVt8vucRqbOR2RI
   csE3HtVkFFHi+LUl6lUEJxK6QsvN8+PEzel6ttiypN4SgpwTzxC0dC52z
   Xt91/bUy5a9r6U13Ct1h/D6hdIn6DpFkPf9KNMuQdvDmMn5yBXPfj6wwh
   9asaqLx+CBNDxNPfoS/QcQSR2hmhwcsYlnxD0se+CX2+8I0i2MzDWBK2+
   Kd/cwhMl0+rUj19UNj4OzumP0URgltQeObsys6FENlQyGxVRIpw4Ak93q
   9YI7fMeMWY1Hk3ZdnA5v9z6T0inXXEYvB0fEmSP0HvQb2JlXsj02AcdFl
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="245590386"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="245590386"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="618209069"
Received: from huiyinkx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.134.201])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:40 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 15/17] expat: fix CVE-2021-46143
Date: Thu, 27 Jan 2022 13:10:08 +0800
Message-Id: 
 <babe185972eb71058762ca20c349ba2651d0f73d.1643259953.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643259953.git.anuj.mittal@intel.com>
References: <cover.1643259953.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 05:10:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161018

From: Steve Sakoman <steve@sakoman.com>

In doProlog in xmlparse.c in Expat (aka libexpat) before 2.4.3, an
integer overflow exists for m_groupSize.

Backport patch from:
https://github.com/libexpat/libexpat/pull/538/commits/85ae9a2d7d0e9358f356b33977b842df8ebaec2b

CVE: CVE-2021-46143
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 41a65d27e4ecdc11977e2944d8af2f51c48f32ec)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../expat/expat/CVE-2021-46143.patch          | 43 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.10.bb       |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2021-46143.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2021-46143.patch b/meta/recipes-core/expat/expat/CVE-2021-46143.patch
new file mode 100644
index 0000000000..d6bafba0ff
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2021-46143.patch
@@ -0,0 +1,43 @@
+From 85ae9a2d7d0e9358f356b33977b842df8ebaec2b Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 25 Dec 2021 20:52:08 +0100
+Subject: [PATCH] lib: Prevent integer overflow on m_groupSize in function
+ doProlog (CVE-2021-46143)
+
+---
+ expat/lib/xmlparse.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index b47c31b0..8f243126 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5046,6 +5046,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       if (parser->m_prologState.level >= parser->m_groupSize) {
+         if (parser->m_groupSize) {
+           {
++            /* Detect and prevent integer overflow */
++            if (parser->m_groupSize > (unsigned int)(-1) / 2u) {
++              return XML_ERROR_NO_MEMORY;
++            }
++
+             char *const new_connector = (char *)REALLOC(
+                 parser, parser->m_groupConnector, parser->m_groupSize *= 2);
+             if (new_connector == NULL) {
+@@ -5056,6 +5061,16 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           }
+ 
+           if (dtd->scaffIndex) {
++            /* Detect and prevent integer overflow.
++             * The preprocessor guard addresses the "always false" warning
++             * from -Wtype-limits on platforms where
++             * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
++#if UINT_MAX >= SIZE_MAX
++            if (parser->m_groupSize > (size_t)(-1) / sizeof(int)) {
++              return XML_ERROR_NO_MEMORY;
++            }
++#endif
++
+             int *const new_scaff_index = (int *)REALLOC(
+                 parser, dtd->scaffIndex, parser->m_groupSize * sizeof(int));
+             if (new_scaff_index == NULL)
diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/expat/expat_2.2.10.bb
index 7a892b0304..e5415361d8 100644
--- a/meta/recipes-core/expat/expat_2.2.10.bb
+++ b/meta/recipes-core/expat/expat_2.2.10.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 	   file://0001-Add-output-of-tests-result.patch \
            file://CVE-2022-22822-27.patch \
            file://CVE-2021-45960.patch \
+           file://CVE-2021-46143.patch \
 	  "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.34.1


