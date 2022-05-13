Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297F1C433FE
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 14:14:52 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.8819.1652451286579328055
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 07:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A0t1eYpp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id p189so4877249wmp.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 07:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=WlxHcsv+DBU7AF48g5FXBy50I72E/7KP3g8b6YABIwk=;
        b=A0t1eYppWu23APIRqsc7gsaL1z01+ZPmvbdbvyA8hgY0pytRPTFPKOHZloXXLv5ZDE
         +o9xlsYMrOF+ah+pxgnvf9QoSKpd4VOdY185RhmIpX35WEKntjPIFSyYlfRqJMR3uoXY
         vPjmNm0taJkB6ywiy74EKztqMzApgThdydscM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=WlxHcsv+DBU7AF48g5FXBy50I72E/7KP3g8b6YABIwk=;
        b=3aCOiygRZopOScerQzZJ91zMZfg5z6lGb6DeGljjvTEKncRjWh8oRdI0TJPDC2SnbQ
         eNbVD4AZP6dv0zccyw7HTtMb8kzn97J878g/EsDujB/zw5vwgBVIY2VigsZYHJcka5Dt
         9TVMhnKnn0dprPxe17Dk1U2O/15oqB+nOgah3Nztq0K+BqppJrXPaTXFgmZEx1/VJt+l
         qvDSBZd3Ys215TzH0ISYBmWq0YLMDS+b2o4U5yr6m4PW91UKnFNLVtxlvUsVOQv5oQXD
         K8+AhMSLN/UHyU6D/hG2PsXhWOBusUGozW37RUC6E2UO8UDJjfW34Iq6PqQ/Cuyvl4FG
         jjnQ==
X-Gm-Message-State: AOAM530fuNouQmZEW8sRhxuF9wCjxKN9geeefhyGwle713DesJkIAiMM
	wuOX99pT3hfW3A+dI1PoZfcvtw==
X-Google-Smtp-Source: 
 ABdhPJxzgT7EQhH9xcUtZpty9f0Xv+sPKDsYj0djJIPqEneIFkfgnld8R+P0OC7SuBRoWfDnKM8T7A==
X-Received: by 2002:a05:600c:21c8:b0:394:7796:49c0 with SMTP id
 x8-20020a05600c21c800b00394779649c0mr4943073wmj.191.1652451284901;
        Fri, 13 May 2022 07:14:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a1e1:9ec5:5b27:abc8?
 ([2001:8b0:aba:5f3c:a1e1:9ec5:5b27:abc8])
        by smtp.gmail.com with ESMTPSA id
 b9-20020adfc749000000b0020c6a524fd5sm2646607wrh.99.2022.05.13.07.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 07:14:44 -0700 (PDT)
Message-ID: 
 <c9f06343ae9ba6ab346046539f0daa6a62bc3da0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] staging.bbclass: Ignore installing
 multiple symlinks of the same name
From: richard.purdie@linuxfoundation.org
To: zboszor@pr.hu, openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2022 15:14:37 +0100
In-Reply-To: <c97c1296-81b6-5900-eadd-dc3f711e82b2@pr.hu>
References: <20220513134829.1895574-1-zboszor@pr.hu>
	 <20220513134829.1895574-3-zboszor@pr.hu>
	 <CANNYZj9-ZWBBo=+FLAECu=Eg8ZtumcuijWQ8_mU0D-hkSRZEWw@mail.gmail.com>
	 <c97c1296-81b6-5900-eadd-dc3f711e82b2@pr.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 14:14:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165571

On Fri, 2022-05-13 at 16:02 +0200, Zoltan Boszormenyi via
lists.openembedded.org wrote:
> 2022. 05. 13. 15:55 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> > Apologies, but special-casing this in staging class is not right
> > either. The problem should be addressed at the making of
> > sysroot-destdir/ step from the npm class.
>=20
> npm.bbclass creates the symlink in sysroot-destdir for recipe A
>=20
> But then it's the job of staging.bbclass to populate a recipe B's
> recipe-sysroot and recipe-sysroot-native from recipe A.
>=20
> How can this be worked around from npm.bbclass?

You could move the line from npm.bbclass into the node recipe so it is
only created once?

Cheers,

Richard

