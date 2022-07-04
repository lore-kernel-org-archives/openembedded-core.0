Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0751C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 07:43:59 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.69291.1656920636717606100
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 00:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CKW5pKoF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id v16so734762wrd.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 00:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=aFr1m9sMvuovcGrvCdD4hSw+r3rhkANeoTfbwD5lyew=;
        b=CKW5pKoFnZ43zbdM9Zn9b7RgS8dOqkVc8UK4B0y5Jet/f5wBFc541Wa0Id7SymeExu
         CQRzCHDTnnfq1Aj9GzUZQryhveyaGZduSUfBYmv6bn3aZ+wT9PRols5uQJxLfnHo1NLj
         uQaulbIxRi9WdjM8EcaT2bmvRKU4lmUKZbElA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=aFr1m9sMvuovcGrvCdD4hSw+r3rhkANeoTfbwD5lyew=;
        b=m7dq3YSCuppAneTGcsQTJ9CKq0ATxT/tRIv7b/XgNg5H0KLSxzcFxiv/k6OHTM91SS
         dEycGVnmLL8Rfqe4dzOCsbiWy89QpUrTjYS8kfEQYrsyMw65AzIQ3lhBPMytoOpXzlw0
         C1cM6RqrWsvtzZAkWuXgCCGuCksYY9m0zz6FGtMDrkuBfsvES2xAlBqdK5wEVmV+pi6w
         z1SfOXDGH8ZI1rj6cJKZeojXxSqT7pCoRh0ryz8W5x8cvNDE+umQP2DUoXLmVnT8SbXX
         2y996mSK+QC4N3qagjJ9l16LtE53Z4/rcP3TpsReJb0ve8nijD6iCWJcFF0aSKDc0x1d
         yp/A==
X-Gm-Message-State: AJIora/6CmmDK7XGNOTIFqDcsC06DB56DLhThzJM6Z5R1vYM7jrgcKRs
	kqdZTcU87Bv1kExwigEukTcuRA==
X-Google-Smtp-Source: 
 AGRyM1uSOmUMxIdn5PPWRForY9Z4Qq///jg14Ev7PC8EFShgJQgqbeM//DZNEPfWRTd0VFEA8zt/fA==
X-Received: by 2002:a5d:5983:0:b0:21b:b7cb:f84e with SMTP id
 n3-20020a5d5983000000b0021bb7cbf84emr26338751wri.654.1656920634982;
        Mon, 04 Jul 2022 00:43:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2?
 ([2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2])
        by smtp.gmail.com with ESMTPSA id
 a3-20020a056000100300b0021b943a50b3sm29949698wrx.85.2022.07.04.00.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 00:43:54 -0700 (PDT)
Message-ID: 
 <747f989ca9a6e46b219b2ef277c06c845a53fc93.camel@linuxfoundation.org>
Subject: Re: [OE-core][kirkstone][PATCH] curl: backport openssl fix CN check
 error code
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@bmw.de>, steve@sakoman.com
Cc: quaresma.jose@gmail.com, openembedded-core@lists.openembedded.org,
 ricardo@foundries.io, daiane.angolini@foundries.io,
 jose.quaresma@foundries.io
Date: Mon, 04 Jul 2022 08:43:53 +0100
In-Reply-To: <YsKMEh4HUz7/9dFK@korppu>
References: <20220701161205.112341-1-jose.quaresma@foundries.io>
	 <CAOSpxdbq+CJE-k7dn1wBnd9ay-wD7-FdxMyMS5SXQVy=afdQCQ@mail.gmail.com>
	 <YsKMEh4HUz7/9dFK@korppu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 07:43:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167597

On Mon, 2022-07-04 at 06:43 +0000, Mikko Rapeli wrote:
> Hi,
>=20
> On Fri, Jul 01, 2022 at 08:27:20AM -1000, Steve Sakoman wrote:
> > Should be Backport, not Backported!  The latter will get you an error:
> >=20
> > ERROR: curl-7.82.0-r0 do_patch: Malformed Upstream-Status in patch
> >=20
> > No need to re-submit, I've fixed it!
>=20
> How is poky/scripts/contrib/patchreview.py setup to run so that this woul=
d
> fail automatically?
>=20
> I'd like to have this on my CI builds too.

See insane.bbclass, do_qa_patch. The issue will be:

       # skip patches not in oe-core
       if '/meta/' not in fullpath:
           continue

since we limited this to OE-Core originally. We probably need to make
that configurable.

Cheers,

Richard

