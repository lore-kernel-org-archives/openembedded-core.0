Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EEEC197BF
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 20:17:12 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.20829.1740687427266157202
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 12:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TbGL/JlI;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.171, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6f754678c29so13310487b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 12:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740687426; x=1741292226; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9UG7h+Goi1koznrAJ9qes6mP35QUB0WewnxkC2l7go=;
        b=TbGL/JlI6b13aqyARbYb5thtL+JSli8lamVeXmkN+apJMkus2D12sExcqPmHVBJbi3
         GWFItCeJsexlGhM0Og9InSaG4gJUF2O0DqYrKMToSEIZdKT7Ahq2hT3Gc1oh4ERr5v0B
         Vryv3iol26s1JCRcvCHzH/szVPn5pBfYpnXn1Z4k04ZAQk+HqZGsr0D8q6pCB+q4+eJ3
         t8/kd9IED3kCEAHrOoN4KNx2OVtgefcA2YfjqzGE8Jpm/j8CG1rI3ZWj6sije6m8heTX
         /92920Ghw9ynGng27McbbnU/fGp/vDLfxdhy+w1tWz4vQbu2Zx/W+pY5CQEXDT6xcUjW
         jQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740687426; x=1741292226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9UG7h+Goi1koznrAJ9qes6mP35QUB0WewnxkC2l7go=;
        b=nMPdCEFn1I/Co9JWnBKq1yfTRjMGH9z3H+/9rOaMzUVl9VVZKW7ewFuL2/bRWe2/pJ
         0MQUsemAOL4uDHTxlemY/5EMOgJhr1BIlL8haD9SFxvvMP2PWCGsWjEJLVbYnlnLWkoT
         jZuJNk0mu4SejvdjNWBJhWO0/85SXxpRj3bvKDYIqh8Qtr/ehvheea4UiUK6NZg3RmZs
         kC6GOvXIanvE/20pBhe8zzbGiZul48AbgUTTMfN+s2jKanJExQpiDyehac0BXCnIqwK7
         C44zxHikeZmtp9z3wDq6hPCjd5NRal+/OCvbZXDQG16CGdlQ5NurFTyhgm5IwD0SBlGw
         j6hQ==
X-Gm-Message-State: AOJu0YzOpe/alsdva48mvB0w8TqBlV/gxa8X5gNaewYCaRXJKamR63OM
	ULRui9iqsDpbNEB11/vQZDXBKUJLAJUgtM3yqhr67AWYkk0H80s/bdAe8SAmIschUrq11SuL4cE
	giQMrnf7SaFAXRQSy2YKwLHhCtM7zFPPxPvaTdvEJFi95wW9vj8s=
X-Gm-Gg: ASbGncvQNe8GuZ9Zkhi0ujCDtQt2/azwFaNsifBLh+v1ni0ibmKbSwqVTitjL8ZNRcJ
	lglITvgIp5Y4oxjTBdbsJjqGh0UJK6Qz66S6H0/nlmHu6tg9tKuFl/d6kNo2/cfppmUPsDFJrMw
	UFrw4fErRo88+nNwLuQNl2YsTL0a1x+86myUX8w9M=
X-Google-Smtp-Source: AGHT+IFcBs4SxR7Ygc1VK1K3necRu8UDsQ2oU4RQAKeMq622LQcRO/LKEc147TvJQ3ya73GrQbJMPPZN8jHgQC0J8P4=
X-Received: by 2002:a05:690c:2789:b0:6fb:1e5a:fcdd with SMTP id
 00721157ae682-6fd4a090fabmr13154337b3.17.1740687425981; Thu, 27 Feb 2025
 12:17:05 -0800 (PST)
MIME-Version: 1.0
References: <20250226133957.954654-1-vanusuri@mvista.com>
In-Reply-To: <20250226133957.954654-1-vanusuri@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 27 Feb 2025 12:16:54 -0800
X-Gm-Features: AQ5f1JpaoLkwIIuqHn4iMAIE8CDfys4XSZyraO5NUflxlC8Ujd5-p8NtQIYvpBc
Message-ID: <CAOSpxda7nD_KNnD2hD1V0a_C8QPLqCyvZCc9O44MDx-8zznnGA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] curl: Backport fix for CVE-2024-11053
To: vanusuri@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 20:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212039

A similar patch was submitted and rejected recently, and your version
has the same issues.

Please see message link below below for details of the failure:

https://lists.openembedded.org/g/openembedded-core/message/211372

Steve

