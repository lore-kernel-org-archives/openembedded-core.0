Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB85C2BA15
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 11:14:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.83498.1718709256220583575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 04:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 730931042
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 04:14:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 61F303F6A8
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 04:14:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] expect: update code for Tcl channel implementation
Date: Tue, 18 Jun 2024 11:14:13 +0000
Message-Id: <20240618111413.2398512-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618111413.2398512-1-ross.burton@arm.com>
References: <20240618111413.2398512-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 11:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200869

Tcl 8.4.0 changed the channel implementation, take a patch submitted
upstream to update the code for the new interface and remove the silencin=
g
of the incompatible assignment error which was due to this issue.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../expect/expect/tcl840.patch                | 27 +++++++++++++++++++
 meta/recipes-devtools/expect/expect_5.45.4.bb |  5 +---
 2 files changed, 28 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/expect/expect/tcl840.patch

diff --git a/meta/recipes-devtools/expect/expect/tcl840.patch b/meta/reci=
pes-devtools/expect/expect/tcl840.patch
new file mode 100644
index 00000000000..8c7b0e7a7f0
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect/tcl840.patch
@@ -0,0 +1,27 @@
+Adjustments for compatibility with the currrent (Tcl 8.4.0+) channel
+implementation.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/expect/patches/24/=
]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/exp_chan.c b/exp_chan.c
+index c92e26b6fbd02305..944200a63b102672 100644
+--- a/exp_chan.c
++++ b/exp_chan.c
+@@ -60,7 +60,7 @@ void			exp_background_channelhandler _ANSI_ARGS_((Clie=
ntData,
+=20
+ Tcl_ChannelType expChannelType =3D {
+     "exp",				/* Type name. */
+-    ExpBlockModeProc,			/* Set blocking/nonblocking mode.*/
++    TCL_CHANNEL_VERSION_2,
+     ExpCloseProc,			/* Close proc. */
+     ExpInputProc,			/* Input proc. */
+     ExpOutputProc,			/* Output proc. */
+@@ -70,6 +70,7 @@ Tcl_ChannelType expChannelType =3D {
+     ExpWatchProc,			/* Initialize notifier. */
+     ExpGetHandleProc,			/* Get OS handles out of channel. */
+     NULL,				/* Close2 proc */
++    ExpBlockModeProc,			/* Set blocking/nonblocking mode.*/
+ };
+=20
+ typedef struct ThreadSpecificData {
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes=
-devtools/expect/expect_5.45.4.bb
index 174b35ec739..461a2c093aa 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -28,6 +28,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/=
${BPN}${PV}.tar.gz \
            file://0001-fixline1-fix-line-1.patch \
            file://0001-Add-prototype-to-function-definitions.patch \
            file://expect-configure-c99.patch \
+           file://tcl840.patch \
            file://run-ptest \
            "
 SRC_URI[md5sum] =3D "00fce8de158422f5ccd2666512329bd2"
@@ -82,7 +83,3 @@ FILES:${PN} +=3D "${libdir}/libexpect${PV}.so \
                "
=20
 BBCLASSEXTEND =3D "native nativesdk"
-
-# http://errors.yoctoproject.org/Errors/Details/766950/
-# expect5.45.4/exp_chan.c:62:5: error: initialization of 'struct Tcl_Cha=
nnelTypeVersion_ *' from incompatible pointer type 'int (*)(void *, int)'=
 [-Wincompatible-pointer-types]
-CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
--=20
2.34.1


