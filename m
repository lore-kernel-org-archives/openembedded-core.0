Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C681FC43334
	for <webhook@archiver.kernel.org>; Sat,  9 Jul 2022 02:38:33 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.2687.1657334311676944428
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 19:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=c0fzzQpa;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.48,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f48.google.com with SMTP id eq6so501072edb.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 19:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kwy6nrxAQJuFVgkLMxnQLy5ljxcoKfQOLniPZYujG9s=;
        b=c0fzzQpaJC8ZSZqfHTC7U5QBXdJg+0fxscWqrCH97C8B49JcRXmEkjM0GkpcF2JP6v
         ab+BxrIIFIjsM+Me5U2roMpULzvw88OMB2PykXX+9ATBYh8ZOjol4cD9BQydMg0iUrtR
         UM24HTPpoXS+5eW+/hf8Z014KiqMXeYvWTpDQF9s2PuByDDP6Cevs7ObYSp+rQK0UEiI
         0zebFjsF1pOpUHcqGTjxfOjhDxt8NKhoUeoCb+MHyw5zZF0JrBbiX4pVeMjSNYBIQqZd
         AR1LZxLBI6OXvoMLCKfSoIex5vWV02g4ROe55Q0QzdcM9ySoaDMHUYxW174XLYLCmbRs
         VM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kwy6nrxAQJuFVgkLMxnQLy5ljxcoKfQOLniPZYujG9s=;
        b=tRGReu5JLFIDLkaSBbj6JYauyAcUBemA7g6uYRp9cf6Iyrp53Ayu6Kyb/ElO9iYxvR
         l/u/0vcL1YzUYNMrRwmIGH95JxfqQVLHroUOgj4EcK3iD6OGlW65ahC9v/LuNt365LyY
         9s3isIH2fZPB5a/cpM281JnlWpOCSBTh36liX1RNKkuJCBr9OfmnFak8U9aGoIKZlXLh
         KuOPsWMynBsQaX09JihQgOgcn3VeR1gAjRqmmVPLbSHOcGdkLvtZ79TqwL4M2eROSUwn
         n07oFAJZSeDM8qRBH7IDL0b8Yv5cg4FwmVTOl/0f3cHjbKmqNa8ONr2FJk1ojGvUZB0A
         UPnw==
X-Gm-Message-State: AJIora+oqrPluTOvNC/+0EnDMnLnExFGjtj/+UsazWNTZsKPiovTfkAc
	hXmInSk35AaPCD2gGyK7RnBeFikcBvJZu+hROqkV4Q==
X-Google-Smtp-Source: 
 AGRyM1sVpoROB5ToAUuvAahHDWluS/kMRLpIUfg75mVYVxtbY3fGHiStOiBfApwIZudsNJoiZYyDzQxIx1Qk+3KNsyc=
X-Received: by 2002:a05:6402:448e:b0:43a:9d20:a4ec with SMTP id
 er14-20020a056402448e00b0043a9d20a4ecmr8920580edb.269.1657334309527; Fri, 08
 Jul 2022 19:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220708105146.20161-1-Sana.Kazi@kpit.com>
In-Reply-To: <20220708105146.20161-1-Sana.Kazi@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 8 Jul 2022 16:38:17 -1000
Message-ID: 
 <CAOSpxdYRR1XLpHgXfjinxA4yXKG5SLjVLV=fbnN=r2jz3t_pWQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] curl: Fix CVEs for curl
To: Sana.Kazi@kpit.com
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Jul 2022 02:38:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167835

