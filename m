Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B6CD79756
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 08:03:46 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5121.1769846606005475962
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 00:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3UA+459/;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-480706554beso30160025e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 00:03:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769846604; cv=none;
        d=google.com; s=arc-20240605;
        b=C7s7Ti2bedK/QGt7migUhqLir0006FqyYpvFSVuGOBE/U+x+qMfOoo34B5eysdpjKK
         MXXZtDxN94QiFhtktlKUhvrxsPwdi6r1Tr9lB8Qozg0MEJRQ91wj8UBat2te6Zn4sJnl
         1gWudEw9YCpkXwGamsEMQobJZKO467pqV68VhtKYe1t2kmKuIr4WZT71eBB6ZVnWEgGA
         Z4PUHdwpZh1Dv6Suut3EuPCkbtmcTevAiKBPAZuqpSfGxTSppLX14RmwhCxQKOuKs61H
         yDmuFv7P8vB/SwEabyiP/ocj5+C+0k03Iy+hKbNmS09ASMueXsF2O+YNUpFGeGk/8Ra7
         3nMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=CzCxLhhlQijQaPmHJugg8IWQ1d1KWVWKk+KrIR/Orc8=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=dS4xNhCPwn0FEgvixYzTDbmAlALKCKzzHal93xviOUpoCsDYb6hKXevDsLpJk6QhST
         3bpTnNkKq/6GQIvittPW9jd6JeI0cabZb2e9DfrOwtLxjf/kKP1TTSVLgLVWxdmyd0SD
         PPnuyO6R4N+DnYGZRCeYjX9RP1Gs971qCJd2+3mFEB0hl8Isl1VMc/3s1Tw7YF0zG1aJ
         s50z4AwI0bk6oWP/0Ry3eYFE98o7fUL+Z6b1KCTLyuath34x8+ZOKwKzyaUKobQnRgXN
         jkaiBo61wnOuqREgV8hKrpS8TJjkSlohg7S1dbvgtOp/TH3GLMdzbD+lkwxEUFffZZTe
         G3Xw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846604; x=1770451404; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CzCxLhhlQijQaPmHJugg8IWQ1d1KWVWKk+KrIR/Orc8=;
        b=3UA+459/NqkOLDVCS1m28LG3W3NQeO+gu2llh4q201kWAlvhSQYbz/RgDLBmT+pvzf
         0jjY/C8l9Lh2ueSd881zxbjP6uABn4lZWlyfPdYyHmU7Tws0A3aQgQC+y9XeUNq5q6q2
         Zzaq2/OAItdEUBGbVaIylpprHVm2Vh3xjoar0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846604; x=1770451404;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzCxLhhlQijQaPmHJugg8IWQ1d1KWVWKk+KrIR/Orc8=;
        b=MSCEYXnELzAeXwwiUjbeIWjNJb+nNEeTdvmHxeJxEY62+HtKb1rKZebTidcnLPC0DX
         i4HVFA+xPzuKWBVBH1GFla/5ZvN6YMrAK08fiOZHt0PQUF2Czvdzr/KgpRVoBC4xUU7F
         w+034F9UiYQxzWDKZyeb+dGjJqvWoV5T40Uf2MKWX3yLaTeNV+OFAyU0GUUmhSTOZ+RV
         4yxF8TI4o0zdY0f0c4k2qohw35BxkIPNDXHUoC9scQ4VMEDaKmAqn3WHSgEzgJ7SW0Ck
         d4NgWQ+qkUG5inBOT6hH6YFNDJrifpxk7IJKmHJf9Elk9EW0blvoFUNDjSWtwv39Kwc+
         OMxA==
X-Gm-Message-State: AOJu0YxHVAIyWE7kTsO3J5zq4RSPLrqHZIBn3fPxfzuiOAViwm5PI2QI
	C19JuygioTaXVEb2UBNfzqHIJ9V0oUWry1hwPT+0nJYzNkQ1XIWKlNW0wDjlSLkhvNV7fysFj1r
	tolzkuFi39C9qgMkeYzVSM4fjvYJ3H+SKQnpiGOG7NMV0h75SY3GZ
