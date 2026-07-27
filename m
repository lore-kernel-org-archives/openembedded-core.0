Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD56C53209
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 17:28:16 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36763.1785173287550433238
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 10:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0GWZ0Zxo;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-472326ca506so1996868f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 10:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785173286; x=1785778086; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/l0h8hE6kARQhRxmOG2xNPC7x+8fBT3DEHPiDRlD2o=;
        b=0GWZ0Zxo/35es00bGKn+RDes+InvBFrOZXut08x2r2uw4EkyuEuk/pp6sEWuxIVuiK
         pQ98Mwg9fLPeIEQoeds7G/gBEoN7tBiGqxh4chP2SLdqsDAQTDcXRe6/kdIkJgUylKyI
         XiYm1AUw6hkZpOksz5bJT2tIydf9jxR4HEbwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785173286; x=1785778086;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/l0h8hE6kARQhRxmOG2xNPC7x+8fBT3DEHPiDRlD2o=;
        b=k6hwQIA1XDJFQMRYyEhSCVprDUw3pUI9d9t94DCNag8JPufznyINKMFCJNSKCWlsc0
         7hiSMTqS5q/n+gnITZ9MyQrl4Vv5WQGk866H9V/ZoOXqEb6mHMvWElUHvwyibQ4W38Io
         7NwB+UD1YXduwk7tdk9WcWoHcPooHIXYEHn9Rqq1bmcNzwa0k+/DfoJ3cOcMfSq5nxSX
         0hMqAQ/4OiliCBudgLZZdi5JG+0bADY/uLtkpr3HeNAu+5P850eqNbtOlhrZ+yyROJM4
         wx91ma4Ql8/oP94fd1maSi1SZuYZWagJ01pnWtBv8q14lc0ruhBYpwTQFws7ldJYTNle
         4XYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpzpk5fwNXexgxK/CjAxV3AZB2maRGm+ytAmt6bkBwXYpgyjrcbKjpqh5AC+CMvoZvK3kmDdBauZKsWRYHxuLpFCA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw/DhrHJI/SKrZeOg8gHSGsd28ODTpOcxev/ST/3XAcvxUSDRb/
	dgAo8sLHqD/PdOmulsGxrb57EJ3yG2ZElWwOss5BICUJZUR4hPKcIlbQO62JIZlOA40=
X-Gm-Gg: AR+sD10K6bouWMUXNYFFIXGItYQl9x4RZRR7bAKaKoqVY2WZ1Y41/KrGbwcRdAjR49w
	tmN+tuoxUYdXpPQvyrqGdKyWjMzJUijLf/5R/nIS22cZeGXoSWDEcwj5EetdCh7YDGw5o7vtCPC
	sMvq7dqMhI0/Qt4dmJg/6z1rMldL5ZcyZ2xoYrdCN6gQmBnW+iE58iP0bbiq7uby6W7DWwGIPaj
	r/zmOlA/3ViZcNrP4Bw3h+PMO31FyGqvoNBca+4vKPo1TY/QKJMJbxXshQZTq5sRGSNzHTveg2Q
	77hCVtDO/fFSHOYGcNjpu3KZLa7rQ7SARugoraOiUTFZ67/3Jf1aJx8lil3TApwrjsMT880wxVX
	WBfXpCXXB3F9XfhQuhfq7rkVI5Z90Sbj96BQPFzfGr1Qb/LBo7/eoea68yuZuoau6+gRM4dCUSZ
	k8Dg58YGyhASSlR7ZBPMl15pHX6A==
X-Received: by 2002:a5d:5d03:0:b0:47f:81fe:12fb with SMTP id ffacd0b85a97d-47fafa92c23mr34942f8f.47.1785173285641;
        Mon, 27 Jul 2026 10:28:05 -0700 (PDT)
