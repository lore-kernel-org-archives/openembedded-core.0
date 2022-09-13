Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5C5ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 20:34:38 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.200.1663101276042012953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 13:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C/hwWEMa;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-127dca21a7dso35365216fac.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 13:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=OwZLS2aacFQ7g6Th9ZYc64K9W5WHDztsKOaOb4W6pQA=;
        b=C/hwWEMa3mdnK4kddPpj8fcZEcGPpq0wDHAUWPCLS/IQg/Ir7rorgWJM439/rmDtIl
         54wwc3AgXK7OcR49thkUDBl2nCGQ4tpfBGQJG+joKEnG23fKb9ToNHxUFU9/XAWDkvZb
         2aSIFNzmg2JT9fEUN0DghCsLNjZ9FYMuqr/GHD2zOk41Jbmf5KOLvWD26kvj2foNEvxT
         INOmiyY/vuSAQ7EXLKaoiYPuXCcJwzcmSKPjss3fpZDuEFs2SyVd7BhofPrYKLGLw/YA
         n8DyZIFnYZhvp8/o0Y8MSXVVq+iPyn5Oeh3i4RwLqOEoRQv3QDCdC8bJoVmaJ2gCG/kp
         yutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OwZLS2aacFQ7g6Th9ZYc64K9W5WHDztsKOaOb4W6pQA=;
        b=igrl/zU9WXRSwihwjqWA0Yh4SArQNtIQ83Cu2arI7L6cpYGK5ETgZNCFI0mmPNhtbF
         3344SGzFdCePFpY7y6hAFwcYaGL8FgZ/2qYS+NVXQFd7ZDzwPGWzbq236eRPHmEZ19lj
         Js1j9tWIJnAtzEhHF37YrChO3WojLWlcQXfTGWXK/ytUbphQeX/81wcQ/OyGXVDBR2Z2
         wkCd9LlhywdLHbCZz2w48mIAVl+RnImOng1ozBQBfSP9a+FFa9pbkJzQhUq0InpefY6J
         /puJkknNhD+i5OI8EzFKPoLZj+DSvDbydtrqVo8xDhCG8xPVe/wOrwHQ6InY8NAaStLq
         liNg==
X-Gm-Message-State: ACgBeo1zY5nbz7RJqimtHT553wngCsBT+OcPm+MuLnsKAavfl0I2vgvB
	2D/3r3YJrgQ5IpuDgppvi6wJEFLk7tAcd27OYC8=
X-Google-Smtp-Source: 
 AA6agR7XQx0NKrwlLvDSK12BvZ6MUpck8IiAKUjM5tOh8vQKBFJOQelWDolCvNqEyVXJyx8IoBqmhBySNV1DyicTiR8=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr564832oae.262.1663101275264; Tue, 13
 Sep 2022 13:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220913123741.3416807-1-ecordonnier@snap.com>
 <a29c5799-9964-526d-d9e3-6a4f28cb1bc3@ni.com>
 <CAMKF1srWRB4vLNjtS+aaY=w2wcx-Y+Gt7gMFPVhftWx84+J1RA@mail.gmail.com>
 <CANOoYsMVb9YpfwjTNHv4kSARM15_3T34CA-Ekr=t7P5F0XO4bA@mail.gmail.com>
In-Reply-To: 
 <CANOoYsMVb9YpfwjTNHv4kSARM15_3T34CA-Ekr=t7P5F0XO4bA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Sep 2022 13:34:09 -0700
Message-ID: 
 <CAMKF1soDuVd5A=6kAZDJ_BdYCSMczENfeb1RDTn5Sf65PqiLFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] opkg: enable zstd support
To: Alex Feinman <afeinman@snap.com>
Cc: Alex Stewart <alex.stewart@ni.com>, ecordonnier@snapchat.com,
	openembedded-core@lists.openembedded.org,
	Etienne Cordonnier <ecordonnier@snap.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 20:34:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170611

Thanks for sharing, really appreciate it. How close were compression
rates in numbers ? I think some users might be sensitive to the
archive sizes, if its something
with in acceptable range, I do agree, zstd would be a better default these =
days.

On Tue, Sep 13, 2022 at 1:20 PM Alex Feinman <afeinman@snap.com> wrote:
>
> I do have some numbers. When I was selling this change internally, I did =
a comparison on our internal build.
>
>           Combined write IPK times (=CE=A3 t do_package_write_ipk)
>
> xz         162m 35s
>
> gz         52m 13s
>
> zstd       33m 49s
>
> Compression rate for zstd was closer to xz than to gz but not as good as =
xz. For systems that have to cache packages on the device with limited stor=
age xz might be a better option, but for the bulk of projects zstd is the b=
est choice
>
> Additionally, zstd offers much faster decompression than xz so the rootfs=
 build step that includes unpacking all of the ipks, takes 3m 58s with xz a=
