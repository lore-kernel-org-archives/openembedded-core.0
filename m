Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2D0C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 10:51:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9155.1664880672793749094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 03:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63CFB12FC;
	Tue,  4 Oct 2022 03:51:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30E663F67D;
	Tue,  4 Oct 2022 03:51:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/5] lsof: upgrade 4.95.0 -> 4.96.3
Date: Tue,  4 Oct 2022 11:51:06 +0100
Message-Id: <20221004105106.1556357-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004105106.1556357-1-ross.burton@arm.com>
References: <20221004105106.1556357-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 10:51:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171385

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...on.patch =3D> remove-host-information.patch} | 68 +++++++++++--------
 .../lsof/{lsof_4.95.0.bb =3D> lsof_4.96.3.bb}   | 11 +--
 2 files changed, 42 insertions(+), 37 deletions(-)
 rename meta/recipes-extended/lsof/files/{lsof-remove-host-information.pa=
tch =3D> remove-host-information.patch} (53%)
 rename meta/recipes-extended/lsof/{lsof_4.95.0.bb =3D> lsof_4.96.3.bb} (=
72%)

diff --git a/meta/recipes-extended/lsof/files/lsof-remove-host-informatio=
n.patch b/meta/recipes-extended/lsof/files/remove-host-information.patch
similarity index 53%
rename from meta/recipes-extended/lsof/files/lsof-remove-host-information=
.patch
rename to meta/recipes-extended/lsof/files/remove-host-information.patch
index 08f083cf83c..fb90366ffa3 100644
--- a/meta/recipes-extended/lsof/files/lsof-remove-host-information.patch
+++ b/meta/recipes-extended/lsof/files/remove-host-information.patch
@@ -1,35 +1,29 @@
-From 4233b5ac1629c225a7a80f33efc0eff527a95851 Mon Sep 17 00:00:00 2001
-From: Li Wang <li.wang@windriver.com>
-Date: Wed, 30 Aug 2017 15:05:16 +0800
-Subject: [PATCH] Remove host information from version.h
+lsof doesn't embed the username or hostname in the build if SOURCE_DATE_=
EPOCH is
+defined, but this still embeds build paths.  Delete all of the host deta=
ils to
+ensure that no host information is leaked into the binary.
=20
-make lsof not include host information
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Li Wang <li.wang@windriver.com>
-
----
- dialects/linux/Makefile | 48 +++++++----------------------------------
- 1 file changed, 8 insertions(+), 40 deletions(-)
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
 diff --git a/dialects/linux/Makefile b/dialects/linux/Makefile
-index 46c83c2..50f03cc 100644
+index 176a4c2..ef5a633 100644
 --- a/dialects/linux/Makefile
 +++ b/dialects/linux/Makefile
-@@ -84,47 +84,15 @@ version.h:	FRC
+@@ -83,64 +83,17 @@ ${LIB}: FRC
+ version.h:	FRC
  	@echo Constructing version.h
  	@rm -f version.h
- 	@echo '#define	LSOF_BLDCMT	"${LSOF_BLDCMT}"' > version.h;
+-	@echo '#define	LSOF_BLDCMT	"${LSOF_BLDCMT}"' > version.h;
 -	@echo '#define	LSOF_CC		"${CC}"' >> version.h
 -	@echo '#define	LSOF_CCV	"${CCV}"' >> version.h
 -	@echo '#define	LSOF_CCFLAGS	"'`echo ${CFLAGS} | sed 's/\\\\(/\\(/g' | =
sed 's/\\\\)/\\)/g' | sed 's/"/\\\\"/g'`'"' >> version.h
-+	@echo '#define	LSOF_CC		""' >> version.h
-+	@echo '#define	LSOF_CCV	""' >> version.h
-+	@echo '#define	LSOF_CCFLAGS	""' >> version.h
- 	@echo '#define	LSOF_CINFO	"${CINFO}"' >> version.h
+-	@echo '#define	LSOF_CINFO	"${CINFO}"' >> version.h
 -	@if [ "X${LSOF_HOST}" =3D "X" ]; then \
--	  echo '#define	LSOF_HOST	"'`uname -n`'"' >> version.h; \
+-	  if [ "X${SOURCE_DATE_EPOCH}" =3D "X" ]; then \
+-	    echo '#define	LSOF_HOST	"'`uname -n`'"' >> version.h; \
+-	  else \
+-	    echo '#define	LSOF_HOST	""' >> version.h; \
+-	  fi \
 -	else \
 -	  if [ "${LSOF_HOST}" =3D "none" ]; then \
 -	    echo '#define	LSOF_HOST	""' >> version.h; \
@@ -39,7 +33,11 @@ index 46c83c2..50f03cc 100644
 -	fi
 -	@echo '#define	LSOF_LDFLAGS	"${CFGL}"' >> version.h
 -	@if [ "X${LSOF_LOGNAME}" =3D "X" ]; then \
