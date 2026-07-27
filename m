Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CB9C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 12:15:20 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29746.1785154516259245379
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 05:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AONJki8a;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7781; q=dns/txt;
  s=iport01; t=1785154516; x=1786364116;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=8STJZMHi9Ad88Ku1S1i5lRpTXgxiGYwUqSP85o5DASw=;
  b=AONJki8amInZLBs5J/yxnejcHK5FOsUVr8qPE7QZ5dEU3IeY6PXeJsdx
   xq19dWEK0BAt3lESHlf1A0VgUkCdDiR5CrLoNkzHsm/xE9qO0j6FG38DK
   g0S8tWpH3hwLeJC2QeYv5yG+dsuL79DwbJK4xFLwUtDBwZIXTaFgI2Xzm
   EFPhX3IycjiwDw8mI1nzaHP9JLJhy8MJkCkqnp9XzA/EtXX0DpaBZ2p0T
   D4t2CFWw4gElY/c2X1hdZiZM1njDkpZb45Yn2tcxNSHQ7U3lyQ1Wc8OIu
   R1BQDPNzbhL4NTDGqTs/K8ck64PftjhaTRXi4RDLqeZ/N6beF8vB4CiXX
   A==;
X-CSE-ConnectionGUID: ATIKlkv5SciFPJhWbbG74g==
X-CSE-MsgGUID: jRSCVG1KRwKkeAzL5+DnRg==
X-IPAS-Result: =?us-ascii?q?A0AaAABnSmdq/5D/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0X0JJjHKHN4IhA4ETnQiBfg8BAQEPRA0EAQGFBQKNYAImNAkOA?=
 =?us-ascii?q?QIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLARgBG?=
 =?us-ascii?q?yIcAwECLysjCBABCIMCAYJ0AxEGxAeBeTOBAYMoAT8CAkABUNsuAQsUAYE4A?=
 =?us-ascii?q?YU+iCBcGAGEfCcbG4FygRWCc3aBBYFcAQOBRoZdBIIigQyBWh6QSEiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgSx5hFgjHwM5f4EvdUp3L?=
 =?us-ascii?q?WoSF4Emg0sCgVADCxgNSBEsNxQZBD5uB413I4JAMUoTASkCggMvHKVRoRIKK?=
 =?us-ascii?q?IN1jCGVOhozqmwLmH2OCpU2gRqEaYFoPIFHCwdwFYMiCUoZD44tCwuFX4MUw?=
 =?us-ascii?q?nw8NQIBCDIBAQcCBw4DC4FokAItgU8BAQ?=
IronPort-Data: A9a23:I/MRNawdJTGFqyeV95B6t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkUPy
 mBNXG6POq6OazTxfYwgYNzipBwOuJXVy9A2HQNspFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYraD1MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGgKHK4c+fgqOmpP2
 8Q6KA8HZD/c2+3jldpXSsE07igiBNPgMIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cP3WjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwaYeJI43bFJ49ckCwp
 Fj91FrWWzIgK/+cxBOX1i/vqun1knauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEp994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:0tYCSKq7r1KGhWNZvvHqksEaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:JrJ1lm8YOHmIJ625hHWVv2coO+MhcWOA93zRDXeaCVljQpLKFVDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AECQd3w22kKBOr4Gqv480vtKYYjUj4Z6VI34iyLY?=
 =?us-ascii?q?8pOqHOAViH2reoDKNTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,188,1779148800"; 
   d="scan'208";a="515419993"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Jul 2026 12:15:07 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 6118018000FB1
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 12:15:01 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 7D02CCC037D; Mon, 27 Jul 2026 17:44:59 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 6/6] glib-2.0: fix CVE-2026-58015
Date: Mon, 27 Jul 2026 17:44:44 +0530
Message-Id: <20260727121444.3158996-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260715172330.1149253-6-deeratho@cisco.com>
References: <20260715172330.1149253-6-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 12:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242093

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.88.1 stable backports [1] and [2] for
CVE-2026-58015. The main fix [1] validates the SHA-1 cookie context,
and the helper fix [2] tightens cookie ID parsing before keyring lookup.

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/db9c8fae398b0c457e660ce63dd5afec8993046a
[2] https://gitlab.gnome.org/GNOME/glib/-/commit/c0531125344bb25fd66ffb7435ed6c285de09aeb
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-58015

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Added the GLib stable helper commit which tightens cookie ID validation
  before keyring lookup.

 .../glib-2.0/glib-2.0/CVE-2026-58015_p1.patch | 97 +++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2026-58015_p2.patch | 54 +++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  2 +
 3 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p1.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p2.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p1.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p1.patch