nd 2m 44s with zstd.
>
> One other thing of note - if your build includes debug packages, some may=
 be quite large. E.g. one of our components produces a 2.2 GB debug package=
 (uncompressed). On large files xz requires a disproportionally large amoun=
t of time resulting in 15 minutes needed to simply write ipk for the abovem=
entioned packages, whereas zstd took about 45 sec. For frequent tasks like =
bitbaking a single package this translates in a lot of saved time.
>
> Bottom line - I think making xz a default package compressor was not enti=
rely thought through. gzip or zstd is what the default should be.
>
> One final note: I could not find a reasonable explanation for why opkg-to=
ols require code changes to support a different compressor. BSD tar and GNU=
 tar both can easily accept compressors that they have no idea about (via -=
I option) because all of them provide a unified command line interface for =
use in pipes. If this were done similar to tar, we could have used any comp=
ressor we wanted, including the multithreaded versions (zstdmt)
>
>
> On Tue, Sep 13, 2022 at 12:43 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Tue, Sep 13, 2022 at 12:19 PM Alex Stewart <alex.stewart@ni.com> wrot=
e:
>> >
>> > ACK from me - apart from enabling zstd by default.
>> >
>> > On 9/13/22 07:37, Etienne Cordonnier via lists.openembedded.org wrote:
>> > > This allows the use of zstd for opkg packages by using OPKGBUILDCMD:
>> > > OPKGBUILDCMD =3D "opkg-build -Z zstd"
>> > >
>> > > Signed-off-by: Alex Feinman <afeinman@snap.com>
>> > > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> > > ---
>> > >   meta/recipes-devtools/opkg/opkg_0.6.0.bb | 3 ++-
>> > >   1 file changed, 2 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb b/meta/recipes=
-devtools/opkg/opkg_0.6.0.bb
>> > > index 7b351e8123..e38d9d6f3f 100644
>> > > --- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>> > > +++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>> > > @@ -30,7 +30,7 @@ inherit autotools pkgconfig ptest
>> > >   target_localstatedir :=3D "${localstatedir}"
>> > >   OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
>> > >
>> > > -PACKAGECONFIG ??=3D "libsolv"
>> > > +PACKAGECONFIG ??=3D "libsolv zstd"
>> >
>> > Building in zstd support by default is a little suspect to me.
>> >
>> > Unless I'm mistaken, OE-core will only build xz-compressed IPKs by
>> > default. So zstd support would be unnecessary for a distro integrator
>> > who just uses upstream OE-core.
>> >
>> > For distros which use zstd compression in their packages, I think it
>> > would be more appropriate to overwrite the opkg PACKAGECONFIG in a
>> > .bbappend.
>> >
>>
>> This is perhaps fine. I do wonder if there is some performance
>> comparison data between xz and zstd compressed ipks
>> with opkg, it might help users on making this choice and also if we
>> should consider using
>> zstd by default at some point or not.
>>
>> > Is there something I'm not considering here?
>> >
>> > >
>> > >   PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,\
>> > >       gnupg gpgme libgpg-error,\
>> > > @@ -39,6 +39,7 @@ PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg=
,\
>> > >   PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl"
>> > >   PACKAGECONFIG[ssl-curl] =3D "--enable-ssl-curl,--disable-ssl-curl,=
curl openssl"
>> > >   PACKAGECONFIG[sha256] =3D "--enable-sha256,--disable-sha256"
>> > > +PACKAGECONFIG[zstd] =3D "--enable-zstd,--disable-zstd,zstd"
>> > >   PACKAGECONFIG[libsolv] =3D "--with-libsolv,--without-libsolv,libso=
lv"
>> > >
>> > >   EXTRA_OECONF:class-native =3D "--localstatedir=3D/${@os.path.relpa=
th('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=3D/${@os.path=
.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
>> > >
>> > >
>> > >
>> >
>> > --
>> > Alex Stewart
>> > Software Engineer - NI Real-Time OS
>> > NI (National Instruments)
>> >
>> > alex.stewart@ni.com
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#170608): https://urldefense.proofpoint.com/v2/url?=
u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_170608&d=
=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcS=
Cog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_=
I1CpnrIJ78DBxgMrvY25Gwyh&s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=
=3D
>> > Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=
__lists.openembedded.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDP=
h0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j=
0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3D=
QncdL2I_pCDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&e=3D
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__li=
sts.openembedded.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_=
K-1j0&m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&=
s=3DPxAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D   [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

