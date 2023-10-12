Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359E3CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 18:37:04 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.20537.1697135819480174993
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 11:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YgnOfjQ8;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.49, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-53e0d21a4easo1703284a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 11:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697135818; x=1697740618; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBL5N6SW9H0duRmT+Z+PDyloiTf+5uc1qh60noloPxs=;
        b=YgnOfjQ88P0X26YoG6LV6rYNfTS3IBvapdGsarWZIVScz32299EgTsAnz8z6Xw1sj4
         B/SIIHZpnVK/aqWlYDK5stbnVBSiky0ka4BbM56tWWTaLVTTJEuZFcnSOwYePg4BzDye
         zoZdWK/5UiEdSz1niEyQemrE9IVFI0ZLZrSmuC/+4Dtuj04906OxgsXscelse0ZQGpK8
         kkdsXHgMIWkv99qvpeYZDKpCquNGAtQGvr4fvhA5zut5B3qb34nosQAoGzr5y7hBTYzb
         M9imOvywpDWYMvJZEVoc9LO7HuvgaoO93jEfSnevVFhyjn+9fXZHgpvb7lRmNjEQFp7E
         ZAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697135818; x=1697740618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBL5N6SW9H0duRmT+Z+PDyloiTf+5uc1qh60noloPxs=;
        b=EFrNBXgAW6PX7kCwxX+HYzGSXxqXwl2tjMyVjv7Y6guDGe6k1ORhYmP2jom9oZoCml
         1SWGXBInHjFUckKBG1W+IhuY5lhA+RZMvInarkcZRFCitBhhgbYwr7wBLBPHCkAz+yxg
         uvdcgPH/KnbFq39z2yw8QcOQZJSSjoMdr4IF+HTbyZcLAtB9mwxn7xOQnALzXPItqklv
         boRi5wistuwH+DRa7Fpof5zKbprjn9YBwIkss+X73lHWtinb02/BdFQIu2gfBcKBGx5T
         q9yaqQMSl7w/7Rq4LKrksx2odvkZF94WFr+oaKuPgu1X5TKNoDPGH4qwb5mUs95xgYvg
         tXnw==
X-Gm-Message-State: AOJu0YxGJU1ys2C/lv7bEz9J3MNRDw7TjGbSESEYWIlKHk360dOFaTA3
	T/YI1SU5Zmo1NMYWCrpNRfR+e3TN0qWGp1G7Ey4kjw==
X-Google-Smtp-Source: AGHT+IHsb6r50ESZxc50WdgoPttDBBaTdht4ASwBWQih2HTyApSAt9c2qa9Qe5thHsYRR0sbxD6SC43srdlyE3lQMXM=
X-Received: by 2002:a17:906:23e2:b0:9b9:b12c:133d with SMTP id
 j2-20020a17090623e200b009b9b12c133dmr18234410ejg.53.1697135817271; Thu, 12
 Oct 2023 11:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231012055444.564180-1-mac@mcrowe.com> <20231012055444.564180-2-mac@mcrowe.com>
In-Reply-To: <20231012055444.564180-2-mac@mcrowe.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 12 Oct 2023 08:36:46 -1000
Message-ID: <CAOSpxdb=D2-FyL5fFWFUmM-Zi5+MO7rnDCQ4n_GuGOhr98umhA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 2/2] curl: Backport fix for CVE-2023-38546
To: mac@mcrowe.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 18:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189020

On Wed, Oct 11, 2023 at 7:55=E2=80=AFPM Mike Crowe via lists.openembedded.o=
rg
<mac=3Dmcrowe.com@lists.openembedded.org> wrote:
>
> From: Mike Crowe <mac@mcrowe.com>
>
> Take patch from Debian 7.64.0-4+deb10u7.
>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  .../curl/curl/CVE-2023-38546.patch            | 131 ++++++++++++++++++
>  meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
>  2 files changed, 132 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38546.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-38546.patch b/meta/r=
ecipes-support/curl/curl/CVE-2023-38546.patch
> new file mode 100644
> index 0000000000..21887d58a3
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-38546.patch
> @@ -0,0 +1,131 @@
> +From 7b67721f12cbe6ed1a41e7332f3b5a7186a5e23f Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Thu, 14 Sep 2023 23:28:32 +0200
> +Subject: [PATCH] cookie: remove unnecessary struct fields
> +To: libcurl development <curl-library@cool.haxx.se>
> +
> +Plus: reduce the hash table size from 256 to 63. It seems unlikely to
> +make much of a speed difference for most use cases but saves 1.5KB of
> +data per instance.
> +
> +Closes #11862
> +
> +This patch taken from Debian's 7.64.0-4+deb10u7 package which applied wi=
th
> +only a little fuzz.
> +
> +CVE: CVE-2023-38546
> +Upstream-Status: Backport [61275672b46d9abb32857404]

Missing Signed-off-by:

Please submit a V2

Thanks!

Steve

