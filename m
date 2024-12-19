Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3FCE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 13:54:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.129207.1734616469318330034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 05:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0043F1477
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 05:54:57 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 76B543F7B4
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 05:54:28 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ofono: fix the build when toolchain has old linux headers
Date: Thu, 19 Dec 2024 13:54:23 +0000
Message-ID: <20241219135423.2552265-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 13:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208909

Whilst our default toolchain has modern kernel headers (6.12, at time of
writing), some external toolchains may use old kernel headers.

As ofono's rmnet module uses kernel defines which were added in 5.14,
add some compatibility defines in case they are not set.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../ofono/ofono/rmnet.patch                   | 45 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_2.14.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/rmnet.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/rmnet.patch b/meta/rec=
ipes-connectivity/ofono/ofono/rmnet.patch
new file mode 100644
index 00000000000..11dfd5db183
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/rmnet.patch
@@ -0,0 +1,45 @@
+From git@z Thu Jan  1 00:00:00 1970
+Subject: [PATCH] rmnet: Handle toolchains with old kernel headers
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 19 Dec 2024 13:47:15 +0000
+Message-Id: <e2b6a94dd9a3789e31dafadfc70c53b565d1db04.camel@linuxfoundat=
ion.org>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3D"utf-8"
+Content-Transfer-Encoding: 7bit
+
+The RMNET_FLAGS_*GRESS_MAP_CKSUMV5 defines were added to the kernel in
+5.14[1] and some toolchains use older headers, so add fallback defines
+in case they are needed.
+
+[1] linux b6e5d27e32ef6089d316ce7e1ecaf595584d4b84
+
+Upstream-Status: Submitted [https://lore.kernel.org/ofono/e2b6a94dd9a378=
9e31dafadfc70c53b565d1db04.camel@linuxfoundation.org/T/#u]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/rmnet.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/rmnet.c b/src/rmnet.c
+index 42b03249..9a7f52fb 100644
+--- a/src/rmnet.c
++++ b/src/rmnet.c
+@@ -27,6 +27,16 @@
+ #define MAX_MUX_IDS 254U
+ #define DEFAULT_MTU 1400U
+=20
++/*
++ * These were added in 5.14 so define them here if the toolchain's kern=
el headers are old.
++ */
++#ifndef RMNET_FLAGS_INGRESS_MAP_CKSUMV5
++#define RMNET_FLAGS_INGRESS_MAP_CKSUMV5 (1U << 4)
++#endif
++#ifndef RMNET_FLAGS_EGRESS_MAP_CKSUMV5
++#define RMNET_FLAGS_EGRESS_MAP_CKSUMV5 (1U << 5)
++#endif
++
+ struct rmnet_request {
+ 	uint32_t parent_ifindex;
+ 	rmnet_new_interfaces_func_t new_cb;
+--=20
+2.43.0
+
diff --git a/meta/recipes-connectivity/ofono/ofono_2.14.bb b/meta/recipes=
-connectivity/ofono/ofono_2.14.bb
index 0a695c978c0..5d11d6cb45e 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.14.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.14.bb
@@ -9,6 +9,7 @@ DEPENDS =3D "dbus glib-2.0 udev mobile-broadband-provider=
-info ell"
=20
 SRC_URI =3D "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+    file://rmnet.patch \
     file://ofono \
 "
 SRC_URI[sha256sum] =3D "983cbfd5e1e1a410ba7ad2db7f50fadc91e50b29f1ede40c=
dc73f941da7ba95f"
--=20
2.43.0


