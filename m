Return-Path: <johannes.pointner@br-automation.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F49C46CCD
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 10:43:28 +0000 (UTC)
Received: from inet11.abb.com (inet11.abb.com [138.225.1.77])
 by mx.groups.io with SMTP id smtpd.web11.9434.1702982602434989512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 02:43:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: br-automation.com, ip: 138.225.1.77, mailfrom: johannes.pointner@br-automation.com)
Received: from brsmtp01.br-automation.co.at ([10.15.2.36])
	by inet11.abb.com (8.14.7/8.14.7) with ESMTP id 3BJAhG7n030976
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 19 Dec 2023 11:43:17 +0100
Received: from extmail.br-automation.com ([192.168.112.26])
          by brsmtp01.br-automation.co.at (HCL Domino Release 12.0.2FP1)
          with ESMTP id 2023121911431554-197273 ;
          Tue, 19 Dec 2023 11:43:15 +0100 
Received: from ategge3723.brdev.net ([192.168.62.72])
          by extmail.br-automation.com (HCL Domino Build V1202_05192022)
          with ESMTP id 2023121911431636-8934 ;
          Tue, 19 Dec 2023 11:43:16 +0100 
From: johannes.pointner@br-automation.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
        "Johannes Pointner" <johannes.pointner@br-automation.com>
Subject: [PATCH v3] ldconfig-native: Add usrmerge support
Date: Tue, 19 Dec 2023 11:42:19 +0100
Message-ID: <20231219104301.443343-1-johannes.pointner@br-automation.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Build V1202_05192022|May
 19, 2022) at 12/19/2023 11:43:16 AM,Serialize by Router on BRSMTPINTERN2/InternSMTP(Build V1202_05192022|May 19, 2022) at
 12/19/2023 11:43:16 AM,Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release 12.0.2FP1|April
 06, 2023) at 12/19/2023 11:43:15 AM
X-TNEFEvaluated: 1
X-Disclaimed: 64595
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 10:43:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192723

From: Johannes Pointner <johannes.pointner@br-automation.com>

If DISTRO=5FFEATURE usrmerge is enabled, SLIBDIR is just a symlink to LIBDI=
R.
ldconfig-native uses hardcoded paths for SLIBDIR and LIBDIR that are fine f=
or
the not usrmerge case. But if usrmerge is enabled ldconfig-native generates=
 a
ld.so.cache for the target, which is done in rootfs.py, that looks like thi=
s:
236 libs found in cache `/etc/ld.so.cache'
       libzstd.so.1 (libc6) =3D> /lib/libzstd.so.1
       libz.so.1 (libc6) =3D> /lib/libz.so.1
       libxtables.so.12 (libc6) =3D> /lib/libxtables.so.12
       libxslt.so.1 (libc6) =3D> /lib/libxslt.so.1
       libxml2.so.2 (libc6) =3D> /lib/libxml2.so.2

But it should look like this, which it does in case of not usrmerge:
236 libs found in cache `/etc/ld.so.cache'
        libzstd.so.1 (libc6) =3D> /usr/lib/libzstd.so.1
        libz.so.1 (libc6) =3D> /usr/lib/libz.so.1
        libxtables.so.12 (libc6) =3D> /usr/lib/libxtables.so.12
        libxslt.so.1 (libc6) =3D> /usr/lib/libxslt.so.1
        libxml2.so.2 (libc6) =3D> /usr/lib/libxml2.so.2

As this is part of the generated image(target) this breaks for example the
Qt QLibraryInfo paths if Qt is configured 'relocatable' and leads to the is=
sue
that the QtWebEngine can find the QtWebEngineProcess,
Qt WebEngine resources,...
In the case of Qt this issue appears because Qt tries to determine the libr=
ary
locations using dladdr and uses this as base to access QtWebEngineProcess or
Qt Webengine resources.

Therefore don't let ldconfig-native parse SLIBDIR if it is a symlink.

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
v3: enhanced explanation

v2: fixed sendemail.from and enhanced explanation

 .../ldconfig-add-usrmerge-support.patch       | 37 +++++++++++++++++++
 .../glibc/ldconfig-native=5F2.12.1.bb           |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig=
-add-usrmerge-support.patch

diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-add-us=
rmerge-support.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldcon=
fig-add-usrmerge-support.patch
new file mode 100644
index 0000000000..3041d433fd
--- /dev/null
+++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-add-usrmerge-=
support.patch
@@ -0,0 +1,37 @@
+From 6e543f39f6bec6eb2e02eea02029c7f4ec533b66 Mon Sep 17 00:00:00 2001
+From: Johannes Pointner <johannes.pointner@br-automation.com>
+Date: Fri, 1 Dec 2023 11:02:39 +0100
+Subject: [PATCH] ldconfig: add usrmerge support
+
+Check whether SLIBDIR is a symlink, which is the case if usrmerge
+is enabled, and if so, ignore it.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
+---
+ ldconfig.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/ldconfig.c b/ldconfig.c
+index e826410..72ac67b 100644
+--- a/ldconfig.c
++++ b/ldconfig.c
+@@ -1371,10 +1371,16 @@ main (int argc, char **argv)
+=20
+   if (!opt=5Fonly=5Fcline)
+     {
++      struct stat buf;
++      int ret;
+       parse=5Fconf (config=5Ffile, true);
+=20
+       /* Always add the standard search paths.  */
+-      add=5Fsystem=5Fdir (SLIBDIR);
++      /* Check whether SLIBDIR is a symlink, which is the case if usrmerge
++       is enabled, and if so, ignore it. */
++      ret =3D lstat(SLIBDIR ,&buf);
++      if(ret =3D=3D -1 || !S=5FISLNK(buf.st=5Fmode))
++        add=5Fsystem=5Fdir (SLIBDIR);
+       if (strcmp (SLIBDIR, LIBDIR))
+ 	add=5Fsystem=5Fdir (LIBDIR);
+       add=5Fsystem=5Fdir (SLIBDIR32);
diff --git a/meta/recipes-core/glibc/ldconfig-native=5F2.12.1.bb b/meta/rec=
ipes-core/glibc/ldconfig-native=5F2.12.1.bb
index 4db67c3ad4..85fc87257d 100644
--- a/meta/recipes-core/glibc/ldconfig-native=5F2.12.1.bb
+++ b/meta/recipes-core/glibc/ldconfig-native=5F2.12.1.bb
@@ -16,6 +16,7 @@ SRC=5FURI =3D "file://ldconfig-native-2.12.1.tar.bz2 \
            file://add-64-bit-flag-for-ELF64-entries.patch \
            file://no-aux-cache.patch \
            file://add-riscv-support.patch \
+           file://ldconfig-add-usrmerge-support.patch \
 "
=20
=20
--=20
2.43.0



