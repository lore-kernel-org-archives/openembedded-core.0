Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0091CC5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 08:57:22 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14735.1786611435794865580
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 01:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MLOn25A6;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=29014; q=dns/txt;
  s=iport01; t=1786611435; x=1787821035;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=QXR83AEILo+IOx8FXYn0Wtajan24YLX/H8F5/7r3DPo=;
  b=MLOn25A6orpKtwLZGA+lEKVz9IAs87wP2+pQusDDou336Ab8X3KGww+/
   NtY+UaVpRBfqTctjtQxxMG84ZgXJ3ST+A2dPwPY8Lc5v60p1ERXqcgRaw
   dukXu2bdj7MkPPzKSScfDRGZDm23MOWL83ADyhcceNgozx1uXnF+Nz9H/
   M8beH9Ks/AKE8s+ASov3gk3j5AhX2chVp9MblY36/MLRlmY2Le2HOdovP
   4e8xUX7uqdDEkVXkXHmbFxvzIjvtiCPRDvPxqurCbF2Q18yx+nKoBxj95
   48HeayA+0vzzs7WxnldLxah6JzE8Rpijcxo9EvTzQLgOJknY0iRky8/O5
   A==;
X-CSE-ConnectionGUID: c6TuMcPwRHWTPLgnfAbdLQ==
X-CSE-MsgGUID: ORztfYW3T6i/eCo8Dre//g==
X-IPAS-Result: =?us-ascii?q?A0AcAAD/hH1q/5X/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0X0JJhFeIG4c3giEDgROQN4xRFIFqDwEBAQ9EDQQBAYISgnMCj?=
 =?us-ascii?q?WgCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECA?=
 =?us-ascii?q?QMaCQQLARgBGyIcAwECAwImAgIrIwgQAQgJgnkBgnQDEQa/Unp/M4EBgygBP?=
 =?us-ascii?q?wICQAFQ2y8BCxQBgQouAYU+gx4BhQJdGAGEfCcbG4FygRWBO4E4doEFgVELA?=
 =?us-ascii?q?QOBIQQhg3OCagSCDRWBDIFaHlCCFYMciyxIgQIcA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+FzVYGwYFgR2BKIQ2Ixk2fIEJYYErKmYSF4EJgiQCgnaBKmECA?=
 =?us-ascii?q?UkHCxgNSBEsNxQZBD0BbgeOJSCCRgEwKQkRBxMBExAGAQEXCYE6Cx4BKAYLE?=
 =?us-ascii?q?ZJvFEuSA4E4njmBIQoog3aMIZU6GjOFW6URC5h9jgqHXI1YAkFZhGmBaDyBR?=
 =?us-ascii?q?wsHcBWDIglKGQ+OLQsLgwKCXYMUxw48NQIBCDIBAQcCBw4DC4FokAACJgeBT?=
 =?us-ascii?q?wEB?=
IronPort-Data: A9a23:SqBGVKplpVzj0FT0lunAFUozn4xeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmGM/yNY2P0ctwka43n80oFv5aAy4MxG1c6qiE8Ei8UpePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8Ug35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0u0pPXxr/
 sQHEhAyUiiniOS46bi3btA506zPLOGzVG8ekmtrwTecCbMtRorOBvyQo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWfrSn8/w7pX7WzFVpUicuaowy2PS1wd2lrPqNbI5f/TXHJUOwhjE+
 T2uE2LRJSsIKNKu9mG5rHPri8TIzQ/hVcVVG+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMpottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:z9iAw6APgb+7CyblHemO55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: 9a23:BxTiOWC6EeVnhJb6EyI5yFMxEfg6SF3i8E/0LEm2IGxlbITAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3Aj584zA0cvu7kEosOg7KiNWo6SzUjxJ68FE48rs4?=
 =?us-ascii?q?65cjDOAd3axuHgXPwTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,221,1779148800"; 
   d="scan'208";a="518346477"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Aug 2026 08:57:14 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id E93B5180001C6
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:57:13 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 11AE0CC037D; Thu, 13 Aug 2026 14:27:12 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v4 6/6] glib-2.0: fix CVE-2026-58015
Date: Thu, 13 Aug 2026 14:27:00 +0530
Message-Id: <20260813085700.839919-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260727121444.3158996-1-deeratho@cisco.com>
References: <20260727121444.3158996-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243339

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream glib-2-88 stable backport chain for
CVE-2026-58015. The issue is in the D-Bus SHA-1 authentication
mechanism, where a malicious peer could provide an unchecked cookie
context and cause the client to access unintended files while resolving
the cookie challenge.