X-Gm-Gg: AZuq6aIjDXQLRQNQWAi6Lvhg7ooDXM/IwsLvXRpAKX9qF2D6VLiXSoenLR6iweo1PGp
	6A3yt3Ode2JPMPUsR8H1/PzKnuWdsfGFSWu9YHP1SRa7U8C8gQ9joM1FAE3wvGydrhZzWoxALR6
	aVhn9nDOTyjQz9au5s5RO6/xHXQNukknMqa+2v7eP5cQyvmN087dQe58SXRKw2I/wbda9QKp04D
	P9OPwjp3i4O2vBmVar/Uiv0nIpbemHZuknNikm5bt4MVN6QzCxlkLYMAhpZJIKGfsysd5kjhBc7
	GZzAAiiziecNh6CCGWUZLJQgFzd+BQ==
X-Received: by 2002:a05:600c:4e47:b0:477:af07:dd21 with SMTP id
 5b1f17b1804b1-482db49cdb6mr61526365e9.25.1769846603985; Sat, 31 Jan 2026
 00:03:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769845858.git.yoann.congal@smile.fr> <030e8e0e4af2349abeea7c1de02e9062fd8aebbe.1769845858.git.yoann.congal@smile.fr>
In-Reply-To: <030e8e0e4af2349abeea7c1de02e9062fd8aebbe.1769845858.git.yoann.congal@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 31 Jan 2026 09:02:57 +0100
X-Gm-Features: AZwV_Qh3de3JebpKiRt9sV0_8KJNKAOi6NS_W73qNkXR8zwX2xxrDykMpde7sWw
Message-ID: <CAMSfU+581tvmZhO1yT+FvFVsFxgaP_j8dLEU3ZFbeYVC6A26jw@mail.gmail.com>
Subject: Re: [OE-core][whinlatter 22/22] openssl: upgrade 3.5.4 -> 3.5.5
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002350030649aa86a1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 08:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230229

--0000000000002350030649aa86a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 31 janv. 2026 =C3=A0 08:57, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

> From: Peter Marko <peter.marko@siemens.com>
>
> Resolved patch conflicts.
>
> Release information [1]:
>
> OpenSSL 3.5.5 is a security patch release. The most severe CVE fixed in
> this release is High.
> This release incorporates the following bug fixes and mitigations:
> * Fixed Improper validation of PBMAC1 parameters in PKCS#12 MAC
> verification. (CVE-2025-11187)
> * Fixed Stack buffer overflow in CMS AuthEnvelopedData parsing.
> (CVE-2025-15467)
> * Fixed NULL dereference in SSL_CIPHER_find() function on unknown cipher
> ID. (CVE-2025-15468)
> * Fixed openssl dgst one-shot codepath silently truncates inputs >16 MiB.
> (CVE-2025-15469)
> * Fixed TLS 1.3 CompressedCertificate excessive memory allocation.
> (CVE-2025-66199)
> * Fixed Heap out-of-bounds write in BIO_f_linebuffer on short writes.
> (CVE-2025-68160)
> * Fixed Unauthenticated/unencrypted trailing bytes with low-level OCB
> function calls. (CVE-2025-69418)
> * Fixed Out of bounds write in PKCS12_get_friendlyname() UTF-8 conversion=
.
> (CVE-2025-69419)
> * Fixed Missing ASN1_TYPE validation in TS_RESP_verify_response()
> function. (CVE-2025-69420)
> * Fixed NULL Pointer Dereference in PKCS12_item_decrypt_d2i_ex() function=
.
> (CVE-2025-69421)
> * Fixed Missing ASN1_TYPE validation in PKCS#12 parsing. (CVE-2026-22795)
> * Fixed ASN1_TYPE Type Confusion in the PKCS7_digest_from_attributes()
> function. (CVE-2026-22796)
>
> [1]
> https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#major-changes=
-between-openssl-354-and-openssl-355-27-jan-2026
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>

This patch was not included in the tested branch, please ignore (it is not
yet merged on master)


