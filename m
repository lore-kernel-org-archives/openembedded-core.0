Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA658C27C77
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 06:17:52 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.50429.1718605062507557940
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 23:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FUiPDGQh;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52bc274f438so4318414e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 23:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718605061; x=1719209861; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bFtGNrA9UrIk61H2JY7bdEc+9Vn2M62RS/ljtlnCCNs=;
        b=FUiPDGQhyexYyaaxhr4/fs0gbfQehh3yzuNNKFrWrPWof2nX8DxEukvzGGxQxLdhHl
         oRSoGQSxSbG5Wc/CHEnA+eMTSorJi81ju6ZVZKC6U8oazC1sElqVDMinKWLewMSFJmxZ
         7FJt/otKmSX8eOpUIeEx+4wbfN+T4rcMZ66nS/SlPGz7LTS/yxa380sqZ0MEEL3inxQO
         nFBa7kuF2Ix4DJDFhy96NkXol0RzDDFfThzpUjPu7jRaO4tDdLPYDxtKR0hi52i7ANxU
         R4klJYVseS3EPY/j/ULuxS7KdDuOhZw21O0XJm/UFCU3zkcUUY5inoKZdSdc8kxao2+6
         v8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718605061; x=1719209861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFtGNrA9UrIk61H2JY7bdEc+9Vn2M62RS/ljtlnCCNs=;
        b=Y8EIdEVvFEwW1ND4ao0LF7gNaiXDc0waJ3UDDFsTdnWWb9BddK206vZzhVfa2fGiKS
         IMd5N7ALcLKP0FhJqbIeEUcThB7AGkatpChiE7/6dbd7KJ6J8TpHCW4NKYMmA+6Hm0sR
         XbrNtk2TXOTk11vRmeCupqg6ezcA42wsIBlZXib+JtU5OLjIoIMrDBXba0Pvd76tbMyz
         ear7WLtKQkg7oa+MTeTVXaYO0PY3ibeJr/wqZ5AfeEZWab3uzqe+H3FWsaJYO6v01N6T
         xk4LQQ8Fpco4JMX5Lvh1zqq1ak4GqSFOzdNn9CEMVW6Sv37hAttRvqcGiLLuWivbTluC
         DACQ==
X-Gm-Message-State: AOJu0YwluzW5yLF3BMyWnhOs+uDqfoRb1n1ImnobMmq8HAUwzCh5pnUL
	wqbO4ExPUpb/RpvG6FDQCukQMTK5DbpAnTxQvWAMFzF9RTIC8z+J
X-Google-Smtp-Source: AGHT+IGSRJS7lQ/rzH6AriEOKvdl6iqxJIY2mEPw6M2lAuiDp5mz8Is2xmcQQoRiZSO9MUnAaiTf8g==
X-Received: by 2002:a19:9108:0:b0:52c:8786:8aee with SMTP id 2adb3069b0e04-52ca6e9eca0mr5619762e87.56.1718605060351;
        Sun, 16 Jun 2024 23:17:40 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca287aac1sm1147253e87.212.2024.06.16.23.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 23:17:39 -0700 (PDT)
Date: Mon, 17 Jun 2024 08:23:53 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: kweihmann@outlook.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4 2/2] image-bootfiles.bbclass: new class,
 copy boot files to root filesystem
Message-ID: <Zm_WeSIfRTx9T5o9@gmail.com>
References: <20240530095314.407638-3-marcus.folkesson@gmail.com>
 <20106.1718512009844562919@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L2L4pl54NKwgjKy4"
Content-Disposition: inline
In-Reply-To: <20106.1718512009844562919@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 06:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200785


--L2L4pl54NKwgjKy4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Konrad,

Thanks for your comments!

On Sat, Jun 15, 2024 at 09:26:49PM -0700, Konrad Weihmann via lists.openemb=
edded.org wrote:
> Looking at the combination of the patches and the following
>=20
> + boot_files =3D d.getVar("IMAGE_BOOT_FILES")
> + if boot_files is None:
> + return
> +
> + install_files =3D get_boot_files(deploy_image_dir, boot_files)
> + if install_files is None:
> + bb.warn("Could not find any boot files to install even though IMAGE_BOO=
T_FILES is not empty")
> + return
>=20
> get_boot_files only returns None if boot_files is None, which is caught a=
lready earlier on here, so the bb.warn clause likely will not be reached

You are right. The case i wanted to cover was if install_files was an
empty list.
This could occour if using asterix, e.g. IMAGE_BOOT_FILES =3D "bootfile.*" =
and there is
no "bootfile.*" in the DEPLOY_DIR.

>=20
> Personally a check like `if install_files:` would make more sense

I think I will keep the check but change it to
if not install_files:

Does that make sense?
>=20
> IMAGE_PREPROCESS_COMMAND +=3D "bootfiles_populate;"
>=20
> I'm not sure if that wouldn't raise issues if any of the packages would i=
nstall a file by the same path/name as also set here.
>=20
> In my opinion moving it to a POSTPROCESS function with some checks that i=
t won't overwrite any files/folders might be the better option


Looking through the documentation, I think ROOTFS_POSTPROCESS_COMMAND
could be a candidate.
I'm not sure which one I prefer though.

Check that it won't overwrite any files/folder could be a good thing. I
will implement that and raise an error if the file/folder already
exists.

Best regards,
Marcus Folkesson

--L2L4pl54NKwgjKy4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmZv1nQACgkQiIBOb1ld
UjL0YxAAlHSB4+20f/FlNSKnnHa2NlQa1r2/0yHibA+VHfr5J5RNAQgd4xOdabnU
Jx45ciDUyLqWtJR6M7XZa2lTLBtiemob14wo5DfOiYBQOv1iNCRezNmDcd0JxVeM
CX3s3lImweAhaLkd/gN/qYBooz2U9sKbRX8nQFewR0ZSmR4Q1yeIjdb9tUHY559U
qJYfdgD0k013JpW88JVWtRpkJk5T4WYFCx31LHu1Na4DrXxfbOauE7ueeR2oN2zF
rpjBYU2KkhHazK3Cumf9XtWqyCuQgeiKSH1loz+9kZ2pzvU/3N7w51xiSxUBSjfv
KzK3s2AeC0new7nGoFhs3DZR2EU0/t3XVHrLPaeAdhmQM0zxOjMz7079grgmecVn
lhqKz8DnmG9aPRU+KukyCl3y2L6AlUqX9KMrD38M9XTbNbXKoz6O5WCpIp+6GrXw
nMQ/4Gf0ZBS/8qESx5DZO1uV/O6wu/4eMwhjCwm1vR3XVBnYq0KznphBpGk8OHxX
Dm5X86LQbNWW+dWtVwKxwE8UL3SVhl/Cxd4lnBgW+QCChcRmGpqOddwa0gon4f71
jIDLf/XyuZ1x3ShYoz+/SKIe2n3edlbfqrga89HAuWg4SPlnVHnRyVI33I/2FG/I
fzRr8/07K3R5QaLyL3fR3ZTT4H4hemUMcE8GdR1wbzXPwc4S6ao=
=7+gl
-----END PGP SIGNATURE-----

--L2L4pl54NKwgjKy4--

