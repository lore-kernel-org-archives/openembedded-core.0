Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C5DC433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 14:23:18 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.50119.1654006995159278053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 07:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZxnNTqgQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id h5so10838970wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=esBXxvFODLomGYf62N04+ay7pFLWYIxlNL+/TkrJmBY=;
        b=ZxnNTqgQsaSvdu7+0aV2MPmFP6lh/uhKWEwAolY+n8AuZ4K/iJGYQEf6oaQZqiMcYu
         VThWR3RiF2cFN5xjVGyM5uwXzS4zC2w5s+XP3y9tCaNyG7HvWS80PnnMVY0D6STcthPb
         Vg8VlePo214NE1GueM27bN8FBWTAebt/e7dLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=esBXxvFODLomGYf62N04+ay7pFLWYIxlNL+/TkrJmBY=;
        b=f8JZRiCp/6PjSIm50Qu0Qrph36OJO0azxl5Tqs76y2uMpz/96snHwNRFNvHDa4PLD7
         PSXEzY7MFZEesuEPW9r1Hbw0+aae1UGdSbJTIYaNsgbHQdN7CjrprNudJKJd5PZFiv4e
         R0HnBa6BbfvOK0lUMnG1/JfRT8UL9kG2HUJLSdy0kSAq6ydzg5Xk5PB2zkckRZ0xGYBj
         KDq20q1jXvJqSc6+ewS/LE3a81VUG1vAQfl4Rs2WbtTIOxZx8qXL54y1LFuC6EYa8qS1
         stYEj/KwoiMfanbgkztdCeKyFkSu4eL1vQsDjfZG4BotLInungbGVtnQb+G0jntU/p6A
         WS/Q==
X-Gm-Message-State: AOAM533jkG2PcHl0Ey503T904hmgjd5RoijGVKboQdncEwwG5NTQeUfh
	/4rcHGHwE8bvHVWqgj4ErGu4FA==
X-Google-Smtp-Source: 
 ABdhPJxIarw7p9QjARGDJYiAp14UPIg26cp9lZiT0aMsuHSObYGrVsMhbCRjte8+fSzPNT0YrFg0JA==
X-Received: by 2002:a05:6000:1c16:b0:20e:7a44:fdd3 with SMTP id
 ba22-20020a0560001c1600b0020e7a44fdd3mr45071849wrb.125.1654006993634;
        Tue, 31 May 2022 07:23:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d16:2159:4370:b82e?
 ([2001:8b0:aba:5f3c:d16:2159:4370:b82e])
        by smtp.gmail.com with ESMTPSA id
 c17-20020a7bc011000000b0039482d95ab7sm2481687wmb.24.2022.05.31.07.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 07:23:13 -0700 (PDT)
Message-ID: 
 <ca1c9481a03622d6dc3136db5f59c8602b0722dd.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv2] libva-initial: unbreak do_populate_sdk
From: richard.purdie@linuxfoundation.org
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2022 15:23:12 +0100
In-Reply-To: <20220524155021.416611-1-f_l_k@t-online.de>
References: <20220524155021.416611-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 14:23:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166314

On Tue, 2022-05-24 at 17:50 +0200, Markus Volk wrote:
> Error:
>  Problem: package libva-dev-2.14.0-r0.corei7_64 requires libva-initial-de=
v, but none of the providers can be installed
>   - conflicting requests
>   - nothing provides libva-initial =3D 2.14.0-r0 needed by libva-initial-=
dev-2.14.0-r0.corei7_64
> (try to add '--skip-broken' to skip uninstallable packages)
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-graphics/libva/libva-initial_2.14.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-graphics/libva/libva-initial_2.14.0.bb b/meta/r=
ecipes-graphics/libva/libva-initial_2.14.0.bb
> index 453096822f..b234797efb 100644
> --- a/meta/recipes-graphics/libva/libva-initial_2.14.0.bb
> +++ b/meta/recipes-graphics/libva/libva-initial_2.14.0.bb
> @@ -6,3 +6,4 @@ do_install:append () {
>  	rm -f ${D}${libdir}/*.so*
>  }
> =20
> +RDEPENDS:${PN}-dev =3D ""

Should libva-initial be creating any packages at all?

I'd have thought they should all come from libva and we should disable
the packages from libva-initial entirely?

Cheers,

Richard

