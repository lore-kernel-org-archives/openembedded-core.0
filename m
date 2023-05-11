Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4581C7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 21:40:28 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.9196.1683841221315894232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 14:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hVJWzqcu;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-965ac4dd11bso1817353166b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 14:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683841220; x=1686433220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTDobE3XnTu4U2/SYoOwuM6rhkV1sH5TPCMzfeLeaIc=;
        b=hVJWzqcuuARo+btjTKgcRdNTK7D+bInfSfC7Y/u3UeWA8iDzqHTcH/KdNRGR7vgL5c
         NQT6OyDyqCo4AP+G8Mo7rGI9bmVeM7MfYDLf0bQvlNqyGJxD/bUEoP0V6rxo0eodgl+j
         Ss/dXH+bgPxFa/N4tS1b3rBM4NivKy+jfWfbKpM9yHt5OyshA59fmP+NuJ31pS7AM0yI
         wLdf3KdvCw06OEtqDFiEwVmdcqWt1XeAjH5jIq9Da4PMWEbBgw0fPzUL+5aAXBLcb4ve
         8qNGitkFYh9bXrWGKZDVfPyERaQnHLIvy3q6OW0BH1P5o6wNG6UFPPpUkoP2Y9JSy6IC
         DCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683841220; x=1686433220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTDobE3XnTu4U2/SYoOwuM6rhkV1sH5TPCMzfeLeaIc=;
        b=NiOuLvclHMuY00urbmDld4UyIgTLBYX0YAIfcl4QM9RA1fPiM5DpqSNXklSuavPA2x
         8TYdmcZJ68sUaxRFkgEABOFWXkvI4DiDsFrxG8t1YD5HZEvBfPWvdATdET67x1y/gTMS
         uwp8UMlcTXW9423kS0BIWnlCbwOz0Zu0TGzldunmvZsfmy3pXn7dmOiVUKq2RS3Tg6S1
         M1fBub0lvDQ4l22iOVnfp9DsEqeqH66683TppJRUetPKl/QdytcC5VhsIojhMe/4Sp0Y
         Fv4n60//12vPJT4UPi5NkiJQrwcYoXBjBSaHO4GEreZOKhFyXjwlg1uTX4D5jCOlWUlA
         9Hfg==
X-Gm-Message-State: AC+VfDyCa5NYi/Ia9a64xD5fM1o8ysrJI1QfAKFMiSMcS0yrBWZaOluk
	hsIVJP6hl83AzKVRXZbMfIIWChIoytAPOeUTtEtyFl0459xTGA/d
X-Google-Smtp-Source: ACHHUZ7/jcv8Y8oJEbj0ahNm11nQtDyqqpJJfBGw1UeCXSlMHm4b8Tqjpp9cTYCQR1ypy15ho842Do5JImfpjC8vfVo=
X-Received: by 2002:a17:907:c22:b0:961:2956:2ed9 with SMTP id
 ga34-20020a1709070c2200b0096129562ed9mr25471321ejc.25.1683841219368; Thu, 11
 May 2023 14:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230511212833.94676-1-sdoshi@mvista.com>
In-Reply-To: <20230511212833.94676-1-sdoshi@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 11 May 2023 11:40:08 -1000
Message-ID: <CAOSpxdYROZQcR-bTyiatJFGk3zsJF-O7PuhYG1zD+MvrmaHvJw@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCHv2] curl: Security fix for CVE-2023-27534
To: Siddharth <sdoshi@mvista.com>
Cc: openembedded-core@lists.openembedded.org, 
	Hitendra Prajapati <hprajapati@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 21:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181159

Hi Siddharth,

Thanks for this, but I think we need a better shortlog and commit
message explaining why we need this additional patch.

Could you send a v3?

Thanks!

Steve