> ---
>  ...ke-history-reporting-when-test-fails.patch | 23 +++++++++----------
>  .../0001-extend-check_cwm-test-timeout.patch  |  2 +-
>  .../{openssl_3.5.4.bb =3D> openssl_3.5.5.bb}    |  2 +-
>  3 files changed, 13 insertions(+), 14 deletions(-)
>  rename meta/recipes-connectivity/openssl/{openssl_3.5.4.bb =3D>
> openssl_3.5.5.bb} (99%)
>
> diff --git
> a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-=
reporting-when-test-fails.patch
> b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-=
reporting-when-test-fails.patch
> index 5b7365a3531..a74c79303f6 100644
> ---
> a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-=
reporting-when-test-fails.patch
> +++
> b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-=
reporting-when-test-fails.patch
> @@ -7,10 +7,10 @@ Upstream-Status: Submitted [
> https://github.com/openssl/openssl/pull/22481]
>
>  Signed-off-by: William Lyu <William.Lyu@windriver.com>
>  ---
> - test/helpers/handshake.c | 137 +++++++++++++++++++++++++++++----------
> + test/helpers/handshake.c | 136 ++++++++++++++++++++++++++++++---------
>   test/helpers/handshake.h |  70 +++++++++++++++++++-
>   test/ssl_test.c          |  44 +++++++++++++
> - 3 files changed, 217 insertions(+), 34 deletions(-)
> + 3 files changed, 217 insertions(+), 33 deletions(-)
>
>  diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
>  index f611b3a..5703b48 100644
> @@ -119,7 +119,7 @@ index f611b3a..5703b48 100644
>   HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)
>   {
>       HANDSHAKE_RESULT *ret;
> -@@ -726,15 +822,6 @@ static void configure_handshake_ssl(SSL *server, SS=
L
> *client,
> +@@ -724,15 +820,6 @@ static void configure_handshake_ssl(SSL *server, SS=
L
> *client,
>           SSL_set_post_handshake_auth(client, 1);
>   }
>
> @@ -135,7 +135,7 @@ index f611b3a..5703b48 100644
>   /* An SSL object and associated read-write buffers. */
>   typedef struct peer_st {
>       SSL *ssl;
> -@@ -1081,17 +1168,6 @@ static void do_shutdown_step(PEER *peer)
> +@@ -1077,16 +1164,6 @@ static void do_shutdown_step(PEER *peer)
>       }
>   }
>
> @@ -148,12 +148,11 @@ index f611b3a..5703b48 100644
>  -    SHUTDOWN,
>  -    CONNECTION_DONE
>  -} connect_phase_t;
> --
>  -
>   static int renegotiate_op(const SSL_TEST_CTX *test_ctx)
>   {
>       switch (test_ctx->handshake_mode) {
> -@@ -1169,19 +1245,6 @@ static void do_connect_step(const SSL_TEST_CTX
> *test_ctx, PEER *peer,
> +@@ -1164,19 +1241,6 @@ static void do_connect_step(const SSL_TEST_CTX
> *test_ctx, PEER *peer,
>       }
>   }
>
> @@ -173,7 +172,7 @@ index f611b3a..5703b48 100644
>   /*
>    * Determine the handshake outcome.
>    * last_status: the status of the peer to have acted last.
> -@@ -1546,6 +1609,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
> +@@ -1541,6 +1605,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
>
>       start =3D time(NULL);
>
> @@ -184,8 +183,8 @@ index f611b3a..5703b48 100644
>       /*
>        * Half-duplex handshake loop.
>        * Client and server speak to each other synchronously in the same
> process.
> -@@ -1567,6 +1634,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
> -                                       0 /* server went last */);
> +@@ -1562,6 +1630,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
> +                 0 /* server went last */);
>           }
>
>  +        save_loop_history(&(ret->history),
> @@ -292,14 +291,14 @@ index 78b03f9..b9967c2 100644
>
>   HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void);
>  @@ -95,4 +159,8 @@ int configure_handshake_ctx_for_srp(SSL_CTX
> *server_ctx, SSL_CTX *server2_ctx,
> -                                     CTX_DATA *server2_ctx_data,
> -                                     CTX_DATA *client_ctx_data);
> +     CTX_DATA *server2_ctx_data,
> +     CTX_DATA *client_ctx_data);
>
>  +const char *handshake_connect_phase_name(connect_phase_t phase);
>  +const char *handshake_status_name(handshake_status_t handshake_status);
>  +const char *handshake_peer_status_name(peer_status_t peer_status);
>  +
> - #endif  /* OSSL_TEST_HANDSHAKE_HELPER_H */
> + #endif /* OSSL_TEST_HANDSHAKE_HELPER_H */
>  diff --git a/test/ssl_test.c b/test/ssl_test.c
>  index ea60851..9d6b093 100644
>  --- a/test/ssl_test.c
> diff --git
> a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-ti=
meout.patch
> b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-ti=
meout.patch
> index d02d42f1b51..f6eb28069ac 100644
> ---
> a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-ti=
meout.patch
> +++
> b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-ti=
meout.patch
> @@ -20,7 +20,7 @@ index 4a1e886a71..39f8c61ef9 100644
>  +++ b/test/radix/main.c
>  @@ -25,6 +25,11 @@ static int test_script(int idx)
>       int testresult;
> -     TERP_CONFIG cfg =3D {0};
> +     TERP_CONFIG cfg =3D { 0 };
>
>  +    // check_cwm test sometimes times out, the default 3000ms is
>  +    // not enough if the test execution starves for CPU
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
> b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
> similarity index 99%
> rename from meta/recipes-connectivity/openssl/openssl_3.5.4.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.5.5.bb
> index e760baf3a02..c0d02b617ba 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
> @@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk =3D " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] =3D
> "967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99"
> +SRC_URI[sha256sum] =3D
> "b28c91532a8b65a1f983b4c28b7488174e4a01008e29ce8e69bd789f28bc2a89"
>
>  inherit lib_package multilib_header multilib_script ptest perlnative
> manpages
>  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
>


