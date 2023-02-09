Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30732C636D7
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 09:44:01 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.10572.1675935833182882969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 01:43:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=M56DJbyw;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1675935833;
  x=1707471833;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PH1Ni43xStG/4CFuBhCpgnsKz0qoE9kzt0rqTBYCO7o=;
  b=M56DJbywVaHX8YJ+MZTxfbU012IOlX8hyTUIXT9kBl/JXK0Rp/Qf2b+C
   Dtr6c6Dn5Zs1W0OnRkVYVlsasZMo79ssJVjYC1hRtAMl21qjWttOZXpBC
   NaCQpCFl22u9tXPxI2WUn8ZQN/SOhjUjiwKFTvkB0r5JWVO6VDUaeC44C
   iH5StixNpZWseEp9zuaRGEG2OA7+Ul8weIyrXN4G3oHPe6AfXR75xURAU
   ICpzWMtczYiV5TkacnNzUJaNj9VdPinpsj9gPsCZGKtL5vzSXMq3GA4eT
   oscOVvrEY7w/6hE/p8JjKGaUzwrqq2cplbubfD4Fl8XaX2taeRJ21K416
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mateusz Marciniec <mateuszmar2@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: RE: [OE-core][PATCH] sstatesig: Improve output hash calculation
Thread-Topic: [OE-core][PATCH] sstatesig: Improve output hash calculation
Thread-Index: AQHZPBhDVNsb8N55BUOIn8b9d07wDq7GXCUg
Date: Thu, 9 Feb 2023 09:43:50 +0000
Message-ID: <b1cd5f2506de45a1a3edb6788c280d4e@axis.com>
References: <20230208235011.40486-1-mateuszmar2@gmail.com>
In-Reply-To: <20230208235011.40486-1-mateuszmar2@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 09:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176934

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Mateusz Marciniec
> Sent: den 9 februari 2023 00:50
> To: openembedded-core@lists.openembedded.org
> Cc: Mateusz Marciniec <mateuszmar2@gmail.com>; Tomasz Dziendzielski <toma=
sz.dziendzielski@gmail.com>
> Subject: [OE-core][PATCH] sstatesig: Improve output hash calculation
>=20
> From: Mateusz Marciniec <mateuszmar2@gmail.com>
>=20
> Symbolic links to the files are included during the output hash
> calculation but symlinks to the directories are missed.
> So if the new symlink to a directory was the only change made,
> then the output hash won't change,
> and the Hash Equivalence server may change unihash.
> In the next run bitbake may use an older package from sstate-cache.
>=20
> To fix this followlinks=3DTrue flag could be set for os.walk
> but it can lead to infinite recursion if link points
> to a parent directory of itself.
> Also, all files from a directory to which symlink points
> would be included in depsig file.
> Therefore another solution was applied, I added code that will loop
> through directories and process those that are symlinks.
>=20
> Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>  meta/lib/oe/sstatesig.py | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index f0224454c9..a5bc030f58 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -652,6 +652,11 @@ def OEOuthashBasic(path, sigfile, task, d):
>                  if f =3D=3D 'fixmepath':
>                      continue
>                  process(os.path.join(root, f))
> +
> +            for d in dirs:

Don't use `d` as a local variable for the directory, it is universally=20
used as reference to the datastore (also in this function as the function=20
declaration above indicates). Use `dir` instead.

> +                if not os.path.islink(os.path.join(root, d)):
> +                    continue
> +                process(os.path.join(root, d))
>      finally:
>          os.chdir(prev_dir)
>=20
> --
> 2.39.1

//Peter


