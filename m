Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C15DC001DB
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 09:37:05 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.13495.1691660214978527949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 02:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UNWLk5w5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fe4b95c371so3747235e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 02:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691660213; x=1692265013;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EoNIUssCT75tY72GFwUwsAIIKYC9ZlmZuER0TrvIX9M=;
        b=UNWLk5w5KKSpx11PuDepDUzDPJ8UUMutvek6RumWO0ENEoNAhu+nkcRBTkWOKFCv5e
         a2BuFJ9zdDvcSVkHeclge5GW7DsmLN4LK/siUzPMWIQSvOgA4yRpmfnWofGREwhnHaix
         a8bwYczX6YuaAcL671ud6PHArKCgw/s/tTGSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691660213; x=1692265013;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EoNIUssCT75tY72GFwUwsAIIKYC9ZlmZuER0TrvIX9M=;
        b=L/urkggxkH8d0Dy0VbIaHNeUzn/hjYrFPhEFBJYPBoqhWwTCBUYv6Ssf+o3I6eU7L3
         FY0pyI1zOHuIJ/sdGOYGuXIeQMseb2zWsCzvMIem/pUqIggdETOw8Z531BwdLlN1yyHE
         pWUzZQKbLKW4kBU/1aiAg8kL5kMo8aX+3nA88SH1rG1eacd2ukeoNiXeEzPvAN9b0NfF
         NGd7SHz9JmmJANkgx1PHx5j0wlSzTuX/NZgnTrYjEGno5pbrzuiKkOjkUwPIsJ+Nrqca
         nBR2BkEb07JKAwyq+vC4/UhN09BDr3Cjzeg9qnYWbm2B2Qyqp2p8ZLOILolMTicSa1KT
         LHzA==
X-Gm-Message-State: AOJu0YwjeQjnx102S0d5e3dLLvvhwIu7MGLBndGDHSVn3AIQNGYLlnw6
	4FB19m8uXfTrEwTK8tvHlQCwCw==
X-Google-Smtp-Source: AGHT+IHPLrJFaH3i3g/tq0JCrnrviD57I8K14k/GtjIWP6KbCKKfdfM9fnoIbzhpAINyZPhsinpoZg==
X-Received: by 2002:a05:600c:19d2:b0:3fa:955a:9291 with SMTP id u18-20020a05600c19d200b003fa955a9291mr1173726wmq.9.1691660213226;
        Thu, 10 Aug 2023 02:36:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ad4:8961:8732:8a5a? ([2001:8b0:aba:5f3c:8ad4:8961:8732:8a5a])
        by smtp.gmail.com with ESMTPSA id g11-20020adff3cb000000b0031807bd3614sm1535523wrp.90.2023.08.10.02.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:36:52 -0700 (PDT)
Message-ID: <63d9c229eb28de1c0775f033230489d9b47ec042.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/5 v2] image_types: use IMAGE_FILE_MAXSIZE
 variable to create fixed partition size
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	charles-antoine.couret@mind.be
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 10 Aug 2023 10:36:51 +0100
In-Reply-To: <CANNYZj_QRe7SwA8+7_oVN=YJC44VtqtwYVveriXUudwfP-TdsQ@mail.gmail.com>
References: <20230806211348.1191553-1-charles-antoine.couret@mind.be>
	 <CANNYZj_QRe7SwA8+7_oVN=YJC44VtqtwYVveriXUudwfP-TdsQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185731

On Mon, 2023-08-07 at 10:04 +0200, Alexander Kanavin wrote:
> On Sun, 6 Aug 2023 at 23:14, Charles-Antoine Couret via
> lists.openembedded.org
> <charles-antoine.couret=3Dmind.be@lists.openembedded.org> wrote:
> >  documentation/ref-manual/variables.rst  | 14 ++++++++
> >  meta/classes-recipe/image.bbclass       | 30 +++++++++++++++++
> >  meta/classes-recipe/image_types.bbclass | 43 ++++++++++++++++++++-----
>=20
> This does need tests and examples. You can grep the poky tree for
> places where related variables are used, and see if you can expand
> those places to include the mechanism. Please include an explanation
> or a demonstration for why existing facilities are not good enough.
>=20
> Documentation updates go to yocto-docs mailing lists.

Alex is right about this needing tests but there is a deeper issue with
this around naming.

"MAXSIZE" could easily be interpreted as some kind of upper limit on
the filesystem size above which you'd get an error. In reality, it is
an override on the overall partition size to a specific value, which
isn't a maximum at all.

I understand the need to differentiate it with IMAGE_ROOTFS_SIZE but
effectively they are the same thing or very closely related.

I think the naming needs a lot more thought.

Cheers,

Richard