Received: from localhost (219.66.136.77.rev.sfr.net. [77.136.66.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f939c1465sm36008469f8f.26.2026.07.27.10.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 10:28:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 19:27:46 +0200
Message-Id: <DK9J3X66ZPWU.3JLB5OLQUORQ2@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2 6/6] glib-2.0: fix CVE-2026-58015
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260715172330.1149253-6-deeratho@cisco.com>
 <20260727121444.3158996-1-deeratho@cisco.com>
In-Reply-To: <20260727121444.3158996-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 17:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242102

On Mon Jul 27, 2026 at 2:14 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream 2.88.1 stable backports [1] and [2] for
> CVE-2026-58015. The main fix [1] validates the SHA-1 cookie context,
> and the helper fix [2] tightens cookie ID parsing before keyring lookup.
>
> [1] https://gitlab.gnome.org/GNOME/glib/-/commit/db9c8fae398b0c457e660ce6=
3dd5afec8993046a
> [2] https://gitlab.gnome.org/GNOME/glib/-/commit/c0531125344bb25fd66ffb74=
35ed6c285de09aeb
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-58015
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
> Changes in v2:
> - Added the GLib stable helper commit which tightens cookie ID validation
>   before keyring lookup.
>
>  .../glib-2.0/glib-2.0/CVE-2026-58015_p1.patch | 97 +++++++++++++++++++
>  .../glib-2.0/glib-2.0/CVE-2026-58015_p2.patch | 54 +++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  2 +
>  3 files changed, 153 insertions(+)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p1=
.patch
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p2=
.patch

Hello,

These patches have formating issues, I'll mark some but please check the
whole files.
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p1.patch =
b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p1.patch
> new file mode 100644
> index 0000000000..50517f23b2
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p1.patch
> @@ -0,0 +1,97 @@
> +From db9c8fae398b0c457e660ce63dd5afec8993046a Mon Sep 17 00:00:00 2001
> +From: Philip Withnall <pwithnall@gnome.org>
> +Date: Tue, 28 Apr 2026 15:47:30 +0100
> +Subject: [PATCH] gdbusauthmechanismsha1: Validate cookie context
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Without validation, the server could send a malicious context which
> +contains path traversal characters, allowing it to exfiltrate a SHA-1
> +hashed copy of arbitrary data from the client's file system.
                                                ^ this character changed
												from upstream.
> +
> +To exploit this successfully would require the client to choose to
> +connect peer-to-peer to a malicious D-Bus server and to choose the SHA-1
> +authentication mechanism in preference to all the other mechanisms. This
> +is vanishingly unlikely.
> +
> +Fixes: #3931
> +
> +CVE: CVE-2026-58015
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
db9c8fae398b0c457e660ce63dd5afec8993046a]
> +
> +Backport Changes:
> +- Added <stdint.h> include because the target branch does not otherwise
> +  expose uint8_t used by the upstream validation code during native buil=
ds.
> +
> +Signed-off-by: Philip Withnall <pwithnall@gnome.org>
> +(cherry picked from commit db9c8fae398b0c457e660ce63dd5afec8993046a)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + gio/gdbusauthmechanismsha1.c | 37 +++++++++++++++++++++++++++++++++++++
> + 1 file changed, 37 insertions(+)
> +
> +diff --git a/gio/gdbusauthmechanismsha1.c b/gio/gdbusauthmechanismsha1.c
> +index c8aa08977c..7f348d862d 100644
> +--- a/gio/gdbusauthmechanismsha1.c
> ++++ b/gio/gdbusauthmechanismsha1.c
> +@@ -22,6 +22,7 @@
> +
   ^ It lacks a whitespace for context here
> + #include "config.h"
> +
   ^ ... also here.
