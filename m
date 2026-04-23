Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10F8FDEE2C
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 17:09:34 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2613.1776964169032343425
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 10:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZOyC6dIB;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so5708192f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 10:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776964167; x=1777568967; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4UwC6gR2ymWjMDvwLYhF2+cATSGxZCcKUiYNA9iTjc=;
        b=ZOyC6dIBA7F9u0oFLAua1dgE0Eh7yMCyxyDEfrrH7DUvaj9I85HBGUPvvkBySHqKKE
         hAwyW7qIvjAYVq9+t4GH0O9eDCKSIz1DQOYgH48l//aYOo/A+v944R05tFjNlEN+L3aD
         CbRqUgGcax6H3wtw2SD0HBLlaTRR46Yw41ZbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776964167; x=1777568967;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M4UwC6gR2ymWjMDvwLYhF2+cATSGxZCcKUiYNA9iTjc=;
        b=Kkcw76wHquYSnob/l2V0XZIqjMOHgRevBgR0u1InhKZuh5Bu1H4WJllMLY8spTFGrv
         W8g/ap6u/QD2T7bY+Eg9z/Om4rqgPhu2EsxggHqOkQ+gRdrMqC4uGw9CSS7M2As9G1pR
         B6uKeSFfA2bqwb0WvCOyhnhQ8O16tf517EnXUJX0CW/P8ooB2SKlsKFK5xXYTfEyFJay
         /5CAPNfw5+M2hGKL/eTHpTHaXZ9F9M8VhyYb3dcr40z4Nwb9i0FZF1iB5VQ+xCzdOutW
         aq4cqLomd56comi0uSVkD+fO8ZCE6LVs1GZWcZGSgaBx7BPFZYUe95ZHmVbz9ygcUKry
         yv3g==
X-Forwarded-Encrypted: i=1; AFNElJ/WvMoHOQdPG57lKOcnDPR25P3NkSR8SsJ9yNs6S2wrj2przQlx1NzkZ37sUph67okjxwh2XKkLTqPe9Iv97OCUIw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw74x/2agzO6XVk8FPCqonip+i41aydHSmwd8u2I16i7AooP5gm
	i/NlvWezwgaqtGKj/hvGglV5shUsIJ/hD1j7601ScNhP7Th77SrN0XpBJAL6YeWrGgrhPDbybpx
	pPTkypR8Hf7TI
X-Gm-Gg: AeBDiesBH7hM+op94K2NqvuBKEUVBeS9pfyY2veKwzg3tj8YwRxXlDWmYK8YebT952s
	8mFSAOxOUkZXycOLip6ASXy+GOpOwqxOIx63Rxy07SF/+b26sK1hkkyRcZDjsWFihrJP4Ra9A7K
	/RbTKVcu1unpuYWoVrWAxNm+Kt78ds5bUpLj+kwqlsx8NWn1XI06o9o01NExMY6cNTOwYGAPbFm
	WHEbRN7zMzDRPFbzgQf1XsDK4hlh8S6eTX0AMyffQy09ZKXkIKxifsz23YelCU9N7LCvGUwCpP9
	78AK4JMh2iLi7Sh40ZB6KxFoYfXDcsIvDx7OwUABTnYHcX33h94cB/roZpXZWATveeUA70geGr1
	Rd+N6M+JDdWHDQGE0zVlrfmNzrQnWseyiyFZrLJxrS/7TqTgFfEw3x885FoKm5YlJHlnXOXYvbL
	wjGf2dkTQxYwmIEDs9VLtZNZIEmJN/PKAbJkMYTMUlVvHVXv64CTrY06nxhJUq3LUkuy5gFNryJ
	BqIy7BCKf0GwxXfJrJ18vpS8Q==
X-Received: by 2002:a05:6000:186c:b0:43d:73de:abce with SMTP id ffacd0b85a97d-43fe3e0a96cmr44206092f8f.32.1776964166579;
        Thu, 23 Apr 2026 10:09:26 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44123d23e0bsm15232421f8f.15.2026.04.23.10.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 10:09:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 19:09:25 +0200
Message-Id: <DI0P845NZBF6.2EOFV0FW4KH53@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 02/12] libsoup: fix
 CVE-2025-14523/CVE-2025-32049
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <Jinfeng.Wang.CN@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
 <20260409061639.1688205-3-jinfeng.wang.cn@windriver.com>
In-Reply-To: <20260409061639.1688205-3-jinfeng.wang.cn@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 17:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235827

On Thu Apr 9, 2026 at 8:16 AM CEST, Jinfeng (CN) via lists.openembedded.org=
 Wang wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Refer:
> https://gitlab.gnome.org/GNOME/libsoup/-/issues/472
> https://gitlab.gnome.org/GNOME/libsoup/-/issues/390
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> ---
>  .../libsoup-3.4.4/CVE-2025-14523.patch        | 715 ++++++++++++++++++
>  .../libsoup-3.4.4/CVE-2025-32049-1.patch      | 229 ++++++
>  .../libsoup-3.4.4/CVE-2025-32049-2.patch      |  34 +
>  .../libsoup-3.4.4/CVE-2025-32049-3.patch      | 134 ++++
>  .../libsoup-3.4.4/CVE-2025-32049-4.patch      | 292 +++++++
>  meta/recipes-support/libsoup/libsoup_3.4.4.bb |   5 +
>  6 files changed, 1409 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-1=
4523.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2049-1.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2049-2.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2049-3.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2049-4.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.pa=
tch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
> new file mode 100644
> index 0000000000..b90f8bd29d
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
> @@ -0,0 +1,715 @@
> +From 70123da95418f5d6e00e8ac2d586fb6c5d02cdc6 Mon Sep 17 00:00:00 2001
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
it/d3db5a6f8f03e1f0133754872877c92c0284c472]

