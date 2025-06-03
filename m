Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CE3C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 08:54:06 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.6757.1748940841304238155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 01:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ly7U7Ovt;
 spf=pass (domain: mvista.com, ip: 209.85.218.45, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adb2e9fd208so887938266b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 01:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1748940840; x=1749545640; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AdnObvjTJQMZFO7HTccwtEx3yBF42AIgP5wd05sjf+c=;
        b=Ly7U7Ovtqc7YzJCUb5m25Ah6wFtQFHC9uAgxtzrp6jUv/a0N7Kd6hd0BV7I4Q5BLbG
         3lSILEm0QIVSbFgCokB1OCKFZMqpoe8+Evo90vtJEd4qHJI0t/iMfy5dByrlsY5cJPvc
         yQ8HwImOEFK2WXJKqAf7Epqjc2IOb0OLflIdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748940840; x=1749545640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdnObvjTJQMZFO7HTccwtEx3yBF42AIgP5wd05sjf+c=;
        b=YzdLu0QrTJNG1F5ohZTH7qUomhMUMovu6h4iXcVSEvi6UuimNun7VanJhc0uUKwWZX
         +TJKZibXmLUFoLQ/qsyQ2cGvyodbuJBt4mXWlUD+YubU1aHIbWqRtCslJ4ABhYAeQvkk
         liUr7cxtNe8mMUOCadPcuAkWPebX5oaw5XWlwyMFLC/r0lqv6QF/0bWFAMgMIowLZ/5Q
         lq/c3tJGkbS8VBRpAc9Yb6rdHH2Kf6n1za/SLQ2m7gwmH4KtvOw527atl9BKB+vZQw1F
         +Z6AufRV6ni/cDtOljFu+9LxsK2vEowUbgdfJjIT4XS7qV5zhpZj6MWHTPwjX9oxLa6Z
         nTGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrFj/UxSd5oR6xC6Lj4mJVVNesFT73qgKgDb0xnQQkXbIX/24pGs/2gLVZJtZ3Rk2SErkNNeEE3PJ0ycJZKztFEQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyHwokg/AKUouW/rsjWqFrgPd+wCmCf0OKf9jiEAQsVeMpSiI+F
	mmtRJ2p74V6DW0pFflucubICyYR6cKciCT/IXdVqVDClezV143yB8hjwDiQsoO+3kf22bATG07n
	qWiv1X8vm5gHVqykImiRjgo+D2UjsjSkRNewnAGyySg==
X-Gm-Gg: ASbGncvwcBV+ZrX/KSJ0KE4t0kgvLHukCZ1e5qz4VMSzA2yCZQHvUPEcBK/Hxv5T2JQ
	SWT8dM516TUnkyk+5qjRWNpbjchya5T99gAtHy3n0o2o6U2NZ9QYvhlMuob7c1wHKbAp3srWeL6
	M+YVqdErQysLQ8ucz6hi77W7LQxtXjFhJ5
X-Google-Smtp-Source: AGHT+IGUmmP36X1niumocaODvs6/KXfqhJ0A3sL3vC3jTHaS8xXWlG6ugXNM9kQgAQ2LCDJFAqDKIMjaNBJ23Ts2WLc=
X-Received: by 2002:a17:907:7210:b0:ad5:3055:784d with SMTP id
 a640c23a62f3a-adb322b02c7mr1468456566b.34.1748940839180; Tue, 03 Jun 2025
 01:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748093626.git.steve@sakoman.com> <b65e3d3a4dc2375d9bb81c7a91c84139cc667a47.1748093626.git.steve@sakoman.com>
 <BY1PR11MB812646004A79B1F1960F015DEE6DA@BY1PR11MB8126.namprd11.prod.outlook.com>
In-Reply-To: <BY1PR11MB812646004A79B1F1960F015DEE6DA@BY1PR11MB8126.namprd11.prod.outlook.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 3 Jun 2025 14:23:47 +0530
X-Gm-Features: AX0GCFvKoW1y8KPr8taspTH52h_VdsRXIrfKLy4pYQ9kaVOfd1ingEVQ7y7sFx8
Message-ID: <CANQUz19EdY0tXj36RkrEctQXL0hRrNFngV2asEmXkWm-CnEVww@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 05/12] libsoup-2.4: Fix CVE-2025-32910
To: "Kumar, Praveen" <Praveen.Kumar@windriver.com>
Cc: "steve@sakoman.com" <steve@sakoman.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000073ee8c0636a70511"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 08:54:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217785

--00000000000073ee8c0636a70511
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Praveen,

I have sent patch  to fix the auth-test failure.

https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D35075

Thanks & Regards,
Vijay

On Tue, Jun 3, 2025 at 1:26=E2=80=AFPM Kumar, Praveen <Praveen.Kumar@windri=
ver.com>
wrote:

