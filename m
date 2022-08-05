Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A23C00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 14:47:11 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.7607.1659710828333471015
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 07:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=LFaU9szV;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1659710829;
  x=1691246829;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=o5Xah+jYWru1J5vOKNHLVqfRymSfiThzbLG33kih0dY=;
  b=LFaU9szVPSuzkU6sslgY5EO/jYVfqL1cRveEe4P2Fx3mBAyEHecMPPVz
   FQahmEynnSrgQsBOMDaU62MW1SFnqeIK3im2bLsFWZLPP9haAi5Iw7VaD
   nOvOwGjrYqfoSgb8/val4Ejc76dkgfYg7HRrakne5u8oYtVvnWxuWIISd
   uSv3DnYdhxtj1EsleNac+jniBq/rYEakfQ7c8AigyaQrrFlrIVwyGp8sK
   59nbbw8e0WpEfOB/r7TtiYCG0hjwBeI5lEJB+usdtZKzR0DViQLBtoNks
   sHHpjGhyDZ6/sXnst95OHhE/L9+JaonMsYDsjvQw4MHOFi0fm8x+73DdI
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 21/29] rust-target-config: Make target
 workaround generic
Thread-Topic: [OE-core] [PATCH 21/29] rust-target-config: Make target
 workaround generic
Thread-Index: AQHYqM2j7+DO/7X4Bkmv/0wubyOb2a2gYlyg
Date: Fri, 5 Aug 2022 14:47:05 +0000
Message-ID: <7faac5488c5d4b879da630a216ff15c7@axis.com>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
 <20220805131252.3706794-21-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220805131252.3706794-21-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 14:47:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168966

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 5 augusti 2022 15:13
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 21/29] rust-target-config: Make target workarou=
nd generic
>=20
> Ensure the 'target' data is set for both HOST and TARGET queries
> as appropriate to work correctly in cross configurations.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/rust-target-config.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/rust-target-config.bbclass b/meta/classes/rust-=
target-config.bbclass
> index bc6bd77abbf..b3c738f02a4 100644
> --- a/meta/classes/rust-target-config.bbclass
> +++ b/meta/classes/rust-target-config.bbclass
> @@ -290,6 +290,10 @@ llvm_cpu[vardepvalue] =3D "${@llvm_cpu(d)}"
>=20
>  def rust_gen_target(d, thing, wd, arch):
>      import json
> +
> +    build_sys =3D d.getVar('BUILD_SYS')
> +    target_sys =3D d.getVar('TARGET_SYS')
> +
>      sys =3D d.getVar('{}_SYS'.format(thing))
>      prefix =3D d.getVar('{}_PREFIX'.format(thing))
>      rustsys =3D d.getVar('RUST_{}_SYS'.format(thing))
> @@ -298,7 +302,9 @@ def rust_gen_target(d, thing, wd, arch):
>      cpu =3D "generic"
>      features =3D ""
>=20
> -    if thing =3D=3D "TARGET":
> +    # Need to apply the target tuning conssitently, only if the triplet =
applies to the target

Typo: conssitently -> consistently

> +    # and not in the native case
> +    if sys =3D=3D target_sys and sys !=3D build_sys:
>          abi =3D d.getVar('ABIEXTENSION')
>          cpu =3D llvm_cpu(d)
>          if bb.data.inherits_class('native', d):
> --
> 2.34.1

//Peter


