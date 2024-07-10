Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDBAC3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 14:03:11 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.15252.1720620183010400295
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 07:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BzEws22t;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4266fd39527so16474425e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 07:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720620181; x=1721224981; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9SKbPbu1Nh5No0UWb8Y2WMyqxlMMU6dDHChQVMSBMg=;
        b=BzEws22toQ9/S6R99WFzruRQIXDwp0VScdj2ViDb2/UrKA1a0Kte+SBdQ+awgd1x2i
         Tztkxc135NRKOZGFFy1jOZr7+iJcEBS+Kui5i4Yx2aIDUIbu4hIQ7athXjinFHNrlKFU
         GNu/TviK8nzw3Rq4pi+JBrtV4yi7j9f7soQ38RKtooeekKyH3EmEnhQAtgAiywO8puJ2
         CDNkKklfsyLIIlVdKjazGGbAj8AmNKbJcWfvu+uD6kZSoKGjrpUpMHSvuDiTQxx2VPoo
         5M/OPd5fslyEp1lk9Eqlt9FOgWCGvd+AqWmBDvsOXHr8L0Ghlzo4+mOafO+xIyn89Ktk
         WJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720620181; x=1721224981;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E9SKbPbu1Nh5No0UWb8Y2WMyqxlMMU6dDHChQVMSBMg=;
        b=GZ+Cr/XiK+tMX81aBQZfBaEGbM2Y8JCvce6RlTAUW8meDRlTPDgfoJVtWazgW9NEF/
         Z6NK3q5j1xFr7bx0sdGCCKnzzcR9Kw3qQVZUgwNYXjQS7s09MW7dN7CAIH2OsrUBFm9h
         YAr2sC6gEO0SlM69jWZfZWucNPBrpAhn4mEpnWovVnL6sKadMbdzvTxWkiAOXn4t+FCQ
         l6O5s85Vf3LMhF17IQ5p0r/wRRc6pNRjY1Stjg3cVwhbkjg72hOQHpGnszYTHtJGuHF3
         ma3+feUEz325FXm8kGflEY3azhgSHSRBnqMqmc+DakazH1zGYS5MBjFY6+Vo48bNlUUb
         BRzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI5Pcn+cMvjaIo9ca2le9sefaGoS/QW7Ztz2rfbNVp5mSkh6hA/OOsM4kM1qdWIryobicdShD2tWx7tk9I07ghZljmmDhtz58dg4HfXT4WJG8ZEXI9ScRY
X-Gm-Message-State: AOJu0Yy2GQlH66demMBBHN5yMde5MM64ymbXjzsBwbGrvoLfoeldd7Ec
	OHbweo7LCwg8nl62BKjGrd/GIfMkI5ckx6DsE3s1WknRJF490O0M
X-Google-Smtp-Source: AGHT+IEvB6DEq1uZz2A/fRdiS0sakcMM2YFm7z/bc28Dy8IkqjSterccYrmrAh29C2s+PGxO8M/3lw==
X-Received: by 2002:a05:600c:3644:b0:426:5cef:ee41 with SMTP id 5b1f17b1804b1-426708f1928mr36136835e9.38.1720620181067;
        Wed, 10 Jul 2024 07:03:01 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f741fa6sm84528635e9.45.2024.07.10.07.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 07:03:00 -0700 (PDT)
Message-ID: <9fa8d6ed69995cfcbcdf41142c3d9f37e21c6a6f.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 07/14] kernel-fitimage: fix external dtb check
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2024 16:02:59 +0200
In-Reply-To: <0508331a-0f95-4507-9c3e-cb91e2ff0e84@kernel.crashing.org>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
	 <20240704071013.2982700-8-adrian.freihofer@gmail.com>
	 <0508331a-0f95-4507-9c3e-cb91e2ff0e84@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 14:03:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201733

On Tue, 2024-07-09 at 14:48 -0500, Mark Hatle wrote:
>=20
>=20
> On 7/4/24 2:09 AM, Adrian Freihofer wrote:
> > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> >=20
> > If EXTERNAL_KERNEL_DEVICETREE and dtb_image_sect are empty
> > variables
> > dtb_path ends up as "/" which is available on most Unix systems but
> > probably not the dtb_path which is needed here. Checking for a file
> > makes more sense and also solves the issue with the "/".
> >=20
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> > =C2=A0 meta/classes-recipe/kernel-fitimage.bbclass | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes-recipe/kernel-fitimage.bbclass
> > b/meta/classes-recipe/kernel-fitimage.bbclass
> > index 6e6898e5f6f..664ebc65d7c 100644
> > --- a/meta/classes-recipe/kernel-fitimage.bbclass
> > +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> > @@ -429,7 +429,7 @@ fitimage_emit_section_config() {
> > =C2=A0=C2=A0	fi
> > =C2=A0=20
> > =C2=A0=C2=A0	dtb_path=3D"${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect=
}"
> > -	if [ -e "$dtb_path" ]; then
> > +	if [ -f "$dtb_path" ]; then
> > =C2=A0=C2=A0		compat=3D$(fdtget -t s "$dtb_path" / compatible |
> > sed 's/ /", "/g')
> > =C2=A0=C2=A0		if [ -n "$compat" ]; then
> > =C2=A0=C2=A0			compatible_line=3D"compatible =3D
> > \"$compat\";"
>=20
> I can understand avoiding directories with this, but I've definitely
> seen cases=20
> where the dtb_path is pointing to a symbolic link.
>=20
> Would [ -f "$dtb_path" -o -L "$dtb_path" ]; (or similar) solve this?

Thank you for the re-view. I will fix this with v2.
Adrian

>=20
> --Mark
>=20
> >=20
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#201511):
> > https://lists.openembedded.org/g/openembedded-core/message/201511
> > Mute This Topic:
> > https://lists.openembedded.org/mt/107033892/3616948
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > mark.hatle@kernel.crashing.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20


