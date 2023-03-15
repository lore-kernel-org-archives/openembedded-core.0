Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C16DC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 16:14:34 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.371.1678896863859881628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 09:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4g4XdkUy;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.48, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f48.google.com with SMTP id x3so77549291edb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 09:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678896862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PppQvdMX2xHDbVGbWo3knKtdi10y06mcaASZWPEVeVA=;
        b=4g4XdkUyuOCfCFvn9kxBgkB/c2yEzhJ/hI8OMWhH5kQUIm/UIBjwE5KaCY/pCwCImt
         Pq5bVcWhrr+koyBsPnBp2q/laV2ZX22awAVjcJNELDYDiKkn841klK6yfjkFXi8sF6J0
         slAqbjiQRDyf7udOvuryC/S6wy7QONiQb5lZhbOpLvjrAbtiYNBVma914SQd2X9iUPXS
         gNg0tiufnYXdUNI2u8gKaryu1OyD3uBPJN6NW0Of2DguGtpwK2LW1FTBX68+6R+oP63r
         t8sRkV+1lyMCgwXQ1rTVa6LKAgSOTgY0l52xGYKdcjOq9uwYRV771G8yCHQB+hHv9t73
         1Qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PppQvdMX2xHDbVGbWo3knKtdi10y06mcaASZWPEVeVA=;
        b=ueLBtnueGtpuuVQmwkOXsk4NOHl/Hvjw+VrLGVDyxx46xFShhMMuQBh7sWuuMvwyoL
         W2NWQFQdHDeSdIrmxMyUQ9G4eYCibkyDKiboXDXd7iHimAiRPzExGLD4AQrfscpwj/tl
         eyob5oIh5se6p7zBRYXfR9DWHY/JPrMRvlab24g0iGE42EGIXSsDJGvvm4N/FhEezmqT
         0MLJEHzZYBkm7n447zHB0T6u8YeZK0spovh1tK6tD1E+aNC8zX+gmTJz/qKzAld6i5+h
         VK9q7BGrMg6OkB4ddRZuUaQEvSCl3dD9LfcRLm09b1h7AsvS/3OOGQBAks9XwoooVmW4
         44RA==
X-Gm-Message-State: AO0yUKWw2l86XwT0ssMAqnymZW6cTh73t/91cqpYgrqikVJLJnmD+ZLm
	BcqkP2t8xha8QqvvjtyFwFji7OieZ+/gw9ujwBZ0WA==
X-Google-Smtp-Source: AK7set/PXvfO/IK+a3T+nWOJyK9Wpm3JsDo/BfKzegZVj14aC9Q6VZzzi35ITS9xwPGd/vABKmvzut0rztdJz/q2l+0=
X-Received: by 2002:a50:cd91:0:b0:4fc:a484:c6ed with SMTP id
 p17-20020a50cd91000000b004fca484c6edmr1771896edi.2.1678896862088; Wed, 15 Mar
 2023 09:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdZFb_ZnaDoRnt1qH5akhPusg6u2GuYJN9SZ6QA-Dysbaw@mail.gmail.com>
 <20230315030621.2248394-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20230315030621.2248394-1-mingli.yu@eng.windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 15 Mar 2023 06:14:11 -1000
Message-ID: <CAOSpxdZtA=O7zjaOs+_5-+KHdWKjaRjn_ggoVRtrjOVy-MCFgw@mail.gmail.com>
Subject: Re: [kirkstone][PATCH v2] curl: Add fix for CVE-2023-23914, CVE-2023-23915
To: mingli.yu@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org, badganchipv@gmail.com, 
	Pawan.Badganchi@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 16:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178650

