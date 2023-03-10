Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCEBC6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 14:57:09 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.21172.1678460221967712359
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 06:57:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0FEEYP0K;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id g3so21595575eda.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 06:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678460220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBgyFgmcwfhhguXxCA3dQNq+iZKCJqn+cBj4IfK22is=;
        b=0FEEYP0K/SRa5Ek5FTuAe1rvvckHtGEmKu5lJS87C75f1qLXx6a2Fhtb+bGzQlLFmS
         DxWxSs49H0aBx1d9DRJoauIIIaYHnYYdmrWJCTE8wvpDaLg7Mc6/2qNB1/5+sAQJzzAU
         soO63nwo2IfltCjPLoWifztHqCqX9EwCmNRGhEpDAq6D4NSTUKuOMz97TQLJGPE09czG
         UBBtwuElfB8vTAchD2MNi2Dk82aBjVm4EslZoLEaixq0qwOulK0cI67eRJt3l2zXSTOR
         Kysm0Q5fz1sPVDwvHsvCYzgOukfYb72Jzl5ZrKd81bz01rt2i2aUKX/2a1QCVQ5fSQs5
         s9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678460220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBgyFgmcwfhhguXxCA3dQNq+iZKCJqn+cBj4IfK22is=;
        b=4sChq1NIdAFoSgm0E1slf8L3vymCMN/rgExZE0lmUndJ0b7XcYVebG7h7KbNX8vmG0
         9A12rXah2vTTs54d8bksvW5tQRhUFyeC5TpM5SHlwc/huSzfN6MKoFFaT/GZw6vzqGYh
         2Rm20lRStMBqnggzmKRa1vEiI1QokmJ922NcjBdNEzWhvJhP7Lvv5oWYRMosX5KNb1Fy
         o/hi0CqjLvv3uQVCoZHFtpxHoZ1uSWBvbUu1sfxcH98t3Xa1nu3rpyc84b4/y4gDFTu9
         2uGFOTUvtpSrzrsYDxRsumw9EZARn4QhwQJXvdnJdHg6nvG505hnw+mBmFZJ3XozHMEW
         J3kg==
X-Gm-Message-State: AO0yUKUZmHXKt9mJsUd77DW5ybMhJOtbChxyzEOWQyz6bN8zxMVJTeo0
	kn9f8gHMecX5s8obTYwkYdVKFmkKBfACjFvBFXYogw==
X-Google-Smtp-Source: AK7set+kwEQX/+2YPiy16SdIgxsF0JpqRT2kxJNDf/0WmixQ4HGSeTG6ff6CHTr2wtnxmp61L+qEydLgTDMnzneUv9k=
X-Received: by 2002:a17:906:5811:b0:8eb:27de:447e with SMTP id
 m17-20020a170906581100b008eb27de447emr12264581ejq.7.1678460220229; Fri, 10
 Mar 2023 06:57:00 -0800 (PST)
MIME-Version: 1.0
References: <CAOSpxdZm91QVn9tEjKeoXC79rxNNwkeDz2qWzgPTakJ4k6Jo2w@mail.gmail.com>
 <20230310124549.119027-1-andrej.valek@siemens.com> <042af09c08da4dad435693220f221a70548a2a91.camel@siemens.com>
 <CAOSpxdZ_iOt_Z17ZYQry5bRTxMt97s5oPJGxgHEpL_xUtu66JQ@mail.gmail.com> <19d1f2a692bec8a39f343f4a357c724a395650b8.camel@siemens.com>
In-Reply-To: <19d1f2a692bec8a39f343f4a357c724a395650b8.camel@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 10 Mar 2023 04:56:49 -1000
Message-ID: <CAOSpxdY7znej3qhB_89mqBDKT8MYPmynp25Ni2-hrvmAM+rzoA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] curl: Fix CVE CVE-2021-22897
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 14:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178339

