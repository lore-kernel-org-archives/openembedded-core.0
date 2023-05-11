Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8421DC7EE23
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 14:45:16 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.61046.1683816315301133007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 07:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Gbh17RS9;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-965d73eb65fso1402376866b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683816313; x=1686408313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJ9MynowFfOvERj8u3YhGZKsTOmjXVnJln2oGMVWKfI=;
        b=Gbh17RS9dAf8sl04Br99Sj+ZUAjwFUgFme+KASI6ZfVDkgzIWr1yB3D8WrCwn+kBiY
         Lo0rSR6C3CfwgzCkGEeGExRmxR+MfLvv9c2wCXUR9jOGPcvjyTG9gidAHjORylxM2CbI
         BmLaylqgKHMjIYKQ0/AaYkyu4tP5yyJJ00X/n/DOu1zXe3QzV3C8VR6NGYss1eJzolaV
         F5GIv9+aWD8KPKSC54eSVATzHYPBPUbSMmP6RUf3ka2ZB0nqwjEXYDzSBZ1V0dCurPpF
         9HRRU/kc7ZLHLnPB586iQiMJ0QdmMsRPOc+zX/SQYBroynja0qVBCHCTHb+WKu5iM4df
         RiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683816313; x=1686408313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJ9MynowFfOvERj8u3YhGZKsTOmjXVnJln2oGMVWKfI=;
        b=J3xj6pcygjZfa1Z6m+JNIsL+My/Iz8DPxuow8APwTkbDG/FSy2d0ulgFHfhJFs9jiY
         ndMLDfT2nfb7TkHpGN99FFNmJ2QcnKXnxbSEMvKnK8zJcfhhMq1OTgE1pnK9DslZTTB8
         Hs7toOLVIMbniPhKvJAAoiyr6OXzgZ/lL2Jm9/3dJjR4UjW38E69josx/vuqWZFo6dM/
         2np5VXSf+O51otlBAhysHmacyXLXW1Y2RYLF7XIxLdI7gW7eeWnHT495Ij4kWxyd38+S
         r+Ik5iY4aaAd0xMjTpt68pzB3ozzjDSEjrxFbKUz03qeIsCSc4gs1PP9zFv54gZdCglt
         gZJA==
X-Gm-Message-State: AC+VfDwWbPEVC+xn7gKjD5yiFAZz9eKsaIlPEWSEi5MTrGdyO6e2zCz6
	A7fTQFWccBc6XL+J8806Yy4fLApbD9Z3vj0dVYfzP5BwvOUE/rqmNi4=
X-Google-Smtp-Source: ACHHUZ5TLsuyoygWo15N1NTtgE8QcWMIuv8BwUhogjDmjeGG0KSsqpvH9tEPkjPCehuBohL65qgsjjvjrqLx9Ep0CV0=
X-Received: by 2002:a17:907:9495:b0:96a:87d3:770e with SMTP id
 dm21-20020a170907949500b0096a87d3770emr599537ejc.48.1683816313323; Thu, 11
 May 2023 07:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230414105523.81661-1-hprajapati@mvista.com>
In-Reply-To: <20230414105523.81661-1-hprajapati@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 11 May 2023 04:45:02 -1000
Message-ID: <CAOSpxdZZ9=DEf-ehFjta-qU=NeDGbzh4puJO-H1=QpH+B3X7og@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] curl: CVE-2023-27534 SFTP path ~
 resolving discrepancy
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 14:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181136

Hi Hitendra,

There's been a bug filed against this patch (build failure when when
curl is configured with `libssh2` i.e. PACKAGECONFIG_append =3D "
libssh2"):

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15114

Could you investigate and advise whether there is an easy fix or
whether we should revert?

Thanks,

Steve

