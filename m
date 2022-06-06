Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1827C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:58:14 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.31658.1654520290059409929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hXDtzEil;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id x17so19760917wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=otvtB2EpOYGJwAjknNNY6+XMuLUIN18PR9km807HYJM=;
        b=hXDtzEilB2/E5DcPAhP1c6LbQMde+0n/2qnDTlDn+EXYDH8SucP26dF2ZZ829WbMi7
         0eoWuwGbNWpkpuJOFNI6Vm9y92FmuGYIdxUY9J2Xmqor2QoY00Z/fuut4eOOEC6YeI6b
         EB+WWvY4p6OAiC9BxlD4QPkcJgvxi43smas1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=otvtB2EpOYGJwAjknNNY6+XMuLUIN18PR9km807HYJM=;
        b=Wkzb38QCtw83qGpILTKQAVXzhHQZAIWhnIsRaGPmZBAOFKYNRsangCQq1F7d+Ld0/q
         tJHhNyjFxbGkR5vMaa0WioHgi5VmUT9Ox9+ZOYacXXYmxKDoIVUQia1fQCjXncz/wgch
         BIAfMWxaC75v8ilcApCyCYwzDB83DRSLK57Tja8/LoV2M+ac7K7p7Wr0bQKQWwisctDc
         Tg0trVSeb96eSP5DK/ajeg29FZaq+iR3fpJ4wC65/TP9zAGqaNURW/sWC+wq5OR3Sp19
         2ltyPcAD8EGkjolkjzpT1F/yZcojT6Hrx53+GAYrbKjlTlhQWuI3ifB2ujTfJgPDc2ag
         qZdQ==
X-Gm-Message-State: AOAM530biFPCuFa93+RlTJEE8EDE8v+drE/YHY4fRlqfAI6giUw+yhe+
	J5uwGEtbMz9Bsc+7ZgbtBlV+hg==
X-Google-Smtp-Source: 
 ABdhPJx+xO2gOBYKoiYVTXvL8HN3FogPYGfJbbK6eM4r4xVWsa0JjV587nx0NnzH1vuWSltu0EBxCg==
X-Received: by 2002:a5d:6d0d:0:b0:218:45b1:ef1f with SMTP id
 e13-20020a5d6d0d000000b0021845b1ef1fmr2290809wrq.558.1654520288381;
        Mon, 06 Jun 2022 05:58:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:22ca:1a07:c46c:a885?
 ([2001:8b0:aba:5f3c:22ca:1a07:c46c:a885])
        by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c4f8600b0039b006bd6d9sm23580371wmq.6.2022.06.06.05.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:58:07 -0700 (PDT)
Message-ID: 
 <0fe1a1e3769bd501474f3e1174345c26f338a510.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv2 4/6] libsdl2: dont mix opengl and gles
 backends for wayland
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Mon, 06 Jun 2022 13:58:06 +0100
In-Reply-To: <af22fea5-01ac-7eb6-271c-487a86e23758@t-online.de>
References: <20220604053028.4682-1-f_l_k@t-online.de>
	 <20220604053028.4682-4-f_l_k@t-online.de>
	 <d82cc562394b4cd74a3fedc53e6b41f7bb053f81.camel@linuxfoundation.org>
	 <d5887223-b996-cd38-3fd2-b2e04d51ff90@t-online.de>
	 <9dac6561419afa5777a01d1acbad52a623296d4f.camel@linuxfoundation.org>
	 <af22fea5-01ac-7eb6-271c-487a86e23758@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:58:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166626

On Mon, 2022-06-06 at 14:50 +0200, Markus Volk wrote:
> I've read the error report for mingw build and did some tests yesterday.
>=20
> Added meta-mingw to bblayers.conf and this to local.conf
>=20
> SDKMACHINE=3D"x86_64-mingw32"
> DISTRO_FEATURES:remove =3D "x11"
>=20
> and then did 'bitbake core-image-minimal -c do_populate_sdk'
>=20
> This lead to the expected error message
>=20
> > Checking whether type "fd_set" has member "fds_bits" : NO
> > Checking whether type "fd_set" has member "__fds_bits" : NO
> >=20
> > ../xorgproto-2022.1/include/X11/meson.build:19:4: ERROR: Problem=20
> encountered: Your fd_set is too weird.
> >=20
> > A full log can be found at=20
> /home/flk/build/poky/build/tmp/work/x86_64-nativesdk-mingw32-w64-mingw32/=
nativesdk-xorgproto/2022.1-r0/build/meson-logs/meson-log.txt
> > ERROR: meson failed
>=20
> I was able to fix this by changing the libsdl2.bbappend in meta-mingw=20
> like this:
>=20
> PACKAGECONFIG:remove:mingw32:class-nativesdk =3D "x11 opengl gles2"
>=20
> Like this libsdl2 doesn't try to build in gl for wayland either and my=
=20
> build succeeded.
>=20
> I sent a patch to openembedded-devel for this yesterday.

Thanks, I've merged that so we don't run into that in future.

> In general, I think it's a matter of perspective. The current state=20
> forces me to request x11 globally and thus prevents me from deciding=20
> within recipes what to do for wayland and what to do for x11=20
> DISTRO_FEATURE. They always have to come in pairs. I thought that from=
=20
> wayland's point of view it would be ok to include and use x11, although=
=20
> it should not be done by default. I understand your concerns about=20
> losing the clean line when mixing x11/Wayland, and it was just an idea.=
=20
> If you don't like it, I have no problem with it.

I think keeping the "clean" line with x11 is necessary at this point.

Cheers,

Richard