--=20
Yoann Congal
Smile ECS

--0000000000002350030649aa86a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 31=
 janv. 2026 =C3=A0=C2=A008:57, Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">From: Peter Marko &lt;<a hr=
ef=3D"mailto:peter.marko@siemens.com" target=3D"_blank">peter.marko@siemens=
.com</a>&gt;<br>
<br>
Resolved patch conflicts.<br>
<br>
Release information [1]:<br>
<br>
OpenSSL 3.5.5 is a security patch release. The most severe CVE fixed in thi=
s release is High.<br>
This release incorporates the following bug fixes and mitigations:<br>
* Fixed Improper validation of PBMAC1 parameters in PKCS#12 MAC verificatio=
n. (CVE-2025-11187)<br>
* Fixed Stack buffer overflow in CMS AuthEnvelopedData parsing. (CVE-2025-1=
5467)<br>
* Fixed NULL dereference in SSL_CIPHER_find() function on unknown cipher ID=
. (CVE-2025-15468)<br>
* Fixed openssl dgst one-shot codepath silently truncates inputs &gt;16 MiB=
. (CVE-2025-15469)<br>
* Fixed TLS 1.3 CompressedCertificate excessive memory allocation. (CVE-202=
5-66199)<br>
* Fixed Heap out-of-bounds write in BIO_f_linebuffer on short writes. (CVE-=
2025-68160)<br>
* Fixed Unauthenticated/unencrypted trailing bytes with low-level OCB funct=
ion calls. (CVE-2025-69418)<br>
* Fixed Out of bounds write in PKCS12_get_friendlyname() UTF-8 conversion. =
(CVE-2025-69419)<br>
* Fixed Missing ASN1_TYPE validation in TS_RESP_verify_response() function.=
 (CVE-2025-69420)<br>