> Hi,
>
> I noticed that after this patch for CVE-2025-32910 was applied, the build
> fails for libsoup-2.74.2 when building core-image-sato.
>
> The error is:
> *../libsoup-2.74.2/tests/auth-test.c:1554:39: error: unknown type name
> 'SoupServerMessage'; did you mean 'SoupServerClass'?*
>
> and something similar to it. If needed I can share the complete log file.
>
> This issue does not happen with core-image-minimal, may be because the
> test suite isn't built there.
>
> When I revert this CVE patch, the error goes away, and the build works
> fine again.
>
> Has anyone else seen this?  Should I disable the test suite if it's not
> required ?
> Please suggest on how we should fix it.
>
> Thanks,
> Praveen
>
>
> ------------------------------
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> on behalf of Steve Sakoman via
> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> *Sent:* Saturday, May 24, 2025 7:06 PM
> *To:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Subject:* [OE-core][kirkstone 05/12] libsoup-2.4: Fix CVE-2025-32910
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> import patch from debian to fix
>  CVE-2025-32910
>
> Upstream-Status: Backport [import from debian
> https://salsa.debian.org/gnome-team/libsoup/-/tree/debian/bullseye/debian=
/patches?ref_type=3Dheads
> Upstream commit
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1cbab56f5d15016=
cc861a503423cfe
> &
>
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd58c4759e7=
d5e23f02c3b556a
> &
>
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b7=
05e5eab34b13832]
>
> Reference:
> https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417
> https://security-tracker.debian.org/tracker/CVE-2025-32910
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../libsoup-2.4/CVE-2025-32910-1.patch        |  97 ++++++++++++
>  .../libsoup-2.4/CVE-2025-32910-2.patch        | 148 ++++++++++++++++++
>  .../libsoup-2.4/CVE-2025-32910-3.patch        |  26 +++
>  .../libsoup/libsoup-2.4_2.74.2.bb             |   3 +
>  4 files changed, 274 insertions(+)
>  create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
>  create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
>  create mode 100644
> meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
>
> diff --git
> a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
> b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
> new file mode 100644
> index 0000000000..de4faf5380
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
> @@ -0,0 +1,97 @@
> +From: Patrick Griffis <pgriffis@igalia.com>
> +Date: Sun, 8 Dec 2024 20:00:35 -0600
> +Subject: auth-digest: Handle missing realm in authenticate header
> +
> +(cherry picked from commit e40df6d48a1cbab56f5d15016cc861a503423cfe)
> +
> +Upstream-Status: Backport [import from debian
> https://salsa.debian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian=
/patches/CVE-2025-32910-1.patch?ref_type=3Dheads
> +Upstream commit
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1cbab56f5d15016=
cc861a503423cfe]
> +CVE: CVE-2025-32910
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + libsoup/soup-auth-digest.c |  3 +++
> + tests/auth-test.c          | 50
> ++++++++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 53 insertions(+)
> +
> +diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
> +index e8ba990..263a15a 100644
> +--- a/libsoup/soup-auth-digest.c
> ++++ b/libsoup/soup-auth-digest.c
> +@@ -142,6 +142,9 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage
> *msg,
> +       guint qop_options;
> +       gboolean ok =3D TRUE;
> +
> ++        if (!soup_auth_get_realm (auth))
> ++                return FALSE;
> ++
> +       g_free (priv->domain);
> +       g_free (priv->nonce);
> +       g_free (priv->opaque);
> +diff --git a/tests/auth-test.c b/tests/auth-test.c
> +index 8295ec3..dfc6b09 100644
> +--- a/tests/auth-test.c
> ++++ b/tests/auth-test.c
> +@@ -1549,6 +1549,55 @@ do_cancel_after_retry_test (void)
> +         soup_test_session_abort_unref (session);
> + }
> +
> ++static void
> ++on_request_read_for_missing_realm (SoupServer        *server,
> ++                                   SoupServerMessage *msg,
> ++                                   gpointer           user_data)
> ++{
> ++        SoupMessageHeaders *response_headers =3D
> soup_server_message_get_response_headers (msg);
> ++        soup_message_headers_replace (response_headers,
> "WWW-Authenticate", "Digest qop=3D\"auth\"");
> ++}
> ++
> ++static void
> ++do_missing_realm_test (void)
> ++{
> ++        SoupSession *session;
> ++        SoupMessage *msg;
> ++        SoupServer *server;
> ++        SoupAuthDomain *digest_auth_domain;
> ++        gint status;
> ++        GUri *uri;
> ++
> ++        server =3D soup_test_server_new (SOUP_TEST_SERVER_IN_THREAD);
> ++      soup_server_add_handler (server, NULL,
> ++                               server_callback, NULL, NULL);
> ++      uri =3D soup_test_server_get_uri (server, "http", NULL);
> ++
> ++      digest_auth_domain =3D soup_auth_domain_digest_new (
> ++              "realm", "auth-test",
> ++              "auth-callback", server_digest_auth_callback,
> ++              NULL);
> ++        soup_auth_domain_add_path (digest_auth_domain, "/");
> ++      soup_server_add_auth_domain (server, digest_auth_domain);
> ++        g_object_unref (digest_auth_domain);
> ++
> ++        g_signal_connect (server, "request-read",
> ++                          G_CALLBACK (on_request_read_for_missing_realm=
),
> ++                          NULL);
> ++
> ++        session =3D soup_test_session_new (NULL);
> ++        msg =3D soup_message_new_from_uri ("GET", uri);
> ++        g_signal_connect (msg, "authenticate",
> ++                          G_CALLBACK (on_digest_authenticate),
> ++                          NULL);
> ++
> ++        status =3D soup_test_session_send_message (session, msg);
> ++
> ++        g_assert_cmpint (status, =3D=3D, SOUP_STATUS_UNAUTHORIZED);
> ++      g_uri_unref (uri);
> ++      soup_test_server_quit_unref (server);
> ++}
> ++
> + int
> + main (int argc, char **argv)
> + {
> +@@ -1576,6 +1625,7 @@ main (int argc, char **argv)
> +       g_test_add_func ("/auth/async-message-do-not-use-auth-cache",
> do_async_message_do_not_use_auth_cache_test);
> +       g_test_add_func ("/auth/authorization-header-request",
> do_message_has_authorization_header_test);
> +       g_test_add_func ("/auth/cancel-after-retry",
> do_cancel_after_retry_test);
> ++        g_test_add_func ("/auth/missing-realm", do_missing_realm_test);
> +
> +       ret =3D g_test_run ();
> +
> diff --git
> a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
> b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
> new file mode 100644
> index 0000000000..0d72afa1d6
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
> @@ -0,0 +1,148 @@
> +From: Patrick Griffis <pgriffis@igalia.com>
> +Date: Thu, 26 Dec 2024 18:18:35 -0600
> +Subject: auth-digest: Handle missing nonce
> +
> +(cherry picked from commit 405a8a34597a44bd58c4759e7d5e23f02c3b556a)
> +
> +Upstream-Status: Backport [import from debian
> https://salsa.debian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian=
/patches/CVE-2025-32910-2.patch?ref_type=3Dheads
> +Upstream commit
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd58c4759e7=
d5e23f02c3b556a]
> +CVE: CVE-2025-32910
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + libsoup/soup-auth-digest.c | 45
> +++++++++++++++++++++++++++++++++++----------
> + tests/auth-test.c          | 19 +++++++++++--------
> + 2 files changed, 46 insertions(+), 18 deletions(-)
> +
> +diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
> +index 263a15a..393adb6 100644
> +--- a/libsoup/soup-auth-digest.c
> ++++ b/libsoup/soup-auth-digest.c
> +@@ -132,6 +132,19 @@ soup_auth_digest_get_qop (SoupAuthDigestQop qop)
> +       return g_string_free (out, FALSE);
> + }
> +
> ++static gboolean
> ++validate_params (SoupAuthDigest *auth_digest)
> ++{
> ++        SoupAuthDigestPrivate *priv =3D
> soup_auth_digest_get_instance_private (auth_digest);
> ++
> ++        if (priv->qop || priv->algorithm =3D=3D
> SOUP_AUTH_DIGEST_ALGORITHM_MD5_SESS) {
> ++                if (!priv->nonce)
> ++                        return FALSE;
> ++        }
> ++
> ++        return TRUE;
> ++}
> ++
> + static gboolean
> + soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
> +                        GHashTable *auth_params)
> +@@ -169,16 +182,21 @@ soup_auth_digest_update (SoupAuth *auth,
> SoupMessage *msg,
> +       if (priv->algorithm =3D=3D -1)
> +               ok =3D FALSE;
> +
> +-      stale =3D g_hash_table_lookup (auth_params, "stale");
> +-      if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv->hex_ur=
p)
> +-              recompute_hex_a1 (priv);
> +-      else {
> +-              g_free (priv->user);
> +-              priv->user =3D NULL;
> +-              g_free (priv->cnonce);
> +-              priv->cnonce =3D NULL;
> +-              memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
> +-              memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
> ++        if (!validate_params (auth_digest))
> ++                ok =3D FALSE;
> ++
> ++        if (ok) {
> ++                stale =3D g_hash_table_lookup (auth_params, "stale");
> ++                if (stale && !g_ascii_strcasecmp (stale, "TRUE") &&
> *priv->hex_urp)
> ++                        recompute_hex_a1 (priv);
> ++                else {
> ++                        g_free (priv->user);
> ++                        priv->user =3D NULL;
> ++                        g_free (priv->cnonce);
> ++                        priv->cnonce =3D NULL;
> ++                        memset (priv->hex_urp, 0, sizeof
> (priv->hex_urp));
> ++                        memset (priv->hex_a1, 0, sizeof (priv->hex_a1))=
;
> ++                }
> +         }
> +
> +       return ok;
> +@@ -269,6 +287,8 @@ soup_auth_digest_compute_hex_a1 (const
> char              *hex_urp,
> +
> +               /* In MD5-sess, A1 is hex_urp:nonce:cnonce */
> +
> ++                g_assert (nonce && cnonce);
> ++
> +               checksum =3D g_checksum_new (G_CHECKSUM_MD5);
> +               g_checksum_update (checksum, (guchar *)hex_urp, strlen
> (hex_urp));
> +               g_checksum_update (checksum, (guchar *)":", 1);
> +@@ -359,6 +379,8 @@ soup_auth_digest_compute_response (const char
> *method,
> +       if (qop) {
> +               char tmp[9];
> +
> ++                g_assert (cnonce);
> ++
> +               g_snprintf (tmp, 9, "%.8x", nc);
> +               g_checksum_update (checksum, (guchar *)tmp, strlen (tmp))=
;
> +               g_checksum_update (checksum, (guchar *)":", 1);
> +@@ -422,6 +444,9 @@ soup_auth_digest_get_authorization (SoupAuth *auth,
> SoupMessage *msg)
> +       g_return_val_if_fail (uri !=3D NULL, NULL);
> +       url =3D soup_uri_to_string (uri, TRUE);
> +
> ++        g_assert (priv->nonce);
> ++        g_assert (!priv->qop || priv->cnonce);
> ++
> +       soup_auth_digest_compute_response (msg->method, url, priv->hex_a1=
,
> +                                          priv->qop, priv->nonce,
> +                                          priv->cnonce, priv->nc,
> +diff --git a/tests/auth-test.c b/tests/auth-test.c
> +index dfc6b09..6fb1e4a 100644
> +--- a/tests/auth-test.c
> ++++ b/tests/auth-test.c
> +@@ -1550,16 +1550,17 @@ do_cancel_after_retry_test (void)
> + }
> +
> + static void
> +-on_request_read_for_missing_realm (SoupServer        *server,
> +-                                   SoupServerMessage *msg,
> +-                                   gpointer           user_data)
> ++on_request_read_for_missing_params (SoupServer        *server,
> ++                                      SoupServerMessage *msg,
> ++                                      gpointer           user_data)
> + {
> ++        const char *auth_header =3D user_data;
> +         SoupMessageHeaders *response_headers =3D
> soup_server_message_get_response_headers (msg);
> +-        soup_message_headers_replace (response_headers,
> "WWW-Authenticate", "Digest qop=3D\"auth\"");
> ++        soup_message_headers_replace (response_headers,
> "WWW-Authenticate", auth_header);
> + }
> +
> + static void
> +-do_missing_realm_test (void)
> ++do_missing_params_test (gconstpointer auth_header)
> + {
> +         SoupSession *session;
> +         SoupMessage *msg;
> +@@ -1582,8 +1583,8 @@ do_missing_realm_test (void)
> +         g_object_unref (digest_auth_domain);
> +
> +         g_signal_connect (server, "request-read",
> +-                          G_CALLBACK (on_request_read_for_missing_realm=
),
> +-                          NULL);
> ++                          G_CALLBACK
> (on_request_read_for_missing_params),
> ++                          (gpointer)auth_header);
> +
> +         session =3D soup_test_session_new (NULL);
> +         msg =3D soup_message_new_from_uri ("GET", uri);
> +@@ -1625,7 +1626,9 @@ main (int argc, char **argv)
> +       g_test_add_func ("/auth/async-message-do-not-use-auth-cache",
> do_async_message_do_not_use_auth_cache_test);
> +       g_test_add_func ("/auth/authorization-header-request",
> do_message_has_authorization_header_test);
> +       g_test_add_func ("/auth/cancel-after-retry",
> do_cancel_after_retry_test);
> +-        g_test_add_func ("/auth/missing-realm", do_missing_realm_test);
> ++        g_test_add_data_func ("/auth/missing-params/realm", "Digest
> qop=3D\"auth\"", do_missing_params_test);
> ++        g_test_add_data_func ("/auth/missing-params/nonce", "Digest
> realm=3D\"auth-test\", qop=3D\"auth,auth-int\",
> opaque=3D\"5ccc069c403ebaf9f0171e9517f40e41\"", do_missing_params_test);
> ++        g_test_add_data_func ("/auth/missing-params/nonce-md5-sess",
> "Digest realm=3D\"auth-test\", qop=3D\"auth,auth-int\",
> opaque=3D\"5ccc069c403ebaf9f0171e9517f40e41\" algorithm=3D\"MD5-sess\"",
> do_missing_params_test);
> +
> +       ret =3D g_test_run ();
> +
> diff --git
> a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
> b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
> new file mode 100644
> index 0000000000..ab0f650804
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
> @@ -0,0 +1,26 @@
> +From: Patrick Griffis <pgriffis@igalia.com>
> +Date: Fri, 27 Dec 2024 13:52:52 -0600
> +Subject: auth-digest: Fix leak
> +
> +(cherry picked from commit ea16eeacb052e423eb5c3b0b705e5eab34b13832)
> +
> +Upstream-Status: Backport [import from debian
> https://salsa.debian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian=
/patches/CVE-2025-32910-3.patch?ref_type=3Dheads
> +Upstream commit
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b7=
05e5eab34b13832]
> +CVE: CVE-2025-32910
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + libsoup/soup-auth-digest.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
> +index 393adb6..a1db188 100644
> +--- a/libsoup/soup-auth-digest.c
> ++++ b/libsoup/soup-auth-digest.c
> +@@ -66,6 +66,7 @@ soup_auth_digest_finalize (GObject *object)
> +       g_free (priv->nonce);
> +       g_free (priv->domain);
> +       g_free (priv->cnonce);
> ++        g_free (priv->opaque);
> +
> +       memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
> +       memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
> b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
> index f04d9b2966..517a8e4539 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
> @@ -23,6 +23,9 @@ SRC_URI =3D
> "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
>             file://CVE-2025-32906-2.patch \
>             file://CVE-2025-32909.patch \
>             file://CVE-2025-46420.patch \
> +           file://CVE-2025-32910-1.patch \
> +           file://CVE-2025-32910-2.patch \
> +           file://CVE-2025-32910-3.patch \
>            "
>  SRC_URI[sha256sum] =3D
> "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
>
> --
> 2.43.0
>
>

--00000000000073ee8c0636a70511
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Praveen,<br><br></div>I have sent patch=C2=A0=
 to fix the auth-test failure. <br><br><a href=3D"https://patchwork.yoctopr=
oject.org/project/oe-core/list/?series=3D35075">https://patchwork.yoctoproj=
ect.org/project/oe-core/list/?series=3D35075</a><br><br></div><div>Thanks &=
amp; Regards,</div><div>Vijay</div></div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 3, 202=
5 at 1:26=E2=80=AFPM Kumar, Praveen &lt;<a href=3D"mailto:Praveen.Kumar@win=
driver.com">Praveen.Kumar@windriver.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div class=3D"msg8276193754913908675=
">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I noticed that after this patch for CVE-2025-32910 was applied, the build f=
ails for libsoup-2.74.2 when building core-image-sato.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
The error is:</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>../libsoup-2.74.2/tests/auth-test.c:1554:39: error: unknown type name &#=
39;SoupServerMessage&#39;; did you mean &#39;SoupServerClass&#39;?</b></div=
>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
and something similar to it. If needed I can share the complete log file.</=
div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
This issue does not happen with core-image-minimal, may be because the test=
 suite isn&#39;t built there.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
When I revert this CVE patch, the error goes away, and the build works fine=
 again.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Has anyone else seen this?=C2=A0 Should I disable the test suite if it&#39;=
s not required ?=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Please suggest on how we should fix it.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Praveen</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
<br>
</div>
<div id=3D"m_8276193754913908675appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_8276193754913908675divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b> =
<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blan=
k">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:opene=
mbedded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@li=
sts.openembedded.org</a>&gt; on behalf of Steve Sakoman via <a href=3D"http=
://lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a>
 &lt;steve=3D<a href=3D"mailto:sakoman.com@lists.openembedded.org" target=
=3D"_blank">sakoman.com@lists.openembedded.org</a>&gt;<br>
<b>Sent:</b> Saturday, May 24, 2025 7:06 PM<br>
<b>To:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt;<br>
<b>Subject:</b> [OE-core][kirkstone 05/12] libsoup-2.4: Fix CVE-2025-32910<=
/font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>CAUTION: This email comes from a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=3D"_b=
lank">vanusuri@mvista.com</a>&gt;<br>
<br>
import patch from debian to fix<br>
=C2=A0CVE-2025-32910<br>
<br>
Upstream-Status: Backport [import from debian <a href=3D"https://salsa.debi=
an.org/gnome-team/libsoup/-/tree/debian/bullseye/debian/patches?ref_type=3D=
heads" target=3D"_blank">
https://salsa.debian.org/gnome-team/libsoup/-/tree/debian/bullseye/debian/p=
atches?ref_type=3Dheads</a><br>
Upstream commit <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit/=
e40df6d48a1cbab56f5d15016cc861a503423cfe" target=3D"_blank">
https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1cbab56f5d15016cc=
861a503423cfe</a><br>
&amp;<br>
<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd=
58c4759e7d5e23f02c3b556a" target=3D"_blank">https://gitlab.gnome.org/GNOME/=
libsoup/-/commit/405a8a34597a44bd58c4759e7d5e23f02c3b556a</a><br>
&amp;<br>
<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423=
eb5c3b0b705e5eab34b13832%5D" target=3D"_blank">https://gitlab.gnome.org/GNO=
ME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832]</a><br>
<br>
Reference:<br>
<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417" tar=
get=3D"_blank">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417<=
/a><br>
<a href=3D"https://security-tracker.debian.org/tracker/CVE-2025-32910" targ=
et=3D"_blank">https://security-tracker.debian.org/tracker/CVE-2025-32910</a=
><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0.../libsoup-2.4/CVE-2025-32910-1.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 97 ++++++++++++<br>
=C2=A0.../libsoup-2.4/CVE-2025-32910-2.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 148 ++++++++++++++++++<br>
=C2=A0.../libsoup-2.4/CVE-2025-32910-3.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 26 +++<br>
=C2=A0.../libsoup/<a href=3D"http://libsoup-2.4_2.74.2.bb" target=3D"_blank=
">libsoup-2.4_2.74.2.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +<br>
=C2=A04 files changed, 274 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-=
32910-1.patch<br>
=C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-=
32910-2.patch<br>
=C2=A0create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-=
32910-3.patch<br>
<br>
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch<br>
new file mode 100644<br>
index 0000000000..de4faf5380<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch<br>
@@ -0,0 +1,97 @@<br>
+From: Patrick Griffis &lt;<a href=3D"mailto:pgriffis@igalia.com" target=3D=
"_blank">pgriffis@igalia.com</a>&gt;<br>
+Date: Sun, 8 Dec 2024 20:00:35 -0600<br>
+Subject: auth-digest: Handle missing realm in authenticate header<br>
+<br>
+(cherry picked from commit e40df6d48a1cbab56f5d15016cc861a503423cfe)<br>
+<br>
+Upstream-Status: Backport [import from debian <a href=3D"https://salsa.deb=
ian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/patches/CVE-2025-3=
2910-1.patch?ref_type=3Dheads" target=3D"_blank">
https://salsa.debian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/p=
atches/CVE-2025-32910-1.patch?ref_type=3Dheads</a><br>
+Upstream commit <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/e40df6d48a1cbab56f5d15016cc861a503423cfe%5D" target=3D"_blank">
https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1cbab56f5d15016cc=
861a503423cfe]</a><br>
+CVE: CVE-2025-32910<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ libsoup/soup-auth-digest.c |=C2=A0 3 +++<br>
+ tests/auth-test.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 50 ++++++++++++++++++++++++++++++++++++++++++++++<br>
+ 2 files changed, 53 insertions(+)<br>
+<br>
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c<br>
+index e8ba990..263a15a 100644<br>
+--- a/libsoup/soup-auth-digest.c<br>
++++ b/libsoup/soup-auth-digest.c<br>
+@@ -142,6 +142,9 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *=
msg,<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 guint qop_options;<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gboolean ok =3D TRUE;<br>
+<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!soup_auth_get_realm (auth=
))<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return FALSE;<br>
++<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_free (priv-&gt;domain);<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_free (priv-&gt;nonce);<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_free (priv-&gt;opaque);<br>
+diff --git a/tests/auth-test.c b/tests/auth-test.c<br>
+index 8295ec3..dfc6b09 100644<br>
+--- a/tests/auth-test.c<br>
++++ b/tests/auth-test.c<br>
+@@ -1549,6 +1549,55 @@ do_cancel_after_retry_test (void)<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 soup_test_session_abort_u=
nref (session);<br>
+ }<br>
+<br>
++static void<br>
++on_request_read_for_missing_realm (SoupServer=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *server,<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SoupServerMessage=
 *msg,<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpointer=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 user_data)<br>
++{<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SoupMessageHeaders *response_h=
eaders =3D soup_server_message_get_response_headers (msg);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 soup_message_headers_replace (=
response_headers, &quot;WWW-Authenticate&quot;, &quot;Digest qop=3D\&quot;a=
uth\&quot;&quot;);<br>
++}<br>
++<br>
++static void<br>
++do_missing_realm_test (void)<br>
++{<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SoupSession *session;<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SoupMessage *msg;<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SoupServer *server;<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SoupAuthDomain *digest_auth_do=
main;<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gint status;<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GUri *uri;<br>
++<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 server =3D soup_test_server_ne=
w (SOUP_TEST_SERVER_IN_THREAD);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 soup_server_add_handler (server, NULL,<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 server_callback, NULL, NULL);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uri =3D soup_test_server_get_uri (server, =
&quot;http&quot;, NULL);<br>
++<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 digest_auth_domain =3D soup_auth_domain_di=
gest_new (<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &quot;realm&quot;, &quot;auth-test&quot;,<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &quot;auth-callback&quot;, server_digest_auth_callback,<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 NULL);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 soup_auth_domain_add_path (dig=
est_auth_domain, &quot;/&quot;);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 soup_server_add_auth_domain (server, diges=
t_auth_domain);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_object_unref (digest_auth_do=
main);<br>
++<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_signal_connect (server, &quo=
t;request-read&quot;,<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 G_CALLBACK (on_request_read_for_missing_realm),<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 NULL);<br>
++<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 session =3D soup_test_session_=
new (NULL);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg =3D soup_message_new_from_=
uri (&quot;GET&quot;, uri);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_signal_connect (msg, &quot;a=
uthenticate&quot;,<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 G_CALLBACK (on_digest_authenticate),<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 NULL);<br>
++<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D soup_test_session_s=
end_message (session, msg);<br>
++<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_assert_cmpint (status, =3D=
=3D, SOUP_STATUS_UNAUTHORIZED);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_uri_unref (uri);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 soup_test_server_quit_unref (server);<br>
++}<br>
++<br>
+ int<br>
+ main (int argc, char **argv)<br>
+ {<br>
+@@ -1576,6 +1625,7 @@ main (int argc, char **argv)<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_test_add_func (&quot;/auth/async-me=
ssage-do-not-use-auth-cache&quot;, do_async_message_do_not_use_auth_cache_t=
est);<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_test_add_func (&quot;/auth/authoriz=
ation-header-request&quot;, do_message_has_authorization_header_test);<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_test_add_func (&quot;/auth/cancel-a=
fter-retry&quot;, do_cancel_after_retry_test);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_test_add_func (&quot;/auth/m=
issing-realm&quot;, do_missing_realm_test);<br>
+<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D g_test_run ();<br>
+<br>
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch<br>
new file mode 100644<br>
index 0000000000..0d72afa1d6<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch<br>
@@ -0,0 +1,148 @@<br>
+From: Patrick Griffis &lt;<a href=3D"mailto:pgriffis@igalia.com" target=3D=
"_blank">pgriffis@igalia.com</a>&gt;<br>
+Date: Thu, 26 Dec 2024 18:18:35 -0600<br>
+Subject: auth-digest: Handle missing nonce<br>
+<br>
+(cherry picked from commit 405a8a34597a44bd58c4759e7d5e23f02c3b556a)<br>
+<br>
+Upstream-Status: Backport [import from debian <a href=3D"https://salsa.deb=
ian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/patches/CVE-2025-3=
2910-2.patch?ref_type=3Dheads" target=3D"_blank">
https://salsa.debian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/p=
atches/CVE-2025-32910-2.patch?ref_type=3Dheads</a><br>
+Upstream commit <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/405a8a34597a44bd58c4759e7d5e23f02c3b556a%5D" target=3D"_blank">
https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd58c4759e7d5=
e23f02c3b556a]</a><br>
+CVE: CVE-2025-32910<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ libsoup/soup-auth-digest.c | 45 +++++++++++++++++++++++++++++++++++------=
----<br>
+ tests/auth-test.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 19 +++++++++++--------<br>
+ 2 files changed, 46 insertions(+), 18 deletions(-)<br>
+<br>
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c<br>
+index 263a15a..393adb6 100644<br>
+--- a/libsoup/soup-auth-digest.c<br>
++++ b/libsoup/soup-auth-digest.c<br>
+@@ -132,6 +132,19 @@ soup_auth_digest_get_qop (SoupAuthDigestQop qop)<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return g_string_free (out, FALSE);<br=
>
+ }<br>
+<br>
++static gboolean<br>
++validate_params (SoupAuthDigest *auth_digest)<br>
++{<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SoupAuthDigestPrivate *priv =
=3D soup_auth_digest_get_instance_private (auth_digest);<br>
++<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (priv-&gt;qop || priv-&gt;a=
lgorithm =3D=3D SOUP_AUTH_DIGEST_ALGORITHM_MD5_SESS) {<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (!priv-&gt;nonce)<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return F=
ALSE;<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
++<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TRUE;<br>
++}<br>
++<br>
+ static gboolean<br>
+ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GHashTab=
le *auth_params)<br>
+@@ -169,16 +182,21 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage=
 *msg,<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (priv-&gt;algorithm =3D=3D -1)<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ok =3D FALSE;<br>
+<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stale =3D g_hash_table_lookup (auth_params=
, &quot;stale&quot;);<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (stale &amp;&amp; !g_ascii_strcasecmp (=
stale, &quot;TRUE&quot;) &amp;&amp; *priv-&gt;hex_urp)<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 recompute_hex_a1 (priv);<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else {<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 g_free (priv-&gt;user);<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 priv-&gt;user =3D NULL;<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 g_free (priv-&gt;cnonce);<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 priv-&gt;cnonce =3D NULL;<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 memset (priv-&gt;hex_urp, 0, sizeof (priv-&gt;hex_urp));<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 memset (priv-&gt;hex_a1, 0, sizeof (priv-&gt;hex_a1));<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!validate_params (auth_dig=
est))<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ok =3D FALSE;<br>
++<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ok) {<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 stale =3D g_hash_table_lookup (auth_params, &quot;stale&=
quot;);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (stale &amp;&amp; !g_ascii_strcasecmp (stale, &quot;T=
RUE&quot;) &amp;&amp; *priv-&gt;hex_urp)<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recomput=
e_hex_a1 (priv);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 else {<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_free (=
priv-&gt;user);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv-&gt=
;user =3D NULL;<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_free (=
priv-&gt;cnonce);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv-&gt=
;cnonce =3D NULL;<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memset (=
priv-&gt;hex_urp, 0, sizeof (priv-&gt;hex_urp));<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memset (=
priv-&gt;hex_a1, 0, sizeof (priv-&gt;hex_a1));<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
+<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ok;<br>
+@@ -269,6 +287,8 @@ soup_auth_digest_compute_hex_a1 (const char=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *hex_=
urp,<br>
+<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* In MD5-sess, A1 is hex_urp:nonce:cnonce */<br>
+<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 g_assert (nonce &amp;&amp; cnonce);<br>
++<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 checksum =3D g_checksum_new (G_CHECKSUM_MD5);<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 g_checksum_update (checksum, (guchar *)hex_urp, strlen (hex_ur=
p));<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 g_checksum_update (checksum, (guchar *)&quot;:&quot;, 1);<br>
+@@ -359,6 +379,8 @@ soup_auth_digest_compute_response (const char=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *method,<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (qop) {<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 char tmp[9];<br>
+<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 g_assert (cnonce);<br>
++<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 g_snprintf (tmp, 9, &quot;%.8x&quot;, nc);<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 g_checksum_update (checksum, (guchar *)tmp, strlen (tmp));<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 g_checksum_update (checksum, (guchar *)&quot;:&quot;, 1);<br>
+@@ -422,6 +444,9 @@ soup_auth_digest_get_authorization (SoupAuth *auth, So=
upMessage *msg)<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_return_val_if_fail (uri !=3D NULL, =
NULL);<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 url =3D soup_uri_to_string (uri, TRUE=
);<br>
+<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_assert (priv-&gt;nonce);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_assert (!priv-&gt;qop || pri=
v-&gt;cnonce);<br>
++<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 soup_auth_digest_compute_response (ms=
g-&gt;method, url, priv-&gt;hex_a1,<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 priv-&gt;qop, priv-&gt;nonce,<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 priv-&gt;cnonce, priv-&gt;nc,<br>
+diff --git a/tests/auth-test.c b/tests/auth-test.c<br>
+index dfc6b09..6fb1e4a 100644<br>
+--- a/tests/auth-test.c<br>
++++ b/tests/auth-test.c<br>
+@@ -1550,16 +1550,17 @@ do_cancel_after_retry_test (void)<br>
+ }<br>
+<br>
+ static void<br>
+-on_request_read_for_missing_realm (SoupServer=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *server,<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SoupServerMessage=
 *msg,<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpointer=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 user_data)<br>
++on_request_read_for_missing_params (SoupServer=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *server,<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SoupServerMessage *msg,<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 gpointer=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 user_=
data)<br>
+ {<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *auth_header =3D us=
er_data;<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SoupMessageHeaders *respo=
nse_headers =3D soup_server_message_get_response_headers (msg);<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 soup_message_headers_replace (=
response_headers, &quot;WWW-Authenticate&quot;, &quot;Digest qop=3D\&quot;a=
uth\&quot;&quot;);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 soup_message_headers_replace (=
response_headers, &quot;WWW-Authenticate&quot;, auth_header);<br>
+ }<br>
+<br>
+ static void<br>
+-do_missing_realm_test (void)<br>
++do_missing_params_test (gconstpointer auth_header)<br>
+ {<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SoupSession *session;<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SoupMessage *msg;<br>
+@@ -1582,8 +1583,8 @@ do_missing_realm_test (void)<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_object_unref (digest_au=
th_domain);<br>
+<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_signal_connect (server,=
 &quot;request-read&quot;,<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 G_CALLBACK (on_request_read_for_missing_realm),<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 NULL);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 G_CALLBACK (on_request_read_for_missing_params),<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (gpointer)auth_header);<br>
+<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 session =3D soup_test_ses=
sion_new (NULL);<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg =3D soup_message_new_=
from_uri (&quot;GET&quot;, uri);<br>
+@@ -1625,7 +1626,9 @@ main (int argc, char **argv)<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_test_add_func (&quot;/auth/async-me=
ssage-do-not-use-auth-cache&quot;, do_async_message_do_not_use_auth_cache_t=
est);<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_test_add_func (&quot;/auth/authoriz=
ation-header-request&quot;, do_message_has_authorization_header_test);<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_test_add_func (&quot;/auth/cancel-a=
fter-retry&quot;, do_cancel_after_retry_test);<br>
+-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_test_add_func (&quot;/auth/m=
issing-realm&quot;, do_missing_realm_test);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_test_add_data_func (&quot;/a=
uth/missing-params/realm&quot;, &quot;Digest qop=3D\&quot;auth\&quot;&quot;=
, do_missing_params_test);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_test_add_data_func (&quot;/a=
uth/missing-params/nonce&quot;, &quot;Digest realm=3D\&quot;auth-test\&quot=
;, qop=3D\&quot;auth,auth-int\&quot;, opaque=3D\&quot;5ccc069c403ebaf9f0171=
e9517f40e41\&quot;&quot;, do_missing_params_test);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_test_add_data_func (&quot;/a=
uth/missing-params/nonce-md5-sess&quot;, &quot;Digest realm=3D\&quot;auth-t=
est\&quot;, qop=3D\&quot;auth,auth-int\&quot;, opaque=3D\&quot;5ccc069c403e=
baf9f0171e9517f40e41\&quot; algorithm=3D\&quot;MD5-sess\&quot;&quot;, do_mi=
ssing_params_test);<br>
+<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D g_test_run ();<br>
+<br>
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch<br>
new file mode 100644<br>
index 0000000000..ab0f650804<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch<br>
@@ -0,0 +1,26 @@<br>
+From: Patrick Griffis &lt;<a href=3D"mailto:pgriffis@igalia.com" target=3D=
"_blank">pgriffis@igalia.com</a>&gt;<br>
+Date: Fri, 27 Dec 2024 13:52:52 -0600<br>
+Subject: auth-digest: Fix leak<br>
+<br>
+(cherry picked from commit ea16eeacb052e423eb5c3b0b705e5eab34b13832)<br>
+<br>
+Upstream-Status: Backport [import from debian <a href=3D"https://salsa.deb=
ian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/patches/CVE-2025-3=
2910-3.patch?ref_type=3Dheads" target=3D"_blank">
https://salsa.debian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/p=
atches/CVE-2025-32910-3.patch?ref_type=3Dheads</a><br>
+Upstream commit <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/ea16eeacb052e423eb5c3b0b705e5eab34b13832%5D" target=3D"_blank">
https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705=
e5eab34b13832]</a><br>
+CVE: CVE-2025-32910<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ libsoup/soup-auth-digest.c | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c<br>
+index 393adb6..a1db188 100644<br>
+--- a/libsoup/soup-auth-digest.c<br>
++++ b/libsoup/soup-auth-digest.c<br>
+@@ -66,6 +66,7 @@ soup_auth_digest_finalize (GObject *object)<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_free (priv-&gt;nonce);<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_free (priv-&gt;domain);<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_free (priv-&gt;cnonce);<br>
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_free (priv-&gt;opaque);<br>
+<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memset (priv-&gt;hex_urp, 0, sizeof (=
priv-&gt;hex_urp));<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memset (priv-&gt;hex_a1, 0, sizeof (p=
riv-&gt;hex_a1));<br>
diff --git a/meta/recipes-support/libsoup/<a href=3D"http://libsoup-2.4_2.7=
4.2.bb" target=3D"_blank">libsoup-2.4_2.74.2.bb</a> b/meta/recipes-support/=
libsoup/<a href=3D"http://libsoup-2.4_2.74.2.bb" target=3D"_blank">libsoup-=
2.4_2.74.2.bb</a><br>
index f04d9b2966..517a8e4539 100644<br>
--- a/meta/recipes-support/libsoup/<a href=3D"http://libsoup-2.4_2.74.2.bb"=
 target=3D"_blank">libsoup-2.4_2.74.2.bb</a><br>
+++ b/meta/recipes-support/libsoup/<a href=3D"http://libsoup-2.4_2.74.2.bb"=
 target=3D"_blank">libsoup-2.4_2.74.2.bb</a><br>
@@ -23,6 +23,9 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/libsoup/${SHRT_VER}/lib=
soup-${PV}.tar.xz \<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>file:=
//CVE-2025-32906-2.patch</a> \<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>file:=
//CVE-2025-32909.patch</a> \<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>file:=
//CVE-2025-46420.patch</a> \<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>file://CVE=
-2025-32910-1.patch</a> \<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>file://CVE=
-2025-32910-2.patch</a> \<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>file://CVE=
-2025-32910-3.patch</a> \<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;f0a427656e5fe19e1df71c107e88dfa1b2e673c2=
5c547b7823b6018b40d01159&quot;<br>
<br>
--<br>
2.43.0<br>
<br>
</div>
</span></font></div>
</div>

</div></blockquote></div>

--00000000000073ee8c0636a70511--