> ++#include <stdint.h>
> + #include <string.h>
> + #include <fcntl.h>
> + #include <errno.h>
> +@@ -1198,6 +1199,34 @@ mechanism_client_initiate (GDBusAuthMechanism   *=
mechanism,
> +   return initial_response;
> + }
> +
> ++/* Context names must be valid ASCII, nonzero length, and may not conta=
in the
> ++ * characters slash ("/"), backslash ("\"), space (" "), newline ("\n")=
,
> ++ * carriage return ("\r"), tab ("\t"), or period (".").
> ++ *
> ++ * See https://dbus.freedesktop.org/doc/dbus-specification.html#auth-me=
chanisms-sha */
> ++static gboolean
> ++validate_cookie_context (const char *cookie_context)
> ++{
> ++  size_t i =3D 0;
> ++
> ++  g_return_val_if_fail (cookie_context !=3D NULL, FALSE);
> ++
> ++  for (i =3D 0; cookie_context[i] !=3D '\0'; i++)
> ++    {
> ++      if ((uint8_t) cookie_context[i] >=3D 128 ||
> ++          cookie_context[i] =3D=3D '/' ||
> ++          cookie_context[i] =3D=3D '\\' ||
> ++          cookie_context[i] =3D=3D ' ' ||
> ++          cookie_context[i] =3D=3D '\n' ||
> ++          cookie_context[i] =3D=3D '\r' ||
> ++          cookie_context[i] =3D=3D '\t' ||
> ++          cookie_context[i] =3D=3D '.')
> ++        return FALSE;
> ++    }
> ++
> ++  return (i > 0);
> ++}
> ++
> + static void
> + mechanism_client_data_receive (GDBusAuthMechanism   *mechanism,
> +                                const gchar          *data,
> +@@ -1232,6 +1261,14 @@ mechanism_client_data_receive (GDBusAuthMechanism=
   *mechanism,
> +     }
> +
> +   cookie_context =3D tokens[0];
> ++  if (!validate_cookie_context (tokens[0]))
> ++    {
> ++      g_free (m->priv->reject_reason);
> ++      m->priv->reject_reason =3D g_strdup_printf ("Malformed cookie_con=
text '%s'", tokens[0]);
> ++      m->priv->state =3D G_DBUS_AUTH_MECHANISM_STATE_REJECTED;
> ++      goto out;
> ++    }
> ++
> +   cookie_id =3D g_ascii_strtoll (tokens[1], &endp, 10);
> +   if (*endp !=3D '\0')
> +     {
> +--
> +GitLab
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p2.patch =
b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p2.patch
> new file mode 100644
> index 0000000000..dd814e192d
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p2.patch
> @@ -0,0 +1,54 @@
> +From c0531125344bb25fd66ffb7435ed6c285de09aeb Mon Sep 17 00:00:00 2001
> +From: Philip Withnall <pwithnall@gnome.org>
> +Date: Tue, 28 Apr 2026 15:49:54 +0100
> +Subject: [PATCH] gdbusauthmechanismsha1: Improve validation of cookie ID
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The D-Bus specification says the cookie ID has to be non-negative, but
> +we weren't checking that (or checking that it was non-empty).
> +
> +CVE: CVE-2026-58015
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
c0531125344bb25fd66ffb7435ed6c285de09aeb]
> +
> +Signed-off-by: Philip Withnall <pwithnall@gnome.org>
> +(cherry picked from commit c0531125344bb25fd66ffb7435ed6c285de09aeb)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + gio/gdbusauthmechanismsha1.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/gio/gdbusauthmechanismsha1.c b/gio/gdbusauthmechanismsha1.c
> +index 7f348d862d..3c17f81a19 100644
> +--- a/gio/gdbusauthmechanismsha1.c
> ++++ b/gio/gdbusauthmechanismsha1.c
> +@@ -1234,7 +1234,7 @@ mechanism_client_data_receive (GDBusAuthMechanism =
  *mechanism,
> +   GDBusAuthMechanismSha1 *m =3D G_DBUS_AUTH_MECHANISM_SHA1 (mechanism);
> +   gchar **tokens;
> +   const gchar *cookie_context;
> +-  guint cookie_id;
> ++  int64_t cookie_id;
> +   const gchar *server_challenge;
> +   gchar *client_challenge;
> +   gchar *endp;
> +@@ -1269,7 +1269,7 @@ mechanism_client_data_receive (GDBusAuthMechanism =
  *mechanism,
> +     }
> +
> +   cookie_id =3D g_ascii_strtoll (tokens[1], &endp, 10);
> +-  if (*endp !=3D '\0')
> ++  if (*endp !=3D '\0' || endp =3D=3D tokens[1] || cookie_id < 0 || cook=
ie_id > UINT32_MAX)
> +     {
> +       g_free (m->priv->reject_reason);
> +       m->priv->reject_reason =3D g_strdup_printf ("Malformed cookie_id =
'%s'", tokens[1]);
> +@@ -1279,7 +1279,7 @@ mechanism_client_data_receive (GDBusAuthMechanism =
  *mechanism,
> +   server_challenge =3D tokens[2];
> +
> +   error =3D NULL;
> +-  cookie =3D keyring_lookup_entry (cookie_context, cookie_id, &error);
> ++  cookie =3D keyring_lookup_entry (cookie_context, (unsigned int) cooki=
e_id, &error);
> +   if (cookie =3D=3D NULL)
> +     {
> +       g_free (m->priv->reject_reason);
> +--
> +GitLab
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.78.6.bb
> index e15aa1fe20..c2feff8988 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
> @@ -54,6 +54,8 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
>             file://CVE-2026-58012.patch \
>             file://CVE-2026-58013.patch \
>             file://CVE-2026-58014.patch \
> +           file://CVE-2026-58015_p1.patch \
> +           file://CVE-2026-58015_p2.patch \
>             "
>  SRC_URI:append:class-native =3D " file://relocate-modules.patch \
>                                  file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \

Regards,
--=20
Yoann Congal
Smile ECS