Backport the upstream GLib fix chain from the glib-2-88 stable branch:
- db9c8fae398b validates cookie_context before keyring lookup. This is
the primary security fix for CVE-2026-58015 [1].
- c0531125344b tightens cookie ID parsing so empty, negative, and
out-of-range values are rejected. This hardens the same SHA-1 cookie
challenge parser and is covered by the upstream regression test [2].
- 060aea67de75 exposes the private client reject-reason vfunc. This is
test-support plumbing required by the upstream regression test [3].
- 091930196229 adds the upstream regression test for SHA-1 cookie
challenge parsing [4].

Add dbus-native to PACKAGECONFIG[tests] so Meson can find dbus-daemon
when building the new installed D-Bus regression test for ptest. This is
kept as a native-only test dependency to avoid adding a target dbus
dependency to glib.

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/db9c8fae398b0c457e660ce63dd5afec8993046a
[2] https://gitlab.gnome.org/GNOME/glib/-/commit/c0531125344bb25fd66ffb7435ed6c285de09aeb
[3] https://gitlab.gnome.org/GNOME/glib/-/commit/060aea67de7517d531b8fe2cdc07aa1a00ddeb22
[4] https://gitlab.gnome.org/GNOME/glib/-/commit/0919301962291a712067ee0c5d273cc392f33277
[5] https://nvd.nist.gov/vuln/detail/CVE-2026-58015

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v4:
- Replace the literal U+1F600 emoji in the p4 test vector with its
equivalent escaped UTF-8 byte sequence. Patchwork truncated the v3
mbox at the literal emoji, causing patchtest to report:
"Hunk is shorter than expected"
- Document the byte-escape substitution under p4 Backport Changes.
- No functional or security behavior has changed from v3.

 .../glib-2.0/glib-2.0/CVE-2026-58015_p1.patch |  97 ++++++++
 .../glib-2.0/glib-2.0/CVE-2026-58015_p2.patch |  55 +++++
 .../glib-2.0/glib-2.0/CVE-2026-58015_p3.patch | 198 ++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2026-58015_p4.patch | 222 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   4 +
 meta/recipes-core/glib-2.0/glib.inc           |   2 +-
 6 files changed, 577 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p1.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p2.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p3.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p4.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p1.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p1.patch
