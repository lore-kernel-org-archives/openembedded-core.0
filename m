Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C3E2C19F32
	for <webhook@archiver.kernel.org>; Sun,  2 Mar 2025 16:51:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.33741.1740934309254537669
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Mar 2025 08:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eqYV9X6Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-439a331d981so33798105e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Mar 2025 08:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740934307; x=1741539107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MrY1gwy6YTGtCNPPAyHNQ8vLjk+GWAGqCPmwcxLb7KA=;
        b=eqYV9X6QS4L4xEvo9z+GHCuQ93T6gdkynnm2i/M50+PTYWRHiH64JEsl3TjGS1NP/A
         /iq+XPFc8foboveGKRxmKilYLB5wRdOIMPjc5ed77ECwjcQXYCMvoioGVKsio9uvPSEh
         2Y2NeIRwZI4mOYk9McvpuiUN3OAsoiuDIIVxr5NwN0pPvrt4ivFwDOWVtx41QeJ0kqIo
         OeIltBuXte6XBtuVlGMB5pMNHmMW2N18wgoAxvvvqw3kgQEl+ZHCxTVI0Mg839l969z/
         WyGOxZk23c/AhcW1r78cPLaCtOHDbL+1fDAvJIB6ZxKcX1vs3iA1a2wvJaX75rPG4iKE
         SwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740934307; x=1741539107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrY1gwy6YTGtCNPPAyHNQ8vLjk+GWAGqCPmwcxLb7KA=;
        b=JOTyHb6IS9CaIri3LFqrmS5uGcrb03Yn4QMyrxRgxKihitlCXh/tZvU1wVOr+uVI8c
         lQf9Ek5mg6bE3DEphW8yONDTDgSaw/sX2j1lpoc0R51HGcW0ATxdswbtxgTcbk6SD8lw
         9vSg0+dhVX9+9WGea/8nVp7bhG34fMP6vOlVg7kY1FMs+RkDzgxWUJQSRjfYy4vkvivE
         6uvsa+L4Naol2vWtGFwX2C/HqR8nDWy0GEPS74VR6X2kgP4ZQwpSOyZy7ocaq2zykL68
         IQbVqr9Y9CAuipajotWoyFTP6amz15Uw66pSkhM8LH9dHN68MbKfgV7KsrN+Xh4sGkff
         wzPg==
X-Gm-Message-State: AOJu0YzXXPihg61rZO8dThpybfl0nBmaf5JzbUzo6Zpotd0SnXifPMer
	AeuqUSt5odfykqxX9vTohfB5PzkZFssnrrqLRNidOU4kgRD2FBE5fGZr2aZ6
X-Gm-Gg: ASbGncuctf90mONvIHq3liPLyv0FGHcK8rRHEDTIj5FOb1LpyFuLAPdciJMHyw63lim
	I98owo401aJ4dp+5VyLknvReltao61ijF/Lbt+IE/5Qa/E007QPNgI1d9K+bieqN5JcYlalhOsh
	F1vtQUBv0/h1AOclVyRRnzhgQog4h1N+Dsh16aIxSdfNsZa3BBU3ywe+dhImhEe3cjn9N2piN7Y
	MNF+WMvCxfWzV2QMrYX6rEhFBdzPRqlHhuRqM06ccpE++ESHI6MUc34PSjs0YTIUIXOtEeeYrUH
	dOUeSDRB3Nt1xDn3Xa3USdCjSkc79ungq2sXq28XVsPBABmn2c2KKBZGC3IP6vhzQxDT45Ksg8X
	FH2Go6ltD4ZZM
X-Google-Smtp-Source: AGHT+IHuJvNsZav6WOegMBuVfs5NFhsgq6iWb0E2TT3QwGjzHhgS+WHpYI7O6gG2Qecu0tJZKmSPKg==
X-Received: by 2002:a05:600c:44d6:b0:43b:c0fa:f9c9 with SMTP id 5b1f17b1804b1-43bc0fb002cmr6483345e9.7.1740934306853;
        Sun, 02 Mar 2025 08:51:46 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d906sm11937616f8f.90.2025.03.02.08.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 08:51:46 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2] boost: Use PN/BPN for naming of packages
