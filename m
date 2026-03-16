Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B94F4644C
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 10:53:30 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47942.1773658407240234769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 03:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UcWtmhN8;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-509046c5c7fso58296301cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 03:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773658406; cv=none;
        d=google.com; s=arc-20240605;
        b=OwSb8Rchc6VX0g5/u1P8ffKHV5HQc3Kjkv0A4E8r520Ol6Wb65CUwFiBLGLuuSyskC
         BQCVBkRNPul2satU7K6VSro+bd+jQMbgXJ8wAHJ81Drt/5Xxw6qEEHQglfMkpmUWPIVj
         ZI6yxCq6sK3kqF73DCfOhYzNK4+W4I2Pujq0/mfpUaVfSe72qjqQ7NJwEj1mVx2AIibI
         MHHQhiidu2bXMKN/v1qXZhR9P+hRdP9+7qgfdO5g2qIi4SFGdZh3Hc3HlKwLKy23U/+s
         NqKk9nc4bWVcVmU5PRGdZ2k9JWyLcZrAsRdQx8Wc3wLVs6i79LdExAqpFJ//CD+Fd++q
         n/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JeZbR/HQiVhxNP+iusu8w8BqgbF3LDApE23kmyUhHGA=;
        fh=OQtNlTcu7jqAHIGCxOUCu27TtZubnZCEp9O1Gs/aDC4=;
        b=YV67zIsJsJrs6V0zX3WIZm9+RCu8ivyVCgJICyjyR3Jb40G2AV38UXyUx3bM9zQbC1
         PURgrZ+fjyuqILnI7KLJe5aCZUU4hfRIKz7TMPPzVGkWoX0VR1s3qssflAtTILdpzrba
         xpj9Arymb0tPcF5g8TmpP9wdE/OqvSluwiTWQp4TV9BzUel4ktV54Y7B/KFg+aKRHKr5
         7W6SBA9vFqAJzbdDTmat31VyqESdcuewTuHEAWxMtUJNREyfw/ej8WkWRWQpyYS/s1xR
         b9eyQPwMxvRuY7V1jnEnyfT/LjZfHL+wAdxJNQpv6XXVAQb1/zkpyqW5OKyzx2KWN738
         FfWA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773658406; x=1774263206; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JeZbR/HQiVhxNP+iusu8w8BqgbF3LDApE23kmyUhHGA=;
        b=UcWtmhN84ktg6UO0C2dUO1oX/8fNN0wfm8ovaQRWhFovK9qQWbVfAZwWxyTPq+kVsB
         PdeV2gs4iq55/oOf0Qv9BDM9rG4qH9omo6ylxIzDXoA2bx7Plup57Pt+2qZ8miI/dwFp
         SNA9bkEC/Ft2JuHddvdhQkiakVMkl9BNPsLN7oXEpRFxeLVa895OqLHCF3SPRICKGkyh
         0FAl5NEVSXSFpOYaipoVfNo2BM3rOUEU3IVBWU/ern8gf4ucKpFiowLSopAgzEkXFYNZ
         Kch1OtZdcqsXPTclwdhTvzsIIc1zKwpz538C1HiEZts/yrdSrdwadmjJJqYAzFI2IoX6
         1rzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658406; x=1774263206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeZbR/HQiVhxNP+iusu8w8BqgbF3LDApE23kmyUhHGA=;
        b=CMAa8+8go9owlfODL/ExfS/0B/7tJjmlqTvDAz9Pmqhl8UFN1TXRbpFggCZXWRKpvu
         Xtp33Ks96Qz3jdEQKYLv/A50zkXNWW6AIBW8VUFNYLL28CzSuoTOfnI8FhC4dV8nkOC5
         KWI+9LpBvsysS1YMz3zInyuxu8ChvyVJqtQr+jB7Ln7lQRKtI3TDiXUfVnseT8L+6Kls
         vjLbHzqVBPNqtOwqUc/cM9uGOGI7CiNspiNCrQBWwodnK3D7gGZW1xereNjfl5/e+tNW
         EkyW5rJUy+3LuvnZRFCEm7tV+GuVY4lpgfJWvAFjdbLDieRug690PLda8GmNbX3+tYZW
         L97Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDrQw8YNyRMZ9YdjZgoMqe/j3mFUNZA2QXzFWWfXzWIsI9H5LvIk2oYX1c+UnvdAy4Kz2CLg1N5B0ULaFBSeX4Pw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzVQ3VTbLrSGti0HT0pXyRI7W0fe42+ZXEEbu7rQrx1fPwxHj+5
	QWA0Smm0uSA+9fHxp8dGziNuNoGondR4UT2KVelHu7S4EkR2/so4/tlEyFEVJL01E5M8L95BJ2t
	7eWxpAn9KAGhuqC2IOytJ1tNyK7f6Hw4=