On Fri, Apr 14, 2023 at 12:55=E2=80=AFAM Hitendra Prajapati
<hprajapati@mvista.com> wrote:
>
> Upstream-Status: Backport from https://github.com/curl/curl/commit/4e2b52=
b5f7a3bf50a0f1494155717b02cc1df6d6
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../curl/curl/CVE-2023-27534.patch            | 123 ++++++++++++++++++
>  meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
>  2 files changed, 124 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27534.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-27534.patch b/meta/r=
ecipes-support/curl/curl/CVE-2023-27534.patch
> new file mode 100644
> index 0000000000..aeeffd5fea
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-27534.patch
> @@ -0,0 +1,123 @@
> +From 4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Thu, 9 Mar 2023 16:22:11 +0100
> +Subject: [PATCH] curl_path: create the new path with dynbuf
> +
> +CVE: CVE-2023-27534
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/4e2b52b5f=
7a3bf50a0f1494155717b02cc1df6d6]
> +
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + lib/curl_path.c | 71 ++++++++++++++++++++++++-------------------------
> + 1 file changed, 35 insertions(+), 36 deletions(-)
> +
> +diff --git a/lib/curl_path.c b/lib/curl_path.c
> +index f429634..e17db4b 100644
> +--- a/lib/curl_path.c
> ++++ b/lib/curl_path.c
> +@@ -30,6 +30,8 @@
> + #include "escape.h"
> + #include "memdebug.h"
> +
> ++#define MAX_SSHPATH_LEN 100000 /* arbitrary */
> ++
> + /* figure out the path to work with in this particular request */
> + CURLcode Curl_getworkingpath(struct connectdata *conn,
> +                              char *homedir,  /* when SFTP is used */
> +@@ -37,60 +39,57 @@ CURLcode Curl_getworkingpath(struct connectdata *con=
n,
> +                                              real path to work with */
> + {
> +   struct Curl_easy *data =3D conn->data;
> +-  char *real_path =3D NULL;
> +   char *working_path;
> +   size_t working_path_len;
> ++  struct dynbuf npath;
> +   CURLcode result =3D
> +     Curl_urldecode(data, data->state.up.path, 0, &working_path,
> +                    &working_path_len, FALSE);
> +   if(result)
> +     return result;
> +
> ++  /* new path to switch to in case we need to */
> ++  Curl_dyn_init(&npath, MAX_SSHPATH_LEN);
> ++
> +   /* Check for /~/, indicating relative to the user's home directory */
> +-  if(conn->handler->protocol & CURLPROTO_SCP) {
> +-    real_path =3D malloc(working_path_len + 1);
> +-    if(real_path =3D=3D NULL) {
> ++  if((data->conn->handler->protocol & CURLPROTO_SCP) &&
> ++     (working_path_len > 3) && (!memcmp(working_path, "/~/", 3))) {
> ++    /* It is referenced to the home directory, so strip the leading '/~=
/' */
> ++    if(Curl_dyn_addn(&npath, &working_path[3], working_path_len - 3)) {
> +       free(working_path);
> +       return CURLE_OUT_OF_MEMORY;
> +     }
> +-    if((working_path_len > 3) && (!memcmp(working_path, "/~/", 3)))
> +-      /* It is referenced to the home directory, so strip the leading '=
/~/' */
> +-      memcpy(real_path, working_path + 3, working_path_len - 2);
> +-    else
> +-      memcpy(real_path, working_path, 1 + working_path_len);
> +   }
> +-  else if(conn->handler->protocol & CURLPROTO_SFTP) {
> +-    if((working_path_len > 1) && (working_path[1] =3D=3D '~')) {
> +-      size_t homelen =3D strlen(homedir);
> +-      real_path =3D malloc(homelen + working_path_len + 1);
> +-      if(real_path =3D=3D NULL) {
> +-        free(working_path);
> +-        return CURLE_OUT_OF_MEMORY;
> +-      }
> +-      /* It is referenced to the home directory, so strip the
> +-         leading '/' */
> +-      memcpy(real_path, homedir, homelen);
> +-      real_path[homelen] =3D '/';
> +-      real_path[homelen + 1] =3D '\0';
> +-      if(working_path_len > 3) {
> +-        memcpy(real_path + homelen + 1, working_path + 3,
> +-               1 + working_path_len -3);
> +-      }
> ++  else if((data->conn->handler->protocol & CURLPROTO_SFTP) &&
> ++          (working_path_len > 2) && !memcmp(working_path, "/~/", 3)) {
> ++    size_t len;
> ++    const char *p;
> ++    int copyfrom =3D 3;
> ++    if(Curl_dyn_add(&npath, homedir)) {
> ++      free(working_path);
> ++      return CURLE_OUT_OF_MEMORY;
> +     }
> +-    else {
> +-      real_path =3D malloc(working_path_len + 1);
> +-      if(real_path =3D=3D NULL) {
> +-        free(working_path);
> +-        return CURLE_OUT_OF_MEMORY;
> +-      }
> +-      memcpy(real_path, working_path, 1 + working_path_len);
> ++    /* Copy a separating '/' if homedir does not end with one */
> ++    len =3D Curl_dyn_len(&npath);
> ++    p =3D Curl_dyn_ptr(&npath);
> ++    if(len && (p[len-1] !=3D '/'))
> ++      copyfrom =3D 2;
> ++
> ++    if(Curl_dyn_addn(&npath,
> ++                     &working_path[copyfrom], working_path_len - copyfr=
om)) {
> ++      free(working_path);
> ++      return CURLE_OUT_OF_MEMORY;
> +     }
> +   }
> +
> +-  free(working_path);
> ++  if(Curl_dyn_len(&npath)) {
> ++    free(working_path);
> +
> +-  /* store the pointer for the caller to receive */
> +-  *path =3D real_path;
> ++    /* store the pointer for the caller to receive */
> ++    *path =3D Curl_dyn_ptr(&npath);
> ++  }
> ++  else
> ++    *path =3D working_path;
> +
> +   return CURLE_OK;
> + }
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-supp=
ort/curl/curl_7.69.1.bb
> index 899daf8eac..fddf15e3ff 100644
> --- a/meta/recipes-support/curl/curl_7.69.1.bb
> +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> @@ -42,6 +42,7 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.t=
ar.bz2 \
>             file://CVE-2022-32221.patch \
>             file://CVE-2022-35260.patch \
>             file://CVE-2022-43552.patch \
> +           file://CVE-2023-27534.patch \
>  "
>
>  SRC_URI[md5sum] =3D "ec5fc263f898a3dfef08e805f1ecca42"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179997): https://lists.openembedded.org/g/openembedde=
d-core/message/179997
> Mute This Topic: https://lists.openembedded.org/mt/98259554/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

