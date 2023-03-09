Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F8FC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:22:32 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.16216.1678375351269066145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:22:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X7MTRXxB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id j2so2232991wrh.9
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678375350;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ak+VSuaPRq1JoTpyqbjSqQztAauY2KSuKYglu5ymPrw=;
        b=X7MTRXxBNdyqxlSVxrJODQcMy5j3Q7Y5kEUkKhTYDk1H4k17LOZQqynZs7Rv9DR15Z
         p911c9SqqyRPcFtZeFHcAudqiMBWv97aCFMQApMH0QyylSLfJiyZfMiy65p8JXXUL4yi
         p1UtaL20u7BvgRsqAsLJzf4ZMk38Sg45O1RMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375350;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ak+VSuaPRq1JoTpyqbjSqQztAauY2KSuKYglu5ymPrw=;
        b=PMr/FW64C0EUu8TbvU11FpA0s/u2Ft6xTN23i1L8q/JbjbfHVRavk1Ap5Qv1quUgW8
         1SZ0QeMAWxFUhUAqniQ3Q9fAUAxVx/Y6cRD8jTFGwVXXjr1r7XoCTJbTpLMhvnH9m8Cl
         ElQC/VF7xeuaMNklJgDxN2aQFYqaVKtOo35IfqMObftEpMmV5jO1X0H5sLPuFYSerxCL
         vs/z+J4+AIrNe7Q6whNfaADTv6FTzVbrU7n6uOUM5G1oy1SPPbIlueDEHy06U9mYYk+G
         4v2jp100EpYCFInl8pe4rfjXzFS/+kIOmKVB6zV8jal6zPvIC73O7UpCmGqgSEvYWanJ
         rymQ==
X-Gm-Message-State: AO0yUKVIKtzk0Rsw2QRjdoqIRJzmaiVDr/C87evGg1jhhWS/giz3a3Dc
	TetWyvoYB5vyDjXAhP1UM2eO+6MCflVvOk8/nN8=
X-Google-Smtp-Source: AK7set9+/rOiGMHyf9xQ7kT+sMnz4+PhhJH//G+20xXPPq21YaYq5T/SCC2HRmBpiAbLBzIV1L8AmA==
X-Received: by 2002:a05:6000:1a43:b0:2c9:6b87:962d with SMTP id t3-20020a0560001a4300b002c96b87962dmr12348971wry.15.1678375349820;
        Thu, 09 Mar 2023 07:22:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7e05:8348:1f1a:b973? ([2001:8b0:aba:5f3c:7e05:8348:1f1a:b973])
        by smtp.gmail.com with ESMTPSA id e23-20020a05600c219700b003dec22de1b1sm190138wme.10.2023.03.09.07.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:22:29 -0800 (PST)
Message-ID: <e549bd404d248611ef51394d90abc8a8ed8a8d88.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2 5/5] bash: Fix install conflict when enable
 multilib.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 09 Mar 2023 15:22:28 +0000
In-Reply-To: <OSBPR01MB184550B5D7326199A5C3FF34DCB59@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
	 <1678239619-21210-5-git-send-email-wangmy@fujitsu.com>
	 <6e1d1ccb86355e4bd4cdf669e06069706b702afd.camel@linuxfoundation.org>
	 <OSBPR01MB184550B5D7326199A5C3FF34DCB59@OSBPR01MB1845.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178252

On Thu, 2023-03-09 at 01:51 +0000, wangmy@fujitsu.com wrote:
> > I think we should just change the MACHINE, OS, CC and MACHTYPE
> > lines to
> > something like "<redacted for multilib compatibility>".
> So for the correction of this problem, do we need to continue to vote
> for patch?=20
> Or accept this patch temporarily, and then roll it back after the
> bash update?

I'd like to see a patch which fixes the issue properly. If I take this
one temporarily, it is unlikely anyone will then send the correct fix.

Cheers,

Richard

