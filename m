Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F23C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 14:40:19 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.20677.1678459217056444335
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 06:40:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PzoNh6+7;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id s11so21302280edy.8
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 06:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678459215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S527IE3S/L+2FKptuc9wkz9Qqt77oFds66nBnSj3yqk=;
        b=PzoNh6+7127JUhUPgdJbYEVyVhTG2QXgRScPeq1ShJgG47AlhvV68A4CK5Jp6Qy7dr
         /2p9OePfqbOuW2+l7pkMIxc4AxHWAl0f6zcWzLUtqg50iJyatYHGbojHYd/9z2kt0gPE
         Krv1YJrMPd0n7VNVv+HQLmRDI9fE/QkKwqqOLVyPXsvxsUMuR1VeqCguRgxhJ7/cEc3W
         TIV7Mcl1CfAYJ25QYDmT4UPkkKamTrRnExVIEVgG7j851tCU/mpVG/G3ktNEzQnWxI55
         v0K8osoxclbDRM03Igoh1vEX4Xq1Q6Xac+2U2UbZRbFQ2lWmTIurdesIRBNf/rXsEFJc
         h4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S527IE3S/L+2FKptuc9wkz9Qqt77oFds66nBnSj3yqk=;
        b=oNw1CV4p6Dh9nTwXOHrKSt36Pv7MGZ0qUgXzPfOLetc7Yz9ThaEzC6xganzePf9Ov9
         v0TEHfpTyJAR3q98VriAonOezihOaoKqBU9vVCShozFfKzONH/YLp1jH4hqJLerdo9G4
         +AApJb8vMF6uaL66/4xMseYhdZClyEDHC4M+loXL/SOFo3wBJ2F3oeCs1vAqyWN0GwNm
         am7L3bGfnmxP0DCB0vG/F/TBByADIn9IP19aFUeJ8AlYMGRI1CVgKLPSxh7dCJeLHuvo
         hIldGKw5nV+uWydbyea3+IhCHREVAMo3y8EI/ll0AQ95jv0TQp5WS8IxaO7UWHjMhJju
         LV2g==
X-Gm-Message-State: AO0yUKVMnwCOyqJM0m3IF6vPBxoCMVSRHwo0dV7ShQnNu84KKHM4O/xX
	gLB6/zvPo2Sr8PTyXpK+hR7drZtz4KjmphnBgxzhRA==
X-Google-Smtp-Source: AK7set9gxDhFlEGDFsa6Nnq8IgXvHNGx0RCGgFB/ki4t8DJnqK6r6G1jbWWuBg5nztmm5N6A5y98Y2Lq/riJT0mpsi4=
X-Received: by 2002:a50:d08d:0:b0:4bf:bec0:b865 with SMTP id
 v13-20020a50d08d000000b004bfbec0b865mr14448904edd.3.1678459215340; Fri, 10
 Mar 2023 06:40:15 -0800 (PST)
MIME-Version: 1.0
References: <CAOSpxdZm91QVn9tEjKeoXC79rxNNwkeDz2qWzgPTakJ4k6Jo2w@mail.gmail.com>
 <20230310124549.119027-1-andrej.valek@siemens.com> <042af09c08da4dad435693220f221a70548a2a91.camel@siemens.com>
In-Reply-To: <042af09c08da4dad435693220f221a70548a2a91.camel@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 10 Mar 2023 04:40:04 -1000
Message-ID: <CAOSpxdZ_iOt_Z17ZYQry5bRTxMt97s5oPJGxgHEpL_xUtu66JQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] curl: Fix CVE CVE-2021-22897
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 14:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178337

On Fri, Mar 10, 2023 at 3:09=E2=80=AFAM Valek, Andrej <andrej.valek@siemens=
.com> wrote:
>
> Hello again,
>
> Looks like that this patch showed some isses/open points:
> - CVE-2021-22897 is white-listed already, but in hardknott is fixed
> already
> https://github.com/openembedded/openembedded-core/blob/hardknott/meta/rec=
ipes-support/curl/curl/CVE-2021-22897.patch
>  - So do we have to ignore the patch, or apply and remove the
> whitelist, or remove patch from hardknott?

Hardknott is no longer being maintained, so nothing needs to be done there.

Since this is a Windows only bug ("It can only trigger when Schannel
is used, which is the native TLS library in Microsoft Windows") I
think the existing whitelist is fine and we don't need this additional
patch.

> - Https certificate at yocto.io has been expired ;)

Can you give me the url which is giving the expired certificate error?

Thanks!

Steve

