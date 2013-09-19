Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 654FF60664
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 10:03:47 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id u57so7525467wes.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 03:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tYk4jWRDULtjLqWpMAdF8fWPQwvxkYX2cX/VVTug6ww=;
	b=mv/MkiWlV/nXOHZmvEU5W9t5ihfPA5TsznCvI281YuwFcdhLM02xlI55pue804D18d
	100GiwjVUKo5h4CsG/dCtHIqbO62f1opwXMbhqA7GmGw0JQpqHJikDaHtvnugUK760QD
	n2I7/hibZsH8fk7Uu7HneO7WjhjxVyPZw652E1Ze28+Wj4JtQKeIs16/w/XLwubDXw4c
	yVHCF/w0PtXF+KjM773CFDqrI7fRyrebWKWvt1OlhYK4yFGsFywfokG0U0C7hv2s01/3
	tPxT64Q+oEzhjo06vLC/bQ2K+MOcwUyG/MhjkCuNzHiZEo0YXn+J1wXwNNKQpHMSgT6c
	edVw==
X-Gm-Message-State: ALoCoQkb80NZ1419wcbcMHwmD8LNSE7B+5iQd9e74Vj8KsK9TZVPp9YJHDTZy9qcalJUYN2I38Py
X-Received: by 10.180.20.13 with SMTP id j13mr685549wie.6.1379585028464;
	Thu, 19 Sep 2013 03:03:48 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id b11sm17597275wik.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 03:03:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2013 11:03:43 +0100
Message-Id: <1379585023-26278-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379585023-26278-1-git-send-email-ross.burton@intel.com>
References: <1379585023-26278-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] insane: don't abort if workdir is not TMPDIR/work
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
X-List-Received-Date: Thu, 19 Sep 2013 10:03:47 -0000

The BASE_WORKDIR variable can be used instead of enforcing WORKDIR being
TMPDIR/work (and aborting the build if it isn't).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 524cdca..a784aff 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -175,10 +175,7 @@ def package_qa_check_rpath(file,name, d, elf, messages):
     if os.path.islink(file):
         return
 
-    bad_dirs = [d.getVar('TMPDIR', True) + "/work", d.getVar('STAGING_DIR_TARGET', True)]
-
-    if not bad_dirs[0] in d.getVar('WORKDIR', True):
-        bb.fatal("This class assumed that WORKDIR is ${TMPDIR}/work... Not doing any check")
+    bad_dirs = [d.getVar('BASE_WORKDIR', True), d.getVar('STAGING_DIR_TARGET', True)]
 
     phdrs = elf.run_objdump("-p", d)
 
-- 
1.7.10.4


