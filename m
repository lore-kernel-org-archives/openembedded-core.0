Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id F310F60107
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 09:55:17 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id p127so53235134iop.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 01:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZaF6tYEl2BIEbubTgxzPzXctqEO23tuCt3QRPw/Sz9o=;
	b=HNOt3Jlqy03GqbdFw2+YT3xSWEfmYEh7vyik1N2Lk3PVMvnW8qbejtF3R863XVlh9H
	/yayke6ZfYjYYqzojBCxmGhivb7s3a85/PxthIsagfUOTmkf2xUgIB+x4rH1VWAGPDiZ
	qCfKVfjd1VJIREswc2XlOlxmZVKyDePvVBznqcfJxs5MLAFgiiXwUV1qQ758sN2zhhp/
	XW6YxeaFJ4htM8LM1juLJ3+yGDyppb8BYpbdwqfnML5UKcry9XPIetKZh28DJazA2ENk
	EVJzUpNv2UPzAFs+4q48At1xixTWGePNfsNYU8vBb+13+MrEOmG2ONKlsa4y1JIQiMcp
	2jSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZaF6tYEl2BIEbubTgxzPzXctqEO23tuCt3QRPw/Sz9o=;
	b=atA7M0Jhh/Noumq3/QaNbfjACPygotY5eyS/Kkp0yQ2tbhyVJeslvEJlgZ4OH+6tVQ
	74J2HPIPpgpGHEAK0SGeA4vzoYJ0zclISm0fcP2PK84CjWfFGnBIRvLlG6PImoS98yzz
	aCTN+y+9dRqfPcQgxrM6Iq6aJQ8kbonNHPlDSEmYW88b8pUC0DNNDQVZ45UO+hc8EQLp
	C9SjTuj7WWgJUoCKf9351lAgeFz0IlAb98exNQnfeRnWXwdkiVk2KTEuqUWy1Y6B+B8h
	ngO2hJtW+U23TAFpw1lO/Zlez/5a6xyOUrH1M+zBJ5ys+CZIpBQv4yai0o5SphJArrhz
	6UMg==
X-Gm-Message-State: AIkVDXL/rj0gypSoAARx8ucO6olBKgEm6ydKK2IdPNI41laRXl+ysZLLQajvJcwTu4A0BK7v
X-Received: by 10.107.195.139 with SMTP id t133mr50668336iof.86.1483696517867; 
	Fri, 06 Jan 2017 01:55:17 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8F5BD.dip0.t-ipconnect.de.
	[93.232.245.189]) by smtp.gmail.com with ESMTPSA id
	m128sm1157680itm.16.2017.01.06.01.55.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Jan 2017 01:55:16 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2017 10:55:02 +0100
Message-Id: <8002ec38c29d685bd369fd1d2382298ca33f7b68.1483696378.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1483696378.git.patrick.ohly@intel.com>
References: <cover.1483696378.git.patrick.ohly@intel.com>
Subject: [PATCH 2/3] rm_work_and_downloads.bbclass: more aggressively minimize disk usage
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
X-List-Received-Date: Fri, 06 Jan 2017 09:55:18 -0000

rm_work.bbclass never deletes downloaded files, even if they are not
going to be needed again during the
build. rm_work_and_downloads.bbclass is more aggressive in minimizing
the used disk space during a build, but has other disadvantages:
- sources required by different recipes need to be fetched once per
  recipe, not once per build
- incremental builds do not work reliably because sources get
  removed without ensuring that sources gets fetched again

That makes rm_work_and_downloads.bbclass useful for one-time builds in
a constrained environment (like a CI system), but not for general use.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/rm_work_and_downloads.bbclass | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta/classes/rm_work_and_downloads.bbclass

diff --git a/meta/classes/rm_work_and_downloads.bbclass b/meta/classes/rm_work_and_downloads.bbclass
new file mode 100644
index 0000000..7c00bea
--- /dev/null
+++ b/meta/classes/rm_work_and_downloads.bbclass
@@ -0,0 +1,33 @@
+# Author:       Patrick Ohly <patrick.ohly@intel.com>
+# Copyright:    Copyright (C) 2015 Intel Corporation
+#
+# This file is licensed under the MIT license, see COPYING.MIT in
+# this source distribution for the terms.
+
+# This class is used like rm_work:
+# INHERIT += "rm_work_and_downloads"
+#
+# In addition to removing local build directories of a recipe, it also
+# removes the downloaded source. This is achieved by making the DL_DIR
+# recipe-specific. While reducing disk usage, it increases network usage (for
+# example, compiling the same source for target and host implies downloading
+# the source twice).
+#
+# Because the "do_fetch" task does not get re-run after removing the downloaded
+# sources, this class is also not suitable for incremental builds.
+#
+# Where it works well is in well-connected build environments with limited
+# disk space (like TravisCI).
+
+inherit rm_work
+
+# This would ensure that the existing do_rm_work() removes the downloads,
+# but does not work because some recipes have a circular dependency between
+# WORKDIR and DL_DIR (via ${SRCPV}?).
+# DL_DIR = "${WORKDIR}/downloads"
+
+# Instead go up one level and remove ourself.
+DL_DIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/downloads"
+do_rm_work_append () {
+    rm -rf ${DL_DIR}
+}
-- 
2.1.4