On Fri, Jul 8, 2022 at 12:52 AM Sana Kazi via lists.openembedded.org
<Sana.Kazi=3Dkpit.com@lists.openembedded.org> wrote:
>
> Fix below listed CVEs for curl:
>
> 1.CVE-2022-32206
> Link: http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_7.81.0-1ubun=
tu1.3.debian.tar.xz
>
> 2.CVE-2022-32207
> Linkh: https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.=
74.0-1.3ubuntu2.3/curl_7.74.0-1.3ubuntu2.3.debian.tar.xz
>
> 3.CVE-2022-32208
> Link: https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.6=
8.0-1ubuntu2.12/curl_7.68.0-1ubuntu2.12.debian.tar.xz
>
> Signed-off-by: Sana.Kazi <Sana.Kazi@kpit.com>
> ---
>  .../curl/curl/CVE-2022-32206.patch            |  49 +++
>  .../curl/curl/CVE-2022-32207.patch            | 288 ++++++++++++++++++
>  .../curl/curl/CVE-2022-32208.patch            |  29 ++
>  meta/recipes-support/curl/curl_7.69.1.bb      |   3 +
>  4 files changed, 369 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32206.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32207.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32208.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2022-32206.patch b/meta/r=
ecipes-support/curl/curl/CVE-2022-32206.patch
> new file mode 100644
> index 0000000000..d3b015e435
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2022-32206.patch
> @@ -0,0 +1,49 @@
> +From 7035676c3daa4f1c3766095561f12e7a0e82c736 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 16 May 2022 16:28:13 +0200
> +Subject: [PATCH] content_encoding: return error on too many compression =
steps
> +
> +The max allowed steps is arbitrarily set to 5.
> +---
> + lib/content_encoding.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +CVE: CVE-2022-32206
> +Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/c/=
curl/curl_7.81.0-1ubuntu1.3.debian.tar.xz]
> +Comment: Refreshed hunks to fix patch fuzz
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +Index: curl-7.83.1/lib/content_encoding.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- curl-7.83.1.orig/lib/content_encoding.c
> ++++ curl-7.83.1/lib/content_encoding.c
> +@@ -934,6 +934,9 @@
> +   return NULL;
> + }
> +
> ++/* allow no more than 5 "chained" compression steps */
> ++#define MAX_ENCODE_STACK 5
> ++
> + /* Set-up the unencoding stack from the Content-Encoding header value.
> +  * See RFC 7231 section 3.1.2.2. */
> + CURLcode Curl_build_unencoding_stack(struct connectdata *conn,
> +@@ -941,6 +944,7 @@
> + {
> +   struct Curl_easy *data =3D conn->data;
> +   struct SingleRequest *k =3D &data->req;
> ++  int counter =3D 0;
> +
> +   do {
> +     const char *name;
> +@@ -975,6 +979,11 @@
> +       if(!encoding)
> +         encoding =3D &error_encoding;  /* Defer error at stack use. */
> +
> ++      if(++counter >=3D MAX_ENCODE_STACK) {
> ++        failf(data, "Reject response due to %u content encodings",
> ++              counter);
> ++        return CURLE_BAD_CONTENT_ENCODING;
> ++      }
> +       /* Stack the unencoding stage. */
> +       writer =3D new_unencoding_writer(conn, encoding, k->writer_stack)=
;
> +       if(!writer)
> diff --git a/meta/recipes-support/curl/curl/CVE-2022-32207.patch b/meta/r=
ecipes-support/curl/curl/CVE-2022-32207.patch
> new file mode 100644
> index 0000000000..8435dfaed0
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2022-32207.patch
> @@ -0,0 +1,288 @@
> +Backported of:
> +
> +From 3782dfda5fc4f45a19b1ce1b01ecf7206a3d304a Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Wed, 25 May 2022 10:09:53 +0200
> +Subject: [PATCH 1/3] fopen: add Curl_fopen() for better overwriting of f=
iles
> +
> +---
> + lib/Makefile.inc |   4 +-
> + lib/altsvc.c     |  22 +++-------
> + lib/cookie.c     |  16 ++-----
> + lib/fopen.c      | 106 +++++++++++++++++++++++++++++++++++++++++++++++
> + lib/fopen.h      |  28 +++++++++++++
> + 6 files changed, 152 insertions(+), 46 deletions(-)
> + create mode 100644 lib/fopen.c
> + create mode 100644 lib/fopen.h
> +
> +CVE: CVE-2022-32207
> +Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary=
/+sourcefiles/curl/7.74.0-1.3ubuntu2.3/curl_7.74.0-1.3ubuntu2.3.debian.tar.=
xz]
> +Comment: Removed hsts.c as it is not present in source code and refreshe=
d other hunks to fix the patch fuzz
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +diff --git a/lib/Makefile.inc b/lib/Makefile.inc
> +index 6d35704..7dac605 100644
> +--- a/lib/Makefile.inc
> ++++ b/lib/Makefile.inc
> +@@ -60,7 +60,7 @@
> +   openldap.c curl_gethostname.c gopher.c idn_win32.c                   =
 \
> +   http_proxy.c non-ascii.c asyn-ares.c asyn-thread.c curl_gssapi.c     =
 \
> +   http_ntlm.c curl_ntlm_wb.c curl_ntlm_core.c curl_sasl.c rand.c       =
 \
> +-  curl_multibyte.c hostcheck.c conncache.c dotdot.c                    =
 \
> ++  curl_multibyte.c hostcheck.c conncache.c dotdot.c fopen.c            =
        \
> +   x509asn1.c http2.c smb.c curl_endian.c curl_des.c system_win32.c     =
 \
> +   mime.c sha256.c setopt.c curl_path.c curl_ctype.c curl_range.c psl.c =
 \
> +   doh.c urlapi.c curl_get_line.c altsvc.c socketpair.c rename.c
> +@@ -79,7 +79,7 @@
> +   rtsp.h curl_threads.h warnless.h curl_hmac.h curl_rtmp.h             =
 \
> +   curl_gethostname.h gopher.h http_proxy.h non-ascii.h asyn.h          =
 \
> +   http_ntlm.h curl_gssapi.h curl_ntlm_wb.h curl_ntlm_core.h            =
 \
> +-  curl_sasl.h curl_multibyte.h hostcheck.h conncache.h                 =
 \
> ++  curl_sasl.h curl_multibyte.h hostcheck.h conncache.h fopen.h         =
 \
> +   curl_setup_once.h multihandle.h setup-vms.h dotdot.h                 =
 \
> +   x509asn1.h http2.h sigpipe.h smb.h curl_endian.h curl_des.h          =
 \
> +   curl_printf.h system_win32.h rand.h mime.h curl_sha256.h setopt.h    =
 \
> +diff --git a/lib/altsvc.c b/lib/altsvc.c
> +index 4ab77fd..97249b2 100644
> +--- a/lib/altsvc.c
> ++++ b/lib/altsvc.c
> +@@ -34,7 +34,7 @@
> + #include "parsedate.h"
> + #include "sendf.h"
> + #include "warnless.h"
> +-#include "rand.h"
> ++#include "fopen.h"
> + #include "rename.h"
> +
> + /* The last 3 #include files should be in this order */
> +@@ -326,8 +326,7 @@
> +   struct curl_llist_element *n;
> +   CURLcode result =3D CURLE_OK;
> +   FILE *out;
> +-  char *tempstore;
> +-  unsigned char randsuffix[9];
> ++  char *tempstore =3D NULL;
> +
> +   if(!altsvc)
> +     /* no cache activated */
> +@@ -341,16 +340,8 @@
> +     /* marked as read-only, no file or zero length file name */
> +     return CURLE_OK;
> +
> +-  if(Curl_rand_hex(data, randsuffix, sizeof(randsuffix)))
> +-    return CURLE_FAILED_INIT;
> +-
> +-  tempstore =3D aprintf("%s.%s.tmp", file, randsuffix);
> +-  if(!tempstore)
> +-    return CURLE_OUT_OF_MEMORY;
> +-
> +-  out =3D fopen(tempstore, FOPEN_WRITETEXT);
> +-  if(!out)
> +-    result =3D CURLE_WRITE_ERROR;
> ++  result =3D Curl_fopen(data, file, &out, &tempstore);
> ++  if(!result) {
> +   else {
> +     fputs("# Your alt-svc cache. https://curl.haxx.se/docs/alt-svc.html=
\n"
> +           "# This file was generated by libcurl! Edit at your own risk.=
\n",
> +@@ -366,10 +356,10 @@ CURLcode Curl_altsvc_save(struct Curl_easy *data,
> +         break;
> +     }
> +     fclose(out);
> +-    if(!result && Curl_rename(tempstore, file))
> ++    if(!result && tempstore && Curl_rename(tempstore, file))
> +       result =3D CURLE_WRITE_ERROR;
> +
> +-    if(result)
> ++    if(result && tempstore)
> +       unlink(tempstore);
> +   }
> +   free(tempstore);
> +diff --git a/lib/cookie.c b/lib/cookie.c
> +index 1d1bf9b..2dc6314 100644
> +--- a/lib/cookie.c
> ++++ b/lib/cookie.c
> +@@ -99,6 +99,7 @@ Example set of cookies:
> + #include "parsedate.h"
> + #include "rand.h"
> + #include "rename.h"
> ++#include "fopen.h"
> +
> + /* The last 3 #include files should be in this order */
> + #include "curl_printf.h"
> +@@ -1524,17 +1524,8 @@
> +     use_stdout =3D TRUE;
> +   }
> +   else {
> +-    unsigned char randsuffix[9];
> +-
> +-    if(Curl_rand_hex(data, randsuffix, sizeof(randsuffix)))
> +-      return 2;
> +-
> +-    tempstore =3D aprintf("%s.%s.tmp", filename, randsuffix);
> +-    if(!tempstore)
> +-      return 1;
> +-
> +-    out =3D fopen(tempstore, FOPEN_WRITETEXT);
> +-    if(!out)
> ++    error =3D Curl_fopen(data, filename, &out, &tempstore);
> ++    if(error)
> +       goto error;
> +   }
> +
> +@@ -1581,7 +1572,7 @@
> +   if(!use_stdout) {
> +     fclose(out);
> +     out =3D NULL;
> +-    if(Curl_rename(tempstore, filename)) {
> ++    if(tempstore && Curl_rename(tempstore, filename)) {
> +       unlink(tempstore);
> +       goto error;
> +     }
> +diff --git a/lib/fopen.c b/lib/fopen.c
> +new file mode 100644
> +index 0000000..92dc31d
> +--- /dev/null
> ++++ b/lib/fopen.c
> +@@ -0,0 +1,106 @@
> ++/**********************************************************************=
*****
> ++ *                                  _   _ ____  _
> ++ *  Project                     ___| | | |  _ \| |
> ++ *                             / __| | | | |_) | |
> ++ *                            | (__| |_| |  _ <| |___
> ++ *                             \___|\___/|_| \_\_____|
> ++ *
> ++ * Copyright (C) 1998 - 2022, Daniel Stenberg, <daniel@haxx.se>, et al.
> ++ *
> ++ * This software is licensed as described in the file COPYING, which
> ++ * you should have received as part of this distribution. The terms
> ++ * are also available at https://curl.se/docs/copyright.html.
> ++ *
> ++ * You may opt to use, copy, modify, merge, publish, distribute and/or =
sell
> ++ * copies of the Software, and permit persons to whom the Software is
> ++ * furnished to do so, under the terms of the COPYING file.
> ++ *
> ++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY O=
F ANY
> ++ * KIND, either express or implied.
> ++ *
> ++ **********************************************************************=
*****/
> ++
> ++#include "curl_setup.h"
> ++
> ++#if !defined(CURL_DISABLE_COOKIES) && !defined(CURL_DISABLE_ALTSVC) && =
 \
> ++  !defined(CURL_DISABLE_HSTS)
> ++
> ++#ifdef HAVE_FCNTL_H
> ++#include <fcntl.h>
> ++#endif
> ++
> ++#include "urldata.h"
> ++#include "rand.h"
> ++#include "fopen.h"
> ++/* The last 3 #include files should be in this order */
> ++#include "curl_printf.h"
> ++#include "curl_memory.h"
> ++#include "memdebug.h"
> ++
> ++/*
> ++ * Curl_fopen() opens a file for writing with a temp name, to be rename=
d
> ++ * to the final name when completed. If there is an existing file using=
 this
> ++ * name at the time of the open, this function will clone the mode from=
 that
> ++ * file.  if 'tempname' is non-NULL, it needs a rename after the file i=
s
> ++ * written.
> ++ */
> ++CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
> ++                    FILE **fh, char **tempname)
> ++{
> ++  CURLcode result =3D CURLE_WRITE_ERROR;
> ++  unsigned char randsuffix[9];
> ++  char *tempstore =3D NULL;
> ++  struct_stat sb, nsb;
> ++  int fd =3D -1;
> ++  *tempname =3D NULL;
> ++
> ++  if(stat(filename, &sb) =3D=3D -1 || !S_ISREG(sb.st_mode)) {
> ++    /* a non-regular file, fallback to direct fopen() */
> ++    *fh =3D fopen(filename, FOPEN_WRITETEXT);
> ++    if(*fh)
> ++      return CURLE_OK;
> ++    goto fail;
> ++  }
> ++
> ++  result =3D Curl_rand_hex(data, randsuffix, sizeof(randsuffix));
> ++  if(result)
> ++    goto fail;
> ++
> ++  tempstore =3D aprintf("%s.%s.tmp", filename, randsuffix);
> ++  if(!tempstore) {
> ++    result =3D CURLE_OUT_OF_MEMORY;
> ++    goto fail;
> ++  }
> ++
> ++  result =3D CURLE_WRITE_ERROR;
> ++  fd =3D open(tempstore, O_WRONLY | O_CREAT | O_EXCL, 0600);
> ++  if(fd =3D=3D -1)
> ++    goto fail;
> ++
> ++  if((fstat(fd, &nsb) !=3D -1) &&
> ++     (nsb.st_uid =3D=3D sb.st_uid) && (nsb.st_gid =3D=3D sb.st_gid)) {
> ++    /* if the user and group are the same, clone the original mode */
> ++    if(fchmod(fd, sb.st_mode) =3D=3D -1)

This fails on the autobuilder meta-mingw test with:

../../curl-7.69.1/lib/fopen.c: In function 'Curl_fopen':
../../curl-7.69.1/lib/fopen.c:83:8: error: implicit declaration of
function 'fchmod'; did you mean 'chmod'?
[-Werror=3Dimplicit-function-declaration]
   83 |     if(fchmod(fd, sb.st_mode) =3D=3D -1)
      |        ^~~~~~
      |        chmod

Full log here:

https://errors.yoctoproject.org/Errors/Details/660046/

Steve

> ++      goto fail;
> ++  }
> ++
> ++  *fh =3D fdopen(fd, FOPEN_WRITETEXT);
> ++  if(!*fh)
> ++    goto fail;
> ++
> ++  *tempname =3D tempstore;
> ++  return CURLE_OK;
> ++
> ++fail:
> ++  if(fd !=3D -1) {
> ++    close(fd);
> ++    unlink(tempstore);
> ++  }
> ++
> ++  free(tempstore);
> ++
> ++  *tempname =3D NULL;
> ++  return result;
> ++}
> ++
> ++#endif /* ! disabled */
> +diff --git a/lib/fopen.h b/lib/fopen.h
> +new file mode 100644
> +index 0000000..1020f3c
> +--- /dev/null
> ++++ b/lib/fopen.h
> +@@ -0,0 +1,28 @@
> ++#ifndef HEADER_CURL_FOPEN_H
> ++#define HEADER_CURL_FOPEN_H
> ++/**********************************************************************=
*****
> ++ *                                  _   _ ____  _
> ++ *  Project                     ___| | | |  _ \| |
> ++ *                             / __| | | | |_) | |
> ++ *                            | (__| |_| |  _ <| |___
> ++ *                             \___|\___/|_| \_\_____|
> ++ *
> ++ * Copyright (C) 1998 - 2022, Daniel Stenberg, <daniel@haxx.se>, et al.
> ++ *
> ++ * This software is licensed as described in the file COPYING, which
> ++ * you should have received as part of this distribution. The terms
> ++ * are also available at https://curl.se/docs/copyright.html.
> ++ *
> ++ * You may opt to use, copy, modify, merge, publish, distribute and/or =
sell
> ++ * copies of the Software, and permit persons to whom the Software is
> ++ * furnished to do so, under the terms of the COPYING file.
> ++ *
> ++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY O=
F ANY
> ++ * KIND, either express or implied.
> ++ *
> ++ **********************************************************************=
*****/
> ++
> ++CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
> ++                    FILE **fh, char **tempname);
> ++
> ++#endif
> +--
> +2.25.1
> diff --git a/meta/recipes-support/curl/curl/CVE-2022-32208.patch b/meta/r=
ecipes-support/curl/curl/CVE-2022-32208.patch
> new file mode 100644
> index 0000000000..324fe874f6
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2022-32208.patch
> @@ -0,0 +1,29 @@
> +Backported from:
> +
> +From 4c3f77e871820d055a5f6c4cd7a6ac47a7f3877d Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Thu, 9 Jun 2022 09:27:24 +0200
> +Subject: [PATCH] krb5: return error properly on decode errors
> +
> +CVE: CVE-2022-32208
> +Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary=
/+sourcefiles/curl/7.68.0-1ubuntu2.12/curl_7.68.0-1ubuntu2.12.debian.tar.xz=
]
> +Comment: No change in any hunk
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +
> +diff --git a/lib/krb5.c b/lib/krb5.c
> +index f50287a..5b77e35 100644
> +--- a/lib/krb5.c
> ++++ b/lib/krb5.c
> +@@ -86,11 +86,8 @@ krb5_decode(void *app_data, void *buf, int len,
> +   enc.value =3D buf;
> +   enc.length =3D len;
> +   maj =3D gss_unwrap(&min, *context, &enc, &dec, NULL, NULL);
> +-  if(maj !=3D GSS_S_COMPLETE) {
> +-    if(len >=3D 4)
> +-      strcpy(buf, "599 ");
> ++  if(maj !=3D GSS_S_COMPLETE)
> +     return -1;
> +-  }
> +
> +   memcpy(buf, dec.value, dec.length);
> +   len =3D curlx_uztosi(dec.length);
> diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-supp=
ort/curl/curl_7.69.1.bb
> index 5a597a7dd9..7b67b68f1d 100644
> --- a/meta/recipes-support/curl/curl_7.69.1.bb
> +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> @@ -35,6 +35,9 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.t=
ar.bz2 \
>             file://CVE-2022-27781.patch \
>             file://CVE-2022-27782-1.patch \
>             file://CVE-2022-27782-2.patch \
> +           file://CVE-2022-32206.patch \
> +           file://CVE-2022-32207.patch \
> +           file://CVE-2022-32208.patch \
>  "
>
>  SRC_URI[md5sum] =3D "ec5fc263f898a3dfef08e805f1ecca42"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167817): https://lists.openembedded.org/g/openembedde=
d-core/message/167817
> Mute This Topic: https://lists.openembedded.org/mt/92248712/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