On Wed, Feb 26, 2025 at 5:40=E2=80=AFAM Vijay Anusuri via
lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
wrote:
>
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-Status: Backport
> https://github.com/curl/curl/commit/9bee39bfed2c413b4cc4eb306a57ac92a1854=
907
> & https://github.com/curl/curl/commit/e9b9bbac22c26cf6731 & https://githu=
b.com/curl/curl/commit/9fce2c55d4b0273ac99
>
> Reference:
> https://curl.se/docs/CVE-2024-11053.html
> https://ubuntu.com/security/CVE-2024-11053
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../curl/curl/CVE-2024-11053-1.patch          | 718 ++++++++++++++++++
>  .../curl/curl/CVE-2024-11053-2.patch          | 130 ++++
>  .../curl/curl/CVE-2024-11053-pre1.patch       | 350 +++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   3 +
>  4 files changed, 1201 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2024-11053-1.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2024-11053-2.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2024-11053-pre1.pa=
tch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2024-11053-1.patch b/meta=
/recipes-support/curl/curl/CVE-2024-11053-1.patch
> new file mode 100644
> index 0000000000..14080c7bd0
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2024-11053-1.patch
> @@ -0,0 +1,718 @@
> +From e9b9bbac22c26cf67316fa8e6c6b9e831af31949 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Fri, 15 Nov 2024 11:06:36 +0100
> +Subject: [PATCH] netrc: address several netrc parser flaws
> +
> +- make sure that a match that returns a username also returns a
> +  password, that should be blank if no password is found
> +
> +- fix handling of multiple logins for same host where the password/login
> +  order might be reversed.
> +
> +- reject credentials provided in the .netrc if they contain ASCII contro=
l
> +  codes - if the used protocol does not support such (like HTTP and WS d=
o)
> +
> +Reported-by: Harry Sintonen
> +
> +Add test 478, 479 and 480 to verify. Updated unit 1304.
> +
> +Closes #15586
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/e9b9bbac2=
2c26cf6731]
> +CVE: CVE-2024-11053
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + lib/netrc.c             | 122 ++++++++++++++++++++++------------------
> + lib/url.c               |  59 ++++++++++++-------
> + tests/data/Makefile.inc |   2 +-
> + tests/data/test478      |  73 ++++++++++++++++++++++++
> + tests/data/test479      | 107 +++++++++++++++++++++++++++++++++++
> + tests/data/test480      |  38 +++++++++++++
> + tests/unit/unit1304.c   |  75 +++++++-----------------
> + 7 files changed, 347 insertions(+), 129 deletions(-)
> + create mode 100644 tests/data/test478
> + create mode 100644 tests/data/test479
> + create mode 100644 tests/data/test480
> +
> +diff --git a/lib/netrc.c b/lib/netrc.c
> +index cd2a284..b582c10 100644
> +--- a/lib/netrc.c
> ++++ b/lib/netrc.c
> +@@ -49,6 +49,15 @@ enum host_lookup_state {
> +   MACDEF
> + };
> +
> ++enum found_state {
> ++  NONE,
> ++  LOGIN,
> ++  PASSWORD
> ++};
> ++
> ++#define FOUND_LOGIN    1
> ++#define FOUND_PASSWORD 2
> ++
> + #define NETRC_FILE_MISSING 1
> + #define NETRC_FAILED -1
> + #define NETRC_SUCCESS 0
> +@@ -59,23 +68,20 @@ enum host_lookup_state {
> +  * Returns zero on success.
> +  */
> + static int parsenetrc(const char *host,
> +-                      char **loginp,
> ++                      char **loginp, /* might point to a username */
> +                       char **passwordp,
> +                       char *netrcfile)
> + {
> +   FILE *file;
> +   int retcode =3D NETRC_FILE_MISSING;
> +   char *login =3D *loginp;
> +-  char *password =3D *passwordp;
> +-  bool specific_login =3D (login && *login !=3D 0);
> +-  bool login_alloc =3D FALSE;
> +-  bool password_alloc =3D FALSE;
> ++  char *password =3D NULL;
> ++  bool specific_login =3D login; /* points to something */
> +   enum host_lookup_state state =3D NOTHING;
> +-
> +-  char state_login =3D 0;      /* Found a login keyword */
> +-  char state_password =3D 0;   /* Found a password keyword */
> +-  int state_our_login =3D TRUE;  /* With specific_login, found *our* lo=
gin
> +-                                  name (or login-less line) */
> ++  enum found_state keyword =3D NONE;
> ++  unsigned char found =3D 0; /* login + password found bits, as they ca=
n come in
> ++                            any order */
> ++  bool our_login =3D FALSE;  /* found our login name */
> +
> +   DEBUGASSERT(netrcfile);
> +
> +@@ -97,7 +103,7 @@ static int parsenetrc(const char *host,
> +           continue;
> +       }
> +       tok =3D netrcbuffer;
> +-      while(tok) {
> ++      while(tok && !done) {
> +         while(ISBLANK(*tok))
> +           tok++;
> +         /* tok is first non-space letter */
> +@@ -156,11 +162,6 @@ static int parsenetrc(const char *host,
> +           }
> +         }
> +
> +-        if((login && *login) && (password && *password)) {
> +-          done =3D TRUE;
> +-          break;
> +-        }
> +-
> +         switch(state) {
> +         case NOTHING:
> +           if(strcasecompare("macdef", tok)) {
> +@@ -175,6 +176,12 @@ static int parsenetrc(const char *host,
> +                after this we need to search for 'login' and
> +                'password'. */
> +             state =3D HOSTFOUND;
> ++            keyword =3D NONE;
> ++            found =3D 0;
> ++            our_login =3D FALSE;
> ++            Curl_safefree(password);
> ++            if(!specific_login)
> ++            Curl_safefree(login);
> +           }
> +           else if(strcasecompare("default", tok)) {
> +             state =3D HOSTVALID;
> +@@ -198,48 +205,55 @@ static int parsenetrc(const char *host,
> +           break;
> +         case HOSTVALID:
> +           /* we are now parsing sub-keywords concerning "our" host */
> +-          if(state_login) {
> ++          if(keyword =3D=3D LOGIN) {
> +             if(specific_login) {
> +-              state_our_login =3D !Curl_timestrcmp(login, tok);
> ++              our_login =3D !Curl_timestrcmp(login, tok);
> +             }
> +-            else if(!login || Curl_timestrcmp(login, tok)) {
> +-              if(login_alloc) {
> +-                free(login);
> +-                login_alloc =3D FALSE;
> +-              }
> ++            else {
> ++              our_login =3D TRUE;
> ++              free(login);
> +               login =3D strdup(tok);
> +               if(!login) {
> +                 retcode =3D NETRC_FAILED; /* allocation failed */
> +                 goto out;
> +               }
> +-              login_alloc =3D TRUE;
> +             }
> +-            state_login =3D 0;
> ++          found |=3D FOUND_LOGIN;
> ++          keyword =3D NONE;
> +           }
> +-          else if(state_password) {
> +-            if((state_our_login || !specific_login)
> +-               && (!password || Curl_timestrcmp(password, tok))) {
> +-              if(password_alloc) {
> +-                free(password);
> +-                password_alloc =3D FALSE;
> +-              }
> +-              password =3D strdup(tok);
> +-              if(!password) {
> +-                retcode =3D NETRC_FAILED; /* allocation failed */
> +-                goto out;
> +-              }
> +-              password_alloc =3D TRUE;
> ++          else if(keyword =3D=3D PASSWORD) {
> ++            free(password);
> ++            password =3D strdup(tok);
> ++            if(!password) {
> ++            retcode =3D NETRC_FAILED; /* allocation failed */
> ++            goto out;
> +             }
> +-            state_password =3D 0;
> ++          found |=3D FOUND_PASSWORD;
> ++          keyword =3D NONE;
> +           }
> +           else if(strcasecompare("login", tok))
> +-            state_login =3D 1;
> ++            keyword =3D LOGIN;
> +           else if(strcasecompare("password", tok))
> +-            state_password =3D 1;
> ++            keyword =3D PASSWORD;
> +           else if(strcasecompare("machine", tok)) {
> +-            /* ok, there's machine here go =3D> */
> ++            /* a new machine here */
> +             state =3D HOSTFOUND;
> +-            state_our_login =3D FALSE;
> ++            keyword =3D NONE;
> ++            found =3D 0;
> ++            Curl_safefree(password);
> ++            if(!specific_login)
> ++            Curl_safefree(login);
> ++          }
> ++          else if(strcasecompare("default", tok)) {
> ++            state =3D HOSTVALID;
> ++            retcode =3D NETRC_SUCCESS; /* we did find our host */
> ++            Curl_safefree(password);
> ++            if(!specific_login)
> ++            Curl_safefree(login);
> ++          }
> ++          if((found =3D=3D (FOUND_PASSWORD|FOUND_LOGIN)) && our_login) =
{
> ++            done =3D TRUE;
> ++            break;
> +           }
> +           break;
> +         } /* switch (state) */
> +@@ -249,24 +263,22 @@ static int parsenetrc(const char *host,
> +
> + out:
> +     Curl_dyn_free(&buf);
> ++    if(!retcode && !password && our_login) {
> ++      /* success without a password, set a blank one */
> ++      password =3D strdup("");
> ++      if(!password)
> ++        retcode =3D 1; /* out of memory */
> ++    }
> +     if(!retcode) {
> +       /* success */
> +-      if(login_alloc) {
> +-        if(*loginp)
> +-          free(*loginp);
> ++      if(!specific_login)
> +         *loginp =3D login;
> +-      }
> +-      if(password_alloc) {
> +-        if(*passwordp)
> +-          free(*passwordp);
> +-        *passwordp =3D password;
> +-      }
> ++      *passwordp =3D password;
> +     }
> +     else {
> +-      if(login_alloc)
> ++      if(!specific_login)
> +         free(login);
> +-      if(password_alloc)
> +-        free(password);
> ++      free(password);
> +     }
> +     fclose(file);
> +   }
> +diff --git a/lib/url.c b/lib/url.c
> +index 8892450..e121d45 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -2699,6 +2699,17 @@ static CURLcode parse_remote_port(struct Curl_eas=
y *data,
> +   return CURLE_OK;
> + }
> +
> ++static bool str_has_ctrl(const char *input)
> ++{
> ++  const unsigned char *str =3D (const unsigned char *)input;
> ++  while(*str) {
> ++    if(*str < 0x20)
> ++      return TRUE;
> ++    str++;
> ++  }
> ++  return FALSE;
> ++}
> ++
> + /*
> +  * Override the login details from the URL with that in the CURLOPT_USE=
RPWD
> +  * option or a .netrc file, if applicable.
> +@@ -2730,29 +2741,39 @@ static CURLcode override_login(struct Curl_easy =
*data,
> +
> +     if(data->state.aptr.user &&
> +        (data->state.creds_from !=3D CREDS_NETRC)) {
> +-      /* there was a user name in the URL. Use the URL decoded version =
*/
> ++      /* there was a username with a length in the URL. Use the URL dec=
oded
> ++         version */
> +       userp =3D &data->state.aptr.user;
> +       url_provided =3D TRUE;
> +     }
> +
> +-    ret =3D Curl_parsenetrc(conn->host.name,
> +-                          userp, passwdp,
> +-                          data->set.str[STRING_NETRC_FILE]);
> +-    if(ret > 0) {
> +-      infof(data, "Couldn't find host %s in the %s file; using defaults=
",
> +-            conn->host.name,
> +-            (data->set.str[STRING_NETRC_FILE] ?
> +-             data->set.str[STRING_NETRC_FILE] : ".netrc"));
> +-    }
> +-    else if(ret < 0) {
> +-      failf(data, ".netrc parser error");
> +-      return CURLE_READ_ERROR;
> +-    }
> +-    else {
> +-      /* set bits.netrc TRUE to remember that we got the name from a .n=
etrc
> +-         file, so that it is safe to use even if we followed a Location=
: to a
> +-         different host or similar. */
> +-      conn->bits.netrc =3D TRUE;
> ++    if(!*passwdp) {
> ++      ret =3D Curl_parsenetrc(conn->host.name, userp, passwdp,
> ++                          data->set.str[STRING_NETRC_FILE]);
> ++      if(ret > 0) {
> ++      infof(data, "Couldn't find host %s in the %s file; using defaults=
",
> ++            conn->host.name,
> ++            (data->set.str[STRING_NETRC_FILE] ?
> ++             data->set.str[STRING_NETRC_FILE] : ".netrc"));
> ++      }
> ++      else if(ret < 0) {
> ++      failf(data, ".netrc parser error");
> ++      return CURLE_READ_ERROR;
> ++      }
> ++      else {
> ++      if(!(conn->handler->flags&PROTOPT_USERPWDCTRL)) {
> ++        /* if the protocol can't handle control codes in credentials, m=
ake
> ++           sure there are none */
> ++        if(str_has_ctrl(*userp) || str_has_ctrl(*passwdp)) {
> ++          failf(data, "control code detected in .netrc credentials");
> ++          return CURLE_READ_ERROR;
> ++        }
> ++      }
> ++      /* set bits.netrc TRUE to remember that we got the name from a .n=
etrc
> ++         file, so that it is safe to use even if we followed a Location=
: to a
> ++         different host or similar. */
> ++      conn->bits.netrc =3D TRUE;
> ++      }
> +     }
> +     if(url_provided) {
> +       Curl_safefree(conn->user);
> +diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
> +index 03cb6a0..f608a7d 100644
> +--- a/tests/data/Makefile.inc
> ++++ b/tests/data/Makefile.inc
> +@@ -74,7 +74,7 @@ test435 test436 test437 test438 test439 test440 test44=
1 test442 test443 \
> + test444 test445 test446 test447 test448 test449 test450 test451 test452=
 \
> + test453 test454 test455 test456 test457 test458 test459 test460 test461=
 \
> + test462 test463 test467 test468 \
> +-\
> ++test478 test479 test480 \
> + test490 test491 test492 test493 test494 test495 test496 test497 test498=
 \
> + test499 test500 test501 test502 test503 test504 test505 test506 test507=
 \
> + test508 test509 test510 test511 test512 test513 test514 test515 test516=
 \
> +diff --git a/tests/data/test478 b/tests/data/test478
> +new file mode 100644
> +index 0000000..7d7454d
> +--- /dev/null
> ++++ b/tests/data/test478
> +@@ -0,0 +1,73 @@
> ++<testcase>
> ++<info>
> ++<keywords>
> ++netrc
> ++HTTP
> ++</keywords>
> ++</info>
> ++#
> ++# Server-side
> ++<reply>
> ++<data crlf=3D"yes">
> ++HTTP/1.1 200 OK
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Server: test-server/fake
> ++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
> ++ETag: "21025-dc7-39462498"
> ++Accept-Ranges: bytes
> ++Content-Length: 6
> ++Connection: close
> ++Content-Type: text/html
> ++Funny-head: yesyes
> ++
> ++-foo-
> ++</data>
> ++</reply>
> ++
> ++#
> ++# Client-side
> ++<client>
> ++<server>
> ++http
> ++</server>
> ++<features>
> ++proxy
> ++</features>
> ++<name>
> ++.netrc with multiple accounts for same host
> ++</name>
> ++<command>
> ++--netrc --netrc-file %LOGDIR/netrc%TESTNUMBER -x http://%HOSTIP:%HTTPPO=
RT/ http://debbie@github.com/
> ++</command>
> ++<file name=3D"%LOGDIR/netrc%TESTNUMBER" >
> ++
> ++machine github.com
> ++password weird
> ++password firstone
> ++login daniel
> ++
> ++machine github.com
> ++
> ++machine github.com
> ++login debbie
> ++
> ++machine github.com
> ++password weird
> ++password "second\r"
> ++login debbie
> ++
> ++</file>
> ++</client>
> ++
> ++<verify>
> ++<protocol>
> ++GET http://github.com/ HTTP/1.1
> ++Host: github.com
> ++Authorization: Basic %b64[debbie:second%0D]b64%
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++</protocol>
> ++</verify>
> ++</testcase>
> +diff --git a/tests/data/test479 b/tests/data/test479
> +new file mode 100644
> +index 0000000..48bcdfe
> +--- /dev/null
> ++++ b/tests/data/test479
> +@@ -0,0 +1,107 @@
> ++<testcase>
> ++<info>
> ++<keywords>
> ++netrc
> ++HTTP
> ++</keywords>
> ++</info>
> ++#
> ++# Server-side
> ++<reply>
> ++<data crlf=3D"yes">
> ++HTTP/1.1 301 Follow this you fool
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Server: test-server/fake
> ++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
> ++ETag: "21025-dc7-39462498"
> ++Accept-Ranges: bytes
> ++Content-Length: 6
> ++Connection: close
> ++Location: http://b.com/%TESTNUMBER0002
> ++
> ++-foo-
> ++</data>
> ++
> ++<data2 crlf=3D"yes">
> ++HTTP/1.1 200 OK
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Server: test-server/fake
> ++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
> ++ETag: "21025-dc7-39462498"
> ++Accept-Ranges: bytes
> ++Content-Length: 7
> ++Connection: close
> ++
> ++target
> ++</data2>
> ++
> ++<datacheck crlf=3D"yes">
> ++HTTP/1.1 301 Follow this you fool
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Server: test-server/fake
> ++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
> ++ETag: "21025-dc7-39462498"
> ++Accept-Ranges: bytes
> ++Content-Length: 6
> ++Connection: close
> ++Location: http://b.com/%TESTNUMBER0002
> ++
> ++HTTP/1.1 200 OK
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Server: test-server/fake
> ++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
> ++ETag: "21025-dc7-39462498"
> ++Accept-Ranges: bytes
> ++Content-Length: 7
> ++Connection: close
> ++
> ++target
> ++</datacheck>
> ++</reply>
> ++
> ++#
> ++# Client-side
> ++<client>
> ++<server>
> ++http
> ++</server>
> ++<features>
> ++proxy
> ++</features>
> ++<name>
> ++.netrc with redirect and default without password
> ++</name>
> ++<command>
> ++--netrc --netrc-file %LOGDIR/netrc%TESTNUMBER -L -x http://%HOSTIP:%HTT=
PPORT/ http://a.com/
> ++</command>
> ++<file name=3D"%LOGDIR/netrc%TESTNUMBER" >
> ++
> ++machine a.com
> ++  login alice
> ++  password alicespassword
> ++
> ++default
> ++  login bob
> ++
> ++</file>
> ++</client>
> ++
> ++<verify>
> ++<protocol>
> ++GET http://a.com/ HTTP/1.1
> ++Host: a.com
> ++Authorization: Basic %b64[alice:alicespassword]b64%
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++GET http://b.com/%TESTNUMBER0002 HTTP/1.1
> ++Host: b.com
> ++Authorization: Basic %b64[bob:]b64%
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++</protocol>
> ++</verify>
> ++</testcase>
> +diff --git a/tests/data/test480 b/tests/data/test480
> +new file mode 100644
> +index 0000000..aab889f
> +--- /dev/null
> ++++ b/tests/data/test480
> +@@ -0,0 +1,38 @@
> ++<testcase>
> ++<info>
> ++<keywords>
> ++netrc
> ++pop3
> ++</keywords>
> ++</info>
> ++#
> ++# Server-side
> ++<reply>
> ++
> ++</reply>
> ++
> ++#
> ++# Client-side
> ++<client>
> ++<server>
> ++pop3
> ++</server>
> ++<name>
> ++Reject .netrc with credentials using CRLF for POP3
> ++</name>
> ++<command>
> ++--netrc --netrc-file %LOGDIR/netrc%TESTNUMBER pop3://%HOSTIP:%POP3PORT/=
%TESTNUMBER
> ++</command>
> ++<file name=3D"%LOGDIR/netrc%TESTNUMBER" >
> ++machine %HOSTIP
> ++  login alice
> ++  password "password\r\ncommand"
> ++</file>
> ++</client>
> ++
> ++<verify>
> ++<errorcode>
> ++26
> ++</errorcode>
> ++</verify>
> ++</testcase>
> +diff --git a/tests/unit/unit1304.c b/tests/unit/unit1304.c
> +index 0288562..b2b4366 100644
> +--- a/tests/unit/unit1304.c
> ++++ b/tests/unit/unit1304.c
> +@@ -32,13 +32,8 @@ static char *password;
> +
> + static CURLcode unit_setup(void)
> + {
> +-  password =3D strdup("");
> +-  login =3D strdup("");
> +-  if(!password || !login) {
> +-    Curl_safefree(password);
> +-    Curl_safefree(login);
> +-    return CURLE_OUT_OF_MEMORY;
> +-  }
> ++  password =3D NULL;
> ++  login =3D NULL;
> +   return CURLE_OK;
> + }
> +
> +@@ -56,76 +51,48 @@ UNITTEST_START
> +    */
> +   result =3D Curl_parsenetrc("test.example.com", &login, &password, arg=
);
> +   fail_unless(result =3D=3D 1, "Host not found should return 1");
> +-  abort_unless(password !=3D NULL, "returned NULL!");
> +-  fail_unless(password[0] =3D=3D 0, "password should not have been chan=
ged");
> +-  abort_unless(login !=3D NULL, "returned NULL!");
> +-  fail_unless(login[0] =3D=3D 0, "login should not have been changed");
> ++  abort_unless(password =3D=3D NULL, "password did not return NULL!");
> ++  abort_unless(login =3D=3D NULL, "user did not return NULL!");
> +
> +   /*
> +    * Test a non existent login in our netrc file.
> +    */
> +-  free(login);
> +-  login =3D strdup("me");
> +-  abort_unless(login !=3D NULL, "returned NULL!");
> ++  login =3D (char *)"me";
> +   result =3D Curl_parsenetrc("example.com", &login, &password, arg);
> +   fail_unless(result =3D=3D 0, "Host should have been found");
> +-  abort_unless(password !=3D NULL, "returned NULL!");
> +-  fail_unless(password[0] =3D=3D 0, "password should not have been chan=
ged");
> +-  abort_unless(login !=3D NULL, "returned NULL!");
> +-  fail_unless(strncmp(login, "me", 2) =3D=3D 0,
> +-              "login should not have been changed");
> ++  abort_unless(password =3D=3D NULL, "password is not NULL!");
> +
> +   /*
> +    * Test a non existent login and host in our netrc file.
> +    */
> +-  free(login);
> +-  login =3D strdup("me");
> +-  abort_unless(login !=3D NULL, "returned NULL!");
> ++  login =3D (char *)"me";
> +   result =3D Curl_parsenetrc("test.example.com", &login, &password, arg=
);
> +   fail_unless(result =3D=3D 1, "Host not found should return 1");
> +-  abort_unless(password !=3D NULL, "returned NULL!");
> +-  fail_unless(password[0] =3D=3D 0, "password should not have been chan=
ged");
> +-  abort_unless(login !=3D NULL, "returned NULL!");
> +-  fail_unless(strncmp(login, "me", 2) =3D=3D 0,
> +-              "login should not have been changed");
> ++  abort_unless(password =3D=3D NULL, "password is not NULL!");
> +
> +   /*
> +    * Test a non existent login (substring of an existing one) in our
> +    * netrc file.
> +    */
> +-  free(login);
> +-  login =3D strdup("admi");
> +-  abort_unless(login !=3D NULL, "returned NULL!");
> ++  login =3D (char *)"admi";
> +   result =3D Curl_parsenetrc("example.com", &login, &password, arg);
> +   fail_unless(result =3D=3D 0, "Host should have been found");
> +-  abort_unless(password !=3D NULL, "returned NULL!");
> +-  fail_unless(password[0] =3D=3D 0, "password should not have been chan=
ged");
> +-  abort_unless(login !=3D NULL, "returned NULL!");
> +-  fail_unless(strncmp(login, "admi", 4) =3D=3D 0,
> +-              "login should not have been changed");
> ++  abort_unless(password =3D=3D NULL, "password is not NULL!");
> +
> +   /*
> +    * Test a non existent login (superstring of an existing one)
> +    * in our netrc file.
> +    */
> +-  free(login);
> +-  login =3D strdup("adminn");
> +-  abort_unless(login !=3D NULL, "returned NULL!");
> ++  login =3D (char *)"adminn";
> +   result =3D Curl_parsenetrc("example.com", &login, &password, arg);
> +   fail_unless(result =3D=3D 0, "Host should have been found");
> +-  abort_unless(password !=3D NULL, "returned NULL!");
> +-  fail_unless(password[0] =3D=3D 0, "password should not have been chan=
ged");
> +-  abort_unless(login !=3D NULL, "returned NULL!");
> +-  fail_unless(strncmp(login, "adminn", 6) =3D=3D 0,
> +-              "login should not have been changed");
> ++  abort_unless(password =3D=3D NULL, "password is not NULL!");
> +
> +   /*
> +    * Test for the first existing host in our netrc file
> +    * with login[0] =3D 0.
> +    */
> +-  free(login);
> +-  login =3D strdup("");
> +-  abort_unless(login !=3D NULL, "returned NULL!");
> ++  login =3D NULL;
> +   result =3D Curl_parsenetrc("example.com", &login, &password, arg);
> +   fail_unless(result =3D=3D 0, "Host should have been found");
> +   abort_unless(password !=3D NULL, "returned NULL!");
> +@@ -139,8 +106,9 @@ UNITTEST_START
> +    * with login[0] !=3D 0.
> +    */
> +   free(password);
> +-  password =3D strdup("");
> +-  abort_unless(password !=3D NULL, "returned NULL!");
> ++  free(login);
> ++  password =3D NULL;
> ++  login =3D NULL;
> +   result =3D Curl_parsenetrc("example.com", &login, &password, arg);
> +   fail_unless(result =3D=3D 0, "Host should have been found");
> +   abort_unless(password !=3D NULL, "returned NULL!");
> +@@ -154,11 +122,9 @@ UNITTEST_START
> +    * with login[0] =3D 0.
> +    */
> +   free(password);
> +-  password =3D strdup("");
> +-  abort_unless(password !=3D NULL, "returned NULL!");
> ++  password =3D NULL;
> +   free(login);
> +-  login =3D strdup("");
> +-  abort_unless(login !=3D NULL, "returned NULL!");
> ++  login =3D NULL;
> +   result =3D Curl_parsenetrc("curl.example.com", &login, &password, arg=
);
> +   fail_unless(result =3D=3D 0, "Host should have been found");
> +   abort_unless(password !=3D NULL, "returned NULL!");
> +@@ -172,8 +138,9 @@ UNITTEST_START
> +    * with login[0] !=3D 0.
> +    */
> +   free(password);
> +-  password =3D strdup("");
> +-  abort_unless(password !=3D NULL, "returned NULL!");
> ++  free(login);
> ++  password =3D NULL;
> ++  login =3D NULL;
> +   result =3D Curl_parsenetrc("curl.example.com", &login, &password, arg=
);
> +   fail_unless(result =3D=3D 0, "Host should have been found");
> +   abort_unless(password !=3D NULL, "returned NULL!");
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/curl/curl/CVE-2024-11053-2.patch b/meta=
/recipes-support/curl/curl/CVE-2024-11053-2.patch
> new file mode 100644
> index 0000000000..2f35a86eb9
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2024-11053-2.patch
> @@ -0,0 +1,130 @@
> +From 9fce2c55d4b0273ac99b59bd8cb982a6d96b88cf Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Tue, 17 Dec 2024 23:56:42 +0100
> +Subject: [PATCH] netrc: fix password-only entries
> +
> +When a specific hostname matched, and only a password is set before
> +another machine is specified in the netrc file, the parser would not be
> +happy and stop there and return the password-only state. It instead
> +continued and did not return a match.
> +
> +Add test 2005 to verify this case
> +
> +Regression from e9b9bba, shipped in 8.11.1.
> +
> +Reported-by: Ben Zanin
> +Fixes #15767
> +Closes #15768
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/9fce2c55d=
4b0273ac99]
> +CVE: CVE-2024-11053 #Regression fix
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + lib/netrc.c             |  7 +++++-
> + tests/data/Makefile.inc |  2 +-
> + tests/data/test2005     | 55 +++++++++++++++++++++++++++++++++++++++++
> + 3 files changed, 62 insertions(+), 2 deletions(-)
> + create mode 100644 tests/data/test2005
> +
> +diff --git a/lib/netrc.c b/lib/netrc.c
> +index b582c10..a282fce 100644
> +--- a/lib/netrc.c
> ++++ b/lib/netrc.c
> +@@ -228,7 +228,8 @@ static int parsenetrc(const char *host,
> +             retcode =3D NETRC_FAILED; /* allocation failed */
> +             goto out;
> +             }
> +-          found |=3D FOUND_PASSWORD;
> ++          if(!specific_login || our_login)
> ++            found |=3D FOUND_PASSWORD;
> +           keyword =3D NONE;
> +           }
> +           else if(strcasecompare("login", tok))
> +@@ -237,6 +238,10 @@ static int parsenetrc(const char *host,
> +             keyword =3D PASSWORD;
> +           else if(strcasecompare("machine", tok)) {
> +             /* a new machine here */
> ++            if(found & FOUND_PASSWORD) {
> ++            done =3D TRUE;
> ++            break;
> ++          }
> +             state =3D HOSTFOUND;
> +             keyword =3D NONE;
> +             found =3D 0;
> +diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
> +index f608a7d..2823d96 100644
> +--- a/tests/data/Makefile.inc
> ++++ b/tests/data/Makefile.inc
> +@@ -230,7 +230,7 @@ test1941 test1942 test1943 test1944 test1945 test194=
6 test1947 test1948 \
> + test1955 test1956 test1957 test1958 test1959 test1960 test1964 \
> + test1970 test1971 test1972 test1973 test1974 test1975 \
> + \
> +-test2000 test2001 test2002 test2003 test2004 \
> ++test2000 test2001 test2002 test2003 test2004 test2005 \
> + \
> +                                                                test2023=
 \
> + test2024 test2025 test2026 test2027 test2028 test2029 test2030 test2031=
 \
> +diff --git a/tests/data/test2005 b/tests/data/test2005
> +new file mode 100644
> +index 0000000..69e14d9
> +--- /dev/null
> ++++ b/tests/data/test2005
> +@@ -0,0 +1,55 @@
> ++<testcase>
> ++<info>
> ++<keywords>
> ++HTTP
> ++netrc
> ++</keywords>
> ++</info>
> ++#
> ++# Server-side
> ++<reply>
> ++<data>
> ++HTTP/1.1 200 OK
> ++Date: Fri, 05 Aug 2022 10:09:00 GMT
> ++Server: test-server/fake
> ++Content-Type: text/plain
> ++Content-Length: 6
> ++Connection: close
> ++
> ++-foo-
> ++</data>
> ++</reply>
> ++
> ++#
> ++# Client-side
> ++<client>
> ++<server>
> ++http
> ++</server>
> ++<name>
> ++netrc match with password only in file, no username. machine follows
> ++</name>
> ++<command>
> ++--netrc-optional --netrc-file %LOGDIR/netrc%TESTNUMBER http://%HOSTIP:%=
HTTPPORT/
> ++</command>
> ++<file name=3D"%LOGDIR/netrc%TESTNUMBER" >
> ++machine %HOSTIP
> ++password 5up3r53cr37
> ++
> ++machine example.com
> ++</file>
> ++</client>
> ++
> ++#
> ++# Verify data after the test has been "shot"
> ++<verify>
> ++<protocol>
> ++GET / HTTP/1.1
> ++Host: %HOSTIP:%HTTPPORT
> ++Authorization: Basic %b64[:5up3r53cr37]b64%
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++
> ++</protocol>
> ++</verify>
> ++</testcase>
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/curl/curl/CVE-2024-11053-pre1.patch b/m=
eta/recipes-support/curl/curl/CVE-2024-11053-pre1.patch
> new file mode 100644
> index 0000000000..55fccae316
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2024-11053-pre1.patch
> @@ -0,0 +1,350 @@
> +From 9bee39bfed2c413b4cc4eb306a57ac92a1854907 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Sat, 12 Oct 2024 23:54:39 +0200
> +Subject: [PATCH] url: use same credentials on redirect
> +
> +Previously it could lose the username and only use the password.
> +
> +Added test 998 and 999 to verify.
> +
> +Reported-by: Tobias Bora
> +Fixes #15262
> +Closes #15282
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/9bee39bfe=
d2c413b4cc4eb306a57ac92a1854907]
> +CVE: CVE-2024-11053 #Dependency Patch
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + lib/transfer.c          |  3 ++
> + lib/url.c               | 19 +++++----
> + lib/urldata.h           |  9 +++-
> + tests/data/Makefile.inc |  2 +-
> + tests/data/test998      | 92 +++++++++++++++++++++++++++++++++++++++++
> + tests/data/test999      | 81 ++++++++++++++++++++++++++++++++++++
> + 6 files changed, 195 insertions(+), 11 deletions(-)
> + create mode 100644 tests/data/test998
> + create mode 100644 tests/data/test999
> +
> +diff --git a/lib/transfer.c b/lib/transfer.c
> +index e31d1d6..ccd042b 100644
> +--- a/lib/transfer.c
> ++++ b/lib/transfer.c
> +@@ -700,6 +700,9 @@ CURLcode Curl_pretransfer(struct Curl_easy *data)
> +       return CURLE_OUT_OF_MEMORY;
> +   }
> +
> ++  if(data->set.str[STRING_USERNAME] ||
> ++     data->set.str[STRING_PASSWORD])
> ++    data->state.creds_from =3D CREDS_OPTION;
> +   if(!result)
> +     result =3D Curl_setstropt(&data->state.aptr.user,
> +                             data->set.str[STRING_USERNAME]);
> +diff --git a/lib/url.c b/lib/url.c
> +index 224b9f3..8892450 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -1899,10 +1899,10 @@ static CURLcode parseurlandfillconn(struct Curl_=
easy *data,
> +     return result;
> +
> +   /*
> +-   * User name and password set with their own options override the
> +-   * credentials possibly set in the URL.
> ++   * User name and password set with their own options override the cre=
dentials
> ++   * possibly set in the URL, but netrc does not.
> +    */
> +-  if(!data->set.str[STRING_PASSWORD]) {
> ++  if(!data->state.aptr.passwd || (data->state.creds_from !=3D CREDS_OPT=
ION)) {
> +     uc =3D curl_url_get(uh, CURLUPART_PASSWORD, &data->state.up.passwor=
d, 0);
> +     if(!uc) {
> +       char *decoded;
> +@@ -1915,12 +1915,13 @@ static CURLcode parseurlandfillconn(struct Curl_=
easy *data,
> +       result =3D Curl_setstropt(&data->state.aptr.passwd, decoded);
> +       if(result)
> +         return result;
> ++      data->state.creds_from =3D CREDS_URL;
> +     }
> +     else if(uc !=3D CURLUE_NO_PASSWORD)
> +       return Curl_uc_to_curlcode(uc);
> +   }
> +
> +-  if(!data->set.str[STRING_USERNAME]) {
> ++  if(!data->state.aptr.user || (data->state.creds_from !=3D CREDS_OPTIO=
N)) {
> +     /* we don't use the URL API's URL decoder option here since it reje=
cts
> +        control codes and we want to allow them for some schemes in the =
user
> +        and password fields */
> +@@ -1934,13 +1935,10 @@ static CURLcode parseurlandfillconn(struct Curl_=
easy *data,
> +         return result;
> +       conn->user =3D decoded;
> +       result =3D Curl_setstropt(&data->state.aptr.user, decoded);
> ++      data->state.creds_from =3D CREDS_URL;
> +     }
> +     else if(uc !=3D CURLUE_NO_USER)
> +       return Curl_uc_to_curlcode(uc);
> +-    else if(data->state.aptr.passwd) {
> +-      /* no user was set but a password, set a blank user */
> +-      result =3D Curl_setstropt(&data->state.aptr.user, "");
> +-    }
> +     if(result)
> +       return result;
> +   }
> +@@ -2730,7 +2728,8 @@ static CURLcode override_login(struct Curl_easy *d=
ata,
> +     int ret;
> +     bool url_provided =3D FALSE;
> +
> +-    if(data->state.aptr.user) {
> ++    if(data->state.aptr.user &&
> ++       (data->state.creds_from !=3D CREDS_NETRC)) {
> +       /* there was a user name in the URL. Use the URL decoded version =
*/
> +       userp =3D &data->state.aptr.user;
> +       url_provided =3D TRUE;
> +@@ -2778,6 +2777,7 @@ static CURLcode override_login(struct Curl_easy *d=
ata,
> +       result =3D Curl_setstropt(&data->state.aptr.user, *userp);
> +       if(result)
> +         return result;
> ++      data->state.creds_from =3D CREDS_NETRC;
> +     }
> +   }
> +   if(data->state.aptr.user) {
> +@@ -2795,6 +2795,7 @@ static CURLcode override_login(struct Curl_easy *d=
ata,
> +     CURLcode result =3D Curl_setstropt(&data->state.aptr.passwd, *passw=
dp);
> +     if(result)
> +       return result;
> ++    data->state.creds_from =3D CREDS_NETRC;
> +   }
> +   if(data->state.aptr.passwd) {
> +     uc =3D curl_url_set(data->state.uh, CURLUPART_PASSWORD,
> +diff --git a/lib/urldata.h b/lib/urldata.h
> +index ce28f25..b68d023 100644
> +--- a/lib/urldata.h
> ++++ b/lib/urldata.h
> +@@ -1207,6 +1207,11 @@ struct urlpieces {
> +   char *query;
> + };
> +
> ++#define CREDS_NONE   0
> ++#define CREDS_URL    1 /* from URL */
> ++#define CREDS_OPTION 2 /* set with a CURLOPT_ */
> ++#define CREDS_NETRC  3 /* found in netrc */
> ++
> + struct UrlState {
> +   /* Points to the connection cache */
> +   struct conncache *conn_cache;
> +@@ -1344,7 +1349,6 @@ struct UrlState {
> +     char *proxyuser;
> +     char *proxypasswd;
> +   } aptr;
> +-
> +   unsigned char httpwant; /* when non-zero, a specific HTTP version req=
uested
> +                              to be used in the library's request(s) */
> +   unsigned char httpversion; /* the lowest HTTP version*10 reported by =
any
> +@@ -1354,6 +1358,9 @@ struct UrlState {
> +   unsigned char select_bits; /* !=3D 0 -> bitmask of socket events for =
this
> +                                  transfer overriding anything the socke=
t may
> +                                  report */
> ++  unsigned int creds_from:2; /* where is the server credentials origina=
ting
> ++                                from, see the CREDS_* defines above */
> ++
> + #ifdef CURLDEBUG
> +   BIT(conncache_lock);
> + #endif
> +diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
> +index d89e565..03cb6a0 100644
> +--- a/tests/data/Makefile.inc
> ++++ b/tests/data/Makefile.inc
> +@@ -126,7 +126,7 @@ test952 test953 test954 test955 test956 test957 test=
958 test959 test960 \
> + test961 test962 test963 test964 test965 test966 test967 test968 test969=
 \
> + test970 test971 test972 test973 test974 test975 test976 test977 test978=
 \
> + test979 test980 test981 test982 test983 test984 test985 test986 test987=
 \
> +-test988 test989 test990 test991 test992 \
> ++test988 test989 test990 test991 test992 test998 test999 \
> + \
> + test1000 test1001 test1002 test1003 test1004 test1005 test1006 test1007=
 \
> + test1008 test1009 test1010 test1011 test1012 test1013 test1014 test1015=
 \
> +diff --git a/tests/data/test998 b/tests/data/test998
> +new file mode 100644
> +index 0000000..6dcd95f
> +--- /dev/null
> ++++ b/tests/data/test998
> +@@ -0,0 +1,92 @@
> ++<testcase>
> ++<info>
> ++<keywords>
> ++HTTP
> ++--location-trusted
> ++</keywords>
> ++</info>
> ++
> ++#
> ++# Server-side
> ++<reply>
> ++<data>
> ++HTTP/1.1 301 redirect
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Server: test-server/fake
> ++Content-Length: 0
> ++Connection: close
> ++Content-Type: text/html
> ++Location: http://somewhere.else.example/a/path/%TESTNUMBER0002
> ++
> ++</data>
> ++<data2>
> ++HTTP/1.1 200 OK
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Content-Length: 6
> ++Content-Type: text/html
> ++Funny-head: yesyes
> ++
> ++-foo-
> ++</data2>
> ++
> ++<datacheck>
> ++HTTP/1.1 301 redirect
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Server: test-server/fake
> ++Content-Length: 0
> ++Connection: close
> ++Content-Type: text/html
> ++Location: http://somewhere.else.example/a/path/%TESTNUMBER0002
> ++
> ++HTTP/1.1 200 OK
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Content-Length: 6
> ++Content-Type: text/html
> ++Funny-head: yesyes
> ++
> ++-foo-
> ++</datacheck>
> ++
> ++</reply>
> ++
> ++#
> ++# Client-side
> ++<client>
> ++<features>
> ++proxy
> ++</features>
> ++<server>
> ++http
> ++</server>
> ++<name>
> ++HTTP with auth in URL redirected to another host
> ++</name>
> ++<command>
> ++-x %HOSTIP:%HTTPPORT http://alberto:einstein@somwhere.example/%TESTNUMB=
ER --location-trusted
> ++</command>
> ++</client>
> ++
> ++#
> ++# Verify data after the test has been "shot"
> ++<verify>
> ++<strip>
> ++QUIT
> ++</strip>
> ++<protocol>
> ++GET http://somwhere.example/998 HTTP/1.1
> ++Host: somwhere.example
> ++Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg=3D=3D
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++GET http://somewhere.else.example/a/path/9980002 HTTP/1.1
> ++Host: somewhere.else.example
> ++Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg=3D=3D
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++</protocol>
> ++</verify>
> ++</testcase>
> +diff --git a/tests/data/test999 b/tests/data/test999
> +new file mode 100644
> +index 0000000..e805cde
> +--- /dev/null
> ++++ b/tests/data/test999
> +@@ -0,0 +1,81 @@
> ++<testcase>
> ++<info>
> ++<keywords>
> ++HTTP
> ++--location-trusted
> ++</keywords>
> ++</info>
> ++
> ++#
> ++# Server-side
> ++<reply>
> ++<data nocheck=3D"yes">
> ++HTTP/1.1 200 OK
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Content-Length: 6
> ++Content-Type: text/html
> ++Funny-head: yesyes
> ++
> ++-foo-
> ++</data>
> ++
> ++<datacheck>
> ++HTTP/1.1 301 redirect
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Server: test-server/fake
> ++Content-Length: 0
> ++Connection: close
> ++Content-Type: text/html
> ++Location: http://somewhere.else.example/a/path/%TESTNUMBER0002
> ++
> ++HTTP/1.1 200 OK
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Content-Length: 6
> ++Content-Type: text/html
> ++Funny-head: yesyes
> ++
> ++-foo-
> ++</datacheck>
> ++
> ++</reply>
> ++
> ++#
> ++# Client-side
> ++<client>
> ++<features>
> ++proxy
> ++</features>
> ++<server>
> ++http
> ++</server>
> ++<name>
> ++HTTP with auth in first URL but not second
> ++</name>
> ++<command>
> ++-x %HOSTIP:%HTTPPORT http://alberto:einstein@somwhere.example/%TESTNUMB=
ER http://somewhere.else.example/%TESTNUMBER
> ++</command>
> ++</client>
> ++
> ++#
> ++# Verify data after the test has been "shot"
> ++<verify>
> ++<strip>
> ++QUIT
> ++</strip>
> ++<protocol>
> ++GET http://somwhere.example/%TESTNUMBER HTTP/1.1
> ++Host: somwhere.example
> ++Authorization: Basic YWxiZXJ0bzplaW5zdGVpbg=3D=3D
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++GET http://somewhere.else.example/%TESTNUMBER HTTP/1.1
> ++Host: somewhere.else.example
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++</protocol>
> ++</verify>
> ++</testcase>
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index 439fcb7881..23bc6f429a 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -20,6 +20,9 @@ SRC_URI =3D " \
>      file://CVE-2024-7264-2.patch \
>      file://CVE-2024-8096.patch \
>      file://CVE-2024-9681.patch \
> +    file://CVE-2024-11053-pre1.patch \
> +    file://CVE-2024-11053-1.patch \
> +    file://CVE-2024-11053-2.patch \
>  "
>  SRC_URI[sha256sum] =3D "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5=
855ebc0c659710cd"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211960): https://lists.openembedded.org/g/openembedde=
d-core/message/211960
> Mute This Topic: https://lists.openembedded.org/mt/111395659/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

