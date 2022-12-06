Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BC4C352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 15:28:03 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.50635.1670340482322749323
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 07:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L88f1/eS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id bx10so24039588wrb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 07:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MdFyfY2UpmzdBGtU3oxiaquDgb7OumWa+Cp73mykbY=;
        b=L88f1/eSqpX5FfosAgrMkNwR/s15pXVWBFXNeSByeKKww5kJw/GDa14uU52ZSJaluO
         9Qyv9t0gm1prhFoYb0dwwcFy0Hj8BgTXcwP+9OXmdCKgsHfYKgf4FzSeh2UcAI8PosLL
         if/aPxOMOas+w+1aEHmXJuMc0Rekzah6hjrZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7MdFyfY2UpmzdBGtU3oxiaquDgb7OumWa+Cp73mykbY=;
        b=l5NHmxlpVWMGmOKzjn3DIHV7KzD7TOVrt44RhlfUAw3wAXJIcMbZR+UhLTVYOBbgye
         1533zzzeb/RDqt4wieO4iMKQ8MpDwZnmO5uqP/YUmnNA94ZipGqHxCapYDWUej/m9bWD
         LINQl9U5vQq0wYLkNMqbEabtlWnoU2gRzugSeY9W33HTPNiEJC2B6PASMg2X3XpSMvr2
         EpcoXCTdperHo9TLZnAVMfuOzZj9BLi+yfOv7D3/MZ5/a2/sJQDi3yq+2kuPusujVCbd
         SBHdjr2pg+s9qKWoxoaUFJdsEUyuibjGqD/x9bNy6CLXPCp/PNXkBQjipj9UPxxmvJNK
         rC4Q==
X-Gm-Message-State: ANoB5pmqXrBza3BniW4YthoETaTJJ23oyL26RVvb80qkFrd4bQIMrXPW
	0k8BFD4tzhT5wR0cec+2OILmDg==
X-Google-Smtp-Source: AA0mqf5kc7Yjw0qJeltx4Bny/8ub3c/uhyZ9hD23gA5l3s8xd5lILkKahzruHxD3B55ghFQy5nG9sA==
X-Received: by 2002:a05:6000:18c7:b0:236:a471:81c3 with SMTP id w7-20020a05600018c700b00236a47181c3mr53289045wrq.392.1670340480576;
        Tue, 06 Dec 2022 07:28:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d6:2c80:98d5:dc63? ([2001:8b0:aba:5f3c:d6:2c80:98d5:dc63])
        by smtp.gmail.com with ESMTPSA id t12-20020adfeb8c000000b0023662245d3csm16935793wrn.95.2022.12.06.07.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 07:27:59 -0800 (PST)
Message-ID: <bcbf71731ee09b3f5f88da7ecf88f9b3840cb22f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/6] acl: Enable largefile support by default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 06 Dec 2022 15:27:57 +0000
In-Reply-To: <20221201190248.175753-2-raj.khem@gmail.com>
References: <20221201190248.175753-1-raj.khem@gmail.com>
	 <20221201190248.175753-2-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 15:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174323

On Thu, 2022-12-01 at 11:02 -0800, Khem Raj wrote:
> This ensures right flags are passed so enable it. Musl and decoupled
> these APIs from _GNU_SOURCE and now are only available when
> _LARGEFILE64_SOURCE macro is enabled
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...rtable-version-of-dirent-and-readdir.patch | 39 +++++++++++++++++++
>  meta/recipes-support/attr/acl_2.3.1.bb        |  3 ++
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-support/attr/acl/0001-chacl-Use-portable=
-version-of-dirent-and-readdir.patch
>=20
> diff --git a/meta/recipes-support/attr/acl/0001-chacl-Use-portable-versio=
n-of-dirent-and-readdir.patch b/meta/recipes-support/attr/acl/0001-chacl-Us=
e-portable-version-of-dirent-and-readdir.patch
> new file mode 100644
> index 0000000000..c51b90216f
> --- /dev/null
> +++ b/meta/recipes-support/attr/acl/0001-chacl-Use-portable-version-of-di=
rent-and-readdir.patch
> @@ -0,0 +1,39 @@
> +From 1a5671a4eb13b81b98c3e71f00370781563f66d8 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 10 Nov 2022 17:57:24 -0800
> +Subject: [PATCH] chacl: Use portable version of dirent and readdir
> +
> +Using 64bit versions on 32bit architectures should be enabled with
> +--enable-largefile, this makes it portable across musl and glibc
> +
> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-de=
vel/2022-11/msg00005.html]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>

Now a backport:

https://git.savannah.nongnu.org/cgit/acl.git/commit/?id=3D2b42f64737adf6a2d=
dd491213580d6e9cdd2f5af

:)

Cheers,

Richard


