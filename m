Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192C8EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:23:56 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.4395.1689585826861733599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=J7jGA862;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.176, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b703d7ed3aso63937291fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 02:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689585825; x=1692177825;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t1vVEc9FwREYnOcbMYbWVMAdVcPxoeG0MMS1QMY7niA=;
        b=J7jGA862LOdFbQ0WcCoF91IbLzAowTlUdQDjKIGiaw2e0nehur9al9ezvDYEnhILh8
         Jrm3gXPpDvo1R9gqvQE7YnMfPbgElYwxbESpjC/VXXJYBn8Wb8tzDuCh2LgOpk6hmbgt
         tG4AQdoFbCm9w5jYFKqBDJYIBy0g1eMzL6Oo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689585825; x=1692177825;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t1vVEc9FwREYnOcbMYbWVMAdVcPxoeG0MMS1QMY7niA=;
        b=igd4/RlpEFslGfWJ6rnXuD1ajs4EUNqqdVjjRq8OrSnZbYheEPKYkdEv3kGFw8/2i8
         MSYgVZ1/ylE8GjMdqut51xXHN8jcYZu5hFFMEEVBPV5TQmD5DVEdCpdeUwKzYkpzVTJB
         HR8HcyEwK+jLt6u2KksybUV/6YMMlgrFKnxlibnO/VCoOHab+dG8Rd6WH7jNy+aA3Y8o
         6u+6IhHB7XwPd7dfXsUpNsRdEuGXJ12+5JBnZ0gf572mej5qv2yCxQSj145Fwjvqt4bQ
         zCJafXN4/dEkGUfSyN2bwTfUrJWG8o5Z7MVCl9CcT2ujKvVDSd1o0yx6cq/A+XNNVHbZ
         D6Sg==
X-Gm-Message-State: ABy/qLZbPkwYgJ5iFxA9MC5AMQ+jnGkkw+a5Bqeg5GVl5TCqHWCzfFnS
	3X8unKRjOKLUda57zUKRBMWNrw==
X-Google-Smtp-Source: APBJJlHlee7oCarU1OO1WQaeYR9PL9izvzAlYoWE/N5ks0j1lBfyebBI6g/3K2N4ABPruUrfbiB6EQ==
X-Received: by 2002:a2e:9011:0:b0:2b6:fc60:776f with SMTP id h17-20020a2e9011000000b002b6fc60776fmr7903483ljg.30.1689585825087;
        Mon, 17 Jul 2023 02:23:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6671:c2e1:78e1:cf2a? ([2001:8b0:aba:5f3c:6671:c2e1:78e1:cf2a])
        by smtp.gmail.com with ESMTPSA id f11-20020a7bcd0b000000b003fc07e1908csm7592908wmj.43.2023.07.17.02.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 02:23:44 -0700 (PDT)
Message-ID: <c838ca7a8fdaca76fdc30158b5acd3f8f75cf67d.camel@linuxfoundation.org>
Subject: Re: [OE-core][mickledore 26/26] image-artifact-names: include
 ${IMAGE_NAME_SUFFIX} directly in both ${IMAGE_NAME} and ${IMAGE_LINK_NAME}
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2023 10:23:43 +0100
In-Reply-To: <CA+chaQdH1xn8WMmgip89Gae=m6nM1ONEDWzXoB8-GzskfpGv6Q@mail.gmail.com>
References: <cover.1689373875.git.steve@sakoman.com>
	 <7272fe3663fd9eb6144138f6b090075af6eecaed.1689373876.git.steve@sakoman.com>
	 <CA+chaQdH1xn8WMmgip89Gae=m6nM1ONEDWzXoB8-GzskfpGv6Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184456

On Mon, 2023-07-17 at 10:38 +0200, Martin Jansa wrote:
> This isn't backwards compatible and various BSP might need small
> adjustment to work correctly with this.
>=20
> Please don't backport this one.

Agreed and 25/26 probably isn't needed either.

Cheers,

Richard

