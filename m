Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6332BC369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 11:18:27 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.6173.1744888699065990758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 04:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Hwi9oQ6M;
 spf=pass (domain: mvista.com, ip: 209.85.208.50, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so1137047a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 04:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744888697; x=1745493497; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KkD30uyeVOzhqHmZvs8eeOgafnMonrGDc6kvpMZAhOU=;
        b=Hwi9oQ6MOIM7odvA6S11vhS/Q2LQB7It5hiIwEwV5AjtJp1C8uVvszUsHpR3YibXbd
         /S2/zo7WwcEkF+3J8t90Qz/rjU8Q0RR5egCgMHLmIn+zzp6GjAKqvWgL1xUK0tU4r3iK
         XhgDj7E6/9WFenX99M06/8tVRZFDXrCjGAKYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744888697; x=1745493497;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KkD30uyeVOzhqHmZvs8eeOgafnMonrGDc6kvpMZAhOU=;
        b=sFXYZE9YMarFsqa4A0nuu0Dyko+bpxsB6WNghPxF16X+ugNqfZ7BKzwWsiTuRwBudi
         eMwTVyg0wB2j8ZeQaa2no8FCKbiZ7n4OFxj3O+j73Vb8Y13qrumee51hZ14vj9aEw1h/
         oTzZbkCa5bXmbRZ8p61XpDZsSyJO2vwx3s9Foyp2TYpM1oavzjghSKjyQ4fKhJAC8DeE
         mfLNlyXz3Nk6LdUHCoBUb2ApmhOltJUR2nHPgkx8XOTvMIr+doR1SDGR8bwF/sJvcQ6F
         aPO+w83CPbrv/eUHQ+v7BGm8cC6aMVax0Lnju0ehqW9xbyBEyNemt8Smbhzkhf0Sex4W
         mGxQ==
X-Gm-Message-State: AOJu0Yzq4YEf1c2VENC3fioPT/JqmeqAxJpBspRL2G3yC3PGo0NyJrpe
	OolWb5TitXqEV1p3jTuSUgGyRv8eviIJsnhJuYNdoZjr8SlfXj/KG7ZVTDxFbRrkoIoPjajlUVg
	TNHopcD95z+db9z5NxghkU5gbpAlAV+S0vPDYy6KfK6r1V1aTHpcRew==
X-Gm-Gg: ASbGncsZfKVZ0IW/wWr7ZtMVsugSS7yFXWTnOLElmhX8Gb7q2kuiOtOYMFMMHP4QrVH
	LJCFvjhAIy6MVq4BvIIeAmxVre99xi+3L5QZyADP4pgx8bEnSlMiL5r3bvMC9FMm2/GCFv48U9o
	+9BGC8HkAHtW0VGj2n83k3TjE=
X-Google-Smtp-Source: AGHT+IHme/PSXwlH+770NBO6t5DGUmLawm4SMzMLpjqfJNOgcRsgOV6KSaNnzzg2YehW3mkx3PlUOTQnq5mcyMALQAg=
X-Received: by 2002:a17:907:3d0e:b0:aca:c6fe:30e2 with SMTP id
 a640c23a62f3a-acb42bfbe4bmr473478366b.41.1744888696766; Thu, 17 Apr 2025
 04:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250416051314.96105-1-vanusuri@mvista.com> <20250416051314.96105-3-vanusuri@mvista.com>
In-Reply-To: <20250416051314.96105-3-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 17 Apr 2025 16:48:04 +0530
X-Gm-Features: ATxdqUFI7MuMVuN5F8tTIaon232cRzrjEsnKsSCRlKhgntWhfB63U3xFcxRZSK0
Message-ID: <CANQUz19rNCyLK2F-u=S2Rv4PnMeckt_2WUJQKt2qPAqxpAxSzQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 3/5] libsoup: Fix CVE-2025-32913
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f19feb0632f78e29"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 11:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215069

--000000000000f19feb0632f78e29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This commit resolves CVE-2025-32911 along with CVE-2025-32913.
I have renamed the patch and sent a v2 patch.


Thanks & Regards,
Vijay

