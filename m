Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50B4C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:07:47 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.456.1654099661509600623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Ngo+OHhl;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id gi33so4755086ejc.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vCWdBsxbr7Y9ezi83CfoEL5DGy73cV1xI4Ou3JRyFWY=;
        b=Ngo+OHhlVUsXGm9Q4VegOZ06Y4AYvC8n+VOWMlCsU2lJ5G/5WEh8erK16YNBHPdFlm
         hzC6teZ+WjTrPNbdhYx74shII/08Uji8rE1oygQWLJJwZ5VZtjU86D54SGDHPImmJaRV
         8x7gXZxbrFjl0Lgo3e8ZbN+UKgjTbg6X7qyQPwOLkb544oUZExNt51dspGdPNcaIrAkv
         keuoGVArNSjDWqTX1zVZmZd73H3bo+sRlvFxakAv2R5sO+hkzpQTOLq6ScG3Ae84R2v/
         kdIBGTksH4ucu3OXLUqsNECuFtKS+JC5gUIGv8Ta7jnFr86NzqQrgLoKzTIqs6XZWWO2
         p5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vCWdBsxbr7Y9ezi83CfoEL5DGy73cV1xI4Ou3JRyFWY=;
        b=vVopTG2L1OfFU3O1312QZTB3Tdz21tqN7bVGsWtYE6pSao6KB1SX0p425gJp767sCP
         dwoLrV0Nmg+q5laFJiwJYhGeRnZNnEA1stuosp0Ufegl7dsBgOmqHwSg4qFKz9HW8a8t
         5XllRVDffTGFeYWcp2i+w2343pD5HpfD40RagUwhuJpxVe1zlvuh+nJ11rmeqmpGp+zH
         nX55gmWYhz66d/aHipcbAcVSvOP4EHMh22HwcIrWxzw/osdlY/Bk1dathibZot/BMQVM
         WM6l5KeEC6e/ht2YkIAltV3BI7eIm3F0bVXFHFNGzAA+gLuYSpBfi31C9ew1QeMsOPyf
         fMJA==
X-Gm-Message-State: AOAM530vl7yJE1Hgc+3SK+NbHcK82rtk2qH1AKnM3IQDAvwwl+gRYH2n
	5o4BrvPhwSmsY0Gm9043wfM70VHtMh81u4SBMEnhXA==
X-Google-Smtp-Source: 
 ABdhPJzZl7u52UAsSwDhQhtnvGentILt7ubONUle/IjUEjdepOtkPKJdF/nURFEkWa953lPRc5Kfy12KeXUQXNAafSQ=
X-Received: by 2002:a17:907:60d3:b0:6f9:6ac6:2335 with SMTP id
 hv19-20020a17090760d300b006f96ac62335mr225498ejc.628.1654099659526; Wed, 01
 Jun 2022 09:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220601090044.28212-1-rak3033@gmail.com>
In-Reply-To: <20220601090044.28212-1-rak3033@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 1 Jun 2022 06:07:28 -1000
Message-ID: 
 <CAOSpxda4XY3qbJ_wncx3y5TN-5nAB4nKDcypbaCoNBFWzczhxQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH v2] curl: Add fix for CVE-2022-27781
 CVE-2022-27782
To: Riyaz Ahmed Khan <rak3033@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Riyaz.Khan@kpit.com,
	Ranjitsinh.Rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:07:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166390

On Tue, May 31, 2022 at 11:01 PM Riyaz Ahmed Khan <rak3033@gmail.com> wrote=
:
>
> From: Riyaz Khan <Riyaz.Khan@kpit.com>
>
> Add patches for CVE issues: CVE-2022-27781 CVE-2022-27782
>
> CVE-2022-27781
> Link: [https://github.com/curl/curl/commit/5c7da89d404bf59c8dd82a001119a1=
6d18365917]

Unfortunately, this is still failing:

