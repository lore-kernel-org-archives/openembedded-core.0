Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFC0CDB47E
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 18:26:59 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.101195.1697394412654247268
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 11:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KzXaiYL1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-32d895584f1so3325711f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 11:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697394411; x=1697999211; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1D2HUEUiwv5o9d9jyK8XQsaCFe3KIQazwZx7yMAXTg=;
        b=KzXaiYL1boJQ8gXo7xjyhtI7k8LyrQAuiVa7H6UtXiZuqJ/pTZLjAOOXSo6yiDf6BM
         UmdNkvQsySfCI4ksmDBG6hhEbs7/TL+avjHxwx1wzmnfOQmbgwkUlxTpgcLtqeDNxIa8
         sMGxD/a0+X3F9b3dhqsAucIQGX0MBCCx78TcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697394411; x=1697999211;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j1D2HUEUiwv5o9d9jyK8XQsaCFe3KIQazwZx7yMAXTg=;
        b=qVFXbAs6TqN34YzBv6XCvqbwFeldOh3HvDAxGrhHoMqU7HAHn1chJuU65orjNxF23W
         whVxPqeVHfe2TkXlFvm+NmLKVgpShM6/ki0els3aRc3H251agHze4wVjcOcWuz5ynGHh
         EHo/ZcIz77eO4kYYS8TTyjGzIx+I11riz9Xwclpjt+rupE7Csz0WyHSNX6ekCqlnklVZ
         ReC4bXGMR0P4X9ex2mEdo4h1FHNeACT0msJglf1FPbVDT8S5OD0hE72QmwuKSQRc5RsK
         MMJz82y5HrTMqQfJ4if07j4I09dqRz8SpBt11gP2P4+8lLneS5MCV/RWNGhFH8e0I3Zc
         WfJQ==
X-Gm-Message-State: AOJu0YxKSZk6STmsO1FKbwUlOZ3vaUsA57htPpclHegcMyF09bH8CLZ+
	v5gtZ41vbrYGLcXSK/jk5J/QdA==
X-Google-Smtp-Source: AGHT+IGmBSwxid7QdXb0WW5j2XoyPtcWch7vfnCzqIk9ZbN7m8ifLh+tUz/04Bm+fq6UQSUmT2FQag==
X-Received: by 2002:a5d:534b:0:b0:31f:fb63:12d8 with SMTP id t11-20020a5d534b000000b0031ffb6312d8mr28317634wrv.44.1697394411081;
        Sun, 15 Oct 2023 11:26:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7e01:6bdd:8c85:9c17? ([2001:8b0:aba:5f3c:7e01:6bdd:8c85:9c17])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm25407201wrp.116.2023.10.15.11.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 11:26:50 -0700 (PDT)
Message-ID: <3bf4d3c6ef38532d316ec3eefc9d670aad5ba21d.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v14 03/11] sstate.bbclass: override tar with
 tar-native
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 15 Oct 2023 19:26:49 +0100
In-Reply-To: <20231015145749.69995-3-p.lobacz@welotec.com>
References: <20231015145749.69995-1-p.lobacz@welotec.com>
	 <20231015145749.69995-3-p.lobacz@welotec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 18:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189159

On Sun, 2023-10-15 at 16:57 +0200, Piotr =C5=81obacz wrote:
> Due to the bugs https://savannah.gnu.org/bugs/?61934 and
> https://savannah.gnu.org/bugs/?59184, which are fixed in
> tar version 1.35, we need to force yocto to use it instead
> of the one provided by the host machine.
>=20
> sstate_create_package and sstate_unpack_package functions,
> will use the tar provided by tar recipe, which is already
> in proper version.
>=20
> Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> ---
>  meta/classes-global/sstate.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sst=
ate.bbclass
> index 2676f18e0a..5ae6f515f2 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -152,7 +152,9 @@ python () {
>      else:
>          d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))
> =20
> -    if bb.data.inherits_class('native', d) or bb.data.inherits_class('cr=
osssdk', d) or bb.data.inherits_class('cross', d):
> +    is_native =3D bb.data.inherits_class('native', d) or bb.data.inherit=
s_class('crosssdk', d) or bb.data.inherits_class('cross', d)
> +
> +    if is_native:
>          d.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
>          d.setVar('BB_HASHFILENAME', "True ${SSTATE_PKGSPEC} ${SSTATE_SWS=
PEC}")
>          d.setVar('SSTATE_EXTRAPATHWILDCARD', "${NATIVELSBSTRING}/")
> @@ -164,6 +166,8 @@ python () {
>          d.appendVarFlag(task, 'postfuncs', " sstate_task_postfunc")
>          d.setVarFlag(task, 'network', '1')
>          d.setVarFlag(task + "_setscene", 'network', '1')
> +        if not is_native:
> +            d.appendVarFlag(task, 'deptask', ' tar-replacement-native:do=
_populate_sysroot')
>  }
> =20
>  def sstate_init(task, d):

I don't think this dependency is enough to ensure that the setscene
task for one of these tasks has tar-native present when the sstate
package is extracted from sstate?

Cheers,

Richard



