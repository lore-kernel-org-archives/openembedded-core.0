Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6572C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 20:46:35 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.2183.1642711585560752165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 12:46:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H5C3qk10;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id w26so14552687wmi.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 12:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Cy1pPh3sMFTUHzFIpt4bdjvzTV9ceCzsR/CpiDyO0M0=;
        b=H5C3qk10s2ktL0pcd8EpgqBo6FOdhbscJjxEuWBNfaSshl1NhyxhjbgBprId6/qgy+
         BG90SJR4MQYg5NNqULpJit0AdHESIpD1HrrVPVLZlV7uWzjKBn9M6A4hnwIK9p/qtd5S
         Uo0gUTYDeUa4vJ7LIn5XAurNM9SvN4W2ooxFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Cy1pPh3sMFTUHzFIpt4bdjvzTV9ceCzsR/CpiDyO0M0=;
        b=EWMD/s1/367yBNp9xczwT0Bqdqi1lxsF8cdFVg/eTLR/qbzv+1lPP2I1tIYo6Nm+Em
         XSw1uKn4pFEb3Wx5U1FS5EQffmPOze4YHt0595z4CDmV5i8etJsHP0Y9FrKSNUf7Pwbq
         2nqurh7LPrJuMejidwBlB7BJvUSRQpKU5MrwJC7O04YchlMUvJj7NxPhkUOc/9EZY7Dp
         xE3SI+MkBhGM15Oy57p7bpxL0m0rd/h4591+SEjL+/0f/8LMG+Qy3uXj0RbFpkMvhZfX
         rfPxFdjBCkENB7K/R6TNpUgRGkeFasDsMAJDZwBRZxxiuLHjlEPc++n2gZ3IQV5FCkej
         JpWw==
X-Gm-Message-State: AOAM533FHURjkHe2seTq6XG7E6npyTozmUTjKy2EyJqvOYO2s5jRtTmP
	1aDUjLoniaxr5YwZ5AWj0lCROw==
X-Google-Smtp-Source: 
 ABdhPJyoLqb5Wj9l5aM502To5ErxFVHnftjiNpwpkxsdbGIU6HEcMFSfJqflk4Wgw3CxX5F2ffAP4Q==
X-Received: by 2002:adf:fac9:: with SMTP id a9mr764689wrs.318.1642711583923;
        Thu, 20 Jan 2022 12:46:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4dc7:4aef:2fda:b7ee?
 ([2001:8b0:aba:5f3c:4dc7:4aef:2fda:b7ee])
        by smtp.gmail.com with ESMTPSA id
 f6sm3627130wrj.26.2022.01.20.12.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 12:46:23 -0800 (PST)
Message-ID: 
 <56724a11b917e32b196f8aeb7c4678c4e0903d49.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] runqemu: automatically turn on "kvm" on x86
 CPUs with VT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>, Ross Burton <ross.burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jan 2022 20:46:22 +0000
In-Reply-To: <27cd215a-abb7-a873-40a6-86df335691b1@bootlin.com>
References: <20220120152146.1912559-1-michael.opdenacker@bootlin.com>
	 <CANNYZj-wjwmKuu_FxoktmP84TFUJU4yi9JJ4bZ1N23VP+83n6g@mail.gmail.com>
	 <27cd215a-abb7-a873-40a6-86df335691b1@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 20:46:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160787

On Thu, 2022-01-20 at 19:43 +0100, Michael Opdenacker wrote:
> Hi Alex
> 
> On 1/20/22 4:28 PM, Alexander Kanavin wrote:
> > I think this should cover aarch64 on aarch64 too :) And presence of
> > (and ability to open) /dev/kvm is probably a better check than looking
> > through cpuinfo?
> 
> Thanks for the review!
> 
> However, my abilities to build and test on aarch64 are limited. At least
> this change would take me much more time to develop and is more likely
> to cause regressions.
> 
> Wouldn't this version already be a worthy change for users? I'm not sure
> we have many users running QEMU on aarch64. Would automatically passing
> the "kvm" option on applicable cases have value in our automated tests?

I think the patch as it stands will actually regress things for many users. You
must be already in the right groups to be able to access kvm on your system but
I don't think that is the default for many distros. On those distros you would
see a "permission denied" message from qemu which users find very confusing and
I think this is why the code is in the form it is in.

We might be able to improve the test further with the open permissions Alexander
mentions but that is probably necessary to make the patch mergable.

Cheers,

Richard