--	  echo '#define	LSOF_LOGNAME	"${LOGNAME}"' >> version.h; \
+-	  if [ "X${SOURCE_DATE_EPOCH}" =3D "X" ]; then \
+-	    echo '#define	LSOF_LOGNAME	"${LOGNAME}"' >> version.h; \
+-	  else \
+-	    echo '#define	LSOF_LOGNAME	""' >> version.h; \
+-	  fi \
 -	else \
 -	  if [ "${LSOF_LOGNAME}" =3D "none" ]; then \
 -	    echo '#define	LSOF_LOGNAME	""' >> version.h; \
@@ -48,7 +46,11 @@ index 46c83c2..50f03cc 100644
 -	  fi; \
 -	fi
 -	@if [ "X${LSOF_SYSINFO}" =3D "X" ]; then \
+-	  if [ "X${SOURCE_DATE_EPOCH}" =3D "X" ]; then \
 -	    echo '#define	LSOF_SYSINFO	"'`uname -a`'"' >> version.h; \
+-	  else \
+-	    echo '#define	LSOF_SYSINFO	""' >> version.h; \
+-	  fi \
 -	else \
 -	  if [ "${LSOF_SYSINFO}" =3D "none" ]; then \
 -	    echo '#define	LSOF_SYSINFO	""' >> version.h; \
@@ -57,7 +59,11 @@ index 46c83c2..50f03cc 100644
 -	  fi \
 -	fi
 -	@if [ "X${LSOF_USER}" =3D "X" ]; then \
--	  echo '#define	LSOF_USER	"${USER}"' >> version.h; \
+-	  if [ "X${SOURCE_DATE_EPOCH}" =3D "X" ]; then \
+-	    echo '#define	LSOF_USER	"${USER}"' >> version.h; \
+-	  else \
+-	    echo '#define	LSOF_USER	""' >> version.h; \
+-	  fi \
 -	else \
 -	  if [ "${LSOF_USER}" =3D "none" ]; then \
 -	    echo '#define	LSOF_USER	""' >> version.h; \
@@ -65,11 +71,17 @@ index 46c83c2..50f03cc 100644
 -	    echo '#define	LSOF_USER	"${LSOF_USER}"' >> version.h; \
 -	  fi \
 -	fi
-+	@echo '#define	LSOF_HOST	""' >> version.h;
-+	@echo '#define	LSOF_LDFLAGS	""' >> version.h
-+	@echo '#define	LSOF_LOGNAME	""' >> version.h;
-+	@echo '#define	LSOF_SYSINFO	""' >> version.h;
-+	@echo '#define	LSOF_USER	""' >> version.h;
++
++	@echo '#define	LSOF_BLDCMT	""' > version.h;
++	@echo '#define	LSOF_CC		""' >> version.h
++	@echo '#define	LSOF_CCV	""' >> version.h
++	@echo '#define	LSOF_CCFLAGS	""' >> version.h
++	@echo '#define	LSOF_CINFO	""' >> version.h
++	@echo '#define	LSOF_HOST	""' >> version.h
++	@echo '#define	LSOF_LDFLAGS ""' >> version.h
++	@echo '#define	LSOF_LOGNAME	""' >> version.h
++	@echo '#define	LSOF_SYSINFO	""' >> version.h
++	@echo '#define	LSOF_USER	""' >> version.h
  	@sed '/VN/s/.ds VN \(.*\)/#define	LSOF_VERSION	"\1"/' < version >> ver=
sion.h
 =20
  FRC:
diff --git a/meta/recipes-extended/lsof/lsof_4.95.0.bb b/meta/recipes-ext=
ended/lsof/lsof_4.96.3.bb
similarity index 72%
rename from meta/recipes-extended/lsof/lsof_4.95.0.bb
rename to meta/recipes-extended/lsof/lsof_4.96.3.bb
index f380de0b6b0..c32fcd5583d 100644
--- a/meta/recipes-extended/lsof/lsof_4.95.0.bb
+++ b/meta/recipes-extended/lsof/lsof_4.96.3.bb
@@ -6,16 +6,9 @@ SECTION =3D "devel"
 LICENSE =3D "Spencer-94"
 LIC_FILES_CHKSUM =3D "file://00README;beginline=3D645;endline=3D679;md5=3D=
964df275d26429ba3b39dbb9f205172a"
=20
-# Upstream lsof releases are hosted on an ftp server which times out dow=
nload
-# attempts from hosts for which it can not perform a DNS reverse-lookup =
(See:
-# https://people.freebsd.org/~abe/ ). http://www.mirrorservice.org seems=
 to be
-# the most commonly used alternative.
-
 SRC_URI =3D "git://github.com/lsof-org/lsof;branch=3Dmaster;protocol=3Dh=
ttps \
-           file://lsof-remove-host-information.patch \
-          "
-
-SRCREV =3D "67d8c828e7bdc01ba93f8ff79765dd424da0c9d7"
+           file://remove-host-information.patch"
+SRCREV =3D "eec10fac8f57544e26ff00bf41a2dc09c56049bf"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