On Tue, Mar 14, 2023 at 5:06=E2=80=AFPM <mingli.yu@eng.windriver.com> wrote=
:
>
> From: Pawan Badganchi <badganchipv@gmail.com>
>
> Add below patches to fix CVE-2023-23914 [1], CVE-2023-23915 [2]
>
> CVE-2023-23914_5-1.patch
> CVE-2023-23914_5-2.patch
> CVE-2023-23914_5-3.patch
> CVE-2023-23914_5-4.patch
> CVE-2023-23914_5-5.patch
>
> [1] https://curl.se/docs/CVE-2023-23914.html
> [2] https://curl.se/docs/CVE-2023-23915.html
>
> Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> Signed-off-by: pawan <badganchipv@gmail.com>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../curl/curl/CVE-2023-23914_5-1.patch        | 305 ++++++++++++++++++
>  .../curl/curl/CVE-2023-23914_5-2.patch        |  23 ++
>  .../curl/curl/CVE-2023-23914_5-3.patch        |  45 +++
>  .../curl/curl/CVE-2023-23914_5-4.patch        |  48 +++
>  .../curl/curl/CVE-2023-23914_5-5.patch        | 118 +++++++
>  meta/recipes-support/curl/curl_7.82.0.bb      |   5 +
>  6 files changed, 544 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-1.pat=
ch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-2.pat=
ch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-3.pat=
ch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-4.pat=
ch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-5.pat=
ch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-23914_5-1.patch b/me=
ta/recipes-support/curl/curl/CVE-2023-23914_5-1.patch
> new file mode 100644
> index 0000000000..94a2264a9f
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-23914_5-1.patch
> @@ -0,0 +1,305 @@
> +From 076a2f629119222aeeb50f5a03bf9f9052fabb9a Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Tue, 27 Dec 2022 11:50:20 +0100
> +Subject: [PATCH] share: add sharing of HSTS cache among handles
> +
> +Closes #10138
> +
> +CVE: CVE-2023-23914 CVE-2023-23915
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/076a2f629=
119222aeeb50f5a03bf9f9052fabb9a]
> +Comment: Refreshed hunk from hsts.c and urldata.h
> +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + docs/libcurl/opts/CURLSHOPT_SHARE.3 |  4 +++
> + docs/libcurl/symbols-in-versions    |  1 +
> + include/curl/curl.h                 |  1 +
> + lib/hsts.c                          | 15 +++++++++
> + lib/hsts.h                          |  2 ++
> + lib/setopt.c                        | 48 ++++++++++++++++++++++++-----
> + lib/share.c                         | 32 +++++++++++++++++--
> + lib/share.h                         |  6 +++-
> + lib/transfer.c                      |  3 ++
> + lib/url.c                           |  6 +++-
> + lib/urldata.h                       |  2 ++
> + 11 files changed, 109 insertions(+), 11 deletions(-)
> +
> +--- a/docs/libcurl/opts/CURLSHOPT_SHARE.3
> ++++ b/docs/libcurl/opts/CURLSHOPT_SHARE.3
> +@@ -79,6 +79,10 @@ Added in 7.61.0.
> +
> + Note that when you use the multi interface, all easy handles added to t=
he same
> + multi handle will share PSL cache by default without using this option.
> ++.IP CURL_LOCK_DATA_HSTS
> ++The in-memory HSTS cache.
> ++
> ++Added in 7.88.0
> + .SH PROTOCOLS
> + All
> + .SH EXAMPLE
> +--- a/docs/libcurl/symbols-in-versions
> ++++ b/docs/libcurl/symbols-in-versions
> +@@ -73,6 +73,7 @@ CURL_LOCK_ACCESS_SINGLE         7.10.3
> + CURL_LOCK_DATA_CONNECT          7.10.3
> + CURL_LOCK_DATA_COOKIE           7.10.3
> + CURL_LOCK_DATA_DNS              7.10.3
> ++CURL_LOCK_DATA_HSTS             7.88.0
> + CURL_LOCK_DATA_NONE             7.10.3
> + CURL_LOCK_DATA_PSL              7.61.0
> + CURL_LOCK_DATA_SHARE            7.10.4

Thanks for reworking this patch with links to the upstream commits!

However the above changes to curl docs seems to be triggering
reproducibility errors in the docs package:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230313-ef21ej=
rc/packages/diff-html/

This may be an issue that has been lurking un-noticed, but just
finally triggered by this change.

However it also does raise the issue of whether we should be patching
the docs for 7.82 with text claiming "Added in 7.88.0"

Thoughts?

Steve