> +---
> + lib/cookie.c | 13 +------------
> + lib/cookie.h |  7 ++-----
> + lib/easy.c   |  4 +---
> + 3 files changed, 4 insertions(+), 20 deletions(-)
> +
> +diff --git a/lib/cookie.c b/lib/cookie.c
> +index 68054e1c4..a378f28e1 100644
> +--- a/lib/cookie.c
> ++++ b/lib/cookie.c
> +@@ -114,7 +114,6 @@ static void freecookie(struct Cookie *co)
> +   free(co->name);
> +   free(co->value);
> +   free(co->maxage);
> +-  free(co->version);
> +   free(co);
> + }
> +
> +@@ -641,11 +640,7 @@ Curl_cookie_add(struct Curl_easy *data,
> +           }
> +         }
> +         else if(strcasecompare("version", name)) {
> +-          strstore(&co->version, whatptr);
> +-          if(!co->version) {
> +-            badcookie =3D TRUE;
> +-            break;
> +-          }
> ++          /* just ignore */
> +         }
> +         else if(strcasecompare("max-age", name)) {
> +           /* Defined in RFC2109:
> +@@ -1042,7 +1037,6 @@ Curl_cookie_add(struct Curl_easy *data,
> +         free(clist->path);
> +         free(clist->spath);
> +         free(clist->expirestr);
> +-        free(clist->version);
> +         free(clist->maxage);
> +
> +         *clist =3D *co;  /* then store all the new data */
> +@@ -1111,9 +1105,6 @@ struct CookieInfo *Curl_cookie_init(struct Curl_ea=
sy *data,
> +     c =3D calloc(1, sizeof(struct CookieInfo));
> +     if(!c)
> +       return NULL; /* failed to get memory */
> +-    c->filename =3D strdup(file?file:"none"); /* copy the name just in =
case */
> +-    if(!c->filename)
> +-      goto fail; /* failed to get memory */
> +   }
> +   else {
> +     /* we got an already existing one, use that */
> +@@ -1241,7 +1232,6 @@ static struct Cookie *dup_cookie(struct Cookie *sr=
c)
> +     CLONE(name);
> +     CLONE(value);
> +     CLONE(maxage);
> +-    CLONE(version);
> +     d->expires =3D src->expires;
> +     d->tailmatch =3D src->tailmatch;
> +     d->secure =3D src->secure;
> +@@ -1457,7 +1447,6 @@ void Curl_cookie_cleanup(struct CookieInfo *c)
> + {
> +   if(c) {
> +     unsigned int i;
> +-    free(c->filename);
> +     for(i =3D 0; i < COOKIE_HASH_SIZE; i++)
> +       Curl_cookie_freelist(c->cookies[i]);
> +     free(c); /* free the base struct as well */
> +diff --git a/lib/cookie.h b/lib/cookie.h
> +index b3865e601..2e667cda0 100644
> +--- a/lib/cookie.h
> ++++ b/lib/cookie.h
> +@@ -36,8 +36,6 @@ struct Cookie {
> +   char *expirestr;   /* the plain text version */
> +   bool tailmatch;    /* whether we do tail-matching of the domain name =
*/
> +
> +-  /* RFC 2109 keywords. Version=3D1 means 2109-compliant cookie sending=
 */
> +-  char *version;     /* Version =3D <value> */
> +   char *maxage;      /* Max-Age =3D <value> */
> +
> +   bool secure;       /* whether the 'secure' keyword was used */
> +@@ -54,15 +52,14 @@ struct Cookie {
> + #define COOKIE_PREFIX__SECURE (1<<0)
> + #define COOKIE_PREFIX__HOST (1<<1)
> +
> +-#define COOKIE_HASH_SIZE 256
> ++#define COOKIE_HASH_SIZE 63
> +
> + struct CookieInfo {
> +   /* linked list of cookies we know of */
> +   struct Cookie *cookies[COOKIE_HASH_SIZE];
> +
> +-  char *filename;  /* file we read from/write to */
> +   bool running;    /* state info, for cookie adding information */
> +-  long numcookies; /* number of cookies in the "jar" */
> ++  int numcookies;  /* number of cookies in the "jar" */
> +   bool newsession; /* new session, discard session cookies on load */
> +   int lastct;      /* last creation-time used in the jar */
> + };
> +diff --git a/lib/easy.c b/lib/easy.c
> +index b648e80c1..cdca0fb03 100644
> +--- a/lib/easy.c
> ++++ b/lib/easy.c
> +@@ -840,9 +840,7 @@ struct Curl_easy *curl_easy_duphandle(struct Curl_ea=
sy *data)
> +   if(data->cookies) {
> +     /* If cookies are enabled in the parent handle, we enable them
> +        in the clone as well! */
> +-    outcurl->cookies =3D Curl_cookie_init(data,
> +-                                        data->cookies->filename,
> +-                                        outcurl->cookies,
> ++    outcurl->cookies =3D Curl_cookie_init(data, NULL, outcurl->cookies,
> +                                         data->set.cookiesession);
> +     if(!outcurl->cookies)
> +       goto fail;
> +--
> +2.39.2
> +
> diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-supp=
ort/curl/curl_7.69.1.bb
> index 4012776613..0141b780ee 100644
> --- a/meta/recipes-support/curl/curl_7.69.1.bb
> +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> @@ -54,6 +54,7 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.t=
ar.bz2 \
>             file://CVE-2023-28320-fol1.patch \
>             file://CVE-2023-32001.patch \
>             file://CVE-2023-38545.patch \
> +           file://CVE-2023-38546.patch \
>  "
>
>  SRC_URI[md5sum] =3D "ec5fc263f898a3dfef08e805f1ecca42"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188977): https://lists.openembedded.org/g/openembedde=
d-core/message/188977
> Mute This Topic: https://lists.openembedded.org/mt/101913150/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

