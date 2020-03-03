Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 978D9619C6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 16:05:19 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id a5so3895999wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 08:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XVov9CzG6d/LET6i3TdQtSFRig4JSvMWJBRIc9vg3Dw=;
	b=TouIs/pYQPmBwAQVJZe8UXeM1HhXVpNyVoeWCsHraKSMxrf13IJwZPR6whfaFu5QEh
	IWiDJyQI5Lb1Qh2GBewIC0tLrB/mtVExwNROthleWqZq28cLoydA7+cFoV7EtnAX35WX
	Nal/F968tI3HAYzrkn8rA19mMwIbdPe6ekndY7uPY3JGXTkBuq5qq8mxPfYqFTZ0/b2Q
	8orcaIdV00O7lFsI+iR6mmjDdfJCr0DPvvJVs/Wy+CcsJhjaG8J2ac/F93saVMtNqIBD
	247F9jXjXlWRAmBv8I+ibxRd0DEbzFfb0kviI+KSCCw4cMlH/JLFTtOfXrbK3eekUx62
	+3Ww==
X-Gm-Message-State: ANhLgQ0n3SsbTj5Ry4UkO2fm0hLcbPuUl8cJ2yj5YA1XZHaP01ANgumc
	Bl31Fx3heDMGv8jK38mkoi3FHoPr
X-Google-Smtp-Source: ADFU+vsRR7VCcc0c4z+fEkVrnmdDwZlTHm9+CDJyQB/vbmDnOwCg50TqHxBfa7VUUyQCd0R/O02PdA==
X-Received: by 2002:a1c:9e10:: with SMTP id h16mr4767642wme.44.1583251517991; 
	Tue, 03 Mar 2020 08:05:17 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e8sm35335861wrr.69.2020.03.03.08.05.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 08:05:17 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2020 16:05:13 +0000
Message-Id: <20200303160513.17645-4-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200303160513.17645-1-git@andred.net>
References: <20200303160513.17645-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 4/4] reproducible: try to ensure reproducible xz archives
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
X-List-Received-Date: Tue, 03 Mar 2020 16:05:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xz suffers from a reproducibility problem when not using multi-
threaded mode:
a) archives are created differently in single- vs multi-threaded
   modes
b) xz will scale down the compression level so as to be able to
   work within any memory limit given to it when being launched
  in single-threaded mode.

Thus, for reproducible xz archives we need to launch xz with
at least two threads.

Add a little sanity test, and error out otherwise, so as to
guarantee no difference due this fact.

Assumptions:
* The thread limit should be set via XZ_THREADS, not via
  modifying XZ_DEFAULTS or XZ_OPTS, or any other way
* The thread limit should not be set to xz's magic value
  zero (0), as that will lead to single-threaded mode on
  single-core systems

This patch here doesn't prevent people from shooting themselves
into the foot by changing XZ_DEFAULTS to change the number
of threads directly, but it's can serve as a hint at least.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/classes/reproducible_build.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 750eb950f2..e07bef87d8 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -35,6 +35,7 @@
 # SOURCE_DATE_EPOCH is set for all tasks that might use it (do_configure, do_compile, do_package, ...)
 
 BUILD_REPRODUCIBLE_BINARIES ??= '1'
+BUILD_REPRODUCIBLE_XZ_ARCHIVES ??= '1'
 inherit ${@oe.utils.ifelse(d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1', 'reproducible_build_simple', '')}
 
 SDE_DIR ="${WORKDIR}/source-date-epoch"
@@ -198,4 +199,8 @@ BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
 python () {
     if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
         d.appendVarFlag("do_unpack", "postfuncs", " do_create_source_date_epoch_stamp")
+
+        if d.getVar('BUILD_REPRODUCIBLE_XZ_ARCHIVES') == '1':
+            if int(d.getVar('XZ_THREADS')) < 2:
+                bb.fatal("Can not build reproducible XZ archives without threading")
 }
-- 
2.23.0.rc1


