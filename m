Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F90C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:22:31 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.378.1784136142789221291
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JvXEHhEV;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4730; q=dns/txt;
  s=iport01; t=1784136142; x=1785345742;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SVfnwGZLVjnuRrTU95nZWYr960traIeb6xJew49BbDc=;
  b=JvXEHhEVj3lTCXq8Sneal46GAaVE6v0FCvyr5UzI6x1Q9XIZc7Cvsj2I
   IrWrzfY93Prfpultyj97cJiNtw85QnQuwKImwD+zEruCYoneXh8PlR2O4
   fcr9BQPoxRSCFTSb7SIyx7/sm7mew40vLcgyzwLUIAM2cD369R31xeOek
   Mdk58gwq8UfJJR07iwCsSdLIgR+dt3AX6mJI7xLDFTGstRjVGxvpSHMYK
   8Qg2QY++tylZPxqTXibnW73D8Q9Ry2eommHoMvbv6Z28liZlL9xxGMi+B
   811OwKmFLcuiW8xUAQVbz3wZbnhP/ZTNC0mmKpe3CN3RnFxnM992tcK2O
   Q==;
X-CSE-ConnectionGUID: TzO/Sx20TWmkMpYQimwYNA==
X-CSE-MsgGUID: A0qb3UjuR2yAZc3mZVPwuA==
X-IPAS-Result: =?us-ascii?q?A0BLAgCFwFdq/4v/Ja1aHgEBCxIMggULgld0X0JJhFePU?=
 =?us-ascii?q?oIhA4ETnQiBfg8BAQEPRA0EAQGFBQKNUQImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAyMECwE0IhwDAQIDAiYCAisjCBABC?=
 =?us-ascii?q?IMCAYJ0AxEGvRd6fzOBAYNoAgJAAVDbLgEFBhQBgQouhT+DHQGFAlwYAYR8J?=
 =?us-ascii?q?xsbgXKBFYJzdoEFgVwBA4FGg3OCagSCIoEMgVqQFkiBAhwDWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XNFgbBwWBHYFQgQKEdiMfAzl/gTB1SnctahIXgVGCF?=
 =?us-ascii?q?IEYAwsYDUgRLDcUGwQ9AW4HjUklgj8xXQEpAoIDLxylUaESCiiDdYwhlToaM?=
 =?us-ascii?q?6psC5h9jgqVNoEahGmBaDyBRwsHcBWDIlMZD44tCwuFX4MUyS88NQIJMgEBB?=
 =?us-ascii?q?wIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:8cu6JaLJUGVmOFz0FE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS3jABy
 TYeCmuEM/qINjbxL95yaYiz90xSu5OBzYAxSAod+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGcpajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1SHmZxBp1CotpIBGJr7
 c0hKTUSXzaq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBV7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2N0Wojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeG1boKNJIbQLSlTtm/Av
 2idwmbkOEsLHe6Ukj+3zEqzm8aayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1zfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:i3X9dqDtV1t3EBHlHemO55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AT4dx0Gh1dL5LkWrrKuY8X5WHyzJuTm/6i0zAeRe?=
 =?us-ascii?q?ENmNqbaWkcF6V55JCup87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AmzlCnA3TbZ6NQRm9eQ3n6WlOMDUjyvy3Ahswk4g?=
 =?us-ascii?q?84ditBycrPgWjtCuqa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="510600622"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:22:21 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 889B91800020D
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:22:21 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id A98E8CC037D; Wed, 15 Jul 2026 22:52:19 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 6/6] glib-2.0: Fix CVE-2026-58015
Date: Wed, 15 Jul 2026 22:51:42 +0530
Message-Id: <20260715172142.1146263-6-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260715172142.1146263-1-deeratho@cisco.com>
References: <20260715172142.1146263-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241025

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.88.1 backport for
CVE-2026-58015. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/db9c8fae398b0c457e660ce63dd5afec8993046a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58015

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../glib-2.0/files/CVE-2026-58015.patch       | 95 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58015.patch

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58015.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-58015.patch
new file mode 100644
index 0000000000..25a7f3428b
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58015.patch
@@ -0,0 +1,95 @@
+From 95ab8e4641a7bd9562872214af9335023c030aed Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 28 Apr 2026 15:47:30 +0100
+Subject: [PATCH] gdbusauthmechanismsha1: Validate cookie context
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Without validation, the server could send a malicious context which
+contains path traversal characters, allowing it to exfiltrate a SHA-1
+hashed copy of arbitrary data from the client’s file system.
+
+To exploit this successfully would require the client to choose to
+connect peer-to-peer to a malicious D-Bus server and to choose the SHA-1
+authentication mechanism in preference to all the other mechanisms. This
+is vanishingly unlikely.
+
+Fixes: #3931
+
+CVE: CVE-2026-58015
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/db9c8fae398b0c457e660ce63dd5afec8993046a]
+
+Backport Changes:
+- Added <stdint.h> include because the target branch does not otherwise
+  expose uint8_t used by the upstream validation code during native builds.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit db9c8fae398b0c457e660ce63dd5afec8993046a)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ gio/gdbusauthmechanismsha1.c | 37 +++++++++++++++++++++++++++++++++++++
+ 1 file changed, 37 insertions(+)
+
+diff --git a/gio/gdbusauthmechanismsha1.c b/gio/gdbusauthmechanismsha1.c
+index c8aa089..7f348d8 100644
+--- a/gio/gdbusauthmechanismsha1.c
++++ b/gio/gdbusauthmechanismsha1.c
+@@ -22,6 +22,7 @@
+ 
+ #include "config.h"
+ 
++#include <stdint.h>
+ #include <string.h>
+ #include <fcntl.h>
+ #include <errno.h>
+@@ -1198,6 +1198,34 @@ mechanism_client_initiate (GDBusAuthMechanism   *mechanism,
+   return initial_response;
+ }
+ 
++/* Context names must be valid ASCII, nonzero length, and may not contain the
++ * characters slash ("/"), backslash ("\"), space (" "), newline ("\n"),
++ * carriage return ("\r"), tab ("\t"), or period (".").
++ *
++ * See https://dbus.freedesktop.org/doc/dbus-specification.html#auth-mechanisms-sha */
++static gboolean
++validate_cookie_context (const char *cookie_context)
++{
++  size_t i = 0;
++
++  g_return_val_if_fail (cookie_context != NULL, FALSE);
++
++  for (i = 0; cookie_context[i] != '\0'; i++)
++    {
++      if ((uint8_t) cookie_context[i] >= 128 ||
++          cookie_context[i] == '/' ||
++          cookie_context[i] == '\\' ||
++          cookie_context[i] == ' ' ||
++          cookie_context[i] == '\n' ||
++          cookie_context[i] == '\r' ||
++          cookie_context[i] == '\t' ||
++          cookie_context[i] == '.')
++        return FALSE;
++    }
++
++  return (i > 0);
++}
++
+ static void
+ mechanism_client_data_receive (GDBusAuthMechanism   *mechanism,
+                                const gchar          *data,
+@@ -1232,6 +1260,14 @@ mechanism_client_data_receive (GDBusAuthMechanism   *mechanism,
+     }
+ 
+   cookie_context = tokens[0];
++  if (!validate_cookie_context (tokens[0]))
++    {
++      g_free (m->priv->reject_reason);
++      m->priv->reject_reason = g_strdup_printf ("Malformed cookie_context '%s'", tokens[0]);
++      m->priv->state = G_DBUS_AUTH_MECHANISM_STATE_REJECTED;
++      goto out;
++    }
++
+   cookie_id = g_ascii_strtoll (tokens[1], &endp, 10);
+   if (*endp != '\0')
+     {
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 018e6e55fb..ec7a26c2a9 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -238,6 +238,7 @@ SRC_URI += "\
            file://CVE-2026-58012.patch \
            file://CVE-2026-58013.patch \
            file://CVE-2026-58014.patch \
+           file://CVE-2026-58015.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.35.6