Sorry but I don't see this commit mentionned in
(CVE-2025-14523) (#YWH-PGM9867-116) Lack of Duplicate Header Rejection in l=
ibsoup can lead to host header parsing discrepancy between libsoup server a=
nd proxy (#472) =C2=B7 Issue =C2=B7 GNOME/libsoup
https://gitlab.gnome.org/GNOME/libsoup/-/issues/472

I admit this commit looks related but I very much like a detailled trail
between a trusted source (eg. NVD, debian security tracker or upstream)
and the commit.

Also, that commit is only in the "mcatanzaro/rhel9" branch, that would
need some justification.

This may apply to the other CVE.

Finally, I'd rather have 1 CVE fix per commit, would it be possible to
split the commit?

Thanks!

> +CVE: CVE-2025-14523
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/soup-headers.c                 |   3 +-
> + libsoup/soup-message-headers-private.h |   4 +-
> + libsoup/soup-message-headers.c         |  80 +++++++------
> + tests/header-parsing-test.c            | 148 +++++++++++++++++--------
> + 4 files changed, 153 insertions(+), 82 deletions(-)
> +
> +diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
> +index 155c11d..3fec9b3 100644
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
> +index d69d6e8..ce4b3b3 100644
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
> ++        if (name =3D=3D SOUP_HEADER_HOST && soup_message_headers_get_on=
e (hdrs, "Host")) {
> ++                g_warning ("soup_message_headers_append_common: Rejecti=
ng duplicate Host header");
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
> ++        return TRUE;
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
> ++                         const char *name, const char *value)
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
> +-		g_warning ("soup_message_headers_append: Ignoring bad name '%s'", nam=
e);
> +-		return;
> ++		g_warning ("soup_message_headers_append: Rejecting bad name '%s'", na=
me);
> ++		return FALSE;
> + 	}
> + 	if (strpbrk (value, "\r\n")) {
> +-		g_warning ("soup_message_headers_append: Ignoring bad value '%s'", va=
lue);
> +-		return;
> ++		g_warning ("soup_message_headers_append: Rejecting bad value '%s'", v=
alue);
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
> ++        return TRUE;
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
> +index 9490559..98a22a4 100644
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
> +@@ -453,21 +454,40 @@ static struct RequestTest {
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
> ++	{ "Duplicate Host headers",
> ++	  "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
> ++	  "GET / HTTP/1.1\r\nHost: example.com\r\nHost: example.org\r\n",
> ++	  -1,
> ++	  SOUP_STATUS_BAD_REQUEST,
> ++	  NULL, NULL, -1,
> ++	  { { NULL } },
> ++	  G_LOG_LEVEL_WARNING
> ++	},
> ++
> ++	{ "Duplicate Host headers, case insensitive",
> ++	  "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
> ++	  "GET / HTTP/1.1\r\nHost: example.com\r\nhost: example.org\r\n",
> ++	  -1,
> ++	  SOUP_STATUS_BAD_REQUEST,
> ++	  NULL, NULL, -1,
> ++	  { { NULL } },
> ++	  G_LOG_LEVEL_WARNING
> + 	}
> + };
> + static const int num_reqtests =3D G_N_ELEMENTS (reqtests);
> +@@ -915,10 +935,17 @@ do_request_tests (void)
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
> +@@ -1312,6 +1339,32 @@ do_bad_header_tests (void)
> + 	soup_message_headers_unref (hdrs);
> + }
> +=20
> ++static void
> ++do_append_duplicate_host_test (void)
> ++{
> ++   SoupMessageHeaders *hdrs;
> ++   const char *list_value;
> ++
> ++   hdrs =3D soup_message_headers_new (SOUP_MESSAGE_HEADERS_REQUEST);
> ++   soup_message_headers_append (hdrs, "Host", "a");
> ++
> ++   g_test_expect_message ("libsoup", G_LOG_LEVEL_WARNING,
> ++                      "soup_message_headers_append_common: Rejecting du=
plicate Host header");
> ++   soup_message_headers_append (hdrs, "Host", "b");
> ++   g_test_assert_expected_messages ();
> ++
> ++        /* Case insensitive */
> ++   g_test_expect_message ("libsoup", G_LOG_LEVEL_WARNING,
> ++                      "soup_message_headers_append_common: Rejecting du=
plicate Host header");
> ++   soup_message_headers_append (hdrs, "host", "b");
> ++   g_test_assert_expected_messages ();
> ++
> ++   list_value =3D soup_message_headers_get_list (hdrs, "Host");
> ++   g_assert_cmpstr (list_value, =3D=3D, "a");
> ++
> ++   soup_message_headers_unref (hdrs);
> ++}
> ++
> + int
> + main (int argc, char **argv)
> + {
> +@@ -1327,6 +1380,7 @@ main (int argc, char **argv)
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
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.=
patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
> new file mode 100644
> index 0000000000..0772c759dc
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
> @@ -0,0 +1,229 @@
> +From 176cb31003252a69d3fc7908e8f505c0ee006b7a Mon Sep 17 00:00:00 2001
> +From: Ignacio Casal Quinteiro <qignacio@amazon.com>
> +Date: Wed, 24 Jul 2024 15:20:35 +0200
> +Subject: [PATCH 1/4] websocket: add a way to restrict the total message =
size
> +
> +Otherwise a client could send small packages smaller than
> +total-incoming-payload-size but still to break the server
> +with a big allocation
> +
> +Fixes: #390
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/db87805ab565d67533dfed2cb409dbfd63c7fdce]
> +CVE: CVE-2025-32049
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/websocket/soup-websocket-connection.c | 107 +++++++++++++++++-
> + libsoup/websocket/soup-websocket-connection.h |   7 ++
> + 2 files changed, 110 insertions(+), 4 deletions(-)
> +
> +diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/web=
socket/soup-websocket-connection.c
> +index 5eb8150..19bdd39 100644
> +--- a/libsoup/websocket/soup-websocket-connection.c
> ++++ b/libsoup/websocket/soup-websocket-connection.c
> +@@ -84,7 +84,7 @@ enum {
> + 	PROP_MAX_INCOMING_PAYLOAD_SIZE,
> + 	PROP_KEEPALIVE_INTERVAL,
> + 	PROP_EXTENSIONS,
> +-
> ++	PROP_MAX_TOTAL_MESSAGE_SIZE,
> +         LAST_PROPERTY
> + };
> +=20
> +@@ -126,6 +126,7 @@ typedef struct {
> + 	char *origin;
> + 	char *protocol;
> + 	guint64 max_incoming_payload_size;
> ++	guint64 max_total_message_size;
> + 	guint keepalive_interval;
> +=20
> + 	gushort peer_close_code;
> +@@ -156,6 +157,7 @@ typedef struct {
> + } SoupWebsocketConnectionPrivate;
> +=20
> + #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
> ++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
> + #define READ_BUFFER_SIZE 1024
> + #define MASK_LENGTH 4
> +=20
> +@@ -670,8 +672,8 @@ bad_data_error_and_close (SoupWebsocketConnection *s=
elf)
> + }
> +=20
> + static void
> +-too_big_error_and_close (SoupWebsocketConnection *self,
> +-                         guint64 payload_len)
> ++too_big_incoming_payload_error_and_close (SoupWebsocketConnection *self=
,
> ++                                          guint64 payload_len)
> + {
> +         SoupWebsocketConnectionPrivate *priv =3D soup_websocket_connect=
ion_get_instance_private (self);
> + 	GError *error;
> +@@ -687,6 +689,24 @@ too_big_error_and_close (SoupWebsocketConnection *s=
elf,
> + 	emit_error_and_close (self, error, TRUE);
> + }
> +=20
> ++static void
> ++too_big_message_error_and_close (SoupWebsocketConnection *self,
> ++                                 guint64 len)
> ++{
> ++	SoupWebsocketConnectionPrivate *priv =3D soup_websocket_connection_get=
_instance_private (self);
> ++	GError *error;
> ++
> ++	error =3D g_error_new_literal (SOUP_WEBSOCKET_ERROR,
> ++				     SOUP_WEBSOCKET_CLOSE_TOO_BIG,
> ++				     priv->connection_type =3D=3D SOUP_WEBSOCKET_CONNECTION_SERVER =
?
> ++				     "Received WebSocket payload from the client larger than config=
ured max-total-message-size" :
> ++				     "Received WebSocket payload from the server larger than config=
ured max-total-message-size");
> ++	g_debug ("%s received message of size %" G_GUINT64_FORMAT " or greater=
, but max supported size is %" G_GUINT64_FORMAT,
> ++	         priv->connection_type =3D=3D SOUP_WEBSOCKET_CONNECTION_SERVER=
 ? "server" : "client",
> ++	         len, priv->max_total_message_size);
> ++	emit_error_and_close (self, error, TRUE);
> ++}
> ++
> + static void
> + close_connection (SoupWebsocketConnection *self,
> +                   gushort                  code,
> +@@ -918,6 +938,12 @@ process_contents (SoupWebsocketConnection *self,
> + 		switch (priv->message_opcode) {
> + 		case 0x01:
> + 		case 0x02:
> ++			/* Safety valve */
> ++			if (priv->max_total_message_size > 0 &&
> ++			    (priv->message_data->len + payload_len) > priv->max_total_messag=
e_size) {
> ++				too_big_message_error_and_close (self, (priv->message_data->len + p=
ayload_len));
> ++				return;
> ++			}
> + 			g_byte_array_append (priv->message_data, payload, payload_len);
> + 			break;
> + 		default:
> +@@ -1056,7 +1082,7 @@ process_frame (SoupWebsocketConnection *self)
> + 	/* Safety valve */
> + 	if (priv->max_incoming_payload_size > 0 &&
> + 	    payload_len > priv->max_incoming_payload_size) {
> +-		too_big_error_and_close (self, payload_len);
> ++		too_big_incoming_payload_error_and_close (self, payload_len);
> + 		return FALSE;
> + 	}
> +=20
> +@@ -1363,6 +1389,10 @@ soup_websocket_connection_get_property (GObject *=
object,
> + 		g_value_set_pointer (value, priv->extensions);
> + 		break;
> +=20
> ++        case PROP_MAX_TOTAL_MESSAGE_SIZE:
> ++		g_value_set_uint64 (value, priv->max_total_message_size);
> ++		break;
> ++
> + 	default:
> + 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> + 		break;
> +@@ -1416,6 +1446,10 @@ soup_websocket_connection_set_property (GObject *=
object,
> + 		priv->extensions =3D g_value_get_pointer (value);
> + 		break;
> +=20
> ++	case PROP_MAX_TOTAL_MESSAGE_SIZE:
> ++		priv->max_total_message_size =3D g_value_get_uint64 (value);
> ++		break;
> ++
> + 	default:
> + 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> + 		break;
> +@@ -1628,6 +1662,26 @@ soup_websocket_connection_class_init (SoupWebsock=
etConnectionClass *klass)
> +                                       G_PARAM_CONSTRUCT_ONLY |
> +                                       G_PARAM_STATIC_STRINGS);
> +=20
> ++	/**
> ++	 * SoupWebsocketConnection:max-total-message-size:
> ++	 *
> ++	 * The total message size for incoming packets.
> ++	 *
> ++	 * The protocol expects or 0 to not limit it.
> ++	 *
> ++	 * Since: 3.8
> ++	 */
> ++        properties[PROP_MAX_TOTAL_MESSAGE_SIZE] =3D
> ++                g_param_spec_uint64 ("max-total-message-size",
> ++                                     "Max total message size",
> ++                                     "Max total message size ",
> ++                                     0,
> ++                                     G_MAXUINT64,
> ++                                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
> ++                                     G_PARAM_READWRITE |
> ++                                     G_PARAM_CONSTRUCT |
> ++                                     G_PARAM_STATIC_STRINGS);
> ++
> +         g_object_class_install_properties (gobject_class, LAST_PROPERTY=
, properties);
> +=20
> + 	/**
> +@@ -2111,6 +2165,51 @@ soup_websocket_connection_set_max_incoming_payloa=
d_size (SoupWebsocketConnection
> + 	}
> + }
> +=20
> ++/**
> ++ * soup_websocket_connection_get_max_total_message_size:
> ++ * @self: the WebSocket
> ++ *
> ++ * Gets the maximum total message size allowed for packets.
> ++ *
> ++ * Returns: the maximum total message size.
> ++ *
> ++ * Since: 3.8
> ++ */
> ++guint64
> ++soup_websocket_connection_get_max_total_message_size (SoupWebsocketConn=
ection *self)
> ++{
> ++	SoupWebsocketConnectionPrivate *priv =3D soup_websocket_connection_get=
_instance_private (self);
> ++
> ++	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_M=
ESSAGE_SIZE_DEFAULT);
> ++
> ++	return priv->max_total_message_size;
> ++}
> ++
> ++/**
> ++ * soup_websocket_connection_set_max_total_message_size:
> ++ * @self: the WebSocket
> ++ * @max_total_message_size: the maximum total message size
> ++ *
> ++ * Sets the maximum total message size allowed for packets.
> ++ *
> ++ * It does not limit the outgoing packet size.
> ++ *
> ++ * Since: 3.8
> ++ */
> ++void
> ++soup_websocket_connection_set_max_total_message_size (SoupWebsocketConn=
ection *self,
> ++                                                      guint64          =
        max_total_message_size)
> ++{
> ++	SoupWebsocketConnectionPrivate *priv =3D soup_websocket_connection_get=
_instance_private (self);
> ++
> ++	g_return_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self));
> ++
> ++	if (priv->max_total_message_size !=3D max_total_message_size) {
> ++		priv->max_total_message_size =3D max_total_message_size;
> ++		g_object_notify_by_pspec (G_OBJECT (self), properties[PROP_MAX_TOTAL_=
MESSAGE_SIZE]);
> ++	}
> ++}
> ++
> + /**
> +  * soup_websocket_connection_get_keepalive_interval:
> +  * @self: the WebSocket
> +diff --git a/libsoup/websocket/soup-websocket-connection.h b/libsoup/web=
socket/soup-websocket-connection.h
> +index eeb093d..922de56 100644
> +--- a/libsoup/websocket/soup-websocket-connection.h
> ++++ b/libsoup/websocket/soup-websocket-connection.h
> +@@ -88,6 +88,13 @@ SOUP_AVAILABLE_IN_ALL
> + void                soup_websocket_connection_set_max_incoming_payload_=
size (SoupWebsocketConnection *self,
> +                                                                        =
      guint64                  max_incoming_payload_size);
> +=20
> ++SOUP_AVAILABLE_IN_3_0
> ++guint64             soup_websocket_connection_get_max_total_message_siz=
e    (SoupWebsocketConnection *self);
> ++
> ++SOUP_AVAILABLE_IN_3_0
> ++void                soup_websocket_connection_set_max_total_message_siz=
e    (SoupWebsocketConnection *self,
> ++                                                                       =
      guint64                  max_total_message_size);
> ++
> + SOUP_AVAILABLE_IN_ALL
> + guint               soup_websocket_connection_get_keepalive_interval (S=
oupWebsocketConnection *self);
> +=20
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.=
patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
> new file mode 100644
> index 0000000000..6f00fabfdb
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
> @@ -0,0 +1,34 @@
> +From 81eb7cf7422878f0b78b833a3b741f734502921f Mon Sep 17 00:00:00 2001
> +From: Ignacio Casal Quinteiro <qignacio@amazon.com>
> +Date: Fri, 20 Sep 2024 12:12:38 +0200
> +Subject: [PATCH 2/4] websocket-test: set the total message size
> +
> +This is required when sending a big amount of data
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/4904a46a2d9a014efa6be01a186ac353dbf5047b]
> +CVE: CVE-2025-32049
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + tests/websocket-test.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/tests/websocket-test.c b/tests/websocket-test.c
> +index a0b8334..827b041 100644
> +--- a/tests/websocket-test.c
> ++++ b/tests/websocket-test.c
> +@@ -567,6 +567,11 @@ test_send_big_packets (Test *test,
> + 	soup_websocket_connection_set_max_incoming_payload_size (test->server,=
 1000 * 1000 + 1);
> + 	g_assert (soup_websocket_connection_get_max_incoming_payload_size (tes=
t->server) =3D=3D (1000 * 1000 + 1));
> +=20
> ++	soup_websocket_connection_set_max_total_message_size (test->client, 10=
00 * 1000 + 1);
> ++	g_assert (soup_websocket_connection_get_max_total_message_size (test->=
client) =3D=3D (1000 * 1000 + 1));
> ++	soup_websocket_connection_set_max_total_message_size (test->server, 10=
00 * 1000 + 1);
> ++	g_assert (soup_websocket_connection_get_max_total_message_size (test->=
server) =3D=3D (1000 * 1000 + 1));
> ++
> + 	sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000)=
;
> + 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (s=
ent, NULL));
> + 	WAIT_UNTIL (received !=3D NULL);
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.=
patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
> new file mode 100644
> index 0000000000..29fb0d7ddb
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
> @@ -0,0 +1,134 @@
> +From 25616e1a958bc1503cc24d6845a6e80ffc287727 Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@redhat.com>
> +Date: Thu, 8 May 2025 16:16:25 -0500
> +Subject: [PATCH] Set message size limit in SoupServer rather than
> + SoupWebsocketConnection
> +
> +We're not sure about the compatibility implications of having a default
> +size limit for clients.
> +
> +Also not sure whether the server limit is actually set appropriately,
> +but there is probably very little server usage of
> +SoupWebsocketConnection in the wild, so it's not so likely to break
> +things.
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/2df34d9544cabdbfdedd3b36f098cf69233b1df7]
> +CVE: CVE-2025-32049
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/server/soup-server.c                  | 24 +++++++++++++----
> + libsoup/websocket/soup-websocket-connection.c | 26 +++++++++++++------
> + 2 files changed, 37 insertions(+), 13 deletions(-)
> +
> +diff --git a/libsoup/server/soup-server.c b/libsoup/server/soup-server.c
> +index 6b486f5..c779f7d 100644
> +--- a/libsoup/server/soup-server.c
> ++++ b/libsoup/server/soup-server.c
> +@@ -186,6 +186,16 @@ static GParamSpec *properties[LAST_PROPERTY] =3D { =
NULL, };
> +=20
> + G_DEFINE_TYPE_WITH_PRIVATE (SoupServer, soup_server, G_TYPE_OBJECT)
> +=20
> ++/* SoupWebsocketConnection by default limits only maximum packet size. =
But a
> ++ * message may consist of multiple packets, so SoupServer additionally =
restricts
> ++ * total message size to mitigate denial of service attacks on the serv=
er.
> ++ * SoupWebsocketConnection does not do this by default because I don't =
know
> ++ * whether that would or would not cause compatibility problems for web=
sites.
> ++ *
> ++ * This size is in bytes and it is arbitrary.
> ++ */
> ++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
> ++
> + static void request_finished (SoupServerMessage      *msg,
> +                               SoupMessageIOCompletion completion,
> +                               SoupServer             *server);
> +@@ -937,11 +947,15 @@ complete_websocket_upgrade (SoupServer        *ser=
ver,
> +=20
> + 	g_object_ref (msg);
> + 	stream =3D soup_server_message_steal_connection (msg);
> +-	conn =3D soup_websocket_connection_new (stream, uri,
> +-					      SOUP_WEBSOCKET_CONNECTION_SERVER,
> +-					      soup_message_headers_get_one_common (soup_server_message_get=
_request_headers (msg), SOUP_HEADER_ORIGIN),
> +-					      soup_message_headers_get_one_common (soup_server_message_get=
_response_headers (msg), SOUP_HEADER_SEC_WEBSOCKET_PROTOCOL),
> +-					      handler->websocket_extensions);
> ++	conn =3D SOUP_WEBSOCKET_CONNECTION (g_object_new (SOUP_TYPE_WEBSOCKET_=
CONNECTION,
> ++					  "io-stream", stream,
> ++					  "uri", uri,
> ++					  "connection-type", SOUP_WEBSOCKET_CONNECTION_SERVER,
> ++					  "origin", soup_message_headers_get_one_common (soup_server_messa=
ge_get_request_headers (msg), SOUP_HEADER_ORIGIN),
> ++					  "protocol", soup_message_headers_get_one_common (soup_server_mes=
sage_get_response_headers (msg), SOUP_HEADER_SEC_WEBSOCKET_PROTOCOL),
> ++					  "extensions", handler->websocket_extensions,
> ++					  "max-total-message-size", (guint64)MAX_TOTAL_MESSAGE_SIZE_DEFAUL=
T,
> ++					  NULL));
> + 	handler->websocket_extensions =3D NULL;
> + 	g_object_unref (stream);
> +=20
> +diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/web=
socket/soup-websocket-connection.c
> +index 26476df..cbb1b72 100644
> +--- a/libsoup/websocket/soup-websocket-connection.c
> ++++ b/libsoup/websocket/soup-websocket-connection.c
> +@@ -149,7 +149,6 @@ typedef struct {
> + } SoupWebsocketConnectionPrivate;
> +=20
> + #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
> +-#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
> + #define READ_BUFFER_SIZE 1024
> + #define MASK_LENGTH 4
> +=20
> +@@ -1612,9 +1611,10 @@ soup_websocket_connection_class_init (SoupWebsock=
etConnectionClass *klass)
> + 	/**
> + 	 * SoupWebsocketConnection:max-incoming-payload-size:
> + 	 *
> +-	 * The maximum payload size for incoming packets.
> +-	 *
> +-	 * The protocol expects or 0 to not limit it.
> ++     * The maximum payload size for incoming packets, or 0 to not limit=
 it.
> ++     *
> ++     * Each message may consist of multiple packets, so also refer to
> ++     * [property@WebSocketConnection:max-total-message-size].
> + 	 */
> +         properties[PROP_MAX_INCOMING_PAYLOAD_SIZE] =3D
> +                 g_param_spec_uint64 ("max-incoming-payload-size",
> +@@ -1662,9 +1662,19 @@ soup_websocket_connection_class_init (SoupWebsock=
etConnectionClass *klass)
> + 	/**
> + 	 * SoupWebsocketConnection:max-total-message-size:
> + 	 *
> +-	 * The total message size for incoming packets.
> ++	 * The maximum size for incoming messages.
> ++	 *
> ++	 * Set to a value to limit the total message size, or 0 to not
> ++	 * limit it.
> ++	 *
> ++	 * [method@Server.add_websocket_handler] will set this to a nonzero
> ++	 * default value to mitigate denial of service attacks. Clients must
> ++	 * choose their own default if they need to mitigate denial of service
> ++	 * attacks. You also need to set your own default if creating your own
> ++	 * server SoupWebsocketConnection without using SoupServer.
> + 	 *
> +-	 * The protocol expects or 0 to not limit it.
> ++	 * Each message may consist of multiple packets, so also refer to
> ++	 * [property@WebSocketConnection:max-incoming-payload-size].
> + 	 *
> + 	 * Since: 3.8
> + 	 */
> +@@ -1674,7 +1684,7 @@ soup_websocket_connection_class_init (SoupWebsocke=
tConnectionClass *klass)
> +                                      "Max total message size ",
> +                                      0,
> +                                      G_MAXUINT64,
> +-                                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
> ++                                     0,
> +                                      G_PARAM_READWRITE |
> +                                      G_PARAM_CONSTRUCT |
> +                                      G_PARAM_STATIC_STRINGS);
> +@@ -2164,7 +2174,7 @@ soup_websocket_connection_get_max_total_message_si=
ze (SoupWebsocketConnection *s
> + {
> + 	SoupWebsocketConnectionPrivate *priv =3D soup_websocket_connection_get=
_instance_private (self);
> +=20
> +-	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_M=
ESSAGE_SIZE_DEFAULT);
> ++	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), 0);
> +=20
> + 	return priv->max_total_message_size;
> + }
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.=
patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch
> new file mode 100644
> index 0000000000..6f391e98e2
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch
> @@ -0,0 +1,292 @@
> +From 3c87790a4ba141125e6ba165c478f0440e8e693e Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@redhat.com>
> +Date: Fri, 16 May 2025 16:55:40 -0500
> +Subject: [PATCH 4/4] Add tests for max-incoming-packet-size and
> + max-total-message-size
> +
> +An even better test would verify that it's possible to send big messages
> +containing small packets, but libsoup doesn't offer control over packet
> +size, and I don't want to take the time to learn how WebSockets work to
> +figure out how to do that manually. Instead, I just check that both
> +limits work, for both client and server.
> +
> +I didn't add deflate variants of these tests because I doubt that would
> +add valuable coverage.
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/4d00b45b7eebdcfa0706b58e34c40b8a0a16015b]
> +CVE: CVE-2025-32049
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + tests/websocket-test.c | 214 +++++++++++++++++++++++++++++++++++++----
> + 1 file changed, 197 insertions(+), 17 deletions(-)
> +
> +diff --git a/tests/websocket-test.c b/tests/websocket-test.c
> +index 827b041..ec1324c 100644
> +--- a/tests/websocket-test.c
> ++++ b/tests/websocket-test.c
> +@@ -543,16 +543,9 @@ test_send_big_packets (Test *test,
> + {
> + 	GBytes *sent =3D NULL;
> + 	GBytes *received =3D NULL;
> ++	gulong signal_id;
> +=20
> +-	g_signal_connect (test->client, "message", G_CALLBACK (on_text_message=
), &received);
> +-
> +-	sent =3D g_bytes_new_take (g_strnfill (400, '!'), 400);
> +-	soup_websocket_connection_send_text (test->server, g_bytes_get_data (s=
ent, NULL));
> +-	WAIT_UNTIL (received !=3D NULL);
> +-	g_assert (g_bytes_equal (sent, received));
> +-	g_bytes_unref (sent);
> +-	g_bytes_unref (received);
> +-	received =3D NULL;
> ++	signal_id =3D g_signal_connect (test->client, "message", G_CALLBACK (o=
n_text_message), &received);
> +=20
> + 	sent =3D g_bytes_new_take (g_strnfill (100 * 1000, '?'), 100 * 1000);
> + 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (s=
ent, NULL));
> +@@ -563,23 +556,174 @@ test_send_big_packets (Test *test,
> + 	received =3D NULL;
> +=20
> + 	soup_websocket_connection_set_max_incoming_payload_size (test->client,=
 1000 * 1000 + 1);
> +-	g_assert (soup_websocket_connection_get_max_incoming_payload_size (tes=
t->client) =3D=3D (1000 * 1000 + 1));
> ++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_s=
ize (test->client), =3D=3D, 1000 * 1000 + 1);
> + 	soup_websocket_connection_set_max_incoming_payload_size (test->server,=
 1000 * 1000 + 1);
> +-	g_assert (soup_websocket_connection_get_max_incoming_payload_size (tes=
t->server) =3D=3D (1000 * 1000 + 1));
> ++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_s=
ize (test->server), =3D=3D, 1000 * 1000 + 1);
> +=20
> + 	soup_websocket_connection_set_max_total_message_size (test->client, 10=
00 * 1000 + 1);
> +-	g_assert (soup_websocket_connection_get_max_total_message_size (test->=
client) =3D=3D (1000 * 1000 + 1));
> ++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size=
 (test->client), =3D=3D, 1000 * 1000 + 1);
> + 	soup_websocket_connection_set_max_total_message_size (test->server, 10=
00 * 1000 + 1);
> +-	g_assert (soup_websocket_connection_get_max_total_message_size (test->=
server) =3D=3D (1000 * 1000 + 1));
> ++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size=
 (test->server), =3D=3D, 1000 * 1000 + 1);
> +=20
> + 	sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000)=
;
> + 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (s=
ent, NULL));
> + 	WAIT_UNTIL (received !=3D NULL);
> + 	g_assert (g_bytes_equal (sent, received));
> ++	g_bytes_unref (received);
> ++	received =3D NULL;
> ++
> ++	/* Reverse the test and send the big message to the server. */
> ++	g_signal_handler_disconnect (test->client, signal_id);
> ++	g_signal_connect (test->server, "message", G_CALLBACK (on_text_message=
), &received);
> ++
> ++	soup_websocket_connection_send_text (test->client, g_bytes_get_data (s=
ent, NULL));
> ++	WAIT_UNTIL (received !=3D NULL);
> ++	g_assert_true (g_bytes_equal (sent, received));
> + 	g_bytes_unref (sent);
> + 	g_bytes_unref (received);
> + }
> +=20
> ++static void
> ++test_send_big_packets_direct (Test *test,
> ++                              gconstpointer data)
> ++{
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->client), =3D=3D, 128 * 1024);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->client), =3D=3D, 0);
> ++
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->server), =3D=3D, 128 * 1024);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->server), =3D=3D, 0);
> ++
> ++   test_send_big_packets (test, data);
> ++}
> ++
> ++static void
> ++test_send_big_packets_soup (Test *test,
> ++                            gconstpointer data)
> ++{
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->client), =3D=3D, 128 * 1024);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->client), =3D=3D, 0);
> ++
> ++   /* Max total message size defaults to 0 (unlimited), but SoupServer =
applies its own limit by default. */
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->server), =3D=3D, 128 * 1024);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->server), =3D=3D, 128 * 1024);
> ++
> ++   test_send_big_packets (test, data);
> ++}
> ++
> ++static void
> ++test_send_exceeding_client_max_payload_size (Test *test,
> ++                                             gconstpointer data)
> ++{
> ++   GBytes *sent =3D NULL;
> ++   GBytes *received =3D NULL;
> ++   gboolean close_event =3D FALSE;
> ++   GError *error =3D NULL;
> ++
> ++   g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy),=
 &error);