new file mode 100644
index 0000000000..50517f23b2
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p1.patch
@@ -0,0 +1,97 @@
+From db9c8fae398b0c457e660ce63dd5afec8993046a Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 28 Apr 2026 15:47:30 +0100
+Subject: [PATCH] gdbusauthmechanismsha1: Validate cookie context
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Without validation, the server could send a malicious context which
+contains path traversal characters, allowing it to exfiltrate a SHA-1
+hashed copy of arbitrary data from the client's file system.
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
+index c8aa08977c..7f348d862d 100644
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
+@@ -1198,6 +1199,34 @@ mechanism_client_initiate (GDBusAuthMechanism   *mechanism,
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
+@@ -1232,6 +1261,14 @@ mechanism_client_data_receive (GDBusAuthMechanism   *mechanism,
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
+--
+GitLab
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p2.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p2.patch
new file mode 100644
index 0000000000..dd814e192d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p2.patch
@@ -0,0 +1,54 @@
+From c0531125344bb25fd66ffb7435ed6c285de09aeb Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 28 Apr 2026 15:49:54 +0100
+Subject: [PATCH] gdbusauthmechanismsha1: Improve validation of cookie ID
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The D-Bus specification says the cookie ID has to be non-negative, but
+we weren't checking that (or checking that it was non-empty).
+
+CVE: CVE-2026-58015
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/c0531125344bb25fd66ffb7435ed6c285de09aeb]
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit c0531125344bb25fd66ffb7435ed6c285de09aeb)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ gio/gdbusauthmechanismsha1.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gio/gdbusauthmechanismsha1.c b/gio/gdbusauthmechanismsha1.c
+index 7f348d862d..3c17f81a19 100644
+--- a/gio/gdbusauthmechanismsha1.c
++++ b/gio/gdbusauthmechanismsha1.c
+@@ -1234,7 +1234,7 @@ mechanism_client_data_receive (GDBusAuthMechanism   *mechanism,
+   GDBusAuthMechanismSha1 *m = G_DBUS_AUTH_MECHANISM_SHA1 (mechanism);
+   gchar **tokens;
+   const gchar *cookie_context;
+-  guint cookie_id;
++  int64_t cookie_id;
+   const gchar *server_challenge;
+   gchar *client_challenge;
+   gchar *endp;
+@@ -1269,7 +1269,7 @@ mechanism_client_data_receive (GDBusAuthMechanism   *mechanism,
+     }
+
+   cookie_id = g_ascii_strtoll (tokens[1], &endp, 10);
+-  if (*endp != '\0')
++  if (*endp != '\0' || endp == tokens[1] || cookie_id < 0 || cookie_id > UINT32_MAX)
+     {
+       g_free (m->priv->reject_reason);
+       m->priv->reject_reason = g_strdup_printf ("Malformed cookie_id '%s'", tokens[1]);
+@@ -1279,7 +1279,7 @@ mechanism_client_data_receive (GDBusAuthMechanism   *mechanism,
+   server_challenge = tokens[2];
+
+   error = NULL;
+-  cookie = keyring_lookup_entry (cookie_context, cookie_id, &error);
++  cookie = keyring_lookup_entry (cookie_context, (unsigned int) cookie_id, &error);
+   if (cookie == NULL)
+     {
+       g_free (m->priv->reject_reason);
+--
+GitLab
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index e15aa1fe20..c2feff8988 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -54,6 +54,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-58012.patch \
            file://CVE-2026-58013.patch \
            file://CVE-2026-58014.patch \
+           file://CVE-2026-58015_p1.patch \
+           file://CVE-2026-58015_p2.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.35.6