> Regards,
> Andrej
>
> On Fri, 2023-03-10 at 13:45 +0100, Andrej Valek wrote:
> > https://curl.se/docs/CVE-2021-22897.html
> >
> > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > ---
> >  .../curl/curl/CVE-2021-22897.patch            | 73
> > +++++++++++++++++++
> >  meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2021-
> > 22897.patch
> >
> > diff --git a/meta/recipes-support/curl/curl/CVE-2021-22897.patch
> > b/meta/recipes-support/curl/curl/CVE-2021-22897.patch
> > new file mode 100644
> > index 0000000000..cbd6c067ce
> > --- /dev/null
> > +++ b/meta/recipes-support/curl/curl/CVE-2021-22897.patch
> > @@ -0,0 +1,73 @@
> > +From bbb71507b7bab52002f9b1e0880bed6a32834511 Mon Sep 17 00:00:00
> > 2001
> > +From: Daniel Stenberg <daniel@haxx.se>
> > +Date: Fri, 23 Apr 2021 10:54:10 +0200
> > +Subject: [PATCH] schannel: don't use static to store selected
> > ciphers
> > +
> > +CVE-2021-22897
> > +
> > +Bug: https://curl.se/docs/CVE-2021-22897.html
> > +
> > +Upstream-Status: Backport
> > +[
> > https://github.com/curl/curl/commit/bbb71507b7bab52002f9b1e0880bed6a3
> > 2834511]
> > +
> > +CVE: CVE-2021-22897
> > +
> > +Signed-off-by: Daniel Stenberg <daniel@haxx.se>
> > +Signed-off-by: Khairul Rohaizzat Jamaluddin
> > <khairul.rohaizzat.jamaluddin@intel.com>
> > +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > +---
> > + lib/vtls/schannel.c | 9 +++++----
> > + lib/vtls/schannel.h | 3 +++
> > + 2 files changed, 8 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/lib/vtls/schannel.c b/lib/vtls/schannel.c
> > +index 8c25ac5dd5a5..dba7072273a9 100644
> > +--- a/lib/vtls/schannel.c
> > ++++ b/lib/vtls/schannel.c
> > +@@ -322,12 +322,12 @@ get_alg_id_by_name(char *name)
> > + }
> > +
> > + static CURLcode
> > +-set_ssl_ciphers(SCHANNEL_CRED *schannel_cred, char *ciphers)
> > ++set_ssl_ciphers(SCHANNEL_CRED *schannel_cred, char *ciphers,
> > ++                int *algIds)
> > + {
> > +   char *startCur =3D ciphers;
> > +   int algCount =3D 0;
> > +-  static ALG_ID algIds[45]; /*There are 45 listed in the MS
> > headers*/
> > +-  while(startCur && (0 !=3D *startCur) && (algCount < 45)) {
> > ++  while(startCur && (0 !=3D *startCur) && (algCount < NUMOF_CIPHERS))
> > {
> > +     long alg =3D strtol(startCur, 0, 0);
> > +     if(!alg)
> > +       alg =3D get_alg_id_by_name(startCur);
> > +@@ -566,7 +566,8 @@ schannel_connect_step1(struct connectdat
> > +     }
> > +
> > +     if(SSL_CONN_CONFIG(cipher_list)) {
> > +-      result =3D set_ssl_ciphers(&schannel_cred,
> > SSL_CONN_CONFIG(cipher_list));
> > ++      result =3D set_ssl_ciphers(&schannel_cred,
> > SSL_CONN_CONFIG(cipher_list),
> > ++                               BACKEND->algIds);
> > +       if(CURLE_OK !=3D result) {
> > +         failf(data, "Unable to set ciphers to passed via
> > SSL_CONN_CONFIG");
> > +         return result;
> > +diff --git a/lib/vtls/schannel.h b/lib/vtls/schannel.h
> > +index 2952caa1a5a1..77853aa30f96 100644
> > +--- a/lib/vtls/schannel.h
> > ++++ b/lib/vtls/schannel.h
> > +@@ -70,6 +70,8 @@ CURLcode Curl_verify_certificate(struct
> > + #endif
> > + #endif
> > +
> > ++#define NUMOF_CIPHERS 45 /* There are 45 listed in the MS headers
> > */
> > ++
> > + struct curl_schannel_cred {
> > +   CredHandle cred_handle;
> > +   TimeStamp time_stamp;
> > +@@ -101,6 +103,7 @@ struct ssl_backend_data {
> > + #ifdef HAS_MANUAL_VERIFY_API
> > +   bool use_manual_cred_validation; /* true if manual cred
> > validation is used */
> > + #endif
> > ++  ALG_ID algIds[NUMOF_CIPHERS];
> > + };
> > + #endif /* EXPOSE_SCHANNEL_INTERNAL_STRUCTS */
> > +
> > diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-
> > support/curl/curl_7.69.1.bb
> > index ea36c0bd3d..384719dd15 100644
> > --- a/meta/recipes-support/curl/curl_7.69.1.bb
> > +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> > @@ -19,6 +19,7 @@ SRC_URI =3D
> > "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> >             file://CVE-2020-8286.patch \
> >             file://CVE-2021-22876.patch \
> >             file://CVE-2021-22890.patch \
> > +           file://CVE-2021-22897.patch \
> >             file://CVE-2021-22898.patch \
> >             file://CVE-2021-22924.patch \
> >             file://CVE-2021-22925.patch \
>

