Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E63CFD9E26
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 23:54:27 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84330.1772150064946618840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 15:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yCPmt3s4;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806bf39419so18554435e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 15:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772150063; x=1772754863; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rt5Gd2TPPZOFgSzxKD2oc75cP/nwHbVBOFRJVTtRJ8=;
        b=yCPmt3s4leqAYowQ9EEbYzdVqJpd8TP41Gs4TIE2R125/4lEDFPyeiOSakjU7Dhd4x
         iI5/ewkV291w8hPUDWdophZW2s150mUYvZErrcT9u5gA543JMi2qnfbx06Li7LSBF6du
         YLFPQCyq7yXOsqtNpUl9k3P/fg+Pl1gBWHkcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772150063; x=1772754863;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rt5Gd2TPPZOFgSzxKD2oc75cP/nwHbVBOFRJVTtRJ8=;
        b=OzMH2JWHnjgXqVs1JoXiFQErHhpEKbnK4HJVRi6SEWdSvXhCbMX2NhOAH0ktLa4vsj
         wcuNjuGTVx2w0S8iIRIscaq+6HpUEalLrUN43Jab+5UHCRb744M0HGQaoF98v/oq0CKr
         9nNN7889niiZrFPgTwXJQ8cocp/cF3Pn4hMmyvO3wf83EY6iqfZaIqTPNJ4DzRfnCLSl
         Z29NxgtuJ/WrsmjQTCKhPLckjo+aVVnRvZOnGGHGca2ih0JrN2f9QWtTEusOubgsscfl
         7RY+4Jgfm/oQJX3mcMNNvBgwxOmDzUch/eAIC96CsYJclEuq6q8mT+ANRlsIsUe+iVb7
         pOvA==
X-Forwarded-Encrypted: i=1; AJvYcCVFlLfgEwPdC4rQ/h9mRG94y9ON5VD1bIWdn4WLzQhRJW0l2E2u+2YW3LziiqCihWwUND4u4aXULLdgwd6xs0WDmQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy5tXJ4PtX8pI0t12hXgYwbjBHqd0VWmGl1hWDy+V0+QA2EpPmJ
	UlDegIQ5b0VGJhdTDju0F2GGs60jBQPSv/ESmJKyWSeEs8CVGsoohILC/fHx+nsQYFI6ITU6TVq
	gFP+L
X-Gm-Gg: ATEYQzx4+Op/bkJgFjMw+OWqiU0OZ4W7+FXA+LOOC9aohFO/ABkxyy+u91Fp4yt2wqU
	/X0blnuY1in50/22QrbieYc3wT6TZxJE08t3oYB+ncE0b6M2709ZEQh7t81BgO1Tz75VV9j+X/h
	33kb33bqk+OBjQ1wlQLDSHZpbDlXnFPS7ab04wBvfnTlW/d851ccV75JOaN5Qcb8MpqABWgInZo
	5FjmqUkyEFaxpZEI6W0Zc8jHXgXfkO4yP8SLAR8tqbyiAEnLv4/K6OLtlabUi95RK33fL8gf2aV
	lAf9JSBYHrXk96si4mbABPUy9VbRYmsYWE4ZH1b/ZtkwrP+/T5SYQ5o+Y6rvGfx6wTXMFsNp7yJ
	BlLJgPtVQlPKnPH2eboYn5IBLmhEEkvi7cm6oEmho7Fpcyx4/25jsnmMNV0B1AgLV0UGMeNmNHG
	zEKFM23l1di49rn2ajJIwaEpKSUt/iwZgz02ZFT5k50xn79S8VP4AjHGki5DVXRRiCTUohfb/Tr
	0M5iFp1wtYa5jLr
X-Received: by 2002:a05:600c:34c1:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-483c993a0e3mr13734625e9.17.1772150062824;
        Thu, 26 Feb 2026 15:54:22 -0800 (PST)
Received: from localhost (2a01cb001331aa002c0b752a8b25831e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2c0b:752a:8b25:831e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb9b97sm78067015e9.7.2026.02.26.15.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 15:54:22 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 00:54:22 +0100
Message-Id: <DGPARNJAZH24.1AF4QH1TOZ7UU@smile.fr>
To: <rsangam@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] libsoup: Security fix for
 CVE-2025-14523 & CVE-2026-1761
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260226072352.8670-1-rsangam@mvista.com>
In-Reply-To: <20260226072352.8670-1-rsangam@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 23:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232070

Hello,

Thanks for the patch but it needs improvements:

On Thu Feb 26, 2026 at 8:23 AM CET, Rohini Sangam via lists.openembedded.or=
g wrote:
> CVEs fixed:
> - CVE-2025-14523 libsoup: Duplicate Host Header Handling Causes Host-Pars=
ing Discrepancy (First- vs Last-Value Wins)
> Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commi=
t/383cc02354c2a4235a98338005f8b47ffab4e53a,
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/a94c4fb5bd9ef0f6b47128f98=
08c45f2259f9409]
>
> - CVE-2026-1761 libsoup: Stack-Based Buffer Overflow in libsoup Multipart=
 Response Parsingmultipart HTTP response
> Upstream-Status : Backport [import from RHEL9 - libsoup-2.72.0-12.el9_7.5
> Upstream-commit: https://gitlab.gnome.org/GNOME/libsoup/-/commit/cfa9d90d=
1a5c274233554a264c56551c13d6a6f0]