ERROR: curl-7.69.1-r0 do_patch: Applying patch 'CVE-2022-27781.patch'
on target directory
'/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/curl/7.=
69.1-r0/curl-7.69.1'
Command Error: 'quilt --quiltrc
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/curl/7.6=
9.1-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch CVE-2022-27781.patch
patching file lib/vtls/nss.c
Hunk #1 FAILED at 983.
Hunk #2 succeeded at 986 (offset -32 lines).
1 out of 2 hunks FAILED -- rejects in file lib/vtls/nss.c
Patch CVE-2022-27781.patch does not apply (enforce with -f)
ERROR: Logfile of failure stored in:
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/curl/7.6=
9.1-r0/temp/log.do_patch.1303805
ERROR: Task (/home/steve/builds/poky-contrib/meta/recipes-support/curl/curl=
_7.69.1.bb:do_patch)
failed with exit code '1'

Steve

> CVE-2022-27782
> Link: [https://github.com/curl/curl/commit/1645e9b44505abd5cbaf65da5282c3=
f33b5924a5]
>
> Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
> ---
>  .../curl/curl/CVE-2022-27781.patch            | 50 +++++++++++++
>  .../curl/curl/CVE-2022-27782.patch            | 75 +++++++++++++++++++
>  meta/recipes-support/curl/curl_7.69.1.bb      |  2 +
>  3 files changed, 127 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27781.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27782.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2022-27781.patch b/meta/r=
ecipes-support/curl/curl/CVE-2022-27781.patch
> new file mode 100644
> index 0000000000..83cdd1290f
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2022-27781.patch
> @@ -0,0 +1,50 @@
> +From 5c7da89d404bf59c8dd82a001119a16d18365917 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 9 May 2022 10:07:15 +0200
> +Subject: [PATCH] nss: return error if seemingly stuck in a cert loop
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +CVE-2022-27781
> +
> +Reported-by: Florian Kohnh=C3=A4user
> +Bug: https://curl.se/docs/CVE-2022-27781.html
> +Closes #8822
> +
> +CVE: CVE-2022-27781
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/5c7da89d4=
04bf59c8dd82a001119a16d18365917]
> +
> +Signed-off-by: Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
> +
> +---
> + lib/vtls/nss.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/lib/vtls/nss.c b/lib/vtls/nss.c
> +index 5b7de9f81895..569c0628feb5 100644
> +--- a/lib/vtls/nss.c
> ++++ b/lib/vtls/nss.c
> +@@ -983,6 +983,9 @@ static void display_cert_info(struct Curl_easy *data=
,
> +   PR_Free(common_name);
> + }
> +
> ++/* A number of certs that will never occur in a real server handshake *=
/
> ++#define TOO_MANY_CERTS 300
> ++
> + static CURLcode display_conn_info(struct Curl_easy *data, PRFileDesc *s=
ock)
> + {
> +   CURLcode result =3D CURLE_OK;
> +@@ -1018,6 +1021,11 @@ static CURLcode display_conn_info(struct Curl_eas=
y *data, PRFileDesc *sock)
> +         cert2 =3D CERT_FindCertIssuer(cert, now, certUsageSSLCA);
> +         while(cert2) {
> +           i++;
> ++          if(i >=3D TOO_MANY_CERTS) {
> ++            CERT_DestroyCertificate(cert2);
> ++            failf(data, "certificate loop");
> ++            return CURLE_SSL_CERTPROBLEM;
> ++          }
> +           if(cert2->isRoot) {
> +             CERT_DestroyCertificate(cert2);
> +             break;
> diff --git a/meta/recipes-support/curl/curl/CVE-2022-27782.patch b/meta/r=
ecipes-support/curl/curl/CVE-2022-27782.patch
> new file mode 100644
> index 0000000000..a88aabe517
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2022-27782.patch
> @@ -0,0 +1,75 @@
> +From 1645e9b44505abd5cbaf65da5282c3f33b5924a5 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 9 May 2022 23:13:53 +0200
> +Subject: [PATCH] url: check SSH config match on connection reuse
> +
> +CVE-2022-27782
> +
> +Reported-by: Harry Sintonen
> +Bug: https://curl.se/docs/CVE-2022-27782.html
> +Closes #8825
> +
> +CVE: CVE-2022-27782
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/1645e9b44=
505abd5cbaf65da5282c3f33b5924a5]
> +
> +Signed-off-by: Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
> +
> +---
> + lib/url.c      | 11 +++++++++++
> + lib/vssh/ssh.h |  6 +++---
> + 2 files changed, 14 insertions(+), 3 deletions(-)
> +
> +diff --git a/lib/url.c b/lib/url.c
> +index cf14a333ac69..6b31d4b1315d 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -1100,6 +1100,12 @@ static void prune_dead_connections(struct Curl_ea=
sy *data)
> +   }
> + }
> +
> ++static bool ssh_config_matches(struct connectdata *one,
> ++                               struct connectdata *two)
> ++{
> ++  return (Curl_safecmp(one->proto.sshc.rsa, two->proto.sshc.rsa) &&
> ++          Curl_safecmp(one->proto.sshc.rsa_pub, two->proto.sshc.rsa_pub=
));
> ++}
> + /*
> +  * Given one filled in connection struct (named needle), this function =
should
> +  * detect if there already is one that has all the significant details
> +@@ -1356,6 +1362,11 @@ ConnectionExists(struct Curl_easy *data,
> +          (data->state.httpwant < CURL_HTTP_VERSION_2_0))
> +         continue;
> +
> ++      if(get_protocol_family(needle->handler) =3D=3D PROTO_FAMILY_SSH) =
{
> ++        if(!ssh_config_matches(needle, check))
> ++          continue;
> ++      }
> ++
> +       if((needle->handler->flags&PROTOPT_SSL)
> + #ifndef CURL_DISABLE_PROXY
> +          || !needle->bits.httpproxy || needle->bits.tunnel_proxy
> +diff --git a/lib/vssh/ssh.h b/lib/vssh/ssh.h
> +index 7972081ec610..30d82e57648e 100644
> +--- a/lib/vssh/ssh.h
> ++++ b/lib/vssh/ssh.h
> +@@ -7,7 +7,7 @@
> +  *                            | (__| |_| |  _ <| |___
> +  *                             \___|\___/|_| \_\_____|
> +  *
> +- * Copyright (C) 1998 - 2021, Daniel Stenberg, <daniel@haxx.se>, et al.
> ++ * Copyright (C) 1998 - 2022, Daniel Stenberg, <daniel@haxx.se>, et al.
> +  *
> +  * This software is licensed as described in the file COPYING, which
> +  * you should have received as part of this distribution. The terms
> +@@ -131,8 +131,8 @@ struct ssh_conn {
> +
> +   /* common */
> +   const char *passphrase;     /* pass-phrase to use */
> +-  char *rsa_pub;              /* path name */
> +-  char *rsa;                  /* path name */
> ++  char *rsa_pub;              /* strdup'ed public key file */
> ++  char *rsa;                  /* strdup'ed private key file */
> +   bool authed;                /* the connection has been authenticated =
fine */
> +   bool acceptfail;            /* used by the SFTP_QUOTE (continue if
> +                                  quote command fails) */
> diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-supp=
ort/curl/curl_7.69.1.bb
> index e850376ff8..602caf97ab 100644
> --- a/meta/recipes-support/curl/curl_7.69.1.bb
> +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> @@ -28,6 +28,8 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.t=
ar.bz2 \
>             file://CVE-2022-27776.patch \
>             file://CVE-2022-27775.patch \
>             file://CVE-2022-22576.patch \
> +           file://CVE-2022-27781.patch \
> +           file://CVE-2022-27782.patch \
>  "
>
>  SRC_URI[md5sum] =3D "ec5fc263f898a3dfef08e805f1ecca42"
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166368): https://lists.openembedded.org/g/openembedde=
d-core/message/166368
> Mute This Topic: https://lists.openembedded.org/mt/91471123/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

