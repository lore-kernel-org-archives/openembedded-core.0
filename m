Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 21FBD71DB2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:52:44 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id 203so33947908ith.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=wOtOAKiiIqQkm1k9g8S7nUsyy2i0QNNWqy4uwtwzdMY=;
	b=e08DvWqW5yTOmbKqfTM8qxY36XT+f35I9opfJHlhz+0MeFPgzXqAgC65yOWUZCbyD9
	3uVHTzy4AJK9SxB/b+2z3MtbfPEkwxT4SuJCp36DGd1MWRaGqmpC9aBrwtNuY6sghLEn
	PXPQI8nGd2+qsOgy5c7fza/6V3Z21xkrSuOUW/6scn5HB8zslmuP82V0SQIfY87/jrZG
	2xOn0mZPNpIdY2nyoG28okQwbqAaFVRZKQ47mepBl604S9X/uOxfmq9Kj5AAHdSmB+do
	99xrk5OvPnF7CYxd4TUek69yzia9ekqnniABGCZkboMhcUxIImH1NuC9RGoqs+k6bWoA
	Serg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=wOtOAKiiIqQkm1k9g8S7nUsyy2i0QNNWqy4uwtwzdMY=;
	b=FstwARK88s/5wxr/oSKDUYFyLyL2r0qqL3HihWeJcBVfowE/kX1u551P+eCBHgedQQ
	gMPKVQXHo/BCHrTvAoJOGFXNKp5nPpY7ebLc+AMMrIv8rE6ZlxaBmjLz+zwLyW7Z9zsU
	4hYmdQHQl4JXC6MRrkwiHrJIUO5hGHEtpXtKyvpGjScPi26l0HEFDT/AqaNVr+M1GQrO
	+cKT4qYYd7Blre5xgAqrG7oOk4pC7zoG0KfElgAiJOExNXd920O/XuJiEIUOLyAK542y
	V9nwvAJ66NwllU86FqWStz83IT2T3f0+6jZ5r4qrkKFyWwTxYmcqMZhOjBPdADeRZh67
	2QDw==
X-Gm-Message-State: AIkVDXLjXX5bBcdSwA4MYfrw0KVW6nWApogK0X3MSs5liOJYjyBDYsW0Uww+laqnsR4rse7S
X-Received: by 10.36.48.208 with SMTP id q199mr2969308itq.28.1484319165233;
	Fri, 13 Jan 2017 06:52:45 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56056.dip0.t-ipconnect.de.
	[87.165.96.86]) by smtp.gmail.com with ESMTPSA id
	o138sm989394itc.18.2017.01.13.06.52.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jan 2017 06:52:43 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:52:32 +0100
Message-Id: <08feb6bda643440a1a8c468a09ac7876f7d6d69b.1484318722.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 2/3] rm_work_and_downloads.bbclass: more aggressively minimize disk usage
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
X-List-Received-Date: Fri, 13 Jan 2017 14:52:45 -0000

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
 meta/classes/rm_work_and_downloads.bbclass | 33 +++++++++++++++++++++++-
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
git-series 0.9.1