Date: Sun,  2 Mar 2025 16:50:55 +0000
Message-Id: <20250302165054.242017-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Mar 2025 16:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212194

Rework the anon Python so that it doesn't expect to find non-MLPREFIXed FILES
overrides which are then mapped into MLPREFIXed versions, this allows the
apparent hardcoding of boost-{test,serialization} to be written more naturally
(and is significantly less surprising).

With this, and a change to lookup ${BPN} when generating split package names,
generating an explicitly versioned boost package (e.g. "boost-1.82") alongside
the main boost package ("boost") can be done by copying/renaming the older
recipe. This is useful when upstream code hasn't yet been ported to newer
boost and an older version is required.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 77105aa1fa13..32bd1f7f89fa 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -42,6 +42,9 @@ BOOST_LIBS = "\
 	type_erasure \
 	url \
 	wave \
+	${@bb.utils.filter('PACKAGECONFIG', 'locale python', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', 'graph_parallel', 'graph_parallel mpi', \
+			     bb.utils.filter('PACKAGECONFIG', 'mpi', d), d)} \
 	"
 
 # optional libraries
@@ -51,12 +54,6 @@ PACKAGECONFIG[graph_parallel] = ",,,boost-mpi mpich"
 PACKAGECONFIG[mpi] = ",,mpich"
 PACKAGECONFIG[python] = ",,python3"
 
-BOOST_LIBS += "\
-    ${@bb.utils.filter('PACKAGECONFIG', 'locale python', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'graph_parallel', 'graph_parallel mpi', \
-                         bb.utils.filter('PACKAGECONFIG', 'mpi', d), d)} \
-"
-
 inherit python3-dir
 PYTHON_ROOT = "${STAGING_DIR_HOST}/${prefix}"
 
@@ -69,14 +66,12 @@ python __anonymous () {
     mlprefix = d.getVar("MLPREFIX")
     for lib in d.getVar('BOOST_LIBS').split():
         extras.append("--with-%s" % lib)
-        pkg = "boost-%s" % (lib.replace("_", "-"))
+        pkg = "%s-%s" % (d.getVar("BPN"), lib.replace("_", "-"))
         if "-native" in pn:
             pkg = pkg + "-native"
         packages.append(mlprefix + pkg)
-        if not d.getVar("FILES:%s" % pkg):
+        if not d.getVar("FILES:%s%s" % (mlprefix, pkg)):
                 d.setVar("FILES:%s%s" % (mlprefix, pkg), "${libdir}/libboost_%s*.so.*" % lib)
-        else:
-                d.setVar("FILES:%s%s" % (mlprefix, pkg), d.getVar("FILES:%s" % pkg))
 
     d.setVar("BOOST_PACKAGES", " ".join(packages))
     d.setVar("BJAM_EXTRA", " ".join(extras))
@@ -86,9 +81,9 @@ python __anonymous () {
 FILES:${PN}-graph_parallel = "${libdir}/libboost_graph_parallel.so.*"
 FILES:${PN}-locale = "${libdir}/libboost_locale.so.*"
 FILES:${PN}-mpi = "${libdir}/mpi.so ${libdir}/libboost_mpi*.so.*"
-FILES:boost-serialization = "${libdir}/libboost_serialization*.so.* \
+FILES:${PN}-serialization = "${libdir}/libboost_serialization*.so.* \
 	${libdir}/libboost_wserialization*.so.*"
-FILES:boost-test = "${libdir}/libboost_prg_exec_monitor*.so.* \
+FILES:${PN}-test = "${libdir}/libboost_prg_exec_monitor*.so.* \
 	${libdir}/libboost_unit_test_framework*.so.*"
 
 # -dev last to pick up the remaining stuff

