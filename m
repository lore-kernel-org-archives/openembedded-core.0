Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4535BC61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 12:41:27 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.89923.1700743286093461995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 04:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KcsgzT6Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-507a62d4788so1150488e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 04:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700743284; x=1701348084; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+DFlYX/VrFiqkcp2A9pfvMJjNl3Q55fqkDeZfBoO6Q=;
        b=KcsgzT6YnaPCff+ZSWwcthcROqzwkOyjkj9X6Ck87HfeNxOAzMcSnbWPeFAEQLqipL
         iGUHLrDDKvmGa9Cx1GZFkmjIdvJpObMSssu0UwxGRBxkZOwe6HZWtwHE8/4oyn/+aqRB
         vih2get8rtSeooht2LA3HtYon9w7/7dsLLM3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700743284; x=1701348084;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s+DFlYX/VrFiqkcp2A9pfvMJjNl3Q55fqkDeZfBoO6Q=;
        b=pBTE9YPO6QNSXcHtfKJLRmqciwgzm8fHkM/oWfCDLRaCbbGEiXlWrmEc6iUe8bmqPe
         nIkSM/dGYpvEXwx6W5qRBJcc9kxLGiJ4BcC0y+nzbUJoHQDNyqN8SG+MegO1sqQsAZEP
         TxL6kkMx+kKa++8yE2fXcxbgz4tEuOjIJmo1QrTwTm+e8LNw838gE/ondEppPDXsRTjV
         5XBVdAcMh7J2uBvHzxMrAcpm7UHaZ4DeW+9tT1skb8TQW/6lCK+un2k+FHRDhir0mfSg
         WjquvLCHnyvYqcAlKlchpZvoetOowNE3lhsK/TBCAyDAEH8HNr+zVj8UcX6vOeiFYMKm
         prww==
X-Gm-Message-State: AOJu0YxaM3k86Crv/JDtjrMfkjMUPn8Mj2GVMphJnMbFIed6VcLwqh+/
	UPZvKQQGQqN+We5FI9OeMJaDpqa8+AJ5a2Hd/hk=
X-Google-Smtp-Source: AGHT+IEjGOgvB/+rBtaX/eZQAGVfM18zgg+j/x6ZVQU+8525LPb/2M8VHBo7ZL6po70sWJ+zErZvcg==
X-Received: by 2002:a05:6512:3485:b0:50a:77e9:d086 with SMTP id v5-20020a056512348500b0050a77e9d086mr3730893lfr.31.1700743283835;
        Thu, 23 Nov 2023 04:41:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c511:4d31:367c:ab3c? ([2001:8b0:aba:5f3c:c511:4d31:367c:ab3c])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c4fd200b0040b38082b99sm500778wmq.1.2023.11.23.04.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 04:41:23 -0800 (PST)
Message-ID: <e41e538ce6ebbe4c30af4de9c6a1f4e02fd9f359.camel@linuxfoundation.org>
Subject: Re: [OE-core][kirkstone 09/16] binutils: Fix CVE-2022-47007
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2023 12:41:22 +0000
In-Reply-To: <03e6ea59d82e613ba3b5d388fa87317cef982f2b.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
	 <03e6ea59d82e613ba3b5d388fa87317cef982f2b.1700620126.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 12:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191146

On Tue, 2023-11-21 at 16:31 -1000, Steve Sakoman wrote:
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>=20
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../binutils/binutils-2.38.inc                |  1 +
>  .../binutils/0033-CVE-2022-47007.patch        | 34 +++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0033-CVE-2022=
-47007.patch
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/reci=
pes-devtools/binutils/binutils-2.38.inc
> index 43cc97f1ef..dc29141812 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -67,5 +67,6 @@ SRC_URI =3D "\
>       file://0031-CVE-2022-47695.patch \
>       file://CVE-2022-48063.patch \
>       file://0032-CVE-2022-47010.patch \
> +     file://0033-CVE-2022-47007.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.=
patch b/meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.patch
> new file mode 100644
> index 0000000000..cc6dfe684b
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.patch
> @@ -0,0 +1,34 @@
> +From: Alan Modra <amodra@gmail.com>
> +Date: Thu, 16 Jun 2022 23:30:41 +0000 (+0930)
> +Subject: PR29254, memory leak in stab_demangle_v3_arg
> +X-Git-Tag: binutils-2_39~237
> +X-Git-Url: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdi=
ff_plain;h=3D0ebc886149c22aceaf8ed74267821a59ca9d03eb
> +
> +PR29254, memory leak in stab_demangle_v3_arg
> +
> +	PR 29254
> +	* stabs.c (stab_demangle_v3_arg): Free dt on failure path.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff_plain;h=3D0ebc886149c22aceaf8ed74267821a59ca9d03eb]
> +
> +CVE: CVE-2022-47007
> +
> +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> +---
> +

This has not merged to master yet. It probably will but...

Cheers,

Richard

