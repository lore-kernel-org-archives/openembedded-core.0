Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094E3CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 15:27:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1226.1762529259245926548
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 07:27:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A4631515
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Nov 2025 07:27:31 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6B19A3F694
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Nov 2025 07:27:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] lib/oe/buildhistory_analysis: sort package lists
Date: Fri,  7 Nov 2025 15:27:30 +0000
Message-ID: <20251107152730.1774081-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107152730.1774081-1-ross.burton@arm.com>
References: <20251107152730.1774081-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 15:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226059

When listing packages that have been added or removed from an image or
SDK, sort the list so that it's easier to read.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/buildhistory_analysis.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhist=
ory_analysis.py
index 2c5f9c6b169..c1d502e89cf 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -13,6 +13,7 @@
 import sys
 import os.path
 import difflib
+import functools
 import git
 import re
 import shlex
@@ -206,6 +207,7 @@ class ChangeRecord:
=20
         return '%s%s' % (prefix, out) if out else ''
=20
+@functools.total_ordering
 class FileChange:
     changetype_add =3D 'A'
     changetype_remove =3D 'R'
@@ -257,6 +259,12 @@ class FileChange:
         else:
             return '%s changed (unknown)' % self.path
=20
+    def __eq__(self, other):
+        return (self.path, self.changetype, self.oldvalue, self.oldvalue=
) =3D=3D (other.path, other.changetype, other.oldvalue, other.oldvalue)
+
+    def __lt__(self, other):
+        return (self.path, self.changetype, self.oldvalue, self.oldvalue=
) < (other.path, other.changetype, other.oldvalue, other.oldvalue)
+
 def blob_to_dict(blob):
     alines =3D [line for line in blob.data_stream.read().decode('utf-8')=
.splitlines()]
     adict =3D {}
@@ -662,7 +670,7 @@ def process_changes(repopath, revision1, revision2=3D=
'HEAD', report_all=3DFalse, rep
                     filechanges =3D compare_lists(alines,blines)
                     if filechanges:
                         chg =3D ChangeRecord(path, filename, None, None,=
 True)
-                        chg.filechanges =3D filechanges
+                        chg.filechanges =3D sorted(filechanges)
                         changes.append(chg)
                 else:
                     chg =3D ChangeRecord(path, filename, d.a_blob.data_s=
tream.read().decode('utf-8'), d.b_blob.data_stream.read().decode('utf-8')=
, True)
@@ -690,7 +698,7 @@ def process_changes(repopath, revision1, revision2=3D=
'HEAD', report_all=3DFalse, rep
                     filechanges =3D compare_lists(alines,blines)
                     if filechanges:
                         chg =3D ChangeRecord(path, filename, None, None,=
 True)
-                        chg.filechanges =3D filechanges
+                        chg.filechanges =3D sorted(filechanges)
                         changes.append(chg)
                 else:
                     chg =3D ChangeRecord(path, filename, d.a_blob.data_s=
tream.read().decode('utf-8'), d.b_blob.data_stream.read().decode('utf-8')=
, True)
--=20
2.43.0


