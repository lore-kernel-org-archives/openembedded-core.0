Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46522C04E69
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:25:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21894.1691684699319442751
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E34FD75;
	Thu, 10 Aug 2023 09:25:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E33F3F793;
	Thu, 10 Aug 2023 09:24:58 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 7/9] gi-docgen: depend on qemu-usermode MACHINE_FEATURES
Date: Thu, 10 Aug 2023 17:24:49 +0100
Message-Id: <20230810162451.1766532-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810162451.1766532-1-ross.burton@arm.com>
References: <20230810162451.1766532-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185808

From: Ross Burton <ross.burton@arm.com>

gi-docgen uses GObject Introspection, so depends on qemu-usermode working=
.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/gi-docgen.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/gi-docgen.bbclass b/meta/classes-recipe/=
gi-docgen.bbclass
index b4d7b177610..b178d1c3877 100644
--- a/meta/classes-recipe/gi-docgen.bbclass
+++ b/meta/classes-recipe/gi-docgen.bbclass
@@ -8,9 +8,10 @@
 # seems to be a successor to gtk-doc:
 # https://gitlab.gnome.org/GNOME/gi-docgen
=20
-# This variable is set to True if api-documentation and
-# gobject-introspection-data are in DISTRO_FEATURES, False otherwise.
-GIDOCGEN_ENABLED ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'api-docu=
mentation gobject-introspection-data', 'True', 'False', d)}"
+# True if api-documentation and gobject-introspection-data are in DISTRO=
_FEATURES,
+# and qemu-user is in MACHINE_FEATURES, False otherwise.
+GIDOCGEN_ENABLED ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'api-docu=
mentation gobject-introspection-data', \
+                      bb.utils.contains('MACHINE_FEATURES', 'qemu-usermo=
de', 'True', 'False', d), 'False', d)}"
=20
 # When building native recipes, disable gi-docgen, as it is not necessar=
y,
 # pulls in additional dependencies, and makes build times longer
--=20
2.34.1


