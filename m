Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071F6C36011
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:13:01 +0000 (UTC)
Received: from cichlid.ash.relay.mailchannels.net (cichlid.ash.relay.mailchannels.net [23.83.222.36])
 by mx.groups.io with SMTP id smtpd.web10.47798.1743412375686100032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=X1aakIsD;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.36, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 983137829BC;
	Mon, 31 Mar 2025 09:12:54 +0000 (UTC)
Received: from uk-fast-smtpout8.hostinger.io (100-125-201-89.trex-nlb.outbound.svc.cluster.local [100.125.201.89])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 873F87829FA;
	Mon, 31 Mar 2025 09:12:53 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1743412374; a=rsa-sha256;
	cv=none;
	b=phtXyBRlq1hHKUrlXslvOQbGAarqoEgz57ydGxCPQougGh80ePb8JcwVQz9/TmtG1/wBXU
	7SIffANxvAdh0UByXWDCC7QBZCj36tdm7VLaHSyMwPC1SlNV0u3p8sDQechEG8y9lpyYTd
	M70J3+wSXxtUI/LUr1lQ/0GBpd7qBG3549p5JKTCFnsXYrhAjN2vFZgWYp4mjIPIxEaeuC
	fMMiKq6737dJ18gGLP0SD7AVWNWYQUBWWH5glG7s2aP0bhCYj+ztxgigzBnlIeKCXTuQ9V
	4ZMwwsJ97A0PIfyPd/CU7TYEUJQU1EKdHA1zsFV/JLKkywJOjKx0hibQNng2wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1743412374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=W2eDq2Hl82RLOOm+ttBvsM4xFwacdLAH4u+dnOmUtOo=;
	b=4GeRlx2AoxrvGisRiU8EndM2vYNPvBDLvJ/mwn0t2ipCMBr8WKmWFLPXKWwoSRFy5hQVvp
	VR5N5nUvGrPbNT5bVwJwcZmhu3aveV53/yTHcup+puTYxRh6IDJoLiKrwjays3JGm3UlsP
	C3HuZkjGgxkhEmq8FaMQtLc+VMbNLt+AjAW9Hos08f3HUzx1AJFtSEqButcKrTRq5OR5vp
	Np85hyfu6f6DQi21yXunHCZ+mIKkBctd6QnQ6MtbyHAtYtG/j1TC3kPb5mNu5NJLWlGAFT
	Kku2SrrORZP2n4wSk7zdndPQM9sZY5DkwlZ/y9nSbxxbRPf3Dtr5lI3ZQAQXrg==
ARC-Authentication-Results: i=1;
	rspamd-7668cf9b8d-dmm98;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Tasty-Callous: 7a9a9936759a2ebd_1743412374498_703423184