X-Gm-Gg: ATEYQzzJ705s1lJuEqVeERDemqAOugfZwbtLeJpCL6iZ3iKru4+wS9eXZw6IyFhcH4Q
	tS3xrjw5WsgScKZm2dRmAWQWryyhR/ZJkIeMijCD4NIrdnDdIa80YLB7T9gfhvAnDeE7O13pjT+
	UOtcu5B+DnMULhzuFJdXshUe2J7Y+6SnRcJoxXltvlOqzlG8bkvdTPegi9PqbHM5CdNjQIS+7Eg
	mBEIiBtajLr1EDKLBHZ5+LETgmSGzIxkyLQJjD+qWkGe1le8dLQ9Qxv2VVpJe/Dq5mrt0elOK3v
	umbdHrrmXePQCfKAz8PFPDeJFbHDOPgB13Yb3C0fCQ==
X-Received: by 2002:a05:622a:178b:b0:509:33b:ed6 with SMTP id
 d75a77b69052e-50957db5711mr183420971cf.23.1773658406121; Mon, 16 Mar 2026
 03:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <DM4PR11MB61899D3F758D2B3C7BAA9361C444A@DM4PR11MB6189.namprd11.prod.outlook.com>
 <AS1PR10MB56975F5D6969FA7DA67B247DFD44A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DH0UAYG0BSHQ.1ZJE32LWQ4ECN@smile.fr> <DM4PR11MB61897AD50E39921242338DEEC440A@DM4PR11MB6189.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB61897AD50E39921242338DEEC440A@DM4PR11MB6189.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Mar 2026 11:53:15 +0100
X-Gm-Features: AaiRm51YPUkJCLWv71HQftwvaJ_6vIz45N4PPHSv6ORA65FIz2aGec78x15La5E
Message-ID: <CANNYZj-OAQ1SN+FYvgdeYu-pVFkROSusyiT48Sv++xCAxJ=zqw@mail.gmail.com>
Subject: Re: [OE-core] Inquiry Regarding Package Upgrade Approach vs. Manual
 CVE Fixes in LTS Releases
To: deeratho@cisco.com
Cc: Yoann Congal <yoann.congal@smile.fr>, "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Viral Chavda (vchavda)" <vchavda@cisco.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 10:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233243

On Mon, 16 Mar 2026 at 10:39, Deepak Rathore via
lists.openembedded.org <deeratho=cisco.com@lists.openembedded.org>
wrote:
> When the upstream fix exists only in an updated version, upgrading the package is the only viable approach
>
> Please share your thoughts on this.

My thought, and I've expressed it many, many times before, is that you
should learn to upgrade your products to new Yocto releases, instead
of assuming that they can stay on the same LTS release for their
entire lifecycle. Yes it's difficult and costly and adds risk. You
need to set up bulletproof, automated testing and qa pipelines. You
need to convince management. But I firmly believe that's the only way
you can avoid hitting those nasty CVEs that can't be backported.

vim upstream is a special kind of madness. They file CVEs for pretty
much any potential security issue they find, and I have this feeling
that people want to address vim CVEs not to improve actual product
security, but merely to silence the CVE tooling they run. Meanwhile,
there's plenty of potential security issues fixed in various other
components that don't even get a CVE, they're simply released quietly
in a new version. I feel that product security is better addressed by
simply staying close to upstream. Unfortunately a whole industry has
developed around CVE backports, and I am aware this is a minority
opinion.

LTS upgrade policy is not going to change. LTS makes the promise of
stability, and unfortunately it does come at the expense of security,
or at least is pushes the security issue down to product developers
from yocto upstream. That promise can't be broken.

Alex

