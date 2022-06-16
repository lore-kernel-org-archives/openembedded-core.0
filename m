Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FC1C43334
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 10:23:12 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.16369.1655374983918278745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 03:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TxotTcgV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id z9so510598wmf.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=SNdmg6/WXpPJLVuDZUBMhpOrYD3aTfHdd0NeDJr4paU=;
        b=TxotTcgV7LLRK1WO4vXFPm0ReVa6nLK2I86T9L7e6LmGjbkLynRH+n4J9bU1F3BJ0p
         LzOiRxPJzSXJnNo7a81mPuJdItFNG180mr5XJRualY8MPeWRXZVXjjALmVWZoeVwvQb2
         4BlXp1C/JFbcRr6su2MHTEJty0M2sbUr+DKyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=SNdmg6/WXpPJLVuDZUBMhpOrYD3aTfHdd0NeDJr4paU=;
        b=4kprGbDvkIm/o6UyM2+tW7uH7SmKjQr/57/GTqts+c4OThLoSuSrJfH/JHGw4Z6F8P
         IFAMt4fZ3LKekAcOIpdTcPVfw0xjy7xsIEbJvSp7CH5b5BgQ4p8OHXi4jZccVJTxNFct
         bvynKMQ+RXG2G1u62viOo9I8Cuqk1TmUOpLchynT4PtOLreEUvcf0HxHGXO7vRr6VlN1
         9TNX8v5dsHnJ6Q5ACFSTOe86CKU3B1rlqNF1uCN2prYHfWwsL5bKyqom/zAE08MwD9MX
         6aQWAnrXKqWkM1msW/SVNCZcAClYGMKdjj2dIOYULjeghIBjsqCDHRg4p/SBrxOh++YT
         ppkA==
X-Gm-Message-State: AJIora8BmHbhJrfBqHJDnMMLRRsUHwh3N36wKkjH8B/envjfSQfz6eKN
	kPlzza/qL3dQHWZQEAMe0PxieQ==
X-Google-Smtp-Source: 
 AGRyM1tOr1MB4I9kP1/KeKMIFhovFqOJRPI8/kr4Cp8n2IWQCHzvEABZ1s5yTxzXy9FTX5Q/ZKPJ6w==
X-Received: by 2002:a05:600c:22d9:b0:39c:4b1b:5f99 with SMTP id
 25-20020a05600c22d900b0039c4b1b5f99mr4146979wmg.151.1655374982375;
        Thu, 16 Jun 2022 03:23:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eeb2:b739:86e8:b280?
 ([2001:8b0:aba:5f3c:eeb2:b739:86e8:b280])
        by smtp.gmail.com with ESMTPSA id
 h10-20020adf9cca000000b0020c5253d8d0sm1510645wre.28.2022.06.16.03.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 03:23:01 -0700 (PDT)
Message-ID: 
 <27226635e115be452ee7b5643860f4b53ee206b4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v1] glibc-locale: work around
 host-user-contaminated QA failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Muhammad Hamza <Muhammad_Hamza@mentor.com>,
	openembedded-core@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Date: Thu, 16 Jun 2022 11:23:01 +0100
In-Reply-To: <20220616055414.42319-1-muhammad_hamza@mentor.com>
References: <20220616055414.42319-1-muhammad_hamza@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jun 2022 10:23:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167004

On Thu, 2022-06-16 at 10:54 +0500, Muhammad Hamza wrote:
> Work around long standing periodic host-user-contaminated QA failure by
> explicitly correcting the ownership.
>=20
> See `glibc-locale: Rewrite do_install using install utility instead of cp=
`
> on the oe-core mailing list for discussion. This should be dropped when
> a real fix is implemented.
>=20
> Explicitly disable host-user-contaminated to further work around the
> pseudo bug. With pseudo acting up, even if the ownership is correct, it
> may well think it is not, so just sidestep the issue until upstream
> fixes the root cause.
>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>=20
> Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
> ---
>  meta/recipes-core/glibc/glibc-locale.inc | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core=
/glibc/glibc-locale.inc
> index b8de7d3192..34c178268b 100644
> --- a/meta/recipes-core/glibc/glibc-locale.inc
> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> @@ -69,6 +69,23 @@ FILES:localedef =3D "${bindir}/localedef"
> =20
>  LOCALETREESRC =3D "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
> =20
> +# Work around long standing periodic host-user-contaminated QA failure b=
y
> +# explicitly correcting the ownership.
> +#
> +# See `glibc-locale: Rewrite do_install using install utility instead of=
 cp`
> +# on the oe-core mailing list for discussion. This should be dropped whe=
n
> +# a real fix is implemented.
> +
> +do_prep_locale_tree_append () {
> +	chown -R root:root $treedir
> +}
> +
> +# Explicitly disable host-user-contaminated to further work around the
> +# pseudo bug. With pseudo acting up, even if the ownership is correct,
> +# it may well think it is not, so just sidestep the issue until upstream
> +# fixes the root cause.
> +ERROR_QA_remove =3D "host-user-contaminated"
> +
>  copy_locale_files() {
>  	local dir=3D$1 mode=3D$2

At a quick search I couldn't find the email you reference so it
probably isn't recent. As Jacob mentions, this syntax is invalid for
master.

Was this not fixed properly by something like:

https://git.yoctoproject.org/poky/commit/?id=3D2e75c084f2cfe7617de3b9a4b006=
caa3fee687a6

?

We're definitely not taking this without more details on what is going
on and a correct patch as this looks like a workaround.

Cheers,

Richard