On Wed, Apr 16, 2025 at 10:43=E2=80=AFAM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-Status: Backport from
>
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/7b4ef0e004ece3a308ccfaa71=
4c284f4c96ade34
> &
> <https://gitlab.gnome.org/GNOME/libsoup/-/commit/7b4ef0e004ece3a308ccfaa7=
14c284f4c96ade34&>
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/f4a761fb66512fff59798765e=
8ac5b9e57dceef0
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../libsoup-3.4.4/CVE-2025-32913-1.patch      | 72 +++++++++++++++++++
>  .../libsoup-3.4.4/CVE-2025-32913-2.patch      | 44 ++++++++++++
>  meta/recipes-support/libsoup/libsoup_3.4.4.bb |  2 +
>  3 files changed, 118 insertions(+)
>  create mode 100644
> meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-1.patch
>  create mode 100644
> meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-2.patch
>
> diff --git
> a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-1.patch
> b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-1.patch
> new file mode 100644
> index 0000000000..1d6a9aa193
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-1.patch
> @@ -0,0 +1,72 @@
> +From 7b4ef0e004ece3a308ccfaa714c284f4c96ade34 Mon Sep 17 00:00:00 2001
> +From: Patrick Griffis <pgriffis@igalia.com>
> +Date: Fri, 27 Dec 2024 17:53:50 -0600
> +Subject: [PATCH] soup_message_headers_get_content_disposition: Fix NULL
> deref
> +
> +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/7b4ef0e004ece3a308ccfaa71=
4c284f4c96ade34
> ]
> +CVE: CVE-2025-32913 #Dependency Patch
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + libsoup/soup-message-headers.c | 13 +++++++++----
> + tests/header-parsing-test.c    | 14 ++++++++++++++
> + 2 files changed, 23 insertions(+), 4 deletions(-)
> +
> +diff --git a/libsoup/soup-message-headers.c
> b/libsoup/soup-message-headers.c
> +index 56cc1e9d..04f4c302 100644
> +--- a/libsoup/soup-message-headers.c
> ++++ b/libsoup/soup-message-headers.c
> +@@ -1660,10 +1660,15 @@ soup_message_headers_get_content_disposition
> (SoupMessageHeaders  *hdrs,
> +        */
> +       if (params && g_hash_table_lookup_extended (*params, "filename",
> +                                                   &orig_key,
> &orig_value)) {
> +-              char *filename =3D strrchr (orig_value, '/');
> +-
> +-              if (filename)
> +-                      g_hash_table_insert (*params, g_strdup (orig_key)=
,
> filename + 1);
> ++                if (orig_value) {
> ++                        char *filename =3D strrchr (orig_value, '/');
> ++
> ++                        if (filename)
> ++                                g_hash_table_insert (*params, g_strdup
> (orig_key), filename + 1);
> ++                } else {
> ++                        /* filename with no value isn't valid. */
> ++                        g_hash_table_remove (*params, "filename");
> ++                }
> +       }
> +       return TRUE;
> + }
> +diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
> +index 5e423d2b..d0b360c8 100644
> +--- a/tests/header-parsing-test.c
> ++++ b/tests/header-parsing-test.c
> +@@ -1039,6 +1039,7 @@ do_param_list_tests (void)
> + #define RFC5987_TEST_HEADER_FALLBACK "attachment;
> filename*=3DUnknown''t%FF%FF%FFst.txt; filename=3D\"test.txt\""
> + #define RFC5987_TEST_HEADER_NO_TYPE  "filename=3D\"test.txt\""
> + #define RFC5987_TEST_HEADER_NO_TYPE_2  "filename=3D\"test.txt\"; foo=3D=
bar"
> ++#define RFC5987_TEST_HEADER_EMPTY_FILENAME ";filename"
> +
> + static void
> + do_content_disposition_tests (void)
> +@@ -1139,6 +1140,19 @@ do_content_disposition_tests (void)
> +         g_assert_cmpstr (parameter2, =3D=3D, "bar");
> +       g_hash_table_destroy (params);
> +
> ++        /* Empty filename */
> ++        soup_message_headers_clear (hdrs);
> ++        soup_message_headers_append (hdrs, "Content-Disposition",
> ++                                   RFC5987_TEST_HEADER_EMPTY_FILENAME);
> ++      if (!soup_message_headers_get_content_disposition (hdrs,
> ++                                                         &disposition,
> ++                                                         &params)) {
> ++              soup_test_assert (FALSE, "empty filename decoding FAILED"=
);
> ++              return;
> ++      }
> ++        g_assert_false (g_hash_table_contains (params, "filename"));
> ++      g_hash_table_destroy (params);
> ++
> +       soup_message_headers_unref (hdrs);
> +
> +       /* Ensure that soup-multipart always quotes filename */
> +--
> +GitLab
> +
> diff --git
> a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-2.patch
> b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-2.patch
> new file mode 100644
> index 0000000000..6d30bb91d3
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-2.patch
> @@ -0,0 +1,44 @@
> +From f4a761fb66512fff59798765e8ac5b9e57dceef0 Mon Sep 17 00:00:00 2001
> +From: Patrick Griffis <pgriffis@igalia.com>
> +Date: Fri, 27 Dec 2024 18:00:39 -0600
> +Subject: [PATCH] soup_message_headers_get_content_disposition: strdup
> + truncated filenames
> +
> +This table frees the strings it contains.
> +
> +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/f4a761fb66512fff59798765e=
8ac5b9e57dceef0
> ]
> +CVE: CVE-2025-32913
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + libsoup/soup-message-headers.c | 2 +-
> + tests/header-parsing-test.c    | 1 +
> + 2 files changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/libsoup/soup-message-headers.c
> b/libsoup/soup-message-headers.c
> +index 04f4c302..ee7a3cb1 100644
> +--- a/libsoup/soup-message-headers.c
> ++++ b/libsoup/soup-message-headers.c
> +@@ -1664,7 +1664,7 @@ soup_message_headers_get_content_disposition
> (SoupMessageHeaders  *hdrs,
> +                         char *filename =3D strrchr (orig_value, '/');
> +
> +                         if (filename)
> +-                                g_hash_table_insert (*params, g_strdup
> (orig_key), filename + 1);
> ++                                g_hash_table_insert (*params, g_strdup
> (orig_key), g_strdup (filename + 1));
> +                 } else {
> +                         /* filename with no value isn't valid. */
> +                         g_hash_table_remove (*params, "filename");
> +diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
> +index d0b360c8..07ea2866 100644
> +--- a/tests/header-parsing-test.c
> ++++ b/tests/header-parsing-test.c
> +@@ -1150,6 +1150,7 @@ do_content_disposition_tests (void)
> +               soup_test_assert (FALSE, "empty filename decoding FAILED"=
);
> +               return;
> +       }
> ++        g_free (disposition);
> +         g_assert_false (g_hash_table_contains (params, "filename"));
> +       g_hash_table_destroy (params);
> +
> +--
> +GitLab
> +
> diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> index ec3305aed7..0b464d274b 100644
> --- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> +++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> @@ -20,6 +20,8 @@ SRC_URI =3D
> "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
>             file://CVE-2024-52531-3.patch \
>             file://CVE-2025-32910.patch \
>             file://CVE-2025-32909.patch \
> +           file://CVE-2025-32913-1.patch \
> +           file://CVE-2025-32913-2.patch \
>            "
>  SRC_URI[sha256sum] =3D
> "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
>
> --
> 2.25.1
>
>