> ++   g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_f=
lag), &close_event);
> ++
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->client), =3D=3D, 128 * 1024);
> ++
> ++   soup_websocket_connection_set_max_incoming_payload_size (test->serve=
r, 0);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->server), =3D=3D, 0);
> ++
> ++   /* The message to the client is dropped due to the client's limit. *=
/
> ++   sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 100=
0);
> ++   soup_websocket_connection_send_text (test->server, g_bytes_get_data =
(sent, NULL));
> ++   g_bytes_unref (sent);
> ++   WAIT_UNTIL (close_event);
> ++   g_assert_null (received);
> ++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
> ++   g_assert_no_error (test->client_error);
> ++}
> ++
> ++static void
> ++test_send_exceeding_server_max_payload_size (Test *test,
> ++                                             gconstpointer data)
> ++{
> ++   GBytes *sent =3D NULL;
> ++   GBytes *received =3D NULL;
> ++   gboolean close_event =3D FALSE;
> ++   GError *error =3D NULL;
> ++
> ++   g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy),=
 &error);
> ++   g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_f=
lag), &close_event);
> ++
> ++   soup_websocket_connection_set_max_incoming_payload_size (test->clien=
t, 0);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->client), =3D=3D, 0);
> ++
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload=
_size (test->server), =3D=3D, 128 * 1024);
> ++
> ++   /* The message to the server is dropped due to the server's limit. *=
/
> ++   sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 100=
0);
> ++   soup_websocket_connection_send_text (test->client, g_bytes_get_data =
(sent, NULL));
> ++   g_bytes_unref (sent);
> ++   WAIT_UNTIL (close_event);
> ++   g_assert_null (received);
> ++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
> ++   g_assert_no_error (test->client_error);
> ++}
> ++
> ++static void
> ++test_send_exceeding_client_max_message_size (Test *test,
> ++                                             gconstpointer data)
> ++{
> ++   GBytes *sent =3D NULL;
> ++   GBytes *received =3D NULL;
> ++   gboolean close_event =3D FALSE;
> ++   GError *error =3D NULL;
> ++
> ++   g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy),=
 &error);
> ++   g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_f=
lag), &close_event);
> ++
> ++   soup_websocket_connection_set_max_total_message_size (test->client, =
128 * 1024);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->client), =3D=3D, 128 * 1024);
> ++
> ++   soup_websocket_connection_set_max_total_message_size (test->server, =
0);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->server), =3D=3D, 0);
> ++
> ++   /* The message to the client is dropped due to the client's limit. *=
/
> ++   sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 100=
0);
> ++   soup_websocket_connection_send_text (test->server, g_bytes_get_data =
(sent, NULL));
> ++   g_bytes_unref (sent);
> ++   WAIT_UNTIL (close_event);
> ++   g_assert_null (received);
> ++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
> ++   g_assert_no_error (test->client_error);
> ++}
> ++
> ++static void
> ++test_send_exceeding_server_max_message_size (Test *test,
> ++                                             gconstpointer data)
> ++{
> ++   GBytes *sent =3D NULL;
> ++   GBytes *received =3D NULL;
> ++   gboolean close_event =3D FALSE;
> ++   GError *error =3D NULL;
> ++
> ++   g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy),=
 &error);
> ++   g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_f=
lag), &close_event);
> ++
> ++   soup_websocket_connection_set_max_total_message_size (test->client, =
0);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->client), =3D=3D, 0);
> ++
> ++   /* Set the server message total message size manually, because its
> ++    * default is different for direct connection vs. soup connection.
> ++    */
> ++   soup_websocket_connection_set_max_total_message_size (test->server, =
128 * 1024);
> ++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_si=
ze (test->server), =3D=3D, 128 * 1024);
> ++
> ++   /* The message to the server is dropped due to the server's limit. *=
/
> ++   sent =3D g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 100=
0);
> ++   soup_websocket_connection_send_text (test->client, g_bytes_get_data =
(sent, NULL));
> ++   g_bytes_unref (sent);
> ++   WAIT_UNTIL (close_event);
> ++   g_assert_null (received);
> ++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
> ++   g_assert_no_error (test->client_error);
> ++}
> ++
> ++
> + static void
> + test_send_empty_packets (Test *test,
> + 			 gconstpointer data)
> +@@ -2064,11 +2208,47 @@ main (int argc,
> +=20
> + 	g_test_add ("/websocket/direct/send-big-packets", Test, NULL,
> + 		    setup_direct_connection,
> +-		    test_send_big_packets,
> ++		    test_send_big_packets_direct,
> + 		    teardown_direct_connection);
> + 	g_test_add ("/websocket/soup/send-big-packets", Test, NULL,
> + 		    setup_soup_connection,
> +-		    test_send_big_packets,
> ++		    test_send_big_packets_soup,
> ++		    teardown_soup_connection);
> ++
> ++	g_test_add ("/websocket/direct/send-exceeding-client-max-payload-size"=
, Test, NULL,
> ++		    setup_direct_connection,
> ++		    test_send_exceeding_client_max_payload_size,
> ++		    teardown_direct_connection);
> ++	g_test_add ("/websocket/soup/send-exceeding-client-max-payload-size", =
Test, NULL,
> ++		    setup_soup_connection,
> ++		    test_send_exceeding_client_max_payload_size,
> ++		    teardown_soup_connection);
> ++
> ++	g_test_add ("/websocket/direct/send-exceeding-server-max-payload-size"=
, Test, NULL,
> ++		    setup_direct_connection,
> ++		    test_send_exceeding_server_max_payload_size,
> ++		    teardown_direct_connection);
> ++	g_test_add ("/websocket/soup/send-exceeding-server-max-payload-size", =
Test, NULL,
> ++		    setup_soup_connection,
> ++		    test_send_exceeding_server_max_payload_size,
> ++		    teardown_soup_connection);
> ++
> ++	g_test_add ("/websocket/direct/send-exceeding-client-max-message-size"=
, Test, NULL,
> ++		    setup_direct_connection,
> ++		    test_send_exceeding_client_max_message_size,
> ++		    teardown_direct_connection);
> ++	g_test_add ("/websocket/soup/send-exceeding-client-max-message-size", =
Test, NULL,
> ++		    setup_soup_connection,
> ++		    test_send_exceeding_client_max_message_size,
> ++		    teardown_soup_connection);
> ++
> ++	g_test_add ("/websocket/direct/send-exceeding-server-max-message-size"=
, Test, NULL,
> ++		    setup_direct_connection,
> ++		    test_send_exceeding_server_max_message_size,
> ++		    teardown_direct_connection);
> ++	g_test_add ("/websocket/soup/send-exceeding-server-max-message-size", =
Test, NULL,
> ++		    setup_soup_connection,
> ++		    test_send_exceeding_server_max_message_size,
> + 		    teardown_soup_connection);
> +=20
> + 	g_test_add ("/websocket/direct/send-empty-packets", Test, NULL,
> +@@ -2217,11 +2397,11 @@ main (int argc,
> +=20
> + 	g_test_add ("/websocket/direct/deflate-send-big-packets", Test, NULL,
> + 		    setup_direct_connection_with_extensions,
> +-		    test_send_big_packets,
> ++		    test_send_big_packets_direct,
> + 		    teardown_direct_connection);
> + 	g_test_add ("/websocket/soup/deflate-send-big-packets", Test, NULL,
> + 		    setup_soup_connection_with_extensions,
> +-		    test_send_big_packets,
> ++		    test_send_big_packets_soup,
> + 		    teardown_soup_connection);
> +=20
> + 	g_test_add ("/websocket/direct/deflate-send-empty-packets", Test, NULL=
,
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes=
-support/libsoup/libsoup_3.4.4.bb
> index c09b06fec2..fc4a286dcf 100644
> --- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> +++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> @@ -46,6 +46,11 @@ SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libso=
up-${PV}.tar.xz \
>             file://CVE-2025-2784.patch \
>             file://CVE-2025-4945.patch \
>             file://CVE-2025-12105.patch \
> +           file://CVE-2025-14523.patch \
> +           file://CVE-2025-32049-1.patch \
> +           file://CVE-2025-32049-2.patch \
> +           file://CVE-2025-32049-3.patch \
> +           file://CVE-2025-32049-4.patch \
>  "
>  SRC_URI[sha256sum] =3D "291c67725f36ed90ea43efff25064b69c5a2d1981488477c=
05c481a3b4b0c5aa"
> =20


--=20
Yoann Congal
Smile ECS


