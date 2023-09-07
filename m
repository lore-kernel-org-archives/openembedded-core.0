Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BFBEE14DB
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 10:40:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9951.1694083222387541466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 03:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D05E716F3;
	Thu,  7 Sep 2023 03:40:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3D01D3F67D;
	Thu,  7 Sep 2023 03:40:20 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] avahi: handle invalid service types gracefully
Date: Thu,  7 Sep 2023 11:40:18 +0100
Message-Id: <20230907104018.2061312-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 10:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187371

From: Ross Burton <ross.burton@arm.com>

Services which broadcast an invalid service type will cause the browse
to fail. Instead of failing, replace the service type and continue.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/invalid-service.patch         | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/invalid-service=
.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
index 7b0f4907687..4c830cc058d 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -25,6 +25,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-$=
{PV}.tar.gz \
            file://0001-Fix-opening-etc-resolv.conf-error.patch \
            file://handle-hup.patch \
            file://local-ping.patch \
+           file://invalid-service.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/invalid-service.patch =
b/meta/recipes-connectivity/avahi/files/invalid-service.patch
new file mode 100644
index 00000000000..8f188aff2c6
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/invalid-service.patch
@@ -0,0 +1,29 @@
+From 46490e95151d415cd22f02565e530eb5efcef680 Mon Sep 17 00:00:00 2001
+From: Asger Hautop Drewsen <asger@princh.com>
+Date: Mon, 9 Aug 2021 14:25:08 +0200
+Subject: [PATCH] Fix avahi-browse: Invalid service type
+
+Invalid service types will stop the browse from completing, or
+in simple terms "my washing machine stops me from printing".
+
+Upstream-Status: Submitted [https://github.com/lathiat/avahi/pull/472]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ avahi-core/browse-service.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-core/browse-service.c b/avahi-core/browse-service.c
+index 63e0275a..ac3d2ecb 100644
+--- a/avahi-core/browse-service.c
++++ b/avahi-core/browse-service.c
+@@ -103,7 +103,9 @@ AvahiSServiceBrowser *avahi_s_service_browser_prepar=
e(
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_PROTO_VALID(protocol=
), AVAHI_ERR_INVALID_PROTOCOL);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !domain || avahi_is_valid_=
domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags, A=
VAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_=
FLAGS);
+-    AVAHI_CHECK_VALIDITY_RETURN_NULL(server, avahi_is_valid_service_typ=
e_generic(service_type), AVAHI_ERR_INVALID_SERVICE_TYPE);
++
++    if (!avahi_is_valid_service_type_generic(service_type))
++        service_type =3D "_invalid._tcp";
+=20
+     if (!domain)
+         domain =3D server->domain_name;
--=20
2.34.1