On Thu, May 11, 2023 at 11:28=E2=80=AFAM Siddharth <sdoshi@mvista.com> wrot=
e:
>
> Upstream-Status: Backport from [https://github.com/curl/curl/commit/4e2b5=
2b5f7a3bf50a0f1494155717b02cc1df6d6]
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../curl/curl/CVE-2023-27534-pre1.patch       |  44 +++++++
>  .../curl/curl/CVE-2023-27534.patch            | 122 +++---------------
>  meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
>  3 files changed, 61 insertions(+), 106 deletions(-)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27534-pre1.pa=
tch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-27534-pre1.patch b/m=
eta/recipes-support/curl/curl/CVE-2023-27534-pre1.patch
> new file mode 100644
> index 0000000000..98b25a2fe5
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-27534-pre1.patch
> @@ -0,0 +1,44 @@
> +From 6c51adeb71da076c5c40a45e339e06bb4394a86b Mon Sep 17 00:00:00 2001
> +From: Eric Vigeant <evigeant@gmail.com>
> +Date: Wed, 2 Nov 2022 11:47:09 -0400
> +Subject: [PATCH] cur_path: do not add '/' if homedir ends with one
> +
> +When using SFTP and a path relative to the user home, do not add a
> +trailing '/' to the user home dir if it already ends with one.
> +
> +Closes #9844
> +
> +CVE: CVE-2023-27534
> +Note: This patch is needed to backport CVE-2023-27534
> +Upstream-Status: Backport from [https://github.com/curl/curl/commit/6c51=
adeb71da076c5c40a45e339e06bb4394a86b]
> +
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + lib/curl_path.c | 10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/lib/curl_path.c b/lib/curl_path.c
> +index f429634..40b92ee 100644
> +--- a/lib/curl_path.c
> ++++ b/lib/curl_path.c
> +@@ -70,10 +70,14 @@ CURLcode Curl_getworkingpath(struct connectdata *con=
n,
> +       /* It is referenced to the home directory, so strip the
> +          leading '/' */
> +       memcpy(real_path, homedir, homelen);
> +-      real_path[homelen] =3D '/';
> +-      real_path[homelen + 1] =3D '\0';
> ++      /* Only add a trailing '/' if homedir does not end with one */
> ++      if(homelen =3D=3D 0 || real_path[homelen - 1] !=3D '/') {
> ++        real_path[homelen] =3D '/';
> ++        homelen++;
> ++        real_path[homelen] =3D '\0';
> ++      }
> +       if(working_path_len > 3) {
> +-        memcpy(real_path + homelen + 1, working_path + 3,
> ++        memcpy(real_path + homelen, working_path + 3,
> +                1 + working_path_len -3);
> +       }
> +     }
> +--
> +2.24.4
> +
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-27534.patch b/meta/r=
ecipes-support/curl/curl/CVE-2023-27534.patch
> index aeeffd5fea..3ecd181290 100644
> --- a/meta/recipes-support/curl/curl/CVE-2023-27534.patch
> +++ b/meta/recipes-support/curl/curl/CVE-2023-27534.patch
> @@ -3,121 +3,31 @@ From: Daniel Stenberg <daniel@haxx.se>
>  Date: Thu, 9 Mar 2023 16:22:11 +0100
>  Subject: [PATCH] curl_path: create the new path with dynbuf
>
> +Closes #10729
> +
>  CVE: CVE-2023-27534
> -Upstream-Status: Backport [https://github.com/curl/curl/commit/4e2b52b5f=
7a3bf50a0f1494155717b02cc1df6d6]
> +Note: This patch is needed to backport CVE-2023-27534
> +Upstream-Status: Backport from [https://github.com/curl/curl/commit/4e2b=
52b5f7a3bf50a0f1494155717b02cc1df6d6]
>
>  Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
>  ---
> - lib/curl_path.c | 71 ++++++++++++++++++++++++-------------------------
> - 1 file changed, 35 insertions(+), 36 deletions(-)
> + lib/curl_path.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/lib/curl_path.c b/lib/curl_path.c
> -index f429634..e17db4b 100644
> +index 40b92ee..598c5dd 100644
>  --- a/lib/curl_path.c
>  +++ b/lib/curl_path.c
> -@@ -30,6 +30,8 @@
> - #include "escape.h"
> - #include "memdebug.h"
> -
> -+#define MAX_SSHPATH_LEN 100000 /* arbitrary */
> -+
> - /* figure out the path to work with in this particular request */
> - CURLcode Curl_getworkingpath(struct connectdata *conn,
> -                              char *homedir,  /* when SFTP is used */
> -@@ -37,60 +39,57 @@ CURLcode Curl_getworkingpath(struct connectdata *con=
n,
> -                                              real path to work with */
> - {
> -   struct Curl_easy *data =3D conn->data;
> --  char *real_path =3D NULL;
> -   char *working_path;
> -   size_t working_path_len;
> -+  struct dynbuf npath;
> -   CURLcode result =3D
> -     Curl_urldecode(data, data->state.up.path, 0, &working_path,
> -                    &working_path_len, FALSE);
> -   if(result)
> -     return result;
> -
> -+  /* new path to switch to in case we need to */
> -+  Curl_dyn_init(&npath, MAX_SSHPATH_LEN);
> -+
> -   /* Check for /~/, indicating relative to the user's home directory */
> --  if(conn->handler->protocol & CURLPROTO_SCP) {
> --    real_path =3D malloc(working_path_len + 1);
> --    if(real_path =3D=3D NULL) {
> -+  if((data->conn->handler->protocol & CURLPROTO_SCP) &&
> -+     (working_path_len > 3) && (!memcmp(working_path, "/~/", 3))) {
> -+    /* It is referenced to the home directory, so strip the leading '/~=
/' */
> -+    if(Curl_dyn_addn(&npath, &working_path[3], working_path_len - 3)) {
> -       free(working_path);
> -       return CURLE_OUT_OF_MEMORY;
> -     }
> --    if((working_path_len > 3) && (!memcmp(working_path, "/~/", 3)))
> --      /* It is referenced to the home directory, so strip the leading '=
/~/' */
> --      memcpy(real_path, working_path + 3, working_path_len - 2);
> --    else
> --      memcpy(real_path, working_path, 1 + working_path_len);
> +@@ -60,7 +60,7 @@ CURLcode Curl_getworkingpath(struct connectdata *conn,
> +       memcpy(real_path, working_path, 1 + working_path_len);
>     }
> --  else if(conn->handler->protocol & CURLPROTO_SFTP) {
> +   else if(conn->handler->protocol & CURLPROTO_SFTP) {
>  -    if((working_path_len > 1) && (working_path[1] =3D=3D '~')) {
> --      size_t homelen =3D strlen(homedir);
> --      real_path =3D malloc(homelen + working_path_len + 1);
> --      if(real_path =3D=3D NULL) {
> --        free(working_path);
> --        return CURLE_OUT_OF_MEMORY;
> --      }
> --      /* It is referenced to the home directory, so strip the
> --         leading '/' */
> --      memcpy(real_path, homedir, homelen);
> --      real_path[homelen] =3D '/';
> --      real_path[homelen + 1] =3D '\0';
> --      if(working_path_len > 3) {
> --        memcpy(real_path + homelen + 1, working_path + 3,
> --               1 + working_path_len -3);
> --      }
> -+  else if((data->conn->handler->protocol & CURLPROTO_SFTP) &&
> -+          (working_path_len > 2) && !memcmp(working_path, "/~/", 3)) {
> -+    size_t len;
> -+    const char *p;
> -+    int copyfrom =3D 3;
> -+    if(Curl_dyn_add(&npath, homedir)) {
> -+      free(working_path);
> -+      return CURLE_OUT_OF_MEMORY;
> -     }
> --    else {
> --      real_path =3D malloc(working_path_len + 1);
> --      if(real_path =3D=3D NULL) {
> --        free(working_path);
> --        return CURLE_OUT_OF_MEMORY;
> --      }
> --      memcpy(real_path, working_path, 1 + working_path_len);
> -+    /* Copy a separating '/' if homedir does not end with one */
> -+    len =3D Curl_dyn_len(&npath);
> -+    p =3D Curl_dyn_ptr(&npath);
> -+    if(len && (p[len-1] !=3D '/'))
> -+      copyfrom =3D 2;
> -+
> -+    if(Curl_dyn_addn(&npath,
> -+                     &working_path[copyfrom], working_path_len - copyfr=
om)) {
> -+      free(working_path);
> -+      return CURLE_OUT_OF_MEMORY;
> -     }
> -   }
> -
> --  free(working_path);
> -+  if(Curl_dyn_len(&npath)) {
> -+    free(working_path);
> -
> --  /* store the pointer for the caller to receive */
> --  *path =3D real_path;
> -+    /* store the pointer for the caller to receive */
> -+    *path =3D Curl_dyn_ptr(&npath);
> -+  }
> -+  else
> -+    *path =3D working_path;
> -
> -   return CURLE_OK;
> - }
> ++    if((working_path_len > 2) && !memcmp(working_path, "/~/", 3)) {
> +       size_t homelen =3D strlen(homedir);
> +       real_path =3D malloc(homelen + working_path_len + 1);
> +       if(real_path =3D=3D NULL) {
>  --
> -2.25.1
> +2.24.4
>
> diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-supp=
ort/curl/curl_7.69.1.bb
> index 32d18ddb3a..13ec117099 100644
> --- a/meta/recipes-support/curl/curl_7.69.1.bb
> +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> @@ -43,6 +43,7 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.t=
ar.bz2 \
>             file://CVE-2022-35260.patch \
>             file://CVE-2022-43552.patch \
>             file://CVE-2023-23916.patch \
> +           file://CVE-2023-27534-pre1.patch \
>             file://CVE-2023-27534.patch \
>             file://CVE-2023-27538.patch \
>             file://CVE-2023-27533.patch \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181154): https://lists.openembedded.org/g/openembedde=
d-core/message/181154
> Mute This Topic: https://lists.openembedded.org/mt/98837360/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

