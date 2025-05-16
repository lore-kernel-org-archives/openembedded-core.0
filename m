Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C70C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 12:18:45 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.11775.1747397915685516815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 05:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=exwPJYIl;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-326ca53a7e8so17096461fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 05:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747397914; x=1748002714; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kz2caOk2xdVJByEcvsmSmJ/VBmY92yJeYwNo1XZ7SBo=;
        b=exwPJYIlu9k7IjgORLErz/MK6G9zpkix7omnlw69+4kDaK0hIBsCFg/BCjwW7dcKXd
         kvyeIAcq5uWKZ8bwIw7eLpLN2/cb31My2SH2XhMXzwC5TkIBvYjk7zy4dlfOLiBJBuHM
         +vUN8MoiRUlwiFXvOID2r0K4P45mweh3Vj52c7A4L9JDMC305OzFVr14Nx2j3V8L9JcY
         CoyIj9VouW3/qfSdjo9d3ZGQLHhC6zr1kPNjADQQt7di+G5H46mYLpSN8oXbdSxjH95l
         CnOP50D5gljLi5eNonKJhAd7QznzLVpR0QSTCrKxtvmANHbp1hgQitStSMDsawCgrYCa
         DmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747397914; x=1748002714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kz2caOk2xdVJByEcvsmSmJ/VBmY92yJeYwNo1XZ7SBo=;
        b=Axxyru5JpCjHuDWiPvAbU6RelM7QvIRXjkjPrj0BDolaqfXqJrt9in1vYjcE9Vt/A/
         YEvfPAaPj5KsZ/YKWXwkNYlIghJRF929ZYpLAXGfdqZIJ9YHj5XzwkOHtiLZLSmobggE
         jgb+/WbMX0rU8L+TznF4Kqm+8TVONtA1RPLVGI90laZyywJfgifkZQs9E2yKVl9ZOGRm
         8ReWCuuSLE7w16Y7mLL2U5kWoIs3+7K6AfSEX3Vsoc7mXuTnF9OBpj2lctdLpki4ko+U
         GIJjn60sK/UjJpu2LiK+w78+aC97LtBznaS7PPnHNZhrEu+vP/WYdWJm/jXdSv7h7nCu
         wgpg==
X-Gm-Message-State: AOJu0YxRk105Tt6MxhG38sVNqc+zdCI/Cc7Fpg6I8+s9w3ALXJstI6OJ
	NHX951NCK1T9RBH5g7YwOy+ohzNtnlB3iNW+K9dsAJ/ZMGQPFVYTgZ1Hll3kVzrozRvpqc882R6
	jnuEF2S2n7g9JzlaDcZdqhHvrcICPMZ4x1KcD
X-Gm-Gg: ASbGncuY8sDDhq36NkzIYUNqKiiHNqRQdRif++eMLyVrIu3AvZ8XMJKYVa7TmA05Qla
	0bW3jCP1VcVPYBUdhzxqiGsF/galUAnVVE/itYsNqMzy8DM2TNGRrdbaoBwbblG/IEr8Epf4Zyg
	QN6+z0va25B7k/XignyK6vbEgXF/FsfiOz3Ws=
X-Google-Smtp-Source: AGHT+IH8rrZ1lRORdz2K6qqpT6sNxPS+nvTLmYaOfwSvZ8GkVgYvnQ094S81yBUe+D9OphanELiktwK6S3wceTUQA+4=
X-Received: by 2002:a05:651c:1441:b0:326:e006:519 with SMTP id
 38308e7fff4ca-328097ae016mr7955791fa.37.1747397913305; Fri, 16 May 2025
 05:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250516114421.3941135-1-praveen.kumar@windriver.com>
In-Reply-To: <20250516114421.3941135-1-praveen.kumar@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 May 2025 14:18:22 +0200
X-Gm-Features: AX0GCFuX01Mk6fIU08S6QwzZ3mdLsZtSK7lMgbElWP_erPKDjYFAQFe-Yhxckgc
Message-ID: <CA+chaQdGAgtLKUYMEgk8-_c__MmJsC95GUzsL_jxdCT+J-iskQ@mail.gmail.com>
Subject: Re: [oe-core][scarthgap][PATCH 1/1] glib-2.0 : fix CVE-2025-4373
To: praveen.kumar@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 12:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216749

