Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A2BC47DA6
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 13:07:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11047.1704892057206665306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 05:07:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88ED62F4
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 05:08:22 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E8DE3F64C
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 05:07:36 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] util-linux: enable gtk-doc
Date: Wed, 10 Jan 2024 13:07:30 +0000
Message-Id: <20240110130730.3698802-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110130730.3698802-1-ross.burton@arm.com>
References: <20240110130730.3698802-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 13:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193508

From: Ross Burton <ross.burton@arm.com>

Now that we've solved the util-linux - gtk-doc - xmlto - util-linux
dependency loop, we can enable gtk-doc in util-linux.

We explicitly disable it in util-linux-libuuuid as this doesn't have API
documentation.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb | 3 +++
 meta/recipes-core/util-linux/util-linux_2.39.2.bb         | 3 +--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb b/=
meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb
index 5d759aed94b..ec04c1d3843 100644
--- a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb
+++ b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb
@@ -6,7 +6,10 @@ require util-linux.inc
 inherit autotools gettext pkgconfig
=20
 S =3D "${WORKDIR}/util-linux-${PV}"
+
+EXTRA_AUTORECONF +=3D "--exclude=3Dgtkdocize"
 EXTRA_OECONF +=3D "--disable-all-programs --enable-libuuid"
+
 LICENSE =3D "BSD-3-Clause"
=20
 do_install:append() {
diff --git a/meta/recipes-core/util-linux/util-linux_2.39.2.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.39.2.bb
index 8c081674017..9fd3a5f5258 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.2.bb
@@ -1,7 +1,6 @@
 require util-linux.inc
=20
-#gtk-doc is not enabled as it requires xmlto which requires util-linux
-inherit autotools gettext manpages pkgconfig systemd update-alternatives=
 python3-dir bash-completion ptest
+inherit autotools gettext manpages pkgconfig systemd update-alternatives=
 python3-dir bash-completion ptest gtk-doc
 DEPENDS =3D "libcap-ng ncurses virtual/crypt zlib util-linux-libuuid"
=20
 PACKAGES =3D+ "${PN}-swaponoff"
--=20
2.34.1