On Fri, Mar 10, 2023 at 4:49=E2=80=AFAM Valek, Andrej <andrej.valek@siemens=
.com> wrote:
>
> Hello Steve,
>
> - patch
>  - I'm fine with explanation
> - Cert error
>  - for example here:
> https://autobuilder.yocto.io/pub/non-release/patchmetrics/cve-status-dunf=
ell.txt

Thanks, I opened a ticket with the infrastructure support team.

Steve

> On Fri, 2023-03-10 at 04:40 -1000, Steve Sakoman wrote:
> > On Fri, Mar 10, 2023 at 3:09=E2=80=AFAM Valek, Andrej
> > <andrej.valek@siemens.com> wrote:
> > >
> > > Hello again,
> > >
> > > Looks like that this patch showed some isses/open points:
> > > - CVE-2021-22897 is white-listed already, but in hardknott is fixed
> > > already
> > > https://github.com/openembedded/openembedded-core/blob/hardknott/meta=
/recipes-support/curl/curl/CVE-2021-22897.patch
> > >  - So do we have to ignore the patch, or apply and remove the
> > > whitelist, or remove patch from hardknott?
> >
> > Hardknott is no longer being maintained, so nothing needs to be done
> > there.
> >
> > Since this is a Windows only bug ("It can only trigger when Schannel
> > is used, which is the native TLS library in Microsoft Windows") I
> > think the existing whitelist is fine and we don't need this
> > additional
> > patch.
> >
> > > - Https certificate at yocto.io has been expired ;)
> >
> > Can you give me the url which is giving the expired certificate
> > error?
> >
> > Thanks!
> >
> > Steve
> >
> > > Regards,
> > > Andrej
> > >
> > > On Fri, 2023-03-10 at 13:45 +0100, Andrej Valek wrote:
> > > > https://curl.se/docs/CVE-2021-22897.html
> > > >
> > > > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > > > ---
> > > >  .../curl/curl/CVE-2021-22897.patch            | 73
> > > > +++++++++++++++++++
> > > >  meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
> > > >  2 files changed, 74 insertions(+)
> > > >  create mode 100644 meta/recipes-support/curl/curl/CVE-2021-
> > > > 22897.patch
> > > >
> > > > diff --git a/meta/recipes-support/curl/curl/CVE-2021-22897.patch
> > > > b/meta/recipes-support/curl/curl/CVE-2021-22897.patch
> > > > new file mode 100644
> > > > index 0000000000..cbd6c067ce
> > > > --- /dev/null
> > > > +++ b/meta/recipes-support/curl/curl/CVE-2021-22897.patch
> > > > @@ -0,0 +1,73 @@
> > > > +From bbb71507b7bab52002f9b1e0880bed6a32834511 Mon Sep 17
> > > > 00:00:00
> > > > 2001
> > > > +From: Daniel Stenberg <daniel@haxx.se>
> > > > +Date: Fri, 23 Apr 2021 10:54:10 +0200
> > > > +Subject: [PATCH] schannel: don't use static to store selected
> > > > ciphers
> > > > +
> > > > +CVE-2021-22897
> > > > +
> > > > +Bug: https://curl.se/docs/CVE-2021-22897.html
> > > > +
> > > > +Upstream-Status: Backport
> > > > +[
> > > > https://github.com/curl/curl/commit/bbb71507b7bab52002f9b1e0880bed6=
a3
> > > > 2834511]
> > > > +
> > > > +CVE: CVE-2021-22897
> > > > +
> > > > +Signed-off-by: Daniel Stenberg <daniel@haxx.se>
> > > > +Signed-off-by: Khairul Rohaizzat Jamaluddin
> > > > <khairul.rohaizzat.jamaluddin@intel.com>
> > > > +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > > > +---
> > > > + lib/vtls/schannel.c | 9 +++++----
> > > > + lib/vtls/schannel.h | 3 +++
> > > > + 2 files changed, 8 insertions(+), 4 deletions(-)
> > > > +
> > > > +diff --git a/lib/vtls/schannel.c b/lib/vtls/schannel.c
> > > > +index 8c25ac5dd5a5..dba7072273a9 100644
> > > > +--- a/lib/vtls/schannel.c
> > > > ++++ b/lib/vtls/schannel.c
> > > > +@@ -322,12 +322,12 @@ get_alg_id_by_name(char *name)
> > > > + }
> > > > +
> > > > + static CURLcode
> > > > +-set_ssl_ciphers(SCHANNEL_CRED *schannel_cred, char *ciphers)
> > > > ++set_ssl_ciphers(SCHANNEL_CRED *schannel_cred, char *ciphers,
> > > > ++                int *algIds)
> > > > + {
> > > > +   char *startCur =3D ciphers;
> > > > +   int algCount =3D 0;
> > > > +-  static ALG_ID algIds[45]; /*There are 45 listed in the MS
> > > > headers*/
> > > > +-  while(startCur && (0 !=3D *startCur) && (algCount < 45)) {
> > > > ++  while(startCur && (0 !=3D *startCur) && (algCount <
> > > > NUMOF_CIPHERS))
> > > > {
> > > > +     long alg =3D strtol(startCur, 0, 0);
> > > > +     if(!alg)
> > > > +       alg =3D get_alg_id_by_name(startCur);
> > > > +@@ -566,7 +566,8 @@ schannel_connect_step1(struct connectdat
> > > > +     }
> > > > +
> > > > +     if(SSL_CONN_CONFIG(cipher_list)) {
> > > > +-      result =3D set_ssl_ciphers(&schannel_cred,
> > > > SSL_CONN_CONFIG(cipher_list));
> > > > ++      result =3D set_ssl_ciphers(&schannel_cred,
> > > > SSL_CONN_CONFIG(cipher_list),
> > > > ++                               BACKEND->algIds);
> > > > +       if(CURLE_OK !=3D result) {
> > > > +         failf(data, "Unable to set ciphers to passed via
> > > > SSL_CONN_CONFIG");
> > > > +         return result;
> > > > +diff --git a/lib/vtls/schannel.h b/lib/vtls/schannel.h
> > > > +index 2952caa1a5a1..77853aa30f96 100644
> > > > +--- a/lib/vtls/schannel.h
> > > > ++++ b/lib/vtls/schannel.h
> > > > +@@ -70,6 +70,8 @@ CURLcode Curl_verify_certificate(struct
> > > > + #endif
> > > > + #endif
> > > > +
> > > > ++#define NUMOF_CIPHERS 45 /* There are 45 listed in the MS
> > > > headers
> > > > */
> > > > ++
> > > > + struct curl_schannel_cred {
> > > > +   CredHandle cred_handle;
> > > > +   TimeStamp time_stamp;
> > > > +@@ -101,6 +103,7 @@ struct ssl_backend_data {
> > > > + #ifdef HAS_MANUAL_VERIFY_API
> > > > +   bool use_manual_cred_validation; /* true if manual cred
> > > > validation is used */
> > > > + #endif
> > > > ++  ALG_ID algIds[NUMOF_CIPHERS];
> > > > + };
> > > > + #endif /* EXPOSE_SCHANNEL_INTERNAL_STRUCTS */
> > > > +
> > > > diff --git a/meta/recipes-support/curl/curl_7.69.1.bb
> > > > b/meta/recipes-
> > > > support/curl/curl_7.69.1.bb
> > > > index ea36c0bd3d..384719dd15 100644
> > > > --- a/meta/recipes-support/curl/curl_7.69.1.bb
> > > > +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> > > > @@ -19,6 +19,7 @@ SRC_URI =3D
> > > > "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> > > >             file://CVE-2020-8286.patch \
> > > >             file://CVE-2021-22876.patch \
> > > >             file://CVE-2021-22890.patch \
> > > > +           file://CVE-2021-22897.patch \
> > > >             file://CVE-2021-22898.patch \
> > > >             file://CVE-2021-22924.patch \
> > > >             file://CVE-2021-22925.patch \
> > >
>