> +--- a/include/curl/curl.h
> ++++ b/include/curl/curl.h
> +@@ -2953,6 +2953,7 @@ typedef enum {
> +   CURL_LOCK_DATA_SSL_SESSION,
> +   CURL_LOCK_DATA_CONNECT,
> +   CURL_LOCK_DATA_PSL,
> ++  CURL_LOCK_DATA_HSTS,
> +   CURL_LOCK_DATA_LAST
> + } curl_lock_data;
> +
> +--- a/lib/hsts.c
> ++++ b/lib/hsts.c
> +@@ -37,6 +37,7 @@
> + #include "parsedate.h"
> + #include "rand.h"
> + #include "rename.h"
> ++#include "share.h"
> + #include "strtoofft.h"
> +
> + /* The last 3 #include files should be in this order */
> +@@ -561,4 +562,18 @@
> +   return CURLE_OK;
> + }
> +
> ++void Curl_hsts_loadfiles(struct Curl_easy *data)
> ++{
> ++  struct curl_slist *l =3D data->set.hstslist;
> ++  if(l) {
> ++    Curl_share_lock(data, CURL_LOCK_DATA_HSTS, CURL_LOCK_ACCESS_SINGLE)=
;
> ++
> ++    while(l) {
> ++      (void)Curl_hsts_loadfile(data, data->hsts, l->data);
> ++      l =3D l->next;
> ++    }
> ++    Curl_share_unlock(data, CURL_LOCK_DATA_HSTS);
> ++  }
> ++}
> ++
> + #endif /* CURL_DISABLE_HTTP || CURL_DISABLE_HSTS */
> +--- a/lib/hsts.h
> ++++ b/lib/hsts.h
> +@@ -59,9 +59,11 @@ CURLcode Curl_hsts_loadfile(struct Curl_
> +                             struct hsts *h, const char *file);
> + CURLcode Curl_hsts_loadcb(struct Curl_easy *data,
> +                           struct hsts *h);
> ++void Curl_hsts_loadfiles(struct Curl_easy *data);
> + #else
> + #define Curl_hsts_cleanup(x)
> + #define Curl_hsts_loadcb(x,y) CURLE_OK
> + #define Curl_hsts_save(x,y,z)
> ++#define Curl_hsts_loadfiles(x)
> + #endif /* CURL_DISABLE_HTTP || CURL_DISABLE_HSTS */
> + #endif /* HEADER_CURL_HSTS_H */
> +--- a/lib/setopt.c
> ++++ b/lib/setopt.c
> +@@ -2260,9 +2260,14 @@ CURLcode Curl_vsetopt(struct Curl_easy *
> +         data->cookies =3D NULL;
> + #endif
> +
> ++#ifndef CURL_DISABLE_HSTS
> ++      if(data->share->hsts =3D=3D data->hsts)
> ++        data->hsts =3D NULL;
> ++#endif
> ++#ifdef USE_SSL
> +       if(data->share->sslsession =3D=3D data->state.session)
> +         data->state.session =3D NULL;
> +-
> ++#endif
> + #ifdef USE_LIBPSL
> +       if(data->psl =3D=3D &data->share->psl)
> +         data->psl =3D data->multi? &data->multi->psl: NULL;
> +@@ -2296,10 +2301,19 @@ CURLcode Curl_vsetopt(struct Curl_easy *
> +         data->cookies =3D data->share->cookies;
> +       }
> + #endif   /* CURL_DISABLE_HTTP */
> ++#ifndef CURL_DISABLE_HSTS
> ++      if(data->share->hsts) {
> ++        /* first free the private one if any */
> ++        Curl_hsts_cleanup(&data->hsts);
> ++        data->hsts =3D data->share->hsts;
> ++      }
> ++#endif   /* CURL_DISABLE_HTTP */
> ++#ifdef USE_SSL
> +       if(data->share->sslsession) {
> +         data->set.general_ssl.max_ssl_sessions =3D data->share->max_ssl=
_sessions;
> +         data->state.session =3D data->share->sslsession;
> +       }
> ++#endif
> + #ifdef USE_LIBPSL
> +       if(data->share->specifier & (1 << CURL_LOCK_DATA_PSL))
> +         data->psl =3D &data->share->psl;
> +@@ -3049,19 +3063,39 @@ CURLcode Curl_vsetopt(struct Curl_easy *
> +   case CURLOPT_HSTSWRITEDATA:
> +     data->set.hsts_write_userp =3D va_arg(param, void *);
> +     break;
> +-  case CURLOPT_HSTS:
> ++  case CURLOPT_HSTS: {
> ++    struct curl_slist *h;
> +     if(!data->hsts) {
> +       data->hsts =3D Curl_hsts_init();
> +       if(!data->hsts)
> +         return CURLE_OUT_OF_MEMORY;
> +     }
> +     argptr =3D va_arg(param, char *);
> +-    result =3D Curl_setstropt(&data->set.str[STRING_HSTS], argptr);
> +-    if(result)
> +-      return result;
> +-    if(argptr)
> +-      (void)Curl_hsts_loadfile(data, data->hsts, argptr);
> ++    if(argptr) {
> ++      result =3D Curl_setstropt(&data->set.str[STRING_HSTS], argptr);
> ++      if(result)
> ++        return result;
> ++      /* this needs to build a list of file names to read from, so that=
 it can
> ++         read them later, as we might get a shared HSTS handle to load =
them
> ++         into */
> ++      h =3D curl_slist_append(data->set.hstslist, argptr);
> ++      if(!h) {
> ++        curl_slist_free_all(data->set.hstslist);
> ++        data->set.hstslist =3D NULL;
> ++        return CURLE_OUT_OF_MEMORY;
> ++      }
> ++      data->set.hstslist =3D h; /* store the list for later use */
> ++    }
> ++    else {
> ++      /* clear the list of HSTS files */
> ++      curl_slist_free_all(data->set.hstslist);
> ++      data->set.hstslist =3D NULL;
> ++      if(!data->share || !data->share->hsts)
> ++        /* throw away the HSTS cache unless shared */
> ++        Curl_hsts_cleanup(&data->hsts);
> ++    }
> +     break;
> ++  }
> +   case CURLOPT_HSTS_CTRL:
> +     arg =3D va_arg(param, long);
> +     if(arg & CURLHSTS_ENABLE) {
> +--- a/lib/share.c
> ++++ b/lib/share.c
> +@@ -29,9 +29,11 @@
> + #include "share.h"
> + #include "psl.h"
> + #include "vtls/vtls.h"
> +-#include "curl_memory.h"
> ++#include "hsts.h"
> +
> +-/* The last #include file should be: */
> ++/* The last 3 #include files should be in this order */
> ++#include "curl_printf.h"
> ++#include "curl_memory.h"
> + #include "memdebug.h"
> +
> + struct Curl_share *
> +@@ -89,6 +91,18 @@ curl_share_setopt(struct Curl_share *sha
> + #endif
> +       break;
> +
> ++    case CURL_LOCK_DATA_HSTS:
> ++#ifndef CURL_DISABLE_HSTS
> ++      if(!share->hsts) {
> ++        share->hsts =3D Curl_hsts_init();
> ++        if(!share->hsts)
> ++          res =3D CURLSHE_NOMEM;
> ++      }
> ++#else   /* CURL_DISABLE_HSTS */
> ++      res =3D CURLSHE_NOT_BUILT_IN;
> ++#endif
> ++      break;
> ++
> +     case CURL_LOCK_DATA_SSL_SESSION:
> + #ifdef USE_SSL
> +       if(!share->sslsession) {
> +@@ -141,6 +155,16 @@ curl_share_setopt(struct Curl_share *sha
> + #endif
> +       break;
> +
> ++    case CURL_LOCK_DATA_HSTS:
> ++#ifndef CURL_DISABLE_HSTS
> ++      if(share->hsts) {
> ++        Curl_hsts_cleanup(&share->hsts);
> ++      }
> ++#else   /* CURL_DISABLE_HSTS */
> ++      res =3D CURLSHE_NOT_BUILT_IN;
> ++#endif
> ++      break;
> ++
> +     case CURL_LOCK_DATA_SSL_SESSION:
> + #ifdef USE_SSL
> +       Curl_safefree(share->sslsession);
> +@@ -207,6 +231,10 @@ curl_share_cleanup(struct Curl_share *sh
> +   Curl_cookie_cleanup(share->cookies);
> + #endif
> +
> ++#ifndef CURL_DISABLE_HSTS
> ++  Curl_hsts_cleanup(&share->hsts);
> ++#endif
> ++
> + #ifdef USE_SSL
> +   if(share->sslsession) {
> +     size_t i;
> +--- a/lib/share.h
> ++++ b/lib/share.h
> +@@ -59,10 +59,14 @@ struct Curl_share {
> + #ifdef USE_LIBPSL
> +   struct PslCache psl;
> + #endif
> +-
> ++#ifndef CURL_DISABLE_HSTS
> ++  struct hsts *hsts;
> ++#endif
> ++#ifdef USE_SSL
> +   struct Curl_ssl_session *sslsession;
> +   size_t max_ssl_sessions;
> +   long sessionage;
> ++#endif
> + };
> +
> + CURLSHcode Curl_share_lock(struct Curl_easy *, curl_lock_data,
> +--- a/lib/transfer.c
> ++++ b/lib/transfer.c
> +@@ -1398,6 +1398,9 @@ CURLcode Curl_pretransfer(struct Curl_ea
> +   if(data->state.resolve)
> +     result =3D Curl_loadhostpairs(data);
> +
> ++  /* If there is a list of hsts files to read */
> ++  Curl_hsts_loadfiles(data);
> ++
> +   if(!result) {
> +     /* Allow data->set.use_port to set which port to use. This needs to=
 be
> +      * disabled for example when we follow Location: headers to URLs us=
ing
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -434,7 +434,11 @@ CURLcode Curl_close(struct Curl_easy **d
> +   Curl_altsvc_save(data, data->asi, data->set.str[STRING_ALTSVC]);
> +   Curl_altsvc_cleanup(&data->asi);
> +   Curl_hsts_save(data, data->hsts, data->set.str[STRING_HSTS]);
> +-  Curl_hsts_cleanup(&data->hsts);
> ++#ifndef CURL_DISABLE_HSTS
> ++  if(!data->share || !data->share->hsts)
> ++    Curl_hsts_cleanup(&data->hsts);
> ++  curl_slist_free_all(data->set.hstslist); /* clean up list */
> ++#endif
> + #if !defined(CURL_DISABLE_HTTP) && !defined(CURL_DISABLE_CRYPTO_AUTH)
> +   Curl_http_auth_cleanup_digest(data);
> + #endif
> +--- a/lib/urldata.h
> ++++ b/lib/urldata.h
> +@@ -1670,6 +1670,8 @@
> +
> +   void *seek_client;    /* pointer to pass to the seek callback */
> + #ifndef CURL_DISABLE_HSTS
> ++  struct curl_slist *hstslist; /* list of HSTS files set by
> ++                                  curl_easy_setopt(HSTS) calls */
> +   curl_hstsread_callback hsts_read;
> +   void *hsts_read_userp;
> +   curl_hstswrite_callback hsts_write;
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-23914_5-2.patch b/me=
ta/recipes-support/curl/curl/CVE-2023-23914_5-2.patch
> new file mode 100644
> index 0000000000..668972cb3f
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-23914_5-2.patch
> @@ -0,0 +1,23 @@
> +From 0bf8b796a0ea98395b390c7807187982215f5c11 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Tue, 27 Dec 2022 11:50:23 +0100
> +Subject: [PATCH] tool_operate: share HSTS between handles
> +
> +CVE: CVE-2023-23914 CVE-2023-23915
> +Upstream-Status: Backport [https://github.com/curl/curl/pull/10138/commi=
ts/ca17cfed2df001356cfe2841f166569bac0f5e8c]
> +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + src/tool_operate.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +--- a/src/tool_operate.c
> ++++ b/src/tool_operate.c
> +@@ -2722,6 +2722,7 @@ CURLcode operate(struct GlobalConfig *gl
> +         curl_share_setopt(share, CURLSHOPT_SHARE, CURL_LOCK_DATA_SSL_SE=
SSION);
> +         curl_share_setopt(share, CURLSHOPT_SHARE, CURL_LOCK_DATA_CONNEC=
T);
> +         curl_share_setopt(share, CURLSHOPT_SHARE, CURL_LOCK_DATA_PSL);
> ++        curl_share_setopt(share, CURLSHOPT_SHARE, CURL_LOCK_DATA_HSTS);
> +
> +         /* Get the required arguments for each operation */
> +         do {
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-23914_5-3.patch b/me=
ta/recipes-support/curl/curl/CVE-2023-23914_5-3.patch
> new file mode 100644
> index 0000000000..4422b26834
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-23914_5-3.patch
> @@ -0,0 +1,45 @@
> +From ca02a77f05bd5cef20618c8f741aa48b7be0a648 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Tue, 27 Dec 2022 11:50:23 +0100
> +Subject: [PATCH] hsts: handle adding the same host name again
> +
> +It will then use the largest expire time of the two entries.
> +
> +CVE: CVE-2023-23914 CVE-2023-23915
> +Upstream-Status: Backport [https://github.com/curl/curl/pull/10138/commi=
ts/e077b30a42272d964d76e5b815a0af7dc65d8360]
> +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + lib/hsts.c | 13 +++++++++++--
> + 1 file changed, 11 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/hsts.c b/lib/hsts.c
> +index 339237be1c621..8d6723ee587d2 100644
> +--- a/lib/hsts.c
> ++++ b/lib/hsts.c
> +@@ -426,14 +426,23 @@ static CURLcode hsts_add(struct hsts *h, char *lin=
e)
> +   if(2 =3D=3D rc) {
> +     time_t expires =3D strcmp(date, UNLIMITED) ? Curl_getdate_capped(da=
te) :
> +       TIME_T_MAX;
> +-    CURLcode result;
> ++    CURLcode result =3D CURLE_OK;
> +     char *p =3D host;
> +     bool subdomain =3D FALSE;
> ++    struct stsentry *e;
> +     if(p[0] =3D=3D '.') {
> +       p++;
> +       subdomain =3D TRUE;
> +     }
> +-    result =3D hsts_create(h, p, subdomain, expires);
> ++    /* only add it if not already present */
> ++    e =3D Curl_hsts(h, p, subdomain);
> ++    if(!e)
> ++      result =3D hsts_create(h, p, subdomain, expires);
> ++    else {
> ++      /* the same host name, use the largest expire time */
> ++      if(expires > e->expires)
> ++        e->expires =3D expires;
> ++    }
> +     if(result)
> +       return result;
> +   }
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-23914_5-4.patch b/me=
ta/recipes-support/curl/curl/CVE-2023-23914_5-4.patch
> new file mode 100644
> index 0000000000..865b3f93a5
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-23914_5-4.patch
> @@ -0,0 +1,48 @@
> +From dc0725244a3163f1e2d5f51165db3a1a430f3ba0 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Tue, 27 Dec 2022 11:50:23 +0100
> +Subject: [PATCH] runtests: support crlf=3D"yes" for verify/proxy
> +
> +CVE: CVE-2023-23914 CVE-2023-23915
> +Upstream-Status: Backport [https://github.com/curl/curl/pull/10138/commi=
ts/fd7e1a557e414dd803c9225e37a2ca84e1df2269]
> +Comment: Refreshed hunk from FILEFORMAT.md
> +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + tests/FILEFORMAT.md | 4 ++--
> + tests/runtests.pl   | 5 +++++
> + 2 files changed, 7 insertions(+), 2 deletions(-)
> +
> +--- a/tests/FILEFORMAT.md
> ++++ b/tests/FILEFORMAT.md
> +@@ -540,14 +540,14 @@
> + One perl op per line that operates on the protocol dump. This is pretty
> + advanced. Example: `s/^EPRT .*/EPRT stripped/`.
> +
> +-### `<protocol [nonewline=3D"yes"]>`
> ++### `<protocol [nonewline=3D"yes"][crlf=3D"yes"]>`
> +
> + the protocol dump curl should transmit, if 'nonewline' is set, we will =
cut off
> + the trailing newline of this given data before comparing with the one a=
ctually
> + sent by the client The `<strip>` and `<strippart>` rules are applied be=
fore
> + comparisons are made.
> +
> +-### `<proxy [nonewline=3D"yes"]>`
> ++### `<proxy [nonewline=3D"yes"][crlf=3D"yes"]>`
> +
> + The protocol dump curl should transmit to a HTTP proxy (when the http-p=
roxy
> + server is used), if 'nonewline' is set, we will cut off the trailing ne=
wline
> +--- a/tests/runtests.pl
> ++++ b/tests/runtests.pl
> +@@ -4744,6 +4744,11 @@ sub singletest {
> +             }
> +         }
> +
> ++        if($hash{'crlf'} ||
> ++           ($has_hyper && ($keywords{"HTTP"} || $keywords{"HTTPS"}))) {
> ++            map subNewlines(0, \$_), @protstrip;
> ++        }
> ++
> +         $res =3D compare($testnum, $testname, "proxy", \@out, \@protstr=
ip);
> +         if($res) {
> +             return $errorreturncode;
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-23914_5-5.patch b/me=
ta/recipes-support/curl/curl/CVE-2023-23914_5-5.patch
> new file mode 100644
> index 0000000000..1a363f0b4b
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-23914_5-5.patch
> @@ -0,0 +1,118 @@
> +From ea5aaaa5ede53819f8bc7ae767fc2d13d3704d37 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Tue, 27 Dec 2022 11:50:23 +0100
> +Subject: [PATCH] test446: verify hsts with two URLs
> +
> +CVE: CVE-2023-23914 CVE-2023-23915
> +Upstream-Status: Backport [https://github.com/curl/curl/pull/10138/commi=
ts/7e89dfd463597701dd1defcad7be54f7d3c9d55d]
> +Comment: Refreshed hunk from Makefile.inc
> +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + tests/data/Makefile.inc |  2 +-
> + tests/data/test446      | 84 +++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 85 insertions(+), 1 deletion(-)
> + create mode 100644 tests/data/test446
> +
> +diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
> +index 3a6356bd122bc..fe1bb1c74c2ab 100644
> +--- a/tests/data/Makefile.inc
> ++++ b/tests/data/Makefile.inc
> +@@ -72,6 +72,7 @@
> + \
> + test430 test431 test432 test433 test434 test435 test436 \
> + \
> ++test446 \
> + test490 test491 test492 test493 test494 \
> + \
> + test500 test501 test502 test503 test504 test505 test506 test507 test508=
 \
> +diff --git a/tests/data/test446 b/tests/data/test446
> +new file mode 100644
> +index 0000000000000..0e2dfdcfe33b6
> +--- /dev/null
> ++++ b/tests/data/test446
> +@@ -0,0 +1,84 @@
> ++<?xml version=3D"1.0" encoding=3D"ISO-8859-1"?>
> ++<testcase>
> ++<info>
> ++<keywords>
> ++HTTP
> ++HTTP proxy
> ++HSTS
> ++trailing-dot
> ++</keywords>
> ++</info>
> ++
> ++<reply>
> ++
> ++# we use this as response to a CONNECT
> ++<connect nocheck=3D"yes">
> ++HTTP/1.1 200 OK
> ++
> ++</connect>
> ++<data crlf=3D"yes">
> ++HTTP/1.1 200 OK
> ++Content-Length: 6
> ++Strict-Transport-Security: max-age=3D604800
> ++
> ++-foo-
> ++</data>
> ++<data2 crlf=3D"yes">
> ++HTTP/1.1 200 OK
> ++Content-Length: 6
> ++Strict-Transport-Security: max-age=3D6048000
> ++
> ++-baa-
> ++</data2>
> ++</reply>
> ++
> ++<client>
> ++<server>
> ++https
> ++http-proxy
> ++</server>
> ++<features>
> ++HSTS
> ++proxy
> ++https
> ++debug
> ++</features>
> ++<setenv>
> ++CURL_HSTS_HTTP=3Dyes
> ++CURL_TIME=3D2000000000
> ++</setenv>
> ++
> ++<name>
> ++HSTS with two URLs
> ++</name>
> ++<command>
> ++-x http://%HOSTIP:%PROXYPORT --hsts log/hsts%TESTNUMBER http://this.hst=
s.example./%TESTNUMBER http://another.example.com/%TESTNUMBER0002
> ++</command>
> ++</client>
> ++
> ++<verify>
> ++# we let it CONNECT to the server to confirm HSTS but deny from there
> ++<proxy crlf=3D"yes">
> ++GET http://this.hsts.example./%TESTNUMBER HTTP/1.1
> ++Host: this.hsts.example.
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++GET http://another.example.com/%TESTNUMBER0002 HTTP/1.1
> ++Host: another.example.com
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++Proxy-Connection: Keep-Alive
> ++
> ++</proxy>
> ++
> ++<file name=3D"log/hsts%TESTNUMBER" mode=3D"text">
> ++# Your HSTS cache. https://curl.se/docs/hsts.html
> ++# This file was generated by libcurl! Edit at your own risk.
> ++this.hsts.example "20330525 03:33:20"
> ++another.example.com "20330727 03:33:20"
> ++</file>
> ++
> ++</verify>
> ++</testcase>
> diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-supp=
ort/curl/curl_7.82.0.bb
> index 13f157ead8..af3c4a6ce4 100644
> --- a/meta/recipes-support/curl/curl_7.82.0.bb
> +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> @@ -34,6 +34,11 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
>             file://CVE-2022-42915.patch \
>             file://CVE-2022-43551.patch \
>             file://CVE-2022-43552.patch \
> +           file://CVE-2023-23914_5-1.patch \
> +           file://CVE-2023-23914_5-2.patch \
> +           file://CVE-2023-23914_5-3.patch \
> +           file://CVE-2023-23914_5-4.patch \
> +           file://CVE-2023-23914_5-5.patch \
>             "
>  SRC_URI[sha256sum] =3D "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d=
3d690cdce58a583c"
>
> --
> 2.25.1
>

