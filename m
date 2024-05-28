Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD83C25B7C
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 11:42:52 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.19856.1716896562676004531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 04:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hPGRH+9m;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5295c65d3fdso3753952e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716896561; x=1717501361; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IDA4/SoMZTHs6/ejCNfhgeuLynG2vX314fPDyo2cJx0=;
        b=hPGRH+9mks7HuYhgONBOgSqXZpsQZGzaCF3HL6rMmJPccdDKqh6Jpf3fBCuIMC6RpY
         epNougxpta6MOAWbgjtcQPOAEk/6NoTxMuE0D4+75T8zfoa8l02kaaMa7rFZtvrkoLh8
         B5E8T7O4keuEEx1q3LEDANfUuAj9a46NNH/Rg/1wOwD9IvRFNsYdqh+uRimPWaFAxfZF
         4tcQQu1x3ZzFzkkMdbS32sKTv6irsxgpHSrxJYWPxcK3q0auIv2wZmt45fRlBDTG8+u3
         IROlax/kRGVQVrDIrlBzaHmlQuWBU/0zDR1IKFMsMsvklLT0hXYt1oQg2wVzB66xJPol
         Zh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716896561; x=1717501361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDA4/SoMZTHs6/ejCNfhgeuLynG2vX314fPDyo2cJx0=;
        b=tWwKL5ugX+X70kELHkuKW4GPpDVdwfTKG6e+02dzXdYwVGY/zDcxW8zIfgg6SOLThy
         9GNZYpMv4f1oCJxYPQcsyTvPGnbnw+C8ErgwzHaUbHvLkdmxA66NNm58jX4nVuR5A+8r
         Bxj8YOqdghGkXwA6SJY6lDn6oQ63HFdpX83q0uT50wmI3oyc/pC/NZ3vbb+k9m0LfRMJ
         7b8tHaL/go8S6qPGyhabuWsewf9UdVK3Xsvj5Lcv8laXAJ6nandI6EhqtDeiO2RjNpnq
         GojT9Qdz1P+ezdeIzfeUZYnAJicQA3bahZNEqDonNqe52Jzgq5RAhTShJflFpC3iSxzw
         kuVg==
X-Gm-Message-State: AOJu0YyDPZx2pkvLmtT8WCHgUmvTmq30/MkvwV7XKczOOeMUvfiBXolI
	59oEPD+qdwosqrfckDINIS3sBwszmZ6m5vpJUDezLJWk52kAt4nnVLpMVw==
X-Google-Smtp-Source: AGHT+IFKZlys+oNJ7RgTmvACEVWBvHI+tsN34SDhPgOwlQj2ZkT9Ooji+jJZnyr9GcMA3ZZ6yIKTaA==
X-Received: by 2002:a05:6512:48d2:b0:522:2990:7134 with SMTP id 2adb3069b0e04-527f14d560emr4062408e87.33.1716896560357;
        Tue, 28 May 2024 04:42:40 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529a62f2ff1sm691484e87.225.2024.05.28.04.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 04:42:39 -0700 (PDT)
Date: Tue, 28 May 2024 13:48:52 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/2] bootimg-partition: break out code to a common
 library.
Message-ID: <ZlXEpFcCPEymvBbl@gmail.com>
References: <20240528090832.725884-1-marcus.folkesson@gmail.com>
 <20240528090832.725884-2-marcus.folkesson@gmail.com>
 <5dbcb41f-503f-499b-bcec-882c54008d49@cherry.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q1bsBcEBYa7dw8f+"
Content-Disposition: inline
In-Reply-To: <5dbcb41f-503f-499b-bcec-882c54008d49@cherry.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 11:42:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199971


--q1bsBcEBYa7dw8f+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

On Tue, May 28, 2024 at 01:01:29PM +0200, Quentin Schulz wrote:
> Hi Marcus,
>=20
> On 5/28/24 11:08 AM, Marcus Folkesson wrote:
> > Break out the code that parse IMAGE_BOOT_FILES to a common library.
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> > ---
> >=20
> > Notes:
> >      v3:
> >         - Removed unnecessary "import glob"
>=20
> Ah, there was a misunderstanding here, the "wrong" import glob got removed
> :)

Ah, of course.