new file mode 100644
index 0000000000..1216e1a12b
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p1.patch
@@ -0,0 +1,97 @@
+From 1d0d0dc891399e8572a6c96b116149d076e2de28 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 28 Apr 2026 15:47:30 +0100
+Subject: [PATCH 1/4] gdbusauthmechanismsha1: Validate cookie context
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
+CVE: CVE-2026-58015
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/db9c8fae398b0c457e660ce63dd5afec8993046a]
+
+Backport Changes:
+- Added <stdint.h> include because the target branch does not otherwise
+  expose uint8_t used by the upstream validation code during native builds.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+Fixes: #3931
+(cherry picked from commit db9c8fae398b0c457e660ce63dd5afec8993046a)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ gio/gdbusauthmechanismsha1.c | 37 ++++++++++++++++++++++++++++++++++++
+ 1 file changed, 37 insertions(+)
+
+diff --git a/gio/gdbusauthmechanismsha1.c b/gio/gdbusauthmechanismsha1.c
+index c8aa08977..7d8fc1922 100644
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
+2.35.6
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p2.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p2.patch
new file mode 100644
index 0000000000..28f496734a
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p2.patch
@@ -0,0 +1,55 @@
+From a94b2df7e2bc5f49661e53c2781ce99ae48d18aa Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 28 Apr 2026 15:49:54 +0100
+Subject: [PATCH 2/4] gdbusauthmechanismsha1: Improve validation of cookie ID
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The D-Bus specification says the cookie ID has to be non-negative, but
+we weren’t checking that (or checking that it was non-empty).
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
+index 7d8fc1922..e753d139d 100644
+--- a/gio/gdbusauthmechanismsha1.c
++++ b/gio/gdbusauthmechanismsha1.c
+@@ -1235,7 +1235,7 @@ mechanism_client_data_receive (GDBusAuthMechanism   *mechanism,
+   GDBusAuthMechanismSha1 *m = G_DBUS_AUTH_MECHANISM_SHA1 (mechanism);
+   gchar **tokens;
+   const gchar *cookie_context;
+-  guint cookie_id;
++  int64_t cookie_id;
+   const gchar *server_challenge;
+   gchar *client_challenge;
+   gchar *endp;
+@@ -1270,7 +1270,7 @@ mechanism_client_data_receive (GDBusAuthMechanism   *mechanism,
+     }
+ 
+   cookie_id = g_ascii_strtoll (tokens[1], &endp, 10);
+-  if (*endp != '\0')
++  if (*endp != '\0' || endp == tokens[1] || cookie_id < 0 || cookie_id > UINT32_MAX)
+     {
+       g_free (m->priv->reject_reason);
+       m->priv->reject_reason = g_strdup_printf ("Malformed cookie_id '%s'", tokens[1]);
+@@ -1280,7 +1280,7 @@ mechanism_client_data_receive (GDBusAuthMechanism   *mechanism,
+   server_challenge = tokens[2];
+ 
+   error = NULL;
+-  cookie = keyring_lookup_entry (cookie_context, cookie_id, &error);
++  cookie = keyring_lookup_entry (cookie_context, (unsigned int) cookie_id, &error);
+   if (cookie == NULL)
+     {
+       g_free (m->priv->reject_reason);
+-- 
+2.35.6
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p3.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p3.patch
new file mode 100644
index 0000000000..b6bd2baeb3
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p3.patch
@@ -0,0 +1,198 @@
+From 99c7abffbd1d549f6c625de6f2028efcdeea5c49 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 28 Apr 2026 15:51:00 +0100
+Subject: [PATCH 3/4] gdbusauthmechanism: Expose client reject reason as a new
+ vfunc
+
+We can do this because `gdbusauthmechanism.h` is a private header.
+
+Hook it up to the existing `reject_reason` code in each
+`GDBusAuthMechanism` implementation, as all three implementations
+currently intermingle reject reasons from the server and client code, so
+there would currently be no benefit to having a separate server and
+client implementation of `*_get_reject_reason()`.
+
+This new private API will be used in a new unit test in the following
+commit.
+
+CVE: CVE-2026-58015
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/060aea67de7517d531b8fe2cdc07aa1a00ddeb22]
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit 060aea67de7517d531b8fe2cdc07aa1a00ddeb22)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ gio/gdbusauthmechanism.c         | 7 +++++++
+ gio/gdbusauthmechanism.h         | 2 ++
+ gio/gdbusauthmechanismanon.c     | 8 ++++----
+ gio/gdbusauthmechanismexternal.c | 8 ++++----
+ gio/gdbusauthmechanismsha1.c     | 8 ++++----
+ 5 files changed, 21 insertions(+), 12 deletions(-)
+
+diff --git a/gio/gdbusauthmechanism.c b/gio/gdbusauthmechanism.c
+index 6e494dbd9..0d4ef4389 100644
+--- a/gio/gdbusauthmechanism.c
++++ b/gio/gdbusauthmechanism.c
+@@ -328,6 +328,13 @@ _g_dbus_auth_mechanism_client_data_send (GDBusAuthMechanism *mechanism,
+   return G_DBUS_AUTH_MECHANISM_GET_CLASS (mechanism)->client_data_send (mechanism, out_data_len);
+ }
+ 
++gchar *
++_g_dbus_auth_mechanism_client_get_reject_reason (GDBusAuthMechanism *mechanism)
++{
++  g_return_val_if_fail (G_IS_DBUS_AUTH_MECHANISM (mechanism), NULL);
++  return G_DBUS_AUTH_MECHANISM_GET_CLASS (mechanism)->client_get_reject_reason (mechanism);
++}
++
+ void
+ _g_dbus_auth_mechanism_client_shutdown (GDBusAuthMechanism *mechanism)
+ {
+diff --git a/gio/gdbusauthmechanism.h b/gio/gdbusauthmechanism.h
+index f0edd19a3..e906a47ac 100644
+--- a/gio/gdbusauthmechanism.h
++++ b/gio/gdbusauthmechanism.h
+@@ -100,6 +100,7 @@ struct _GDBusAuthMechanismClass
+                                                          gsize                 data_len);
+   gchar                    *(*client_data_send)         (GDBusAuthMechanism   *mechanism,
+                                                          gsize                *out_data_len);
++  gchar                    *(*client_get_reject_reason) (GDBusAuthMechanism   *mechanism);
+   void                      (*client_shutdown)          (GDBusAuthMechanism   *mechanism);
+ };
+ 
+@@ -148,6 +149,7 @@ void                      _g_dbus_auth_mechanism_client_data_receive      (GDBus
+                                                                            gsize                 data_len);
+ gchar                    *_g_dbus_auth_mechanism_client_data_send         (GDBusAuthMechanism   *mechanism,
+                                                                           gsize                *out_data_len);
++gchar                    *_g_dbus_auth_mechanism_client_get_reject_reason (GDBusAuthMechanism   *mechanism);
+ void                      _g_dbus_auth_mechanism_client_shutdown          (GDBusAuthMechanism   *mechanism);
+ 
+ 
+diff --git a/gio/gdbusauthmechanismanon.c b/gio/gdbusauthmechanismanon.c
+index 5f59d4a61..3d80ec15f 100644
+--- a/gio/gdbusauthmechanismanon.c
++++ b/gio/gdbusauthmechanismanon.c
+@@ -56,7 +56,7 @@ static void                     mechanism_server_data_receive       (GDBusAuthMe
+                                                                      gsize                 data_len);
+ static gchar                   *mechanism_server_data_send          (GDBusAuthMechanism   *mechanism,
+                                                                      gsize                *out_data_len);
+-static gchar                   *mechanism_server_get_reject_reason  (GDBusAuthMechanism   *mechanism);
++static gchar                   *mechanism_server_or_client_get_reject_reason (GDBusAuthMechanism   *mechanism);
+ static void                     mechanism_server_shutdown           (GDBusAuthMechanism   *mechanism);
+ static GDBusAuthMechanismState  mechanism_client_get_state          (GDBusAuthMechanism   *mechanism);
+ static gchar                   *mechanism_client_initiate           (GDBusAuthMechanism   *mechanism,
+@@ -103,12 +103,13 @@ _g_dbus_auth_mechanism_anon_class_init (GDBusAuthMechanismAnonClass *klass)
+   mechanism_class->server_initiate           = mechanism_server_initiate;
+   mechanism_class->server_data_receive       = mechanism_server_data_receive;
+   mechanism_class->server_data_send          = mechanism_server_data_send;
+-  mechanism_class->server_get_reject_reason  = mechanism_server_get_reject_reason;
++  mechanism_class->server_get_reject_reason  = mechanism_server_or_client_get_reject_reason;
+   mechanism_class->server_shutdown           = mechanism_server_shutdown;
+   mechanism_class->client_get_state          = mechanism_client_get_state;
+   mechanism_class->client_initiate           = mechanism_client_initiate;
+   mechanism_class->client_data_receive       = mechanism_client_data_receive;
+   mechanism_class->client_data_send          = mechanism_client_data_send;
++  mechanism_class->client_get_reject_reason  = mechanism_server_or_client_get_reject_reason;
+   mechanism_class->client_shutdown           = mechanism_client_shutdown;
+ }
+ 
+@@ -222,12 +223,11 @@ mechanism_server_data_send (GDBusAuthMechanism   *mechanism,
+ }
+ 
+ static gchar *
+-mechanism_server_get_reject_reason (GDBusAuthMechanism   *mechanism)
++mechanism_server_or_client_get_reject_reason (GDBusAuthMechanism   *mechanism)
+ {
+   GDBusAuthMechanismAnon *m = G_DBUS_AUTH_MECHANISM_ANON (mechanism);
+ 
+   g_return_val_if_fail (G_IS_DBUS_AUTH_MECHANISM_ANON (mechanism), NULL);
+-  g_return_val_if_fail (m->priv->is_server && !m->priv->is_client, NULL);
+   g_return_val_if_fail (m->priv->state == G_DBUS_AUTH_MECHANISM_STATE_REJECTED, NULL);
+ 
+   /* can never end up here because we are never in the REJECTED state */
+diff --git a/gio/gdbusauthmechanismexternal.c b/gio/gdbusauthmechanismexternal.c
+index 6fe8b1bed..b223ead04 100644
+--- a/gio/gdbusauthmechanismexternal.c
++++ b/gio/gdbusauthmechanismexternal.c
+@@ -64,7 +64,7 @@ static void                     mechanism_server_data_receive       (GDBusAuthMe
+                                                                      gsize                 data_len);
+ static gchar                   *mechanism_server_data_send          (GDBusAuthMechanism   *mechanism,
+                                                                      gsize                *out_data_len);
+-static gchar                   *mechanism_server_get_reject_reason  (GDBusAuthMechanism   *mechanism);
++static gchar                   *mechanism_server_or_client_get_reject_reason (GDBusAuthMechanism   *mechanism);
+ static void                     mechanism_server_shutdown           (GDBusAuthMechanism   *mechanism);
+ static GDBusAuthMechanismState  mechanism_client_get_state          (GDBusAuthMechanism   *mechanism);
+ static gchar                   *mechanism_client_initiate           (GDBusAuthMechanism   *mechanism,
+@@ -111,12 +111,13 @@ _g_dbus_auth_mechanism_external_class_init (GDBusAuthMechanismExternalClass *kla
+   mechanism_class->server_initiate           = mechanism_server_initiate;
+   mechanism_class->server_data_receive       = mechanism_server_data_receive;
+   mechanism_class->server_data_send          = mechanism_server_data_send;
+-  mechanism_class->server_get_reject_reason  = mechanism_server_get_reject_reason;
++  mechanism_class->server_get_reject_reason  = mechanism_server_or_client_get_reject_reason;
+   mechanism_class->server_shutdown           = mechanism_server_shutdown;
+   mechanism_class->client_get_state          = mechanism_client_get_state;
+   mechanism_class->client_initiate           = mechanism_client_initiate;
+   mechanism_class->client_data_receive       = mechanism_client_data_receive;
+   mechanism_class->client_data_send          = mechanism_client_data_send;
++  mechanism_class->client_get_reject_reason  = mechanism_server_or_client_get_reject_reason;
+   mechanism_class->client_shutdown           = mechanism_client_shutdown;
+ }
+ 
+@@ -321,12 +322,11 @@ mechanism_server_data_send (GDBusAuthMechanism   *mechanism,
+ }
+ 
+ static gchar *
+-mechanism_server_get_reject_reason (GDBusAuthMechanism   *mechanism)
++mechanism_server_or_client_get_reject_reason (GDBusAuthMechanism   *mechanism)
+ {
+   GDBusAuthMechanismExternal *m = G_DBUS_AUTH_MECHANISM_EXTERNAL (mechanism);
+ 
+   g_return_val_if_fail (G_IS_DBUS_AUTH_MECHANISM_EXTERNAL (mechanism), NULL);
+-  g_return_val_if_fail (m->priv->is_server && !m->priv->is_client, NULL);
+   g_return_val_if_fail (m->priv->state == G_DBUS_AUTH_MECHANISM_STATE_REJECTED, NULL);
+ 
+   /* can never end up here because we are never in the REJECTED state */
+diff --git a/gio/gdbusauthmechanismsha1.c b/gio/gdbusauthmechanismsha1.c
+index e753d139d..6c1682d3a 100644
+--- a/gio/gdbusauthmechanismsha1.c
++++ b/gio/gdbusauthmechanismsha1.c
+@@ -120,7 +120,7 @@ static void                     mechanism_server_data_receive       (GDBusAuthMe
+                                                                      gsize                 data_len);
+ static gchar                   *mechanism_server_data_send          (GDBusAuthMechanism   *mechanism,
+                                                                      gsize                *out_data_len);
+-static gchar                   *mechanism_server_get_reject_reason  (GDBusAuthMechanism   *mechanism);
++static gchar                   *mechanism_server_or_client_get_reject_reason (GDBusAuthMechanism   *mechanism);
+ static void                     mechanism_server_shutdown           (GDBusAuthMechanism   *mechanism);
+ static GDBusAuthMechanismState  mechanism_client_get_state          (GDBusAuthMechanism   *mechanism);
+ static gchar                   *mechanism_client_initiate           (GDBusAuthMechanism   *mechanism,
+@@ -173,12 +173,13 @@ _g_dbus_auth_mechanism_sha1_class_init (GDBusAuthMechanismSha1Class *klass)
+   mechanism_class->server_initiate           = mechanism_server_initiate;
+   mechanism_class->server_data_receive       = mechanism_server_data_receive;
+   mechanism_class->server_data_send          = mechanism_server_data_send;
+-  mechanism_class->server_get_reject_reason  = mechanism_server_get_reject_reason;
++  mechanism_class->server_get_reject_reason  = mechanism_server_or_client_get_reject_reason;
+   mechanism_class->server_shutdown           = mechanism_server_shutdown;
+   mechanism_class->client_get_state          = mechanism_client_get_state;
+   mechanism_class->client_initiate           = mechanism_client_initiate;
+   mechanism_class->client_data_receive       = mechanism_client_data_receive;
+   mechanism_class->client_data_send          = mechanism_client_data_send;
++  mechanism_class->client_get_reject_reason  = mechanism_server_or_client_get_reject_reason;
+   mechanism_class->client_shutdown           = mechanism_client_shutdown;
+ }
+ 
+@@ -1129,12 +1130,11 @@ mechanism_server_data_send (GDBusAuthMechanism   *mechanism,
+ }
+ 
+ static gchar *
+-mechanism_server_get_reject_reason (GDBusAuthMechanism   *mechanism)
++mechanism_server_or_client_get_reject_reason (GDBusAuthMechanism *mechanism)
+ {
+   GDBusAuthMechanismSha1 *m = G_DBUS_AUTH_MECHANISM_SHA1 (mechanism);
+ 
+   g_return_val_if_fail (G_IS_DBUS_AUTH_MECHANISM_SHA1 (mechanism), NULL);
+-  g_return_val_if_fail (m->priv->is_server && !m->priv->is_client, NULL);
+   g_return_val_if_fail (m->priv->state == G_DBUS_AUTH_MECHANISM_STATE_REJECTED, NULL);
+ 
+   return g_strdup (m->priv->reject_reason);
+-- 
+2.35.6
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p4.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p4.patch
new file mode 100644
index 0000000000..0785ad3c3a
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p4.patch
@@ -0,0 +1,222 @@
+From 80d2edcc14f476d0ec82dc0733964afa6e9ca74d Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 28 Apr 2026 15:52:53 +0100
+Subject: [PATCH 4/4] tests: Add a unit test for GDBusAuthMechanismSha1 cookie
+ context parsing
+
+This checks for regressions in the fixes from the previous few commits.
+
+CVE: CVE-2026-58015
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/0919301962291a712067ee0c5d273cc392f33277]
+
+Backport Changes:
+- Replaced the literal U+1F600 test string with its UTF-8 byte escapes to
+  avoid the observed Patchwork mbox truncation. The test input is unchanged.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+Helps: #3931
+(cherry picked from commit 0919301962291a712067ee0c5d273cc392f33277)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ gio/tests/gdbus-auth-mechanism-sha1.c | 177 ++++++++++++++++++++++++++
+ gio/tests/meson.build                 |   1 +
+ 2 files changed, 178 insertions(+)
+ create mode 100644 gio/tests/gdbus-auth-mechanism-sha1.c
+
+diff --git a/gio/tests/gdbus-auth-mechanism-sha1.c b/gio/tests/gdbus-auth-mechanism-sha1.c
+new file mode 100644
+index 000000000..abcdb4e3e
+--- /dev/null
++++ b/gio/tests/gdbus-auth-mechanism-sha1.c
+@@ -0,0 +1,177 @@
++/* GLib testing framework examples and tests
++ *
++ * Copyright (C) 2026 Philip Withnall
++ *
++ * SPDX-License-Identifier: LGPL-2.1-or-later
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; either
++ * version 2.1 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General
++ * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
++ *
++ * Author: Philip Withnall <pwithnall@gnome.org>
++ */
++
++#include <locale.h>
++#include <gio/gio.h>
++
++#include <string.h>
++#include <unistd.h>
++
++#include "gdbus-tests.h"
++
++#ifdef G_OS_UNIX
++#include <gio/gunixconnection.h>
++#include <gio/gnetworkingprivate.h>
++#include <gio/gunixsocketaddress.h>
++#include <gio/gunixfdlist.h>
++#endif
++
++#define GIO_COMPILATION 1
++#include "gdbusauthmechanism.h"
++#include "gdbusauthmechanismsha1.h"
++
++/* Vfunc wrappers copied from gdbusauthmechanism.c as they are not public. */
++static gboolean
++dbus_auth_mechanism_is_supported (GDBusAuthMechanism *mechanism)
++{
++  return G_DBUS_AUTH_MECHANISM_GET_CLASS (mechanism)->is_supported (mechanism);
++}
++
++static GDBusAuthMechanismState
++dbus_auth_mechanism_client_get_state (GDBusAuthMechanism *mechanism)
++{
++  return G_DBUS_AUTH_MECHANISM_GET_CLASS (mechanism)->client_get_state (mechanism);
++}
++
++static gchar *
++dbus_auth_mechanism_client_initiate (GDBusAuthMechanism   *mechanism,
++                                     GDBusConnectionFlags  conn_flags,
++                                     size_t               *out_initial_response_len)
++{
++  return G_DBUS_AUTH_MECHANISM_GET_CLASS (mechanism)->client_initiate (mechanism,
++                                                                       conn_flags,
++                                                                       out_initial_response_len);
++}
++
++static void
++dbus_auth_mechanism_client_data_receive (GDBusAuthMechanism *mechanism,
++                                         const char         *data,
++                                         size_t              data_len)
++{
++  G_DBUS_AUTH_MECHANISM_GET_CLASS (mechanism)->client_data_receive (mechanism, data, data_len);
++}
++
++static char *
++dbus_auth_mechanism_client_get_reject_reason (GDBusAuthMechanism *mechanism)
++{
++  return G_DBUS_AUTH_MECHANISM_GET_CLASS (mechanism)->client_get_reject_reason (mechanism);
++}
++
++static void
++dbus_auth_mechanism_client_shutdown (GDBusAuthMechanism *mechanism)
++{
++  G_DBUS_AUTH_MECHANISM_GET_CLASS (mechanism)->client_shutdown (mechanism);
++}
++
++static void
++test_server_challenge_validation (void)
++{
++  const struct
++    {
++      const char *server_challenge;
++      const char *expected_reject_reason_prefix;
++    }
++  vectors[] = {
++    { "valid_context 123 456", "Problems looking up entry in keyring" },
++    { "invalid/context 123 456", "Malformed cookie_context" },
++    { "invalid.context 123 456", "Malformed cookie_context" },
++    { " 123 456", "Malformed cookie_context" },
++    { "\xF0\x9F\x98\x80" " 123 456", "Malformed cookie_context" },
++    { "invalid\ncontext 123 456", "Malformed cookie_context" },
++    { "invalid\rcontext 123 456", "Malformed cookie_context" },
++    { "invalid\tcontext 123 456", "Malformed cookie_context" },
++    { "invalid\\context 123 456", "Malformed cookie_context" },
++    { "valid_context  456", "Malformed cookie_id" },
++    { "valid_context 123notanumber 456", "Malformed cookie_id" },
++    { "valid_context -1 456", "Malformed cookie_id" },
++    { "valid_context 4294967296 456", "Malformed cookie_id" },
++    { "valid_context 123  ", "Malformed data" },
++    { "valid_context ", "Malformed data" },
++  };
++  GType mechanism_type;
++  GDBusConnection *connection = NULL;
++
++  g_test_summary ("Test that GDBusAuthMechanismSha1 rejects various malformed server data lines");
++
++  /* Briefly connect to the actual bus to ensure the GDBusAuth mechanisms are
++   * all registered. */
++  session_bus_up ();
++
++  connection = g_bus_get_sync (G_BUS_TYPE_SESSION, NULL, NULL);
++  g_assert_nonnull (connection);
++  g_clear_object (&connection);
++
++  session_bus_down ();
++
++  /* Check that we now have the type ID for GDBusAuthMechanismSha1 */
++  mechanism_type = g_type_from_name ("GDBusAuthMechanismSha1");
++  g_assert_cmpint (mechanism_type,  !=, 0);
++
++  for (size_t i = 0; i < G_N_ELEMENTS (vectors); i++)
++    {
++      GDBusAuthMechanism *mechanism = NULL;
++      char *data = NULL;
++      size_t data_len = 0;
++      char *reject_reason = NULL;
++
++      mechanism = g_object_new (mechanism_type, NULL);
++
++      if (!dbus_auth_mechanism_is_supported (mechanism))
++        {
++          g_test_skip ("Mechanism not supported");
++          g_clear_object (&mechanism);
++          return;
++        }
++
++      data = dbus_auth_mechanism_client_initiate (mechanism,
++                                                  G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT,
++                                                  &data_len);
++      g_free (data);
++
++      dbus_auth_mechanism_client_data_receive (mechanism, vectors[i].server_challenge, strlen (vectors[i].server_challenge));
++
++      g_assert_cmpint (dbus_auth_mechanism_client_get_state (mechanism), ==, G_DBUS_AUTH_MECHANISM_STATE_REJECTED);
++
++      reject_reason = dbus_auth_mechanism_client_get_reject_reason (mechanism);
++      g_assert_true (g_str_has_prefix (reject_reason, vectors[i].expected_reject_reason_prefix));
++      g_free (reject_reason);
++
++      dbus_auth_mechanism_client_shutdown (mechanism);
++
++      g_clear_object (&mechanism);
++    }
++}
++
++int
++main (int   argc,
++      char *argv[])
++{
++  setlocale (LC_ALL, "C");
++
++  g_test_init (&argc, &argv, G_TEST_OPTION_ISOLATE_DIRS, NULL);
++
++  g_test_dbus_unset ();
++
++  g_test_add_func ("/gdbus/auth-mechanism-sha1/server-challenge-validation", test_server_challenge_validation);
++
++  return g_test_run ();
++}
+diff --git a/gio/tests/meson.build b/gio/tests/meson.build
+index e7699c336..74ea481ff 100644
+--- a/gio/tests/meson.build
++++ b/gio/tests/meson.build
+@@ -418,6 +418,7 @@ if host_system != 'windows'
+       },
+       'fdo-notification-backend': {},
+       'gdbus-auth' : {'extra_sources' : extra_sources},
++      'gdbus-auth-mechanism-sha1': {'extra_sources' : extra_sources},
+       'gdbus-bz627724' : {'extra_sources' : extra_sources},
+       'gdbus-close-pending' : {'extra_sources' : extra_sources},
+       'gdbus-connection' : {
+-- 
+2.35.6
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index e15aa1fe20..70b0b74e88 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -54,6 +54,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-58012.patch \
            file://CVE-2026-58013.patch \
            file://CVE-2026-58014.patch \
+           file://CVE-2026-58015_p1.patch \
+           file://CVE-2026-58015_p2.patch \
+           file://CVE-2026-58015_p3.patch \
+           file://CVE-2026-58015_p4.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index fac8875d84..5b69c9d7d3 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -39,7 +39,7 @@ PACKAGECONFIG ??= "libmount \
 PACKAGECONFIG[libmount] = "-Dlibmount=enabled,-Dlibmount=disabled,util-linux"
 PACKAGECONFIG[manpages] = "-Dman=true, -Dman=false, libxslt-native xmlto-native"
 PACKAGECONFIG[libelf] = "-Dlibelf=enabled,-Dlibelf=disabled,elfutils"
-PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,"
+PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,dbus-native"
 PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux"
 
 EXTRA_OEMESON = "-Ddtrace=false -Dsystemtap=false"
-- 
2.35.6

