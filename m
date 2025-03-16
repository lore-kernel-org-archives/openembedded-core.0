Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF090C282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 08:07:09 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.25427.1742112424723037119
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 01:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout04.t-online.de (Postfix) with SMTP id 3F66F99A
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:07:02 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.236.70]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ttj1R-2nnjX70; Sun, 16 Mar 2025 09:07:01 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] glib-2.0: fix build issue with gobject-introspection
Date: Sun, 16 Mar 2025 09:07:36 +0100
Message-ID: <20250316080742.2737670-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1742112422-0F7FC59D-1110690A/0/0 CLEAN NORMAL
X-TOI-MSGID: 5d89f1bc-5823-4150-9963-94ae5c7f4dec
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 08:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212991

- Add backport patch to fix a build issue with gobject-introspection >=3D=
 1.83.2

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...664e6f1a29e0d5f301979f6d168b08435a61.patch | 75 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5f3=
01979f6d168b08435a61.patch

diff --git a/meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5f301979f6=
d168b08435a61.patch b/meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5=
f301979f6d168b08435a61.patch
new file mode 100644
index 0000000000..28bce02dc3
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5f301979f6d168b08=
435a61.patch
@@ -0,0 +1,75 @@
+From aee0664e6f1a29e0d5f301979f6d168b08435a61 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Mon, 10 Mar 2025 15:21:15 +0000
+Subject: [PATCH] girparser: Ignore new doc:format element in GIR files
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+As of gobject-introspection 1.83.2, a new `<doc:format name=3D"=E2=80=A6=
"/>`
+element is supported (as a child of `<repository>`) in GIR files.
+
+For the moment, this information isn=E2=80=99t needed in libgirepository=
 =E2=80=94 but
+the GIR parser does have to know about the element in order to not throw
+an error claiming it=E2=80=99s invalid.
+
+This is a slightly tweaked version of the code added to
+gobject-introspection.git in commit
+9544cd6c962fab2c3203898779948309833e2439 by Corentin No=C3=ABl
+<corentin.noel@collabora.com>, reformatted slightly to fit in with
+GLib=E2=80=99s style guidelines.
+
+This is backwards compatible and does not require a new
+gobject-introspection version.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+Fixes: #3634
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
aee0664e6f1a29e0d5f301979f6d168b08435a61.patch]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ girepository/girparser.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/girepository/girparser.c b/girepository/girparser.c
+index 63143718d9..be88d871a4 100644
+--- a/girepository/girparser.c
++++ b/girepository/girparser.c
+@@ -107,7 +107,8 @@ typedef enum
+   STATE_ALIAS,
+   STATE_TYPE,
+   STATE_ATTRIBUTE,
+-  STATE_PASSTHROUGH
++  STATE_PASSTHROUGH,
++  STATE_DOC_FORMAT,  /* 35 */
+ } ParseState;
+=20
+ typedef struct _ParseContext ParseContext;
+@@ -3159,6 +3160,11 @@ start_element_handler (GMarkupParseContext  *cont=
ext,
+           state_switch (ctx, STATE_PASSTHROUGH);
+           goto out;
+         }
++      else if (strcmp ("doc:format", element_name) =3D=3D 0)
++        {
++          state_switch (ctx, STATE_DOC_FORMAT);
++          goto out;
++        }
+       break;
+=20
+     case 'e':
+@@ -3843,6 +3849,10 @@ end_element_handler (GMarkupParseContext  *contex=
t,
+           state_switch (ctx, ctx->prev_state);
+         }
+       break;
++    case STATE_DOC_FORMAT:
++      if (require_end_element (context, ctx, "doc:format", element_name=
, error))
++        state_switch (ctx, STATE_REPOSITORY);
++      break;
+=20
+     case STATE_PASSTHROUGH:
+       ctx->unknown_depth -=3D 1;
+--=20
+GitLab
+
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index ee23c5089d..61e1a3ef17 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -229,6 +229,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${=
PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.pa=
tch \
            file://skip-timeout.patch \
+           file://aee0664e6f1a29e0d5f301979f6d168b08435a61.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \=20
                                 file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
--=20
2.48.1