>=20
> >         - Explicitely tell that bootfiles_populate() returns a tuple
> >=20
> >   meta/lib/oe/bootfiles.py                      | 56 +++++++++++++++++++
> >   .../wic/plugins/source/bootimg-partition.py   | 39 +------------
> >   2 files changed, 59 insertions(+), 36 deletions(-)
> >   create mode 100644 meta/lib/oe/bootfiles.py
> >=20
> > diff --git a/meta/lib/oe/bootfiles.py b/meta/lib/oe/bootfiles.py
> > new file mode 100644
> > index 0000000000..666141df4e
> > --- /dev/null
> > +++ b/meta/lib/oe/bootfiles.py
> > @@ -0,0 +1,56 @@
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +# Copyright (C) 2024 Marcus Folkesson
> > +# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
> > +#
> > +# Utility functions handling boot files
> > +#
> > +# Look into deploy_dir and search for boot_files.
> > +# Returns a list of tuples with (original filepath relative to
> > +# deploy_dir, desired filepath renaming)
> > +#
> > +# Heavily inspired of bootimg-partition.py
> > +#
> > +def get_boot_files(deploy_dir, boot_files):
> > +    import re
> > +    import os
> > +
>=20
> We need from glob import glob here........
>=20
> > +    if boot_files is None:
> > +        return None
> > +
> > +    # list of tuples (src_name, dst_name)
> > +    deploy_files =3D []
> > +    for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
> > +        if ';' in src_entry:
> > +            dst_entry =3D tuple(src_entry.split(';'))
> > +            if not dst_entry[0] or not dst_entry[1]:
> > +                raise ValueError('Malformed boot file entry: %s' % src=
_entry)
> > +        else:
> > +            dst_entry =3D (src_entry, src_entry)
> > +
> > +        deploy_files.append(dst_entry)
> > +
> > +    install_files =3D []
> > +    for deploy_entry in deploy_files:
> > +        src, dst =3D deploy_entry
> > +        if '*' in src:
> > +            # by default install files under their basename
> > +            entry_name_fn =3D os.path.basename
> > +            if dst !=3D src:
> > +                # unless a target name was given, then treat name
> > +                # as a directory and append a basename
> > +                entry_name_fn =3D lambda name: \
> > +                                os.path.join(dst,
> > +                                             os.path.basename(name))
> > +
> > +            srcs =3D glob(os.path.join(deploy_dir, src))
> > +
>=20
> .... otherwise this won't work (it'll I believe but only if the python
> module that calls it imports glob itself).

Yep, it did, that was why my testing did not catch it.

>=20
> > +            for entry in srcs:
> > +                src =3D os.path.relpath(entry, deploy_dir)
> > +                entry_dst_name =3D entry_name_fn(entry)
> > +                install_files.append((src, entry_dst_name))
> > +        else:
> > +            install_files.append((src, dst))
> > +
> > +    return install_files
> > diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scri=
pts/lib/wic/plugins/source/bootimg-partition.py
> > index 1071d1af3f..b22a448b65 100644
> > --- a/scripts/lib/wic/plugins/source/bootimg-partition.py
> > +++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
> > @@ -18,6 +18,8 @@ import re
> >   from glob import glob
>=20
> It's this glob we don't need anymore, because it would then be imported by
> the python lib added in this very patch.
>=20
> Cheers,
> Quentin


Thanks again Quentin.
I will delay v4 a day or two to catch more comments.


Best regards,
Marcus Folkesson

--q1bsBcEBYa7dw8f+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmZVxJ8ACgkQiIBOb1ld
UjIYcRAAwv0zLZVYtaIp8ymyWbEZ/LYjCnsYqSRMLFP43wZZ6zyrMCWn/Om61fmx
xR/ltzeDzZHG184CfyBIMF3/0QiTBi0mByVWPqCA40XgyWLX09citQCtalZsL0E7
89JrRk0eQ+PN+yNIEk9P0yOCdTJ/xgq8eIItOu7isyfxwwVisjpg4vMK3+bPypS5
IyELMt9Ac/gXZxEquQsyz5SFcarW/hvGwUJjDtUrgpO+mTqsRWP2oeaY763TRoM+
6beS6YCWMqlrRYd8Oc2A/vAaTtQcrRyxixcAdlWn+1Pra0lyalCFo2SU2HX355bw
M5BOXZVNpgt7E407mu5Tm8IvhZWtcUwkdjQnXwJJUoFIQ1a8viyOW5gBRlyEVaD/
BtpGhTG/UylQC5j1owYDGBia6C28SuNDIIAClQh6dCn6jOvNN3QyYoxAeeBtN57F
uqWHT89RfIUmWIUMnpBAjuYGbb4RweKVCx+Ef0cDxJQ1BVCrk25vHEM+xjQqv8er
ZWWzoJUIzoco0Huo8MLSHkmGGOivZ0jlI+FtMBp/G+G/Pjqr77whB/23Nb8iudn3
n30ACWAs3MLGlWoM8XtJmXl8ieNEHz6YH4vDBPoXDiNan7epQWWClPUJCtJ6j+DC
8mxwIuitQWhkA1pFKz843zZGycAC0Euv11NmROSSLtZbjMTbb4Y=
=AcS3
-----END PGP SIGNATURE-----

--q1bsBcEBYa7dw8f+--

