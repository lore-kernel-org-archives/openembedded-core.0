Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75E1C6FD1C
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 10:30:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.7043.1679826629931248160
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 03:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GSlU2HEF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id u1so3410434wmn.5
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 03:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679826628;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4p+PaB5EoNGZFpD+N8WOWKaHNvm05It8jrZeXsAb7Kk=;
        b=GSlU2HEFgYqOlWNLTfB9igv2fVqfQ/6/PCldbT1Fdffj+R0pO7yxxDEzXh4Q2Hh7Ip
         BczrIOxdAKDmM7wO3mfp2hxAZSw70NlpK36wZq88zYERaZmn1utOVv7fxQTbG1eZqJx6
         RaXpFnzfd+2b0JGaTA5lBGSB56i+mO1DkqhcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679826628;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4p+PaB5EoNGZFpD+N8WOWKaHNvm05It8jrZeXsAb7Kk=;
        b=UvPb7ErvBWa+Q3GMMYmcmcKmBuCUkd1My9BiCCf5QLtZzdt9cRs/NqmtmQubiVSfE6
         5e0uP5jvJjIefSdi3S335XfiuBWKyqn3uYseeHCbIhHsbMozCT4bN/W5KcSV4nBIgim7
         OyP263PaI/ZlYLuYn6f2umy7T2IrcqpV1o1ywqPOBnuGhkxGlhO6m2unZkz3mLvGjTUl
         jx3PAtPu1gxj16+96Zy5M1MHo/jFpFiYQ6KgIYpiAuiB5Saehj14ZjCDSWV2WCvstUDO
         Tw0ia06gjCSyskY3l+QmoDWFnw395tkytUz1SWOdXRJqh7cmk9B9bTp0GbmyyhOBZYdp
         UVaw==
X-Gm-Message-State: AO0yUKUZ31DuwDJOSw7DTTi727VWrgFQ9eCY8WpQhmkChB7cFDEgCrGF
	BtAQ6CQaU/3nM9jJxE3HR6MmAA==
X-Google-Smtp-Source: AK7set+2oJZ1jxCVdoUtvMjChpWqxZ6O7sCa0xHGsgEiuuJVoFO5wC5xl3lrPVWfjT2c5QwIgOGifg==
X-Received: by 2002:a1c:4b09:0:b0:3ed:1f9c:af12 with SMTP id y9-20020a1c4b09000000b003ed1f9caf12mr7288257wma.22.1679826628259;
        Sun, 26 Mar 2023 03:30:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7e91:cdb:75c4:1387? ([2001:8b0:aba:5f3c:7e91:cdb:75c4:1387])
        by smtp.gmail.com with ESMTPSA id m15-20020a05600c3b0f00b003ee91eda67bsm5289550wms.12.2023.03.26.03.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 03:30:27 -0700 (PDT)
Message-ID: <6aa51189704ec1be7a5327d4baffd41d54b184fb.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2] package: moving field data process before
 variable process in process_pkgconfig
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>
Date: Sun, 26 Mar 2023 11:30:27 +0100
In-Reply-To: <20230324083620.2028587-1-xiangyu.chen@eng.windriver.com>
References: <20230324083620.2028587-1-xiangyu.chen@eng.windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 10:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179116

On Fri, 2023-03-24 at 16:36 +0800, Xiangyu Chen wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>=20
> Currently, the latest version abseil-cpp contains a new library named "ab=
sl_log_internal_format", it's
> basic package config(.pc file) as below:
>=20
> prefix=3D/usr
> exec_prefix=3D${prefix}
>=20
> ......
>=20
> Requires: absl_config =3D 20230125, absl_core_headers =3D 20230125, absl_=
log_internal_append_truncated =3D 20230125,
> absl_log_internal_config =3D 20230125, absl_log_internal_globals =3D 2023=
0125, absl_log_severity =3D 20230125,
> absl_strings =3D 20230125, absl_str_format =3D 20230125, absl_time =3D 20=
230125, absl_span =3D 20230125
> ......
>=20
> Normally, the process_pkgconfig() would process variable data before fiel=
d data in a .pc file, but in the
> absl_log_internal_format, the field data in "Requires" section contains "=
xxxx =3D xxxx" format, the
> process_pkgconfig() treats them as normal variable and using the setVar()=
 in bitbake's data_smart.py
> try to process. The absl_log_internal_format field data contains "_append=
_", this hit the setVar() checking
> and finally bitbake stop building and reporting an error as below:
>=20
> "Variable xxx contains an operation using the old override syntax. Please=
 convert this layer/metadata before attempting to use with a newer bitbake.=
"
>=20
> This patch move the field data process before variable process to avoid t=
he process_pkgconfig() treat the field
> data as variable.
>=20
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>=20
> Changes:
> V1 -> V2: changing the package.py instead of bitbake's data_smart.py
> v1 thread please refer:https://lists.openembedded.org/g/bitbake-devel/mes=
sage/14525
>=20
> ---
>  meta/lib/oe/package.py | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index c9eb75d852..7a6b31957a 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -1823,18 +1823,18 @@ def process_pkgconfig(pkgfiles, d):
>                      with open(file, 'r') as f:
>                          lines =3D f.readlines()
>                      for l in lines:
> -                        m =3D var_re.match(l)
> -                        if m:
> -                            name =3D m.group(1)
> -                            val =3D m.group(2)
> -                            pd.setVar(name, pd.expand(val))
> -                            continue
>                          m =3D field_re.match(l)
>                          if m:
>                              hdr =3D m.group(1)
>                              exp =3D pd.expand(m.group(2))
>                              if hdr =3D=3D 'Requires':
>                                  pkgconfig_needed[pkg] +=3D exp.replace('=
,', ' ').split()
> +                                continue
> +                        m =3D var_re.match(l)
> +                        if m:
> +                            name =3D m.group(1)
> +                            val =3D m.group(2)
> +                            pd.setVar(name, pd.expand(val))
> =20
>      for pkg in packages.split():
>          pkgs_file =3D os.path.join(shlibswork_dir, pkg + ".pclist")

It is worth noting this fix actually resolved a number of latent bugs
too. This breakage in reproducibility was as a result of this change:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230325-0k1j3_4=
w/packages/diff-html/

which was because the output changed but the sstate hashes didn't. That
is because package.py code isn't part of the sstate hashes (currently).

This isn't a fault of this patch. I've a patch in progress to bump
various versions to make sure this doesn't break anything further and
it does raise a question on whether we should checksum the python
functions and track that due to the adverse impact an issue like this
can have.

The issue here was missing dependencies, which were missing from -dev
packages when there was a version constraint present. I wanted to
highlight why fixing things at the root cause is good! If we'd hacked
this in bitbake, the other issues would have remained unseen.

Cheers,

Richard


