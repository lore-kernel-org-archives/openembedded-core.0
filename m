Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3712AC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 12:45:50 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.17912.1669121139676380300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 04:45:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I3mm6+a3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id v1so24489091wrt.11
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 04:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NLqOPMuFDEw04RRTnkYkzAr3uyOVUTS11CVK4Pv/zKg=;
        b=I3mm6+a3C15VZyIwpdTCNxYMTzCizUwioRQntwfxr8fEYcyPAxmKaijsVI0+L95DgV
         UFVMbH8aD4EWjsFizd1ONXggdlGiUo4LcU6p860iaN2LaxhVTGYu/5pQbIZ9+vADYfl2
         c6p3CPonM6eGtQtoCo0g3CDxD5VV/ejdB+vuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NLqOPMuFDEw04RRTnkYkzAr3uyOVUTS11CVK4Pv/zKg=;
        b=W6uJTRD8B2dRRSxzber6TcGNHgzoWehq27+YBmoBmE2z8uizuaF3Q8lNiBD9ITe+yr
         3Un/g+tWmLLLClud7aycXC5Qc/bwyL7KRsNJ99FklTzM8rmFe98hynot5RzWY0CfMxlc
         u3F5+tbnda9BqoX0ITUkf02pDygYHXWqLjoAgaDnFTiqIjz/RzP0nZ7ErrpD8sHRrfM4
         nUj3r1vL+vUi0xJYI8L9Rx98aCyeLGvyllnxlrfWWnUbg2kxOBBp1sZVzthYOWMoPzqd
         T/HTZqewMR4M8n4YTmeoM7wC6bDPecf73PqERC/3ZgQTj4Mu1EI9LHwL9/pTEQWJ6Nhy
         w/Jw==
X-Gm-Message-State: ANoB5pkgZGjtrkW+MgskL55Iapst/N/MV7kpJbsQZEnNPt9wjOMvJy5J
	1p08av5jdrsG1CT63OHi1INysg==
X-Google-Smtp-Source: AA0mqf7DWgyhFC4YcAhifGFrIaf0+H9fpn2yXExnQk9ns9LolgNQKv+Vw6K/76RhExzzACdIEKH4PA==
X-Received: by 2002:a5d:6ac6:0:b0:22e:335d:f09a with SMTP id u6-20020a5d6ac6000000b0022e335df09amr4024394wrw.114.1669121137997;
        Tue, 22 Nov 2022 04:45:37 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b3e:5e6:6ca6:2445? ([2001:8b0:aba:5f3c:2b3e:5e6:6ca6:2445])
        by smtp.gmail.com with ESMTPSA id n27-20020a05600c3b9b00b003cfa81e2eb4sm18948916wms.38.2022.11.22.04.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 04:45:37 -0800 (PST)
Message-ID: <7d040dc171220b62822848d43a3fc263ed44f84f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel_dep_check.bbclass: help track kernel
 depend
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jebr@google.com, openembedded-core@lists.openembedded.org
Cc: brandonkim@google.com, edtanous@google.com
Date: Tue, 22 Nov 2022 12:45:36 +0000
In-Reply-To: <20221115234458.2978376-1-jebr@google.com>
References: <20221115234458.2978376-1-jebr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 12:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173678

On Tue, 2022-11-15 at 15:44 -0800, John Broadbent via
lists.openembedded.org wrote:
> From: John Edward Broadbent <jebr@google.com>
>=20
> This recipe can be used to identify kernel dependencies, and
> immediately throw build errors if those dependencies are not met.
>=20
> Signed-off-by: John Edward Broadbent <jebr@google.com>
> ---
>  meta/classes-global/kernel_dep_check.bbclass | 81 ++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 meta/classes-global/kernel_dep_check.bbclass
>=20
> diff --git a/meta/classes-global/kernel_dep_check.bbclass b/meta/classes-=
global/kernel_dep_check.bbclass

I was a little puzzled by the way you'd expect this class to be used.
It is placed in class-global and hence you must be using it as an
INHERIT but I'd have expected it to only be used by recipes that need
it on a per recipe basis?

Cheers,

Richard

