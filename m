Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D50C77B61
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 10:14:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.8975.1681380842935050962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 03:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=NjQRDd01;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id i8-20020a05600c354800b003ee93d2c914so9418989wmq.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 03:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681380841; x=1683972841;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHSawFb8EAsHsH5YTMD5ZP8cqt6/F9sYxILuaNXZDzQ=;
        b=NjQRDd01tFn+nL873LgjZW4xpKnjp/dm/lnukyk9nU80cvBldO4AZf5gdaxNXbZRk1
         Rko/l1R5jT7PLjIUe/cOXhCskPzDVx0/+BGygDAiJZftunkimUaRWki1RwKNuVQlEjuJ
         5CUXxgX0uz5nhUHbpiXg0ryyHn019h5hQhzj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681380841; x=1683972841;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cHSawFb8EAsHsH5YTMD5ZP8cqt6/F9sYxILuaNXZDzQ=;
        b=gGo6kwvfS2vII/C1ZTeejzZUJCjbxjRY9/ds19VK9Bz+2oaPxMvdK4SmpcYqp0Xra3
         QDrpjsuUPIC6Cs6tlwcXqS53L4XAFsKJbV9pY7KOLU05MPcEvnEDD5sVXp+E091PK2uF
         kexphRuWpeFXT3mZcxypwLe07rIECWMm86XKis7ZyXjnw5n6mvD/vbOoBDoncmEltEf8
         r8Xy7A/FHtdmFKbMQuNA9QbyXmu1syK3LhvMcYHmY97TSp0Ucd21OcMTnafGwDJ5d305
         puzuXvyO7c0lRt5k7/ttbgQZLmFkd/7WBlL7NFyAVoev5aJNXO9Cnur5blFHRFChu25p
         8Wfw==
X-Gm-Message-State: AAQBX9cW9tEoZtLeDsTVrhIrq+19hYRkKCd42TLb1jeuBOKbiuC3kjzq
	B1en/RFrhyXe1nDrgbAbdWcU3w==
X-Google-Smtp-Source: AKy350YFc02iMWC6sbAzedxGadIq4MBN3Yx7RTrDRa8Zg+7F5ijLRor6BRJ2+VBrGEFAwKUt+7IGpA==
X-Received: by 2002:a1c:7918:0:b0:3f0:8ed8:853c with SMTP id l24-20020a1c7918000000b003f08ed8853cmr1301285wme.37.1681380841223;
        Thu, 13 Apr 2023 03:14:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b4d4:7e31:434a:3f40? ([2001:8b0:aba:5f3c:b4d4:7e31:434a:3f40])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c350f00b003ee9f396dcesm5119063wmq.30.2023.04.13.03.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 03:14:00 -0700 (PDT)
Message-ID: <033c81e5bd6048afcd3bf8fbee335dc52a60d429.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] gawk: Fix ptests on musl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2023 11:14:00 +0100
In-Reply-To: <20230413055432.1977413-2-raj.khem@gmail.com>
References: <20230413055432.1977413-1-raj.khem@gmail.com>
	 <20230413055432.1977413-2-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 10:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179967

On Wed, 2023-04-12 at 22:54 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...0001-Provide-fixes-for-tests-on-musl.patch | 73 +++++++++++++++++++
>  meta/recipes-extended/gawk/gawk_5.2.1.bb      |  7 +-
>  2 files changed, 77 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-extended/gawk/gawk/0001-Provide-fixes-fo=
r-tests-on-musl.patch
>=20
> diff --git a/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-tests=
-on-musl.patch b/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-tes=
ts-on-musl.patch
> new file mode 100644
> index 0000000000..4ff2466c0e
> --- /dev/null
> +++ b/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-tests-on-mus=
l.patch
> @@ -0,0 +1,73 @@
> +From 95bcf4397b6f727208f3c627b7d00dacec406d02 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 12 Apr 2023 21:57:18 -0700
> +Subject: [PATCH] Provide fixes for tests on musl
> +
> +Fixes rebt8b1 and regx8bit
> +Disable clos1way6 [1]
> +
> +Disable commas and backsmalls1, they do not work
> +with musl-locales somehow even though we do isntall
> +en_US.UTF-8 on target
> +
> +[1] https://lists.gnu.org/archive/html/bug-gawk/2021-02/msg00005.html
> +
> +Upstream-Status: Inappropriate [musl-specific]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + test/Maketests | 11 ++++-------
> +

Carrying a patch like this makes me a bit nervous as:

a) it is only applied for musl so it makes recipe upgrade testing a
nightmare

b) there doesn't appear to be any path to upstream it, we'd just have
to carry it indefinitely.

c) the reasons for the failure don't seem to be understood.

Is there something we can do to avoid having to carry this
indefinitely?

Out of interest did alpine do anything for this?

Cheers,

Richard