Small nitpick, but can you please use colon ':' with space after and
without space before it?

e.g. "connman :fix CVE-2025-32743" recently merged in scarthgap had
the same issue.

It's just cosmetic issue, but other commits use it quite consistently,
so it would be nice to follow that.

https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=3D9=
558ec2091964556b47b0909c5d243aee5bafb6f
https://git.openembedded.org/openembedded-core/log/?h=3Dscarthgap

Cheers,

On Fri, May 16, 2025 at 1:44=E2=80=AFPM Praveen Kumar via
lists.openembedded.org
<praveen.kumar=3Dwindriver.com@lists.openembedded.org> wrote:
>
> A flaw was found in GLib, which is vulnerable to an integer overflow
> in the g_string_insert_unichar() function. When the position at which
> to insert the character is large, the position will overflow, leading
> to a buffer underwrite.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2025-4373
> https://security-tracker.debian.org/tracker/CVE-2025-4373
>
> Upstream-patches:
> https://gitlab.gnome.org/GNOME/glib/-/commit/cc647f9e46d55509a93498af1965=
9baf9c80f2e3
> https://gitlab.gnome.org/GNOME/glib/-/commit/4d435bb4809793c445846db8fb87=
e3c9184c4703
>
> Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> ---
>  .../glib-2.0/glib-2.0/CVE-2025-4373-01.patch  | 120 ++++++++++++++++++
>  .../glib-2.0/glib-2.0/CVE-2025-4373-02.patch  |  29 +++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   2 +
>  3 files changed, 151 insertions(+)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.=
patch
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.=
patch
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch b=
/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch
> new file mode 100644
> index 0000000000..f99c4de7e1
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch
> @@ -0,0 +1,120 @@
> +From cc647f9e46d55509a93498af19659baf9c80f2e3 Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@redhat.com>
> +Date: Thu, 10 Apr 2025 10:57:20 -0500
> +Subject: [PATCH 1/2] gstring: carefully handle gssize parameters
> +
> +Wherever we use gssize to allow passing -1, we need to ensure we don't
> +overflow the value by assigning a gsize to it without checking if the
> +size exceeds the maximum gssize. The safest way to do this is to just
> +use normal gsize everywhere instead and use gssize only for the
> +parameter.
> +
> +Our computers don't have enough RAM to write tests for this. I tried
> +forcing string->len to high values for test purposes, but this isn't
> +valid and will just cause out of bounds reads/writes due to
> +string->allocated_len being unexpectedly small, so I don't think we can
> +test this easily.
> +
> +CVE: CVE-2025-4373
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
cc647f9e46d55509a93498af19659baf9c80f2e3]
> +
> +Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> +---
> + glib/gstring.c | 36 +++++++++++++++++++++++-------------
> + 1 file changed, 23 insertions(+), 13 deletions(-)
> +
> +diff --git a/glib/gstring.c b/glib/gstring.c
> +index 9f04144..d016b65 100644
> +--- a/glib/gstring.c
> ++++ b/glib/gstring.c
> +@@ -490,8 +490,9 @@ g_string_insert_len (GString     *string,
> +     return string;
> +
> +   if (len < 0)
> +-    len =3D strlen (val);
> +-  len_unsigned =3D len;
> ++    len_unsigned =3D strlen (val);
> ++  else
> ++    len_unsigned =3D len;
> +
> +   if (pos < 0)
> +     pos_unsigned =3D string->len;
> +@@ -788,10 +789,12 @@ g_string_insert_c (GString *string,
> +   g_string_maybe_expand (string, 1);
> +
> +   if (pos < 0)
> +-    pos =3D string->len;
> ++    pos_unsigned =3D string->len;
> +   else
> +-    g_return_val_if_fail ((gsize) pos <=3D string->len, string);
> +-  pos_unsigned =3D pos;
> ++    {
> ++      pos_unsigned =3D pos;
> ++      g_return_val_if_fail (pos_unsigned <=3D string->len, string);
> ++    }
> +
> +   /* If not just an append, move the old stuff */
> +   if (pos_unsigned < string->len)
> +@@ -824,6 +827,7 @@ g_string_insert_unichar (GString  *string,
> +                          gssize    pos,
> +                          gunichar  wc)
> + {
> ++  gsize pos_unsigned;
> +   gint charlen, first, i;
> +   gchar *dest;
> +
> +@@ -865,15 +869,18 @@ g_string_insert_unichar (GString  *string,
> +   g_string_maybe_expand (string, charlen);
> +
> +   if (pos < 0)
> +-    pos =3D string->len;
> ++    pos_unsigned =3D string->len;
> +   else
> +-    g_return_val_if_fail ((gsize) pos <=3D string->len, string);
> ++    {
> ++      pos_unsigned =3D pos;
> ++      g_return_val_if_fail (pos_unsigned <=3D string->len, string);
> ++    }
> +
> +   /* If not just an append, move the old stuff */
> +-  if ((gsize) pos < string->len)
> +-    memmove (string->str + pos + charlen, string->str + pos, string->le=
n - pos);
> ++  if (pos_unsigned < string->len)
> ++    memmove (string->str + pos_unsigned + charlen, string->str + pos_un=
signed, string->len - pos_unsigned);
> +
> +-  dest =3D string->str + pos;
> ++  dest =3D string->str + pos_unsigned;
> +   /* Code copied from g_unichar_to_utf() */
> +   for (i =3D charlen - 1; i > 0; --i)
> +     {
> +@@ -931,6 +938,7 @@ g_string_overwrite_len (GString     *string,
> +                         const gchar *val,
> +                         gssize       len)
> + {
> ++  gssize len_unsigned;
> +   gsize end;
> +
> +   g_return_val_if_fail (string !=3D NULL, NULL);
> +@@ -942,14 +950,16 @@ g_string_overwrite_len (GString     *string,
> +   g_return_val_if_fail (pos <=3D string->len, string);
> +
> +   if (len < 0)
> +-    len =3D strlen (val);
> ++    len_unsigned =3D strlen (val);
> ++  else
> ++    len_unsigned =3D len;
> +
> +-  end =3D pos + len;
> ++  end =3D pos + len_unsigned;
> +
> +   if (end > string->len)
> +     g_string_maybe_expand (string, end - string->len);
> +
> +-  memcpy (string->str + pos, val, len);
> ++  memcpy (string->str + pos, val, len_unsigned);
> +
> +   if (end > string->len)
> +     {
> +--
> +2.40.0
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.patch b=
/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.patch
> new file mode 100644
> index 0000000000..ea586c90dc
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.patch
> @@ -0,0 +1,29 @@
> +From 4d435bb4809793c445846db8fb87e3c9184c4703 Mon Sep 17 00:00:00 2001
> +From: Peter Bloomfield <peterbloomfield@bellsouth.net>
> +Date: Fri, 11 Apr 2025 05:52:33 +0000
> +Subject: [PATCH 2/2] gstring: Make len_unsigned unsigned
> +
> +CVE: CVE-2025-4373
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
4d435bb4809793c445846db8fb87e3c9184c4703]
> +
> +Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> +---
> + glib/gstring.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/glib/gstring.c b/glib/gstring.c
> +index d016b65..d9ad0c3 100644
> +--- a/glib/gstring.c
> ++++ b/glib/gstring.c
> +@@ -938,7 +938,7 @@ g_string_overwrite_len (GString     *string,
> +                         const gchar *val,
> +                         gssize       len)
> + {
> +-  gssize len_unsigned;
> ++  gsize len_unsigned;
> +   gsize end;
> +
> +   g_return_val_if_fail (string !=3D NULL, NULL);
> +--
> +2.40.0
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.78.6.bb
> index 1a65f48399..e1a3b57270 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
> @@ -27,6 +27,8 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
>             file://CVE-2025-3360-04.patch \
>             file://CVE-2025-3360-05.patch \
>             file://CVE-2025-3360-06.patch \
> +           file://CVE-2025-4373-01.patch \
> +           file://CVE-2025-4373-02.patch \
>             "
>  SRC_URI:append:class-native =3D " file://relocate-modules.patch \
>                                  file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216748): https://lists.openembedded.org/g/openembedde=
d-core/message/216748
> Mute This Topic: https://lists.openembedded.org/mt/113143455/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

