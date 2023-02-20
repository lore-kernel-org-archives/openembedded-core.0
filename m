Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13964C636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:28:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17761.1676910502334902312
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D72C51BF7;
	Mon, 20 Feb 2023 08:29:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 735173F703;
	Mon, 20 Feb 2023 08:28:21 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] glibc: backport the fix for CVE-2023-25139
Date: Mon, 20 Feb 2023 16:28:17 +0000
Message-Id: <20230220162817.180458-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220162817.180458-1-ross.burton@arm.com>
References: <20230220162817.180458-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 16:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177440

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...r-grouping-in-printf-width-bug-30068.patch | 84 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.37.bb         |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Account-for-groupi=
ng-in-printf-width-bug-30068.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-Account-for-grouping-in-p=
rintf-width-bug-30068.patch b/meta/recipes-core/glibc/glibc/0001-Account-=
for-grouping-in-printf-width-bug-30068.patch
new file mode 100644
index 00000000000..9efd39a9eb4
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-Account-for-grouping-in-printf-w=
idth-bug-30068.patch
@@ -0,0 +1,84 @@
+CVE: CVE-2023-25139
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 07b9521fc6369d000216b96562ff7c0ed32a16c4 Mon Sep 17 00:00:00 2001
+From: Carlos O'Donell <carlos@redhat.com>
+Date: Thu, 19 Jan 2023 12:50:20 +0100
+Subject: [PATCH] Account for grouping in printf width (bug 30068)
+
+This is a partial fix for mishandling of grouping when formatting
+integers.  It properly computes the width in the presence of grouping
+characters when the width is larger than the number of significant
+digits. The precision related issue is documented in bug 23432.
+
+Co-authored-by: Andreas Schwab <schwab@suse.de>
+(cherry picked from commit c980549cc6a1c03c23cc2fe3e7b0fe626a0364b0)
+---
+ stdio-common/Makefile               |  2 ++
+ stdio-common/tst-grouping3.c        | 54 +++++++++++++++++++++++++++++
+ stdio-common/vfprintf-process-arg.c | 22 +++++++++---
+ 3 files changed, 73 insertions(+), 5 deletions(-)
+ create mode 100644 stdio-common/tst-grouping3.c
+
+diff --git a/stdio-common/vfprintf-process-arg.c b/stdio-common/vfprintf=
-process-arg.c
+index 24c9125f9f..8c0fcbcf78 100644
+--- a/stdio-common/vfprintf-process-arg.c
++++ b/stdio-common/vfprintf-process-arg.c
+@@ -186,11 +186,17 @@ LABEL (unsigned_number):      /* Unsigned number o=
f base BASE.  */
+   bool octal_marker =3D (prec <=3D number_length && number.word !=3D 0
+                        && alt && base =3D=3D 8);
+=20
+-  prec =3D MAX (0, prec - (workend - string));
++  /* At this point prec_inc is the additional bytes required for the
++     specificed precision.  It is 0 if the precision would not have
++     required additional bytes i.e. the number of input digits is more
++     than the precision.  It is greater than zero if the precision is
++     more than the number of digits without grouping (precision only
++     considers digits).  */
++  unsigned int prec_inc =3D MAX (0, prec - (workend - string));
+=20
+   if (!left)
+     {
+-      width -=3D number_length + prec;
++      width -=3D number_length + prec_inc;
+=20
+       if (number.word !=3D 0 && alt && (base =3D=3D 16 || base =3D=3D 2=
))
+         /* Account for 0X, 0x, 0B or 0b hex or binary marker.  */
+@@ -221,7 +227,7 @@ LABEL (unsigned_number):      /* Unsigned number of =
base BASE.  */
+           Xprintf_buffer_putc (buf, spec);
+         }
+=20
+-      width +=3D prec;
++      width +=3D prec_inc;
+       Xprintf_buffer_pad (buf, L_('0'), width);
+=20
+       if (octal_marker)
+@@ -237,6 +243,8 @@ LABEL (unsigned_number):      /* Unsigned number of =
base BASE.  */
+     }
+   else
+     {
++      /* Perform left justification adjustments.  */
++
+       if (is_negative)
+         {
+           Xprintf_buffer_putc (buf, L_('-'));
+@@ -263,9 +271,13 @@ LABEL (unsigned_number):      /* Unsigned number of=
 base BASE.  */
+       if (octal_marker)
+ 	--width;
+=20
+-      width -=3D workend - string + prec;
++      /* Adjust the width by subtracting the number of bytes
++         required to represent the number with grouping characters
++	 (NUMBER_LENGTH) and any additional bytes required for
++	 precision.  */
++      width -=3D number_length + prec_inc;
+=20
+-      Xprintf_buffer_pad (buf, L_('0'), prec);
++      Xprintf_buffer_pad (buf, L_('0'), prec_inc);
+=20
+       if (octal_marker)
+         Xprintf_buffer_putc (buf, L_('0'));
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/gl=
ibc/glibc_2.37.bb
index f299a3004a4..e5689e536ad 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -51,6 +51,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
            file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter=
.patch \
            file://0021-fix-create-thread-failed-in-unprivileged-process-=
BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-bi=
nar.patch \
+           file://0001-Account-for-grouping-in-printf-width-bug-30068.pa=
tch \
 "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.34.1