* Fixed NULL Pointer Dereference in PKCS12_item_decrypt_d2i_ex() function. =
(CVE-2025-69421)<br>
* Fixed Missing ASN1_TYPE validation in PKCS#12 parsing. (CVE-2026-22795)<b=
r>
* Fixed ASN1_TYPE Type Confusion in the PKCS7_digest_from_attributes() func=
tion. (CVE-2026-22796)<br>
<br>
[1] <a href=3D"https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#=
major-changes-between-openssl-354-and-openssl-355-27-jan-2026" rel=3D"noref=
errer" target=3D"_blank">https://github.com/openssl/openssl/blob/openssl-3.=
5/NEWS.md#major-changes-between-openssl-354-and-openssl-355-27-jan-2026</a>=
<br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br></blockquote><div><br></di=
v><div>This patch was not included in the tested branch, please ignore (it =
is not yet merged on master)</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
---<br>
=C2=A0...ke-history-reporting-when-test-fails.patch | 23 +++++++++---------=
-<br>
=C2=A0.../0001-extend-check_cwm-test-timeout.patch=C2=A0 |=C2=A0 2 +-<br>
=C2=A0.../{<a href=3D"http://openssl_3.5.4.bb" rel=3D"noreferrer" target=3D=
"_blank">openssl_3.5.4.bb</a> =3D&gt; <a href=3D"http://openssl_3.5.5.bb" r=
el=3D"noreferrer" target=3D"_blank">openssl_3.5.5.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A03 files changed, 13 insertions(+), 14 deletions(-)<br>
=C2=A0rename meta/recipes-connectivity/openssl/{<a href=3D"http://openssl_3=
.5.4.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.5.4.bb</a> =3D&gt; =
<a href=3D"http://openssl_3.5.5.bb" rel=3D"noreferrer" target=3D"_blank">op=
enssl_3.5.5.bb</a>} (99%)<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake=
-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openss=
l/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch<br>
index 5b7365a3531..a74c79303f6 100644<br>
--- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-histor=
y-reporting-when-test-fails.patch<br>
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-histor=
y-reporting-when-test-fails.patch<br>
@@ -7,10 +7,10 @@ Upstream-Status: Submitted [<a href=3D"https://github.com=
/openssl/openssl/pull/22481" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/openssl/openssl/pull/22481</a>]<br>
<br>
=C2=A0Signed-off-by: William Lyu &lt;<a href=3D"mailto:William.Lyu@windrive=
r.com" target=3D"_blank">William.Lyu@windriver.com</a>&gt;<br>
=C2=A0---<br>
- test/helpers/handshake.c | 137 +++++++++++++++++++++++++++++----------<br=
>
+ test/helpers/handshake.c | 136 ++++++++++++++++++++++++++++++---------<br=
>
=C2=A0 test/helpers/handshake.h |=C2=A0 70 +++++++++++++++++++-<br>
=C2=A0 test/ssl_test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 44 +++++++=
++++++<br>
- 3 files changed, 217 insertions(+), 34 deletions(-)<br>
+ 3 files changed, 217 insertions(+), 33 deletions(-)<br>
<br>
=C2=A0diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c<br>
=C2=A0index f611b3a..5703b48 100644<br>
@@ -119,7 +119,7 @@ index f611b3a..5703b48 100644<br>
=C2=A0 HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 HANDSHAKE_RESULT *ret;<br>
-@@ -726,15 +822,6 @@ static void configure_handshake_ssl(SSL *server, SSL =
*client,<br>
+@@ -724,15 +820,6 @@ static void configure_handshake_ssl(SSL *server, SSL =
*client,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SSL_set_post_handshake_auth(client, 1);<=
br>
=C2=A0 }<br>
<br>
@@ -135,7 +135,7 @@ index f611b3a..5703b48 100644<br>
=C2=A0 /* An SSL object and associated read-write buffers. */<br>
=C2=A0 typedef struct peer_st {<br>
=C2=A0 =C2=A0 =C2=A0 SSL *ssl;<br>
-@@ -1081,17 +1168,6 @@ static void do_shutdown_step(PEER *peer)<br>
+@@ -1077,16 +1164,6 @@ static void do_shutdown_step(PEER *peer)<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 }<br>
<br>
@@ -148,12 +148,11 @@ index f611b3a..5703b48 100644<br>
=C2=A0-=C2=A0 =C2=A0 SHUTDOWN,<br>
=C2=A0-=C2=A0 =C2=A0 CONNECTION_DONE<br>
=C2=A0-} connect_phase_t;<br>
--<br>
=C2=A0-<br>
=C2=A0 static int renegotiate_op(const SSL_TEST_CTX *test_ctx)<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 switch (test_ctx-&gt;handshake_mode) {<br>
-@@ -1169,19 +1245,6 @@ static void do_connect_step(const SSL_TEST_CTX *tes=
t_ctx, PEER *peer,<br>
+@@ -1164,19 +1241,6 @@ static void do_connect_step(const SSL_TEST_CTX *tes=
t_ctx, PEER *peer,<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 }<br>
<br>
@@ -173,7 +172,7 @@ index f611b3a..5703b48 100644<br>
=C2=A0 /*<br>
=C2=A0 =C2=A0* Determine the handshake outcome.<br>
=C2=A0 =C2=A0* last_status: the status of the peer to have acted last.<br>
-@@ -1546,6 +1609,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(<br>
+@@ -1541,6 +1605,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(<br>
<br>
=C2=A0 =C2=A0 =C2=A0 start =3D time(NULL);<br>
<br>
@@ -184,8 +183,8 @@ index f611b3a..5703b48 100644<br>
=C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* Half-duplex handshake loop.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* Client and server speak to each other synchron=
ously in the same process.<br>
-@@ -1567,6 +1634,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 /* serv=
er went last */);<br>
+@@ -1562,6 +1630,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 /* server =
went last */);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 save_loop_history(&amp;(ret-&gt;history)=
,<br>
@@ -292,14 +291,14 @@ index 78b03f9..b9967c2 100644<br>
<br>
=C2=A0 HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void);<br>
=C2=A0@@ -95,4 +159,8 @@ int configure_handshake_ctx_for_srp(SSL_CTX *serve=
r_ctx, SSL_CTX *server2_ctx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CTX_DATA *server=
2_ctx_data,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CTX_DATA *client=
_ctx_data);<br>
+=C2=A0 =C2=A0 =C2=A0CTX_DATA *server2_ctx_data,<br>
+=C2=A0 =C2=A0 =C2=A0CTX_DATA *client_ctx_data);<br>
<br>
=C2=A0+const char *handshake_connect_phase_name(connect_phase_t phase);<br>
=C2=A0+const char *handshake_status_name(handshake_status_t handshake_statu=
s);<br>
=C2=A0+const char *handshake_peer_status_name(peer_status_t peer_status);<b=
r>
=C2=A0+<br>
- #endif=C2=A0 /* OSSL_TEST_HANDSHAKE_HELPER_H */<br>
+ #endif /* OSSL_TEST_HANDSHAKE_HELPER_H */<br>
=C2=A0diff --git a/test/ssl_test.c b/test/ssl_test.c<br>
=C2=A0index ea60851..9d6b093 100644<br>
=C2=A0--- a/test/ssl_test.c<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cw=
m-test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-exten=
d-check_cwm-test-timeout.patch<br>
index d02d42f1b51..f6eb28069ac 100644<br>
--- a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-=
timeout.patch<br>
+++ b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-=
timeout.patch<br>
@@ -20,7 +20,7 @@ index 4a1e886a71..39f8c61ef9 100644<br>
=C2=A0+++ b/test/radix/main.c<br>
=C2=A0@@ -25,6 +25,11 @@ static int test_script(int idx)<br>
=C2=A0 =C2=A0 =C2=A0 int testresult;<br>
-=C2=A0 =C2=A0 =C2=A0TERP_CONFIG cfg =3D {0};<br>
+=C2=A0 =C2=A0 =C2=A0TERP_CONFIG cfg =3D { 0 };<br>
<br>
=C2=A0+=C2=A0 =C2=A0 // check_cwm test sometimes times out, the default 300=
0ms is<br>
=C2=A0+=C2=A0 =C2=A0 // not enough if the test execution starves for CPU<br=
>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.=
5.4.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.5.4.bb</a> b/meta/re=
cipes-connectivity/openssl/<a href=3D"http://openssl_3.5.5.bb" rel=3D"noref=
errer" target=3D"_blank">openssl_3.5.5.bb</a><br>
similarity index 99%<br>
rename from meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.5=
.4.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.5.4.bb</a><br>
rename to meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.5.5=
.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.5.5.bb</a><br>
index e760baf3a02..c0d02b617ba 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.5.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.5.4.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.5.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.5.5.bb</a><br>
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<a href=3D"http://environm=
ent.d-openssl.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-openss=
l.sh</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;967311f84955316969bdb1d8d4b983718ef42338639c6=
21ec4c34fddef355e99&quot;<br>
+SRC_URI[sha256sum] =3D &quot;b28c91532a8b65a1f983b4c28b7488174e4a01008e29c=
e8e69bd789f28bc2a89&quot;<br>
<br>
=C2=A0inherit lib_package multilib_header multilib_script ptest perlnative =
manpages<br>
=C2=A0MULTILIB_SCRIPTS =3D &quot;${PN}-bin:${bindir}/c_rehash&quot;<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000002350030649aa86a1--