X-MC-Loop-Signature: 1743412374497:1661378262
X-MC-Ingress-Time: 1743412374497
Received: from uk-fast-smtpout8.hostinger.io (uk-fast-smtpout8.hostinger.io
 [31.220.23.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.125.201.89 (trex/7.0.2);
	Mon, 31 Mar 2025 09:12:54 +0000
Received: from a8.lan (unknown [IPv6:2001:861:4448:6b00:7a4f:12e0:633c:2779])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ZR54z0wRzzPJWR;
	Mon, 31 Mar 2025 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1743412371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W2eDq2Hl82RLOOm+ttBvsM4xFwacdLAH4u+dnOmUtOo=;
	b=X1aakIsDBxBHy87VBTnipEtNGjmNkcl/dYPXqtYakiVquXKIwh/euWV0QXdmQXeJ66QpnP
	D2qm6ZR1wjWW9jbSpdMW8vmjdgwKnsVuSZECrscIUa71xMNFBkfWQlLopq0u91meqITLSd
	fiyszUlhRHVA7NQqHc8QT3NkqCPox2LVUyZM1Q90jah1S3Txo4z+KpWRJyOirwPXt404yn
	fECSBcq6/sYlMpghgMs0BcnGpif7QMDWDNA+FroHRyzKOqMtK+Kp2XFSYcw01qkkEYek4K
	6PJ3MUH6g+F6Q4KJg8988xCdMBdIvJCOKPLkbPEqsAXxx8Y31SfElxPoSG9Agw==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Peter Marko <peter.marko@siemens.com>,
	Ross Burton <Ross.Burton@arm.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v2] flac: upgrade 1.4.3 -> 1.5.0
Message-ID: <20250331091245.500498-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Date: Mon, 31 Mar 2025 09:12:51 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=IrhMc6/g c=1 sm=1 tr=0 ts=67ea5c93 a=db7wCwZ3UdhLoi5XMkDLFg==:617 a=xqWC_Br6kY4A:10 a=NEAV23lmAAAA:8 a=L2IpWlmwAAAA:8 a=d70CFdQeAAAA:8 a=a_U1oVfrAAAA:8 a=7CQSdrXTAAAA:8 a=IepifISrUMpaiu9HCbQA:9 a=-4oddg63ZTIA:10 a=yxSZtuE-OvTTNxukw10G:22 a=NcxpMcIZDGm-g932nG_k:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-CM-Envelope: MS4xfNs80oKX4KqHFk5/kG/M59a07xgO54MSC0Q5OXxJqF7wa6CUAq2YF/JNAFukSRw9+cyWQ/FfgTFhroDjzEiA8BoW7GzW3GZGYxhQmInVaP+mROX7iIuM uzQ4Rni+4qYF29gOOtYeInu546nCDcDLNLKCRFRRhbO6muKrHIL4d8TmP7p30SIJ+nuvaw23RUham4vflRoLzuB9D9LpyGlIphDJ/+yHppLoeRvCah1LsVdn DbZAfFblKFJ3uNF1gTfVBUNJGxpBJ2ZuT01HlKK8oxVD8xyC19IIKrE8wLweICYnf/J2sfsLF0CMhsSP82OsNmnh5xmzkEJPvXHsP3a2/sqW1eNQHz7cyZJt kCT+XcjoXaWtKzoW1GG8THo/RLG+dDmZ5TNXDJViw1Iqso2pAbfm+2dFHf4n3vYzUFaAI+N47CHK/DdpjTcila/OnXu6pA==
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 09:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213956

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

License-Update: GFDL 1.2 -> 1.3, copyright years update

Add patch that fixes a new documentation generation issue in 1.5.0
https://github.com/xiph/flac/pull/824

Remove the check for NASM, no longer used in 1.5.0

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
CC: Peter Marko <peter.marko@siemens.com>
CC: Ross Burton <Ross.Burton@arm.com>
CC: Quentin Schulz <quentin.schulz@cherry.de>

---

Changes in V2:
- Add https://github.com/xiph/flac/pull/824
  to the Upstream-Status line of the included patch.
  Suggested by Quentin Schulz <quentin.schulz@cherry.de>
---
 ...n-replace-modules.html-by-topics.htm.patch | 45 +++++++++++++++++++
 .../flac/{flac_1.4.3.bb =3D> flac_1.5.0.bb}     | 20 +++++----
 2 files changed, 56 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-multimedia/flac/flac/0001-API-documentat=
ion-replace-modules.html-by-topics.htm.patch
 rename meta/recipes-multimedia/flac/{flac_1.4.3.bb =3D> flac_1.5.0.bb} (=
70%)

diff --git a/meta/recipes-multimedia/flac/flac/0001-API-documentation-rep=
lace-modules.html-by-topics.htm.patch b/meta/recipes-multimedia/flac/flac=
/0001-API-documentation-replace-modules.html-by-topics.htm.patch
new file mode 100644
index 0000000000..0e6be8c8d2
--- /dev/null
+++ b/meta/recipes-multimedia/flac/flac/0001-API-documentation-replace-mo=
dules.html-by-topics.htm.patch
@@ -0,0 +1,45 @@
+From 6ad5b6a9ce81383ef75e6f7b88f54d3c29294e63 Mon Sep 17 00:00:00 2001
+From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
+Date: Sat, 15 Mar 2025 11:50:08 +0100
+Subject: [PATCH] API documentation: replace modules.html by topics.html
+
+This fixes the issue reported on
+https://lists.xiph.org/pipermail/flac-dev/2025-February/006696.html
+
+Newer Doxygen versions call what was previously api/modules.html
+api/topics.html instead.
+
+Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
+Suggested-by: Christian Weisgerber <naddy@mips.inka.de>
+Upstream-Status: Submitted [https://github.com/xiph/flac/pull/824]
+---
+ configure.ac       | 2 +-
+ include/FLAC/all.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8eb82320..74295eec 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -296,7 +296,7 @@ if test "x$enable_doxygen_docs" !=3D xfalse ; then
+ fi
+ AM_CONDITIONAL(FLaC__HAS_DOXYGEN, test -n "$DOXYGEN")
+=20
+-if test ! -n "$DOXYGEN" && test -f "$srcdir/doc/FLAC.tag" && test -f "$=
srcdir/doc/api/modules.html" ; then
++if test ! -n "$DOXYGEN" && test -f "$srcdir/doc/FLAC.tag" && test -f "$=
srcdir/doc/api/topics.html" ; then
+ 	HAS_PREBUILT_DOXYGEN=3Dyes
+ fi
+ AM_CONDITIONAL(FLaC__HAS_PREBUILT_DOXYGEN, test "x$HAS_PREBUILT_DOXYGEN=
" =3D xyes)
+diff --git a/include/FLAC/all.h b/include/FLAC/all.h
+index f29aa010..0be26fd7 100644
+--- a/include/FLAC/all.h
++++ b/include/FLAC/all.h
+@@ -102,7 +102,7 @@
+  * \section getting_started Getting Started
+  *
+  * A good starting point for learning the API is to browse through
+- * the <A HREF=3D"modules.html">modules</A>.  Modules are logical
++ * the <A HREF=3D"topics.html">modules</A>.  Modules are logical
+  * groupings of related functions or classes, which correspond roughly
+  * to header files or sections of header files.  Each module includes a
+  * detailed description of the general usage of its functions or
diff --git a/meta/recipes-multimedia/flac/flac_1.4.3.bb b/meta/recipes-mu=
ltimedia/flac/flac_1.5.0.bb
similarity index 70%
rename from meta/recipes-multimedia/flac/flac_1.4.3.bb
rename to meta/recipes-multimedia/flac/flac_1.5.0.bb
index 87b67bee1f..d6df801aec 100644
--- a/meta/recipes-multimedia/flac/flac_1.4.3.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -3,17 +3,20 @@ DESCRIPTION =3D "FLAC stands for Free Lossless Audio Co=
dec, a lossless audio compr
 HOMEPAGE =3D "https://xiph.org/flac/"
 BUGTRACKER =3D "https://github.com/xiph/flac/issues"
 SECTION =3D "libs"
-LICENSE =3D "GFDL-1.2 & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Cla=
use"
-LIC_FILES_CHKSUM =3D "file://COPYING.FDL;md5=3Dad1419ecc56e060eccf8184a8=
7c4285f \
-                    file://src/Makefile.am;beginline=3D1;endline=3D17;md=
5=3Db1dab2704be7f01bfbd9b7f6d5f000a9 \
+LICENSE =3D "GFDL-1.3 & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Cla=
use"
+LIC_FILES_CHKSUM =3D "file://COPYING.FDL;md5=3D802e79e394e372d01e863e3f4=
058cf40 \
+                    file://src/Makefile.am;beginline=3D1;endline=3D17;md=
5=3D9c882153132df8f3a1cb1a8ca1f2350f \
                     file://COPYING.GPL;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263 \
-                    file://src/flac/main.c;beginline=3D1;endline=3D18;md=
5=3D23099119c034d894bd1bf7ef5bd22101 \
+                    file://src/flac/main.c;beginline=3D1;endline=3D18;md=
5=3D1e826b5083ba1e028852fe7ceec6a8ad \
                     file://COPYING.LGPL;md5=3Dfbc093901857fcd118f065f900=
982c24 \
-                    file://COPYING.Xiph;md5=3D0c90e41ab2fa7e69ca9391330d=
870221 \
-                    file://include/FLAC/all.h;beginline=3D65;endline=3D7=
0;md5=3D39aaf5e03c7364363884c8b8ddda8eea"
+                    file://COPYING.Xiph;md5=3D78a131b2ea50675d245d280ccc=
34f8b6 \
+                    file://include/FLAC/all.h;beginline=3D65;endline=3D7=
0;md5=3D39aaf5e03c7364363884c8b8ddda8eea \
+                    "
=20
-SRC_URI =3D "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
-SRC_URI[sha256sum] =3D "6c58e69cd22348f441b861092b825e591d0b822e106de6eb=
0ee4d05d27205b70"
+SRC_URI =3D "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
+           file://0001-API-documentation-replace-modules.html-by-topics.=
htm.patch"
+
+SRC_URI[sha256sum] =3D "f2c1c76592a82ffff8413ba3c4a1299b6c7ab06c734dee03=
fd88630485c2b920"
=20
 CVE_PRODUCT =3D "libflac flac"
=20
@@ -21,7 +24,6 @@ inherit autotools gettext
=20
 EXTRA_OECONF =3D "--disable-oggtest \
                 --without-libiconv-prefix \
-                ac_cv_prog_NASM=3D"" \
                 "
=20
 PACKAGECONFIG ??=3D " \

