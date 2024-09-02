Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB987CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 12:02:08 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.37103.1725278522704578274
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 05:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hQssSwtP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bac9469e8so34692085e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 05:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725278521; x=1725883321; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLx5n5j+31MoTaOgT0xoNEw71HgLgfZ7bfVmjiYlK6Y=;
        b=hQssSwtPU9fzNLjUEgSNipIsiPkEXL5qGfwd6i1IZLegP49e6UAVa21QlDIXxvTvk9
         nAPRHZw9VUmizgXbPhODQ5cmjwldFf/TaGZQE9vOIJTjZAnOWZp3dZvyq5oYRDq41pvF
         kYNa2LmOqppcbq5ZB9SFCwwdFO0i/yy/QDShE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725278521; x=1725883321;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uLx5n5j+31MoTaOgT0xoNEw71HgLgfZ7bfVmjiYlK6Y=;
        b=PLlnAruXuuwivclmHgewK3jpkULGfdL+kXg/RQBv0+1pk4nkFfV/cN3ESe4+ZtFTYV
         D8pj7ku/BCOMfiCS1yrM81h/Os2TlNJeZQj6365iIgGHCaYvQ2GX7ffvbkG8EfVsJ+F2
         3rLQuyUl5bIpL/DZ3ZO4RWpfHlMg76IqlEfp91imx5DA7KYdh8V8sDquThT3Av+cYH3d
         ECw3kU4JNNkt/e3cZ2bX6A9No988szPektzXM+2iRWRD8LGwdpxf+dQ20TG5zc8C1d7y
         pur9KlKLNWvdqUcHL/H5rYAPOdSUp4JL5+ETtjBdx2Ee1Bgo2/bDqSgvbQ2EMyU42R7d
         umNg==
X-Forwarded-Encrypted: i=1; AJvYcCVIeL4fYx40Nl5041G28GlYxzUFia3EMtWHgpZljGZzODwuJCn0Z1geWCOE0uKVKYj5tDp06Y9RwuNWSRUj9pXBMg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzz9e/4lACVoUn3o0GCyr4jCAK0Pkes114evbOaAM1hDaeS+tmh
	n6jMFSGLvBilsQY5MMiKT0Nk8oQ3xJSOpgEdV8pyZ8fz9Fo2OewdP3b+wadH1QchUXNHxPNEdJY
	6
X-Google-Smtp-Source: AGHT+IFZUFZ0L9mTeD72IG95vctr8DSlLk8Z//jr9OwUqe/JwlPVr1fAL2IJxVzxtHmP2bRbHk/45w==
X-Received: by 2002:adf:f68f:0:b0:374:bcc7:b9bb with SMTP id ffacd0b85a97d-374c9460ff1mr2127111f8f.35.1725278520402;
        Mon, 02 Sep 2024 05:02:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ed45:1ec7:2c83:ff6d? ([2001:8b0:aba:5f3c:ed45:1ec7:2c83:ff6d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c39eacdfsm5127466f8f.42.2024.09.02.05.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 05:02:00 -0700 (PDT)
Message-ID: <999553313be2aa7be4e6e822f2e911aea9e2ede3.camel@linuxfoundation.org>
Subject: Re: [scarthgap][PATCH 4/4] sstate: Drop SSTATEPOSTINSTFUNC support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 02 Sep 2024 13:01:59 +0100
In-Reply-To: <20240902103148.3762538-4-pedro.silva.ferreira@criticaltechworks.com>
References: 
	<20240902103148.3762538-1-pedro.silva.ferreira@criticaltechworks.com>
	 <20240902103148.3762538-4-pedro.silva.ferreira@criticaltechworks.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 12:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204099

On Mon, 2024-09-02 at 11:31 +0100, Pedro Ferreira wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> This was deprecated with the introduction of postfunc support for
> tasks
> in general and only used by buildhistory. Now that usage has been
> removed,
> drop the code from sstate.bbclass. Any other users should be able to
> use
> postfuncs too.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> =C2=A0meta/classes-global/sstate.bbclass | 6 ------
> =C2=A01 file changed, 6 deletions(-)

I suspect this patch can be dropped from the series as we wouldn't
remove this on a stable branch.

I'd also highlight that this has not merged to master yet.

Cheers,

Richard