--000000000000f19feb0632f78e29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This commit resolves CVE-2025-32911 along with CVE-20=
25-32913.<br></div><div>I have renamed the patch and sent a v2 patch.</div>=
<div><br></div><div><br></div><div>Thanks &amp; Regards,</div><div>Vijay</d=
iv></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Apr 16, 2025 at 10:43=E2=80=AFAM &lt;<a hr=
ef=3D"mailto:vanusuri@mvista.com">vanusuri@mvista.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">From: Vijay Anusuri &l=
t;<a href=3D"mailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.=
com</a>&gt;<br>
<br>
Upstream-Status: Backport from<br>
<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit/7b4ef0e004ece3a3=
08ccfaa714c284f4c96ade34&amp;" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.gnome.org/GNOME/libsoup/-/commit/7b4ef0e004ece3a308ccfaa714c284f4c9=
6ade34<br>
&amp;</a> <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit/f4a761=
fb66512fff59798765e8ac5b9e57dceef0" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.gnome.org/GNOME/libsoup/-/commit/f4a761fb66512fff59798765e8ac5=
b9e57dceef0</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../libsoup-3.4.4/CVE-2025-32913-1.patch=C2=A0 =C2=A0 =C2=A0 | 72 +++=
++++++++++++++++<br>
=C2=A0.../libsoup-3.4.4/CVE-2025-32913-2.patch=C2=A0 =C2=A0 =C2=A0 | 44 +++=
+++++++++<br>
=C2=A0meta/recipes-support/libsoup/<a href=3D"http://libsoup_3.4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">libsoup_3.4.4.bb</a> |=C2=A0 2 +<br>
=C2=A03 files changed, 118 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-202=
5-32913-1.patch<br>
=C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-202=
5-32913-2.patch<br>
<br>
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-1.pa=
tch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-1.patch<br>
new file mode 100644<br>
index 0000000000..1d6a9aa193<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-1.patch<br>
@@ -0,0 +1,72 @@<br>
+From 7b4ef0e004ece3a308ccfaa714c284f4c96ade34 Mon Sep 17 00:00:00 2001<br>
+From: Patrick Griffis &lt;<a href=3D"mailto:pgriffis@igalia.com" target=3D=
"_blank">pgriffis@igalia.com</a>&gt;<br>
+Date: Fri, 27 Dec 2024 17:53:50 -0600<br>
+Subject: [PATCH] soup_message_headers_get_content_disposition: Fix NULL de=
ref<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/libso=
up/-/commit/7b4ef0e004ece3a308ccfaa714c284f4c96ade34" rel=3D"noreferrer" ta=
rget=3D"_blank">https://gitlab.gnome.org/GNOME/libsoup/-/commit/7b4ef0e004e=
ce3a308ccfaa714c284f4c96ade34</a>]<br>
+CVE: CVE-2025-32913 #Dependency Patch<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ libsoup/soup-message-headers.c | 13 +++++++++----<br>
+ tests/header-parsing-test.c=C2=A0 =C2=A0 | 14 ++++++++++++++<br>
+ 2 files changed, 23 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers=
.c<br>
+index 56cc1e9d..04f4c302 100644<br>
+--- a/libsoup/soup-message-headers.c<br>
++++ b/libsoup/soup-message-headers.c<br>
+@@ -1660,10 +1660,15 @@ soup_message_headers_get_content_disposition (Soup=
MessageHeaders=C2=A0 *hdrs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (params &amp;&amp; g_hash_table_lookup_exten=
ded (*params, &quot;filename&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;orig_key, &amp;orig_value)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *filename =3D strrc=
hr (orig_value, &#39;/&#39;);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (filename)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 g_hash_table_insert (*params, g_strdup (orig_key), filename + 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (orig_value) {=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 char *filename =3D strrchr (orig_value, &#39;/&#39;);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (filename)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_hash_table_insert (*params, g_strd=
up (orig_key), filename + 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* filename with no value isn&#39;t valid. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 g_hash_table_remove (*params, &quot;filename&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return TRUE;<br>
+ }<br>
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c<br>
+index 5e423d2b..d0b360c8 100644<br>
+--- a/tests/header-parsing-test.c<br>
++++ b/tests/header-parsing-test.c<br>
+@@ -1039,6 +1039,7 @@ do_param_list_tests (void)<br>
+ #define RFC5987_TEST_HEADER_FALLBACK &quot;attachment; filename*=3DUnknow=
n&#39;&#39;t%FF%FF%FFst.txt; filename=3D\&quot;test.txt\&quot;&quot;<br>
+ #define RFC5987_TEST_HEADER_NO_TYPE=C2=A0 &quot;filename=3D\&quot;test.tx=
t\&quot;&quot;<br>
+ #define RFC5987_TEST_HEADER_NO_TYPE_2=C2=A0 &quot;filename=3D\&quot;test.=
txt\&quot;; foo=3Dbar&quot;<br>
++#define RFC5987_TEST_HEADER_EMPTY_FILENAME &quot;;filename&quot;<br>
+ <br>
+ static void<br>
+ do_content_disposition_tests (void)<br>
+@@ -1139,6 +1140,19 @@ do_content_disposition_tests (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_cmpstr (parameter2, =3D=3D, &qu=
ot;bar&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_hash_table_destroy (params);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Empty filename */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 soup_message_headers_clear (hdrs);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 soup_message_headers_append (hdrs, &quot;Cont=
ent-Disposition&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RFC5987_TEST_HEADER_EMP=
TY_FILENAME);<br>
++=C2=A0 =C2=A0 =C2=A0 if (!soup_message_headers_get_content_disposition (h=
drs,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;disposition,<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;params)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 soup_test_assert (FALSE,=
 &quot;empty filename decoding FAILED&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_false (g_hash_table_contains (params=
, &quot;filename&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 g_hash_table_destroy (params);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0soup_message_headers_unref (hdrs);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Ensure that soup-multipart always quotes fil=
ename */<br>
+-- <br>
+GitLab<br>
+<br>
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-2.pa=
tch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-2.patch<br>
new file mode 100644<br>
index 0000000000..6d30bb91d3<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32913-2.patch<br>
@@ -0,0 +1,44 @@<br>
+From f4a761fb66512fff59798765e8ac5b9e57dceef0 Mon Sep 17 00:00:00 2001<br>
+From: Patrick Griffis &lt;<a href=3D"mailto:pgriffis@igalia.com" target=3D=
"_blank">pgriffis@igalia.com</a>&gt;<br>
+Date: Fri, 27 Dec 2024 18:00:39 -0600<br>
+Subject: [PATCH] soup_message_headers_get_content_disposition: strdup<br>
+ truncated filenames<br>
+<br>
+This table frees the strings it contains.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/libso=
up/-/commit/f4a761fb66512fff59798765e8ac5b9e57dceef0" rel=3D"noreferrer" ta=
rget=3D"_blank">https://gitlab.gnome.org/GNOME/libsoup/-/commit/f4a761fb665=
12fff59798765e8ac5b9e57dceef0</a>]<br>
+CVE: CVE-2025-32913<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ libsoup/soup-message-headers.c | 2 +-<br>
+ tests/header-parsing-test.c=C2=A0 =C2=A0 | 1 +<br>
+ 2 files changed, 2 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers=
.c<br>
+index 04f4c302..ee7a3cb1 100644<br>
+--- a/libsoup/soup-message-headers.c<br>
++++ b/libsoup/soup-message-headers.c<br>
+@@ -1664,7 +1664,7 @@ soup_message_headers_get_content_disposition (SoupMe=
ssageHeaders=C2=A0 *hdrs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0char *filename =3D strrchr (orig_value, &#39;/&#39;);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (filename)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_hash_table_insert (*params, g_strd=
up (orig_key), filename + 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_hash_table_insert (*params, g_strd=
up (orig_key), g_strdup (filename + 1));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* filename with no value isn&#39;t valid. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0g_hash_table_remove (*params, &quot;filename&quot;);<br>
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c<br>
+index d0b360c8..07ea2866 100644<br>
+--- a/tests/header-parsing-test.c<br>
++++ b/tests/header-parsing-test.c<br>
+@@ -1150,6 +1150,7 @@ do_content_disposition_tests (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0soup_test_assert (F=
ALSE, &quot;empty filename decoding FAILED&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free (disposition);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_false (g_hash_table_contains (p=
arams, &quot;filename&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_hash_table_destroy (params);<br>
+ <br>
+-- <br>
+GitLab<br>
+<br>
diff --git a/meta/recipes-support/libsoup/<a href=3D"http://libsoup_3.4.4.b=
b" rel=3D"noreferrer" target=3D"_blank">libsoup_3.4.4.bb</a> b/meta/recipes=
-support/libsoup/<a href=3D"http://libsoup_3.4.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libsoup_3.4.4.bb</a><br>
index ec3305aed7..0b464d274b 100644<br>
--- a/meta/recipes-support/libsoup/<a href=3D"http://libsoup_3.4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">libsoup_3.4.4.bb</a><br>
+++ b/meta/recipes-support/libsoup/<a href=3D"http://libsoup_3.4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">libsoup_3.4.4.bb</a><br>
@@ -20,6 +20,8 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/libsoup/${SHRT_VER}/lib=
soup-${PV}.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2024-52531-3.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-32910.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-32909.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-32913-1.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-32913-2.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;291c67725f36ed90ea43efff25064b69c5a2d198=
1488477c05c481a3b4b0c5aa&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000f19feb0632f78e29--

