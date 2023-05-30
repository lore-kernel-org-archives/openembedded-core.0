Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1485C77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 14:47:17 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.1040.1685458029978241725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 07:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=cGFpVl83;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f6da07ff00so48154485e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 07:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685458028; x=1688050028;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UU2HT1zKX+/7ehvNdPMrcfxnSDvqluuqpBqP+g3gwj8=;
        b=cGFpVl83wsU5EMHTnDzIKkQuND+JRr1C6VNd7XLHfMcWdiZoP2JHsyL8GpYwkNbXOc
         3vM5pZreu4tofT/m8QgNBVFSXxacEzZf3ScIUDVdvDcoz55mm1k+zb/r6vc307foNf5X
         j5iXLsHBjAhA/Bq9fTbpd7vOBh4EHICoyBTr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685458028; x=1688050028;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UU2HT1zKX+/7ehvNdPMrcfxnSDvqluuqpBqP+g3gwj8=;
        b=QAPgwQ8kosfnPn9Gw7uFJZAb/Ld4pssTNpwavvAi52mTcIpcFUz57eFQz/HBWq3hEi
         mwrGohQDWFPHx/yMlSaxmsOee5CdGinFfdCDEE3nFOjsqHOefvg1CIi8/jTuS6KsxSJ5
         ykfgbr9cUmBgezBJh7ynkc+SnXTZQPFl5kW4HVRIo0gw2AHunnXpw9aKMajmPGDVhC7P
         jaWr/EeEsHbVQrOLWeoVHWCoxxD1p+hbiY3wstixAakwbH6QqasGwPHUlLdQSP9RhQsw
         lsaUsTiNGZPq7Mfq24kmK+1QSOwa+kUlivSZdkZGa2L3XE0Vn5Eitlxq/dIEjOwdzX6A
         LfCg==
X-Gm-Message-State: AC+VfDyRYa8I8RfKgU8p8xRtBkcy8Dh85HfrUJlxgnIWdmwkj9MeR72u
	GjYwRmxbGDt9P2gekbBbJqHlSQ==
X-Google-Smtp-Source: ACHHUZ6BJUUGXpAdKsGFosCXqJ0TZakyS+ZG9zOtBwgFLQr5xg0E5thlP2MBgyGK5q8KA6qZMVRreA==
X-Received: by 2002:a7b:cc05:0:b0:3f4:2b98:428f with SMTP id f5-20020a7bcc05000000b003f42b98428fmr1864373wmh.39.1685458028244;
        Tue, 30 May 2023 07:47:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3? ([2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3])
        by smtp.gmail.com with ESMTPSA id c21-20020a7bc855000000b003f1958eeadcsm21083904wml.17.2023.05.30.07.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:47:07 -0700 (PDT)
Message-ID: <2e7a44299b2b66447024bd615cdaa938fc3d29c3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] u-boot: do_compile depends on the value of
 UBOOT_LOCALVERSION
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2023 15:47:07 +0100
In-Reply-To: <20230529160619.GG9226@denix.org>
References: <20230528171515.832179-1-denis@denix.org>
	 <5e1bf6762dd751f6bf5c5e2463fb91da34efe563.camel@linuxfoundation.org>
	 <20230529160619.GG9226@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 14:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181932

On Mon, 2023-05-29 at 12:06 -0400, Denys Dmytriyenko wrote:
> On Mon, May 29, 2023 at 01:41:00PM +0100, Richard Purdie wrote:
> > On Sun, 2023-05-28 at 17:15 +0000, Denys Dmytriyenko wrote:
> > > UBOOT_LOCALVERSION is often used to pass SCM commit SHA to the code
> > > via populating .scmversion file at the start of do_compile(). Let's
> > > explicitly mark do_compile() as depending on the the value of this
> > > variable to avoid errors like this:
> > >=20
> > > $ echo 'UBOOT_LOCALVERSION =3D "${SRCPV}"' >> conf/local.conf
> > > $ bitbake u-boot
>=20
> ^^^^^^^^
>=20
>=20
> > > Loading cache: 100%
> > > Loaded 0 entries from dependency cache.
> > > WARNING: /OE/poky-master/meta/recipes-bsp/u-boot/u-boot_2023.04.bb: E=
xception during build_dependencies for do_compile
> > > WARNING: /OE/poky-master/meta/recipes-bsp/u-boot/u-boot_2023.04.bb: E=
rror during finalise of /OE/poky-master/meta/recipes-bsp/u-boot/u-boot_2023=
.04.bb
> > > ERROR: ExpansionError during parsing /OE/poky-master/meta/recipes-bsp=
/u-boot/u-boot_2023.04.bb
> > > Traceback (most recent call last):
> > >   File "Var <SRCPV>", line 1, in <module>
> > >   File "/OE/poky-master/bitbake/lib/bb/fetch2/__init__.py", line 784,=
 in get_srcrev(d=3D<bb.data_smart.DataSmart object at 0x7fa0604a7100>, meth=
od_name=3D'sortable_revision'):
> > >          if not scms:
> > >     >        raise FetchError("SRCREV was used yet no valid SCM was f=
ound in SRC_URI")
> > >=20
> > > bb.data_smart.ExpansionError: Failure expanding variable SRCPV, expre=
ssion was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError:=
 Fetcher failure: SRCREV was used yet no valid SCM was found in SRC_URI
> > > The variable dependency chain for the failure is: SRCPV -> UBOOT_LOCA=
LVERSION -> do_compile
> > >=20
> > > ERROR: Parsing halted due to errors, see error messages above
> > >=20
> > > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > > ---
> > >  meta/recipes-bsp/u-boot/u-boot.inc | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-=
boot/u-boot.inc
> > > index b3482dcef3..ec8108f5c9 100644
> > > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > > @@ -23,6 +23,7 @@ PACKAGECONFIG[openssl] =3D ",,openssl-native"
> > >  # u-boot build system and appended to the u-boot version.  If the .s=
cmversion
> > >  # file already exists it will not be overwritten.
> > >  UBOOT_LOCALVERSION ?=3D ""
> > > +do_compile[vardepvalue] =3D "${UBOOT_LOCALVERSION}"
> > > =20
> > >  require u-boot-configure.inc
> > > =20
> >=20
> > How would I reproduce this?
>=20
> The instructions are in the description above.

Sorry, I'd assumed you'd need a specific target MACHINE so I somehow
didn't think they were complete.
>=20

> > The fix looks a bit like a workaround and I'd like to understand what
> > is really going on here.
>=20
> This started happening recently after your change that empties SRC_URI fo=
r=20
> code parser cache handling in BB_HASH_CODEPARSER_VALS, as reported here:
>=20
> https://lists.openembedded.org/g/openembedded-core/message/181726

It would be useful if the commit message had mentioned that!

I suspect the correct fix is to add SRCPV=3Dxxx to
BB_HASH_CODEPARSER_VALS

Could you see if that works instead?

Cheers,

Richard


