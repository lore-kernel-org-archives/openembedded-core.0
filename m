Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EDAC43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 13:22:01 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web09.72286.1656940916683472468
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 06:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout10.t-online.de (Postfix) with SMTP id 0C35F52BA
	for <openembedded-core@lists.openembedded.org>;
 Mon,  4 Jul 2022 15:21:54 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.44.132]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o8M1R-3BFZ6f0; Mon, 4 Jul 2022 15:21:53 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][kirkstone] python3: Backport patch to fix an issue in
 subinterpreters
Date: Mon,  4 Jul 2022 15:21:41 +0200
Message-Id: <20220704132141.3012042-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1656940913-01432E2F-48C40C2C/0/0 CLEAN NORMAL
X-TOI-MSGID: 9076f22c-43ab-43a6-aace-df104032947c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 13:22:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167606

This adds a backport patch that fixes a problem in subinterpreters relate=
d
to the garbagecollector. Without the patch, there are random segfaults in
several Kodi addons that use python3-sqlite3. Presumably there are real w=
orld
issues in other programs as well.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...h-92036-Fix-gc_fini_untrack-GH-92037.patch | 54 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.10.4.bb |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-92036-Fi=
x-gc_fini_untrack-GH-92037.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fi=
ni_untrack-GH-92037.patch b/meta/recipes-devtools/python/python3/0001-gh-=
92036-Fix-gc_fini_untrack-GH-92037.patch
new file mode 100644
index 0000000000..6a58c35cc6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untr=
ack-GH-92037.patch
@@ -0,0 +1,54 @@
+From 178a238f25ab8aff7689d7a09d66dc1583ecd6cb Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Wed, 4 May 2022 03:23:29 -0700
+Subject: [PATCH 01/40] gh-92036: Fix gc_fini_untrack() (GH-92037)
+
+Fix a crash in subinterpreters related to the garbage collector. When
+a subinterpreter is deleted, untrack all objects tracked by its GC.
+To prevent a crash in deallocator functions expecting objects to be
+tracked by the GC, leak a strong reference to these objects on
+purpose, so they are never deleted and their deallocator functions
+are not called.
+(cherry picked from commit 14243369b5f80613628a565c224bba7fb3fcacd8)
+
+Co-authored-by: Victor Stinner <vstinner@python.org>
+
+Upstream-Status: Backport
+---
+ .../2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst           | 5 +++++
+ Modules/gcmodule.c                                          | 6 ++++++
+ 2 files changed, 11 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-37-=
30.gh-issue-92036.GZJAC9.rst
+
+diff --git a/Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-37-30.gh-i=
ssue-92036.GZJAC9.rst b/Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-=
37-30.gh-issue-92036.GZJAC9.rst
+new file mode 100644
+index 0000000000..78094c5e4f
+--- /dev/null
++++ b/Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-37-30.gh-issue-92=
036.GZJAC9.rst=09
+@@ -0,0 +1,5 @@
++Fix a crash in subinterpreters related to the garbage collector. When a
++subinterpreter is deleted, untrack all objects tracked by its GC. To pr=
event a
++crash in deallocator functions expecting objects to be tracked by the G=
C, leak
++a strong reference to these objects on purpose, so they are never delet=
ed and
++their deallocator functions are not called. Patch by Victor Stinner.
+diff --git a/Modules/gcmodule.c b/Modules/gcmodule.c
+index 805a159d53..43ae6fa98b 100644
+--- a/Modules/gcmodule.c
++++ b/Modules/gcmodule.c
+@@ -2170,6 +2170,12 @@ gc_fini_untrack(PyGC_Head *list)
+     for (gc =3D GC_NEXT(list); gc !=3D list; gc =3D GC_NEXT(list)) {
+         PyObject *op =3D FROM_GC(gc);
+         _PyObject_GC_UNTRACK(op);
++        // gh-92036: If a deallocator function expect the object to be =
tracked
++        // by the GC (ex: func_dealloc()), it can crash if called on an=
 object
++        // which is no longer tracked by the GC. Leak one strong refere=
nce on
++        // purpose so the object is never deleted and its deallocator i=
s not
++        // called.
++        Py_INCREF(op);
+     }
+ }
+=20
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipe=
s-devtools/python/python3_3.10.4.bb
index d678d55083..96dbc43b5b 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.4.bb
@@ -33,6 +33,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patc=
h \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-ma=
ste.patch \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross=
-co.patch \
+           file://0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch \
            "
=20
 SRC_URI:append:class-native =3D " \
--=20
2.25.1


