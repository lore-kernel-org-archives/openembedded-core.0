Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59C3C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 16:57:57 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.122.1652461070494741781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 09:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=bY4ZFpR5;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id kq17so17418053ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 09:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iO11//YtStvOrbrNAxcfEXepIG5ZypWabNRktGDXAjE=;
        b=bY4ZFpR5Q5iEypFgF/bD5jtkEn0qrHImdg1AUjEaKQ7fDdf5LDf9yvhBCiEo+KBiAH
         FIF7wNyeoDRDiLILEFhzxM8cizZ5+az4pPG6ym6NbIvt/6g6rgf1P75NCHAdn6kI7fVH
         9D1JgnNLgh/gMLaPm3J0dKMIMILFNk5dztrs192RSYjVYfvs6F2S25UvGpbOpHnkcL92
         av7zpcotJrJsP04Fda53KgXX0ICcmO8+gQDi+TDhA1PgbPzvqr19w7DAvEGbKtUW6D6U
         y3TVOa+2LQo889xDS/AzThId2zB6jWoq7IfNFAoSZ3I2dJ9daBFjpde2TVdVuusAneV+
         vqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iO11//YtStvOrbrNAxcfEXepIG5ZypWabNRktGDXAjE=;
        b=TOnKPKK7rR41VB26Y6HI0EsIhIuOHtoKn+88/q1eIsrzRvVAF/PKFfQkTxx9284hEs
         Yue2OIEYopPq4AMPPp1KndBNlj/cghJdGz1D+uZzk9n860zo8boiwlJhcnar36JcnPp7
         ZtrxQdsAudmm3vQQIeOV3zxLswXxew1ij3ZInBxIuMi8zied9atn195O5G8NoD5VF8vj
         /0RnpkVRlZQMuKo9WSG2fkilkgUQ83aZ58F+6/6LrpLAxTkhL6WabvysZCVR1QmZ0+5D
         QvOhWR87+BqDqYVkZXtfUmvn1IDmMVPKjLD4rFPxhUsBLhiQDzK0qT9MrH85TgDzeUTv
         LzWw==
X-Gm-Message-State: AOAM530wyBBYDeCAv2tXD3kvtQhSpOTeAw+fEU/8x7Vf7H9G65jr1iqL
	8khXX0BzG0TlxIQLJn9wAVLUW41CODh7orPxrjLorg==
X-Google-Smtp-Source: 
 ABdhPJyS0gsPhV68Ib2uyCsNTZYTynVvDJSmLa4sncaItJOGA1XejTPLSGHfT+T1f5Hqa8l0OH22puKCms565+eR2SI=
X-Received: by 2002:a17:907:7e9f:b0:6f6:e9ce:9939 with SMTP id
 qb31-20020a1709077e9f00b006f6e9ce9939mr5071168ejc.456.1652461068757; Fri, 13
 May 2022 09:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220513133521.904120-1-davide.gardenal@huawei.com>
 <CAOSpxdZ4qjcbjsvB8v8P7YtUr=0HSxHnrcbxAkYZHkRVK9PGrg@mail.gmail.com>
 <98AF0B2F-EA7D-4ED4-9B92-F4CDAE9A2196@gmail.com>
In-Reply-To: <98AF0B2F-EA7D-4ED4-9B92-F4CDAE9A2196@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 13 May 2022 06:57:37 -1000
Message-ID: 
 <CAOSpxda9-0Pi8FmAYdcpu1VuwiYQSqxaU4EcOym8V+QNyay3Sw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH v2] openssl: minor security upgrade
 3.0.2 -> 3.0.3
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Davide Gardenal <davide.gardenal@huawei.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 16:57:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165581

On Fri, May 13, 2022 at 5:56 AM Davide Gardenal
<davidegarde2000@gmail.com> wrote:
>
> I see, I=E2=80=99m sorry but I haven=E2=80=99t checked master because I=
=E2=80=99m working on kirkstone right now, next time I=E2=80=99ll do it.

No worries.  If you don't catch it I probably will :-)

BTW, I really appreciate your help with CVEs!

Steve

>
> Davide
>
> Il giorno 13 mag 2022, alle ore 17:53, Steve Sakoman <steve@sakoman.com> =
ha scritto:
>
> On Fri, May 13, 2022 at 3:35 AM Davide Gardenal
> <davidegarde2000@gmail.com> wrote:
>
>
> This minor version include fixes for several CVEs
>
> CVE: CVE-2022-1292
> CVE: CVE-2022-1343
> CVE: CVE-2022-1434
> CVE: CVE-2022-1473
>
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
> Updates:
> -v2 add kirkstone tag in the title
>
>
> Actually, since master is also at version 3.0.2 this patch will have
> to go to master first. I'll then backport it.
>
> In cases like this you should probably tag [master][kirkstone] so
> Richard and I both take notice.
>
> Steve
>
> ---
> .../openssl/{openssl_3.0.2.bb =3D> openssl_3.0.3.bb} | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> rename meta/recipes-connectivity/openssl/{openssl_3.0.2.bb =3D> openssl_3=
.0.3.bb} (99%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.0.3.bb
> similarity index 99%
> rename from meta/recipes-connectivity/openssl/openssl_3.0.2.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.0.3.bb
> index a809666aa7..fd88ae807d 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
> @@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk =3D " \
> file://environment.d-openssl.sh \
> "
>
> -SRC_URI[sha256sum] =3D "98e91ccead4d4756ae3c9cde5e09191a8e586d9f4d50838e=
7ec09d6411dfdb63"
> +SRC_URI[sha256sum] =3D "ee0078adcef1de5f003c62c80cc96527721609c6f3bb42b7=
795df31f8b558c0b"
>
> inherit lib_package multilib_header multilib_script ptest perlnative
> MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
> --
> 2.32.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165563): https://lists.openembedded.org/g/openembedde=
d-core/message/165563
> Mute This Topic: https://lists.openembedded.org/mt/91080703/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