1 - Please add a justification as to why you think these particular patches
    fix these CVEs: Cited in the NVD report? upstream? another source?

2 - This "Upstream-Status:" line is only useful in patches, you can
    remove it from the commit message.

3 - This patch need to be splitted at least by recipe (and I'd
    rather have one patch by CVE given the patches)

4 - As far as I can tell, those CVEs also apply to master (OE-Core for
    libsoup 3.6, meta-OE for 2.4). Before being accepted on stable
	releases, those CVEs have to be fixed on the master branches.

Regards,
>
> Signed-off-by: Rohini Sangam <rsangam@mvista.com>
> ---
>  .../libsoup/libsoup-2.4/CVE-2025-14523.patch  |  77 ++
>  .../libsoup/libsoup-2.4/CVE-2026-1761.patch   |  38 +
>  .../libsoup/libsoup-2.4_2.74.3.bb             |   2 +
>  .../libsoup-3.4.4/CVE-2025-14523.patch        | 697 ++++++++++++++++++
>  .../libsoup/libsoup-3.4.4/CVE-2026-1761.patch | 102 +++
>  meta/recipes-support/libsoup/libsoup_3.4.4.bb |   2 +
>  6 files changed, 918 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-145=
23.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-176=
1.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-1=
4523.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-1=
761.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
> new file mode 100644
> index 0000000000..b951fcd627
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
> @@ -0,0 +1,77 @@
> +From 383cc02354c2a4235a98338005f8b47ffab4e53a Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@redhat.com>
> +Date: Wed, 7 Jan 2026 14:50:33 -0600
> +Subject: [PATCH] Reject duplicate Host headers (for libsoup 2)
> +
> +https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/491
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/383cc02354c2a4235a98338005f8b47ffab4e53a]
> +CVE: CVE-2025-14523
> +
> +Signed-off-by: Rohini Sangam <rsangam@mvista.com>
> +---
> + libsoup/soup-headers.c         |  3 +++
> + libsoup/soup-message-headers.c |  3 +++
> + tests/header-parsing-test.c    | 18 ++++++++++++++++++
> + 3 files changed, 24 insertions(+)
> +
> +diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
> +index ea2f986..6cd3dad 100644
> +--- a/libsoup/soup-headers.c
> ++++ b/libsoup/soup-headers.c
> +@@ -138,6 +138,9 @@ soup_headers_parse (const char *str, int len, SoupMe=
ssageHeaders *dest)
> + 		for (p =3D strchr (value, '\r'); p; p =3D strchr (p, '\r'))
> + 			*p =3D ' ';
> +=20
> ++		if (g_ascii_strcasecmp (name, "Host") =3D=3D 0 && soup_message_header=
s_get_one (dest, "Host"))
> ++			goto done;
> ++
> + 		soup_message_headers_append (dest, name, value);
> +         }
> + 	success =3D TRUE;
> +diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-heade=
rs.c
> +index ff10e10..4fc6768 100644
> +--- a/libsoup/soup-message-headers.c
> ++++ b/libsoup/soup-message-headers.c
> +@@ -220,6 +220,9 @@ soup_message_headers_append (SoupMessageHeaders *hdr=
s,
> + 	}
> + #endif
> +=20
> ++	if (g_ascii_strcasecmp (name, "Host") =3D=3D 0 && soup_message_headers=
_get_one (hdrs, "Host"))
> ++		return;
> ++
> + 	header.name =3D intern_header_name (name, &setter);
> + 	header.value =3D g_strdup (value);
> + 	g_array_append_val (hdrs->array, header);
> +diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
> +index d20da95..f2286d0 100644
> +--- a/tests/header-parsing-test.c
> ++++ b/tests/header-parsing-test.c
> +@@ -468,6 +468,24 @@ static struct RequestTest {
> + 	  SOUP_STATUS_BAD_REQUEST,
> +            NULL, NULL, -1,
> + 	  { { NULL } }
> ++	},
> ++
> ++	{ "Duplicate Host headers",
> ++	  "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
> ++	  "GET / HTTP/1.1\r\nHost: example.com\r\nHost: example.org\r\n",
> ++	  -1,
> ++	  SOUP_STATUS_BAD_REQUEST,
> ++	  NULL, NULL, -1,
> ++	  { { NULL } }
> ++	},
> ++
> ++	{ "Duplicate Host headers (case insensitive)",
> ++	  "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
> ++	  "GET / HTTP/1.1\r\nHost: example.com\r\nhost: example.org\r\n",
> ++	  -1,
> ++	  SOUP_STATUS_BAD_REQUEST,
> ++	  NULL, NULL, -1,
> ++	  { { NULL } }
> + 	}
> + };
> + static const int num_reqtests =3D G_N_ELEMENTS (reqtests);
> +--=20
> +2.44.4
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch=
 b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch
> new file mode 100644
> index 0000000000..f6a30c86f9
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch
> @@ -0,0 +1,38 @@
> +From cfa9d90d1a5c274233554a264c56551c13d6a6f0 Mon Sep 17 00:00:00 2001
> +From: Carlos Garcia Campos <cgarcia@igalia.com>
> +Date: Mon, 19 Jan 2026 15:14:58 +0100
> +Subject: [PATCH] multipart: check length of bytes read
> + soup_filter_input_stream_read_until()
> +
> +We do make sure the read length is smaller than the buffer length when
> +the boundary is not found, but we should do the same when the boundary
> +is found.
> +
> +Spotted in #YWH-PGM9867-149
> +Closes #493
> +
> +Upstream-Status: Backport [import from RHEL9 - libsoup-2.72.0-12.el9_7.5
> +Upstream-commit: https://gitlab.gnome.org/GNOME/libsoup/-/commit/cfa9d90=
d1a5c274233554a264c56551c13d6a6f0]
> +CVE: CVE-2026-1761
> +
> +Signed-off-by: Rohini Sangam <rsangam@mvista.com>
> +---
> + libsoup/soup-filter-input-stream.c |  3 +-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/libsoup/soup-filter-input-stream.c b/libsoup/soup-filter-in=
put-stream.c
> +index 2c30bf9..b16246d 100644
> +--- a/libsoup/soup-filter-input-stream.c
> ++++ b/libsoup/soup-filter-input-stream.c
> +@@ -272,6 +272,7 @@ soup_filter_input_stream_read_until (SoupFilterInput=
Stream  *fstream,
> + 	if (eof && !*got_boundary)
> + 		read_length =3D MIN (fstream->priv->buf->len, length);
> + 	else
> +-		read_length =3D p - buf;
> ++		read_length =3D MIN ((gsize)(p - buf), length);
> ++
> + 	return read_from_buf (fstream, buffer, read_length);
> + }
> +--=20
> +2.44.4
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/re=
cipes-support/libsoup/libsoup-2.4_2.74.3.bb
> index 7e00cd678a..9f6beaee69 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> @@ -41,6 +41,8 @@ SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsou=
p-${PV}.tar.xz \
>             file://CVE-2025-4476.patch \
>             file://CVE-2025-2784.patch \
>             file://CVE-2025-4945.patch \
> +           file://CVE-2025-14523.patch \
> +           file://CVE-2026-1761.patch \
>  "
>  SRC_URI[sha256sum] =3D "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a03415=
3df1413fa1d92f13"
> =20
> diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.pa=
tch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
> new file mode 100644
> index 0000000000..7ce8571c8b
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
> @@ -0,0 +1,697 @@
> +From a94c4fb5bd9ef0f6b47128f9808c45f2259f9409 Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@redhat.com>
> +Date: Wed, 7 Jan 2026 14:50:33 -0600
> +Subject: [PATCH] Reject duplicate Host headers
> +
> +RFC 9112 section 3.2 says:
> +
> +A server MUST respond with a 400 (Bad Request) status code to any
> +HTTP/1.1 request message that lacks a Host header field and to any
> +request message that contains more than one Host header field line or a
> +Host header field with an invalid field value.
> +
> +In addition to rejecting a duplicate header when parsing headers, also
> +reject attempts to add the duplicate header using the
> +soup_message_headers_append() API, and add tests for both cases.
> +
> +These checks will also apply to HTTP/2. I'm not sure whether this is
> +actually desired or not, but the header processing code is not aware of
> +which HTTP version is in use.
> +
> +(Note that while SoupMessageHeaders does not require the Host header to
> +be present in an HTTP/1.1 request, SoupServer itself does. So we can't
> +test the case of missing Host header via the header parsing test, but it
> +really is enforced.)
> +
> +Fixes #472
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/a94c4fb5bd9ef0f6b47128f9808c45f2259f9409]
> +CVE: CVE-2025-14523
> +
> +Signed-off-by: Rohini Sangam <rsangam@mvista.com>
> +---
> + libsoup/soup-headers.c                 |   3 +-
> + libsoup/soup-message-headers-private.h |   4 +-
> + libsoup/soup-message-headers.c         |  76 ++++++++------
> + tests/header-parsing-test.c            | 132 ++++++++++++++++---------
> + 4 files changed, 135 insertions(+), 80 deletions(-)
> +
> +diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
> +index 52ef2ec..6688dfd 100644
> +--- a/libsoup/soup-headers.c
> ++++ b/libsoup/soup-headers.c
> +@@ -139,7 +139,8 @@ soup_headers_parse (const char *str, int len, SoupMe=
ssageHeaders *dest)
> + 		for (p =3D strchr (value, '\r'); p; p =3D strchr (p, '\r'))
> + 			*p =3D ' ';
> +=20
> +-		soup_message_headers_append_untrusted_data (dest, name, value);
> ++		if (!soup_message_headers_append_untrusted_data (dest, name, value))
> ++                        goto done;
> +         }
> + 	success =3D TRUE;
> +=20
> +diff --git a/libsoup/soup-message-headers-private.h b/libsoup/soup-messa=
ge-headers-private.h
> +index 9815464..770f3ef 100644
> +--- a/libsoup/soup-message-headers-private.h
> ++++ b/libsoup/soup-message-headers-private.h
> +@@ -10,10 +10,10 @@
> +=20
> + G_BEGIN_DECLS
> +=20
> +-void        soup_message_headers_append_untrusted_data  (SoupMessageHea=
ders *hdrs,
> ++gboolean    soup_message_headers_append_untrusted_data  (SoupMessageHea=
ders *hdrs,
> +                                                          const char    =
     *name,
> +                                                          const char    =
     *value);
> +-void        soup_message_headers_append_common          (SoupMessageHea=
ders *hdrs,
> ++gboolean    soup_message_headers_append_common          (SoupMessageHea=
ders *hdrs,
> +                                                          SoupHeaderName=
      name,
> +                                                          const char    =
     *value);
> + const char *soup_message_headers_get_one_common         (SoupMessageHea=
ders *hdrs,
> +diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-heade=
rs.c
> +index d69d6e8..383a09f 100644
> +--- a/libsoup/soup-message-headers.c
> ++++ b/libsoup/soup-message-headers.c
> +@@ -267,12 +267,16 @@ soup_message_headers_clean_connection_headers (Sou=
pMessageHeaders *hdrs)
> + 	soup_header_free_list (tokens);
> + }
> +=20
> +-void
> ++gboolean
> + soup_message_headers_append_common (SoupMessageHeaders *hdrs,
> +                                     SoupHeaderName      name,
> +                                     const char         *value)
> + {
> +         SoupCommonHeader header;
> ++	if (name =3D=3D SOUP_HEADER_HOST && soup_message_headers_get_one (hdrs=
, "Host")) {
> ++                g_warning ("Attempted to add duplicate Host header to a=
 SoupMessageHeaders that already contains a Host header");
> ++                return FALSE;
> ++        }
> +=20
> +         if (!hdrs->common_headers)
> +                 hdrs->common_headers =3D g_array_sized_new (FALSE, FALS=
E, sizeof (SoupCommonHeader), 6);
> +@@ -284,32 +288,18 @@ soup_message_headers_append_common (SoupMessageHea=
ders *hdrs,
> +                 g_hash_table_remove (hdrs->common_concat, GUINT_TO_POIN=
TER (header.name));
> +=20
> +         soup_message_headers_set (hdrs, name, value);
> ++	return TRUE;
> + }
> +=20
> +-/**
> +- * soup_message_headers_append:
> +- * @hdrs: a #SoupMessageHeaders
> +- * @name: the header name to add
> +- * @value: the new value of @name
> +- *
> +- * Appends a new header with name @name and value @value to @hdrs.
> +- *
> +- * (If there is an existing header with name @name, then this creates a=
 second
> +- * one, which is only allowed for list-valued headers; see also
> +- * [method@MessageHeaders.replace].)
> +- *
> +- * The caller is expected to make sure that @name and @value are
> +- * syntactically correct.
> +- **/
> +-void
> +-soup_message_headers_append (SoupMessageHeaders *hdrs,
> +-			     const char *name, const char *value)
> ++static gboolean
> ++soup_message_headers_append_internal (SoupMessageHeaders *hdrs,
> ++			              const char *name, const char *value)
> + {
> + 	SoupUncommonHeader header;
> +         SoupHeaderName header_name;
> +=20
> +-	g_return_if_fail (name !=3D NULL);
> +-	g_return_if_fail (value !=3D NULL);
> ++	g_return_val_if_fail (name !=3D NULL, FALSE);
> ++	g_return_val_if_fail (value !=3D NULL, FALSE);
> +=20
> + 	/* Setting a syntactically invalid header name or value is
> + 	 * considered to be a programming error. However, it can also
> +@@ -317,23 +307,22 @@ soup_message_headers_append (SoupMessageHeaders *h=
drs,
> + 	 * compiled with G_DISABLE_CHECKS.
> + 	 */
> + #ifndef G_DISABLE_CHECKS
> +-	g_return_if_fail (*name && strpbrk (name, " \t\r\n:") =3D=3D NULL);
> +-	g_return_if_fail (strpbrk (value, "\r\n") =3D=3D NULL);
> ++	g_return_val_if_fail (*name && strpbrk (name, " \t\r\n:") =3D=3D NULL,=
 FALSE);
> ++	g_return_val_if_fail (strpbrk (value, "\r\n") =3D=3D NULL, FALSE);
> + #else
> + 	if (*name && strpbrk (name, " \t\r\n:")) {
> + 		g_warning ("soup_message_headers_append: Ignoring bad name '%s'", nam=
e);
> +-		return;
> ++		return FALSE;
> + 	}
> + 	if (strpbrk (value, "\r\n")) {
> + 		g_warning ("soup_message_headers_append: Ignoring bad value '%s'", va=
lue);
> +-		return;
> ++		return FALSE;
> + 	}
> + #endif
> +=20
> +         header_name =3D soup_header_name_from_string (name);
> +         if (header_name !=3D SOUP_HEADER_UNKNOWN) {
> +-                soup_message_headers_append_common (hdrs, header_name, =
value);
> +-                return;
> ++                return soup_message_headers_append_common (hdrs, header=
_name, value);
> +         }
> +=20
> +         if (!hdrs->uncommon_headers)
> +@@ -344,21 +333,48 @@ soup_message_headers_append (SoupMessageHeaders *h=
drs,
> + 	g_array_append_val (hdrs->uncommon_headers, header);
> + 	if (hdrs->uncommon_concat)
> + 		g_hash_table_remove (hdrs->uncommon_concat, header.name);
> ++	return TRUE;
> ++}
> ++
> ++/**
> ++ * soup_message_headers_append:
> ++ * @hdrs: a #SoupMessageHeaders
> ++ * @name: the header name to add
> ++ * @value: the new value of @name
> ++ *
> ++ * Appends a new header with name @name and value @value to @hdrs.
> ++ *
> ++ * (If there is an existing header with name @name, then this creates a=
 second
> ++ * one, which is only allowed for list-valued headers; see also
> ++ * [method@MessageHeaders.replace].)
> ++ *
> ++ * The caller is expected to make sure that @name and @value are
> ++ * syntactically correct.
> ++ **/
> ++void
> ++soup_message_headers_append (SoupMessageHeaders *hdrs,
> ++			     const char *name, const char *value)
> ++{
> ++	soup_message_headers_append_internal (hdrs, name, value);
> + }
> +=20
> + /*
> +- * Appends a header value ensuring that it is valid UTF8.
> ++ * Appends a header value ensuring that it is valid UTF-8, and also che=
cking the
> ++ * return value of soup_message_headers_append_internal() to report whe=
ther the
> ++ * headers are invalid for various other reasons.
> +  */
> +-void
> ++gboolean
> + soup_message_headers_append_untrusted_data (SoupMessageHeaders *hdrs,
> +                                             const char         *name,
> +                                             const char         *value)
> + {
> +         char *safe_value =3D g_utf8_make_valid (value, -1);
> +         char *safe_name =3D g_utf8_make_valid (name, -1);
> +-        soup_message_headers_append (hdrs, safe_name, safe_value);
> ++        gboolean result =3D soup_message_headers_append_internal (hdrs,=
 safe_name, safe_value);
> ++
> +         g_free (safe_value);
> +         g_free (safe_name);
> ++        return result;
> + }
> +=20
> + void
> +diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
> +index 4faafbd..380f706 100644
> +--- a/tests/header-parsing-test.c
> ++++ b/tests/header-parsing-test.c
> +@@ -24,6 +24,7 @@ static struct RequestTest {
> + 	const char *method, *path;
> + 	SoupHTTPVersion version;
> + 	Header headers[10];
> ++	GLogLevelFlags log_flags;
> + } reqtests[] =3D {
> + 	/**********************/
> + 	/*** VALID REQUESTS ***/
> +@@ -33,7 +34,7 @@ static struct RequestTest {
> + 	  "GET / HTTP/1.0\r\n", -1,
> + 	  SOUP_STATUS_OK,
> + 	  "GET", "/", SOUP_HTTP_1_0,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	{ "Req w/ 1 header", NULL,
> +@@ -42,7 +43,7 @@ static struct RequestTest {
> + 	  "GET", "/", SOUP_HTTP_1_1,
> + 	  { { "Host", "example.com" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Req w/ 1 header, no leading whitespace", NULL,
> +@@ -51,7 +52,7 @@ static struct RequestTest {
> + 	  "GET", "/", SOUP_HTTP_1_1,
> + 	  { { "Host", "example.com" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Req w/ 1 header including trailing whitespace", NULL,
> +@@ -60,7 +61,7 @@ static struct RequestTest {
> + 	  "GET", "/", SOUP_HTTP_1_1,
> + 	  { { "Host", "example.com" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Req w/ 1 header, wrapped", NULL,
> +@@ -69,7 +70,7 @@ static struct RequestTest {
> + 	  "GET", "/", SOUP_HTTP_1_1,
> + 	  { { "Foo", "bar baz" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Req w/ 1 header, wrapped with additional whitespace", NULL,
> +@@ -78,7 +79,7 @@ static struct RequestTest {
> + 	  "GET", "/", SOUP_HTTP_1_1,
> + 	  { { "Foo", "bar baz" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Req w/ 1 header, wrapped with tab", NULL,
> +@@ -87,7 +88,7 @@ static struct RequestTest {
> + 	  "GET", "/", SOUP_HTTP_1_1,
> + 	  { { "Foo", "bar baz" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Req w/ 1 header, wrapped before value", NULL,
> +@@ -96,7 +97,7 @@ static struct RequestTest {
> + 	  "GET", "/", SOUP_HTTP_1_1,
> + 	  { { "Foo", "bar baz" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Req w/ 1 header with empty value", NULL,
> +@@ -105,7 +106,7 @@ static struct RequestTest {
> + 	  "GET", "/", SOUP_HTTP_1_1,
> + 	  { { "Host", "" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Req w/ 2 headers", NULL,
> +@@ -115,7 +116,7 @@ static struct RequestTest {
> + 	  { { "Host", "example.com" },
> + 	    { "Connection", "close" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Req w/ 3 headers", NULL,
> +@@ -126,7 +127,7 @@ static struct RequestTest {
> + 	    { "Connection", "close" },
> + 	    { "Blah", "blah" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Req w/ 3 headers, 1st wrapped", NULL,
> +@@ -137,7 +138,7 @@ static struct RequestTest {
> +             { "Foo", "bar baz" },
> + 	    { "Blah", "blah" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Req w/ 3 headers, 2nd wrapped", NULL,
> +@@ -148,7 +149,7 @@ static struct RequestTest {
> + 	    { "Blah", "blah" },
> + 	    { "Foo", "bar baz" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Req w/ 3 headers, 3rd wrapped", NULL,
> +@@ -159,7 +160,7 @@ static struct RequestTest {
> + 	    { "Blah", "blah" },
> + 	    { "Foo", "bar baz" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Req w/ same header multiple times", NULL,
> +@@ -168,7 +169,7 @@ static struct RequestTest {
> + 	  "GET", "/", SOUP_HTTP_1_1,
> + 	  { { "Foo", "bar, baz, quux" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Connection header on HTTP/1.0 message", NULL,
> +@@ -178,21 +179,21 @@ static struct RequestTest {
> + 	  { { "Connection", "Bar, Quux" },
> +             { "Foo", "bar" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "GET with full URI", "667637",
> + 	  "GET http://example.com HTTP/1.1\r\n", -1,
> + 	  SOUP_STATUS_OK,
> + 	  "GET", "http://example.com", SOUP_HTTP_1_1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	{ "GET with full URI in upper-case", "667637",
> + 	  "GET HTTP://example.com HTTP/1.1\r\n", -1,
> + 	  SOUP_STATUS_OK,
> + 	  "GET", "HTTP://example.com", SOUP_HTTP_1_1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	/* It's better for this to be passed through: this means a SoupServer
> +@@ -202,7 +203,7 @@ static struct RequestTest {
> + 	  "GET AbOuT: HTTP/1.1\r\n", -1,
> + 	  SOUP_STATUS_OK,
> + 	  "GET", "AbOuT:", SOUP_HTTP_1_1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	/****************************/
> +@@ -217,7 +218,7 @@ static struct RequestTest {
> + 	  "GET", "/", SOUP_HTTP_1_1,
> + 	  { { "Host", "example.com" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	/* RFC 2616 section 3.1 says we MUST accept this */
> +@@ -228,7 +229,7 @@ static struct RequestTest {
> + 	  "GET", "/", SOUP_HTTP_1_1,
> + 	  { { "Host", "example.com" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	/* RFC 2616 section 19.3 says we SHOULD accept these */
> +@@ -240,7 +241,7 @@ static struct RequestTest {
> + 	  { { "Host", "example.com" },
> + 	    { "Connection", "close" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "LF instead of CRLF after Request-Line", NULL,
> +@@ -249,7 +250,7 @@ static struct RequestTest {
> + 	  "GET", "/", SOUP_HTTP_1_1,
> + 	  { { "Host", "example.com" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Mixed CRLF/LF", "666316",
> +@@ -261,7 +262,7 @@ static struct RequestTest {
> + 	    { "e", "f" },
> + 	    { "g", "h" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Req w/ incorrect whitespace in Request-Line", NULL,
> +@@ -270,7 +271,7 @@ static struct RequestTest {
> + 	  "GET", "/", SOUP_HTTP_1_1,
> + 	  { { "Host", "example.com" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Req w/ incorrect whitespace after Request-Line", "475169",
> +@@ -279,7 +280,7 @@ static struct RequestTest {
> + 	  "GET", "/", SOUP_HTTP_1_1,
> + 	  { { "Host", "example.com" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	/* If the request/status line is parseable, then we
> +@@ -293,7 +294,7 @@ static struct RequestTest {
> + 	  { { "Host", "example.com" },
> + 	    { "Bar", "two" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "First header line is continuation", "666316",
> +@@ -303,7 +304,7 @@ static struct RequestTest {
> + 	  { { "Host", "example.com" },
> + 	    { "c", "d" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Zero-length header name", "666316",
> +@@ -313,7 +314,7 @@ static struct RequestTest {
> + 	  { { "a", "b" },
> + 	    { "c", "d" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "CR in header name", "666316",
> +@@ -323,7 +324,7 @@ static struct RequestTest {
> + 	  { { "a", "b" },
> + 	    { "c", "d" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "CR in header value", "666316",
> +@@ -336,7 +337,7 @@ static struct RequestTest {
> + 	    { "s", "t" },		/* CR at end is ignored */
> + 	    { "c", "d" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Tab in header name", "666316",
> +@@ -351,7 +352,7 @@ static struct RequestTest {
> + 	    { "p", "q z: w" },
> + 	    { "c", "d" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	{ "Tab in header value", "666316",
> +@@ -364,7 +365,7 @@ static struct RequestTest {
> + 	    { "z", "w" },	/* trailing tab ignored */
> + 	    { "c", "d" },
> + 	    { NULL }
> +-	  }
> ++	  }, 0
> + 	},
> +=20
> + 	/************************/
> +@@ -375,77 +376,77 @@ static struct RequestTest {
> + 	  "GET /\r\n", -1,
> + 	  SOUP_STATUS_BAD_REQUEST,
> + 	  NULL, NULL, -1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	{ "HTTP 1.2 request (no such thing)", NULL,
> + 	  "GET / HTTP/1.2\r\n", -1,
> + 	  SOUP_STATUS_HTTP_VERSION_NOT_SUPPORTED,
> + 	  NULL, NULL, -1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	{ "HTTP 2000 request (no such thing)", NULL,
> + 	  "GET / HTTP/2000.0\r\n", -1,
> + 	  SOUP_STATUS_HTTP_VERSION_NOT_SUPPORTED,
> + 	  NULL, NULL, -1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	{ "Long HTTP version terminating at missing minor version", "https://g=
itlab.gnome.org/GNOME/libsoup/-/issues/404",
> + 	  unterminated_http_version, sizeof (unterminated_http_version),
> + 	  SOUP_STATUS_BAD_REQUEST,
> +            NULL, NULL, -1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	{ "Non-HTTP request", NULL,
> + 	  "GET / SOUP/1.1\r\nHost: example.com\r\n", -1,
> + 	  SOUP_STATUS_BAD_REQUEST,
> + 	  NULL, NULL, -1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	{ "Junk after Request-Line", NULL,
> + 	  "GET / HTTP/1.1 blah\r\nHost: example.com\r\n", -1,
> + 	  SOUP_STATUS_BAD_REQUEST,
> + 	  NULL, NULL, -1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	{ "NUL in Method", NULL,
> + 	  "G\x00T / HTTP/1.1\r\nHost: example.com\r\n", 37,
> + 	  SOUP_STATUS_BAD_REQUEST,
> + 	  NULL, NULL, -1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	{ "NUL at beginning of Method", "666316",
> + 	  "\x00 / HTTP/1.1\r\nHost: example.com\r\n", 35,
> + 	  SOUP_STATUS_BAD_REQUEST,
> + 	  NULL, NULL, -1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	{ "NUL in Path", NULL,
> + 	  "GET /\x00 HTTP/1.1\r\nHost: example.com\r\n", 38,
> + 	  SOUP_STATUS_BAD_REQUEST,
> + 	  NULL, NULL, -1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	{ "No terminating CRLF", NULL,
> + 	  "GET / HTTP/1.1\r\nHost: example.com", -1,
> + 	  SOUP_STATUS_BAD_REQUEST,
> + 	  NULL, NULL, -1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	{ "Unrecognized expectation", NULL,
> + 	  "GET / HTTP/1.1\r\nHost: example.com\r\nExpect: the-impossible\r\n",=
 -1,
> + 	  SOUP_STATUS_EXPECTATION_FAILED,
> + 	  NULL, NULL, -1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	// https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
> +@@ -453,21 +454,31 @@ static struct RequestTest {
> + 	  "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
> + 	  SOUP_STATUS_BAD_REQUEST,
> + 	  NULL, NULL, -1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	{ "NUL in header value", NULL,
> + 	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
> + 	  SOUP_STATUS_BAD_REQUEST,
> +            NULL, NULL, -1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> + 	},
> +=20
> + 	{ "Only newlines", NULL,
> + 	  only_newlines, sizeof (only_newlines),
> + 	  SOUP_STATUS_BAD_REQUEST,
> +            NULL, NULL, -1,
> +-	  { { NULL } }
> ++	  { { NULL } }, 0
> ++	},
> ++
> ++	{ "Duplicate Host headers",
> ++	  "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
> ++	  "GET / HTTP/1.1\r\nHost: example.com\r\nHost: example.org\r\n",
> ++	  -1,
> ++	  SOUP_STATUS_BAD_REQUEST,
> ++	  NULL, NULL, -1,
> ++	  { { NULL } },
> ++	  G_LOG_LEVEL_WARNING
> + 	}
> + };
> + static const int num_reqtests =3D G_N_ELEMENTS (reqtests);
> +@@ -915,10 +926,17 @@ do_request_tests (void)
> + 			len =3D strlen (reqtests[i].request);
> + 		else
> + 			len =3D reqtests[i].length;
> ++
> ++		if (reqtests[i].log_flags)
> ++			g_test_expect_message ("libsoup", reqtests[i].log_flags, "*");
> ++
> + 		status =3D soup_headers_parse_request (reqtests[i].request, len,
> + 						     headers, &method, &path,
> + 						     &version);
> + 		g_assert_cmpint (status, =3D=3D, reqtests[i].status);
> ++		if (reqtests[i].log_flags)
> ++			g_test_assert_expected_messages ();
> ++
> + 		if (SOUP_STATUS_IS_SUCCESSFUL (status)) {
> + 			g_assert_cmpstr (method, =3D=3D, reqtests[i].method);
> + 			g_assert_cmpstr (path, =3D=3D, reqtests[i].path);
> +@@ -1314,6 +1332,25 @@ do_bad_header_tests (void)
> + 	soup_message_headers_unref (hdrs);
> + }
> +=20
> ++static void
> ++do_append_duplicate_host_test (void)
> ++{
> ++	SoupMessageHeaders *hdrs;
> ++	const char *list_value;
> ++
> ++	hdrs =3D soup_message_headers_new (SOUP_MESSAGE_HEADERS_REQUEST);
> ++	soup_message_headers_append (hdrs, "Host", "a");
> ++	g_test_expect_message ("libsoup", G_LOG_LEVEL_WARNING,
> ++		               "Attempted to add duplicate Host header to a SoupMessa=
geHeaders that already contains a Host header");
> ++	soup_message_headers_append (hdrs, "Host", "b");
> ++	g_test_assert_expected_messages ();
> ++
> ++	list_value =3D soup_message_headers_get_list (hdrs, "Host");
> ++	g_assert_cmpstr (list_value, =3D=3D, "a");
> ++
> ++	soup_message_headers_unref (hdrs);
> ++}
> ++
> + int
> + main (int argc, char **argv)
> + {
> +@@ -1329,6 +1366,7 @@ main (int argc, char **argv)
> + 	g_test_add_func ("/header-parsing/content-type", do_content_type_tests=
);
> + 	g_test_add_func ("/header-parsing/append-param", do_append_param_tests=
);
> + 	g_test_add_func ("/header-parsing/bad", do_bad_header_tests);
> ++	g_test_add_func ("/header-parsing/append-duplicate-host", do_append_du=
plicate_host_test);
> +=20
> + 	ret =3D g_test_run ();
> +=20
> +--=20
> +2.44.4
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-1761.pat=
ch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-1761.patch
> new file mode 100644
> index 0000000000..b47ddbae5d
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-1761.patch
> @@ -0,0 +1,102 @@
> +From cfa9d90d1a5c274233554a264c56551c13d6a6f0 Mon Sep 17 00:00:00 2001
> +From: Carlos Garcia Campos <cgarcia@igalia.com>
> +Date: Mon, 19 Jan 2026 15:14:58 +0100
> +Subject: [PATCH] multipart: check length of bytes read
> + soup_filter_input_stream_read_until()
> +
> +We do make sure the read length is smaller than the buffer length when
> +the boundary is not found, but we should do the same when the boundary
> +is found.
> +
> +Spotted in #YWH-PGM9867-149
> +Closes #493
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOMiE/libsoup/-/com=
mit/cfa9d90d1a5c274233554a264c56551c13d6a6f0]
> +CVE: CVE-2026-1761
> +
> +Signed-off-by: Rohini Sangam <rsangam@mvista.com>
> +---
> + libsoup/soup-filter-input-stream.c |  3 +-
> + tests/multipart-test.c             | 46 ++++++++++++++++++++++++++++++
> + 2 files changed, 48 insertions(+), 1 deletion(-)
> +
> +diff --git a/libsoup/soup-filter-input-stream.c b/libsoup/soup-filter-in=
put-stream.c
> +index b1e616c..76ff086 100644
> +--- a/libsoup/soup-filter-input-stream.c
> ++++ b/libsoup/soup-filter-input-stream.c
> +@@ -337,6 +337,7 @@ soup_filter_input_stream_read_until (SoupFilterInput=
Stream  *fstream,
> + 	if (eof && !*got_boundary)
> + 		read_length =3D MIN (priv->buf->len, length);
> + 	else
> +-		read_length =3D p - buf;
> ++		read_length =3D MIN ((gsize)(p - buf), length);
> ++
> + 	return read_from_buf (fstream, buffer, read_length);
> + }
> +diff --git a/tests/multipart-test.c b/tests/multipart-test.c
> +index b07e4db..b617056 100644
> +--- a/tests/multipart-test.c
> ++++ b/tests/multipart-test.c
> +@@ -548,6 +548,51 @@ test_multipart_bounds_bad_2 (void)
> + 	g_bytes_unref (bytes);
> + }
> +=20
> ++static void
> ++test_multipart_bounds_bad_3 (void)
> ++{
> ++        SoupMessage *msg;
> ++        SoupMessageHeaders *headers;
> ++        GInputStream *in;
> ++        SoupMultipartInputStream *multipart;
> ++        GError *error =3D NULL;
> ++        const char raw_data[] =3D "\0$--A\r\nContent-Disposition: form-=
data; name=3D\"f\"\r\n\r\nXXXXXXXXX\r\n--A--\r\n";
> ++
> ++        msg =3D soup_message_new(SOUP_METHOD_POST, "http://foo/upload")=
;
> ++        headers =3D soup_message_get_response_headers (msg);
> ++        soup_message_headers_replace (headers, "Content-Type", "multipa=
rt/form-data; boundary=3D\"A\"");
> ++
> ++        in =3D g_memory_input_stream_new_from_data (raw_data + 2, sizeo=
f(raw_data) - 2, NULL);
> ++        multipart =3D soup_multipart_input_stream_new (msg, in);
> ++        g_object_unref (in);
> ++
> ++        while (TRUE) {
> ++                in =3D soup_multipart_input_stream_next_part (multipart=
, NULL, &error);
> ++                g_assert_no_error (error);
> ++                if (!in) {
> ++                        g_clear_error (&error);
> ++                        break;
> ++                }
> ++
> ++                char buffer[10];
> ++                while (TRUE) {
> ++                        gssize bytes_read;
> ++
> ++                        bytes_read =3D g_input_stream_read (in, buffer,=
 sizeof(buffer), NULL, &error);
> ++                        g_assert_no_error (error);
> ++                        if (bytes_read <=3D 0) {
> ++                                g_clear_error (&error);
> ++                                break;
> ++                        }
> ++                }
> ++
> ++                g_object_unref (in);
> ++        }
> ++
> ++        g_object_unref (multipart);
> ++        g_object_unref (msg);
> ++}
> ++
> + static void
> + test_multipart_too_large (void)
> + {
> +@@ -617,6 +662,7 @@ main (int argc, char **argv)
> + 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good)=
;
> + 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
> + 	g_test_add_func ("/multipart/bounds-bad-2", test_multipart_bounds_bad_=
2);
> ++	g_test_add_func ("/multipart/bounds-bad-3", test_multipart_bounds_bad_=
3);
> + 	g_test_add_func ("/multipart/too-large", test_multipart_too_large);
> +=20
> + 	ret =3D g_test_run ();
> +--=20
> +2.44.4
> +
> diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes=
-support/libsoup/libsoup_3.4.4.bb
> index c09b06fec2..b59f08b363 100644
> --- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> +++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> @@ -46,6 +46,8 @@ SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsou=
p-${PV}.tar.xz \
>             file://CVE-2025-2784.patch \
>             file://CVE-2025-4945.patch \
>             file://CVE-2025-12105.patch \
> +           file://CVE-2025-14523.patch \
> +           file://CVE-2026-1761.patch \
>  "
>  SRC_URI[sha256sum] =3D "291c67725f36ed90ea43efff25064b69c5a2d1981488477c=
05c481a3b4b0c5aa"
> =20


--=20
Yoann Congal
Smile ECS


