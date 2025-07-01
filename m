Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF05C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 18:19:37 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.4352.1751393972169613484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 11:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=clU6RuKB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so42553735e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 11:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751393970; x=1751998770; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiED9zmNv30oslA5+uJASit3AseLAvEAgJiv9uuZfBA=;
        b=clU6RuKBqVfVTl4QagN20GxDco3ZZNOpIxA1enMOsz07mj31lORHaC+KwTmZRVBlMt
         TmkvtlFRA/uma6vq2ZPGV00mIV6JW+mj4tCpJZPDgtmtaqF/a0qcbzCS2/unzfHBpXY/
         qFC/Xvt0pQ1YuIyrHn7LlHO7tM4a6JgQN8XfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393970; x=1751998770;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jiED9zmNv30oslA5+uJASit3AseLAvEAgJiv9uuZfBA=;
        b=ilwg/T0IkqPPrfYpbzuw/KGysTFynnDPzgBWumTA2nsShqkOeA9NpBCPymzxQpYUpM
         qY1SkeiH1lONRS1saW+QcuqorAA2AnGyXZ62H6hD9WxdLp3qzKwtrJjd778QvDMSVvYl
         SZlhqxPxUc1v1tMq2vJaUUCdrYrjy3pZkL69AWlLU0KrcuP3de5vl8BdWkjLw7/9cmI9
         MDSFniySp7HCTjbBQosfdaXzFj9u/U/YoQUVDNKQ1/mWn7KFqFmcmpso7Zo39ap91fBd
         7IeTy2xvYVduzYRsu1tVqKZVY12i5ArJj6AWTeTcQ5aIOd8nWU8Yms2bqu63JiOLXvd0
         pyog==
X-Forwarded-Encrypted: i=1; AJvYcCXOECf7xXVQBSnErb/G3Ep16kkMt422MuzWKKOpfmLqqJbRI0612Apc2qmcVriMa+lUEjFUpeRDSE6jfRkNxnWckA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzbA1KLOuTwaf4CRALARvdiKcw36S/EMvnRHEpPa0a9o0FmxDEP
	PORy4Flq2/hn2660l6/W/Wf8OgTIIZlgzPUNA+qxvqIus5b+/oMrdtL9Qi+UNLc4CsM=
X-Gm-Gg: ASbGncukiVcEvSybiSe/LHuEzKcYIY6xvOZr0ykEwmZVAdGElpPCIK8hB7njs6LeAbw
	Ji2/R8qH8Dcff8W1zt3LZugfLqlji9l3dOJ8uGadE/c3afLGprxpqdQQG4Doww+K/+KueHPNngf
	bK4EnrFSEMxVFvmkNV6hujzN58dZvH2on9FXj2i5lgJSMa87ugbfcd1orDKEBshawhRzKlTPyQZ
	LxMbQkR+uUSHLPyiTe9aYq2Krs3Pg0bHm4N6h9PJRponx7X2bl8iApf08Ju9OOqt4QhuzkyIZri
	PFwLdBdKGaNQPC7Uuuhafpkh9quo/7PHQOrXarhYMUsl804inarvqSBqIBpGeHVkuo+9cws2LKE
	mLVdKWBkWJ8ml9qtjjss6yILxpxZ+hAN2Yv6+tW/Xh2XKtHH6CMkPs6oWWQbhjQ==
X-Google-Smtp-Source: AGHT+IHwitunXC7wKk0NPko0rHUJVznI3x83fjU5IDbTtDrOchA6slbmYjl6tvB40BjEhEAwc85V7g==
X-Received: by 2002:a05:600c:c0c8:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-453a79673d4mr37256735e9.10.1751393970285;
        Tue, 01 Jul 2025 11:19:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:62fa:d15d:397d:870e? ([2001:8b0:aba:5f3c:62fa:d15d:397d:870e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a390d05sm176611185e9.2.2025.07.01.11.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:19:29 -0700 (PDT)
Message-ID: <c32f29b67e45dbfd74f5b96f2c4f262de2b34346.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/9] drop-unknown-suffix.bbclass: add class
 for removing unknown suffix in version
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yi.zhao@eng.windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 01 Jul 2025 19:19:28 +0100
In-Reply-To: <20250701154731.1465906-2-yi.zhao@windriver.com>
References: <20250701154731.1465906-1-yi.zhao@windriver.com>
	 <20250701154731.1465906-2-yi.zhao@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 18:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219714

On Tue, 2025-07-01 at 23:47 +0800, Yi Zhao via lists.openembedded.org
wrote:
> This class is used to remove unknown suffix in runtime version for
> gnupg
> and its related packages. In these packages, if autogen.sh is run
> outside of a git repo, the find-version function always assumes that
> the
> package is a beta version and adds the suffix '-unknown' to the
> version
> number.
>=20
> This calss modifies autogen.sh to:
> 1. Replace beta=3Dyes with beta=3Dno
> 2. Replace tmp=3D"-unknown" with tmp=3D""
>=20
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
> =C2=A0.../drop-unknown-suffix.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 29
> +++++++++++++++++++
> =C2=A01 file changed, 29 insertions(+)
> =C2=A0create mode 100644 meta/classes-recipe/drop-unknown-suffix.bbclass
>=20
> diff --git a/meta/classes-recipe/drop-unknown-suffix.bbclass
> b/meta/classes-recipe/drop-unknown-suffix.bbclass
> new file mode 100644
> index 0000000000..78707adecb
> --- /dev/null
> +++ b/meta/classes-recipe/drop-unknown-suffix.bbclass
> @@ -0,0 +1,29 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +#
> +# This class is used to remove unknown suffix in runtime version
> +# for gnupg and its related packages.
> +#
> +# In these packages, if autogen.sh is run outside of a git repo,
> +# the find-version function always assumes that the package is a
> +# beta version and adds the suffix '-unknown' to the version number.
> +#
> +# This calss modifies autogen.sh to:
> +# 1. Replace beta=3Dyes with beta=3Dno
> +# 2. Replace tmp=3D"-unknown" with tmp=3D""
> +#
> +
> +do_configure:prepend() {
> +=C2=A0=C2=A0=C2=A0 if [ -f ${S}/autogen.sh ]; then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -e 's=
/^\([[:space:]]*\)beta=3Dyes$/\1beta=3Dno/' \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -e 's=
/^\([[:space:]]*\)tmp=3D"-unknown"$/\1tmp=3D""/' \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${S}/=
autogen.sh
> +=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bbwarn "autogen.sh not found =
in ${S}."
> +=C2=A0=C2=A0=C2=A0 fi
> +}

This is the right direction, my only question was on naming and
location. A bbclass is meant to be fairly generic and I'd suggest this
just be a .inc file, probably as something like meta/recipes-
support/gnupg/drop-unknown-suffix.inc which the other recipes could
then require?

Cheers,

Richard

