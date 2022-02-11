Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EE4C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 15:06:35 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web09.8400.1644591994992130050
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 07:06:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cI6m3Q1l;
 spf=pass (domain: gmail.com, ip: 209.85.221.169,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id u82so5120578vkb.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 07:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fLj1LagTykAlJCRSDh4e9kMYyRh8wa9GnWLBaS5svqw=;
        b=cI6m3Q1l2/JeLKwC/3V0jz/kLfD8KpdWQGvaSGUpn4baWk5M6Pgdc6HfQZw6gEILWD
         1ukO3GLMvoKO/9UMqQ4sV3SRB9EGaVLx4YgFp+z3TnPte2F3/LMofjkwe0fCjy1j24fg
         m76UigmO70kPY4hv82rniyyDFGb9bpLpdwIWYESE7MyfOJ0WGzJ7IK9/2dLLWaMhVFNw
         JKkNuNQaSRlYHfGdLTQcIv/6N66FzOJm5tcfCyiEb8cXbT9e9rsxF1VCqk94p8wlIvHC
         50i+3GDvFyVFrg+KYNDqFltwEZSsYGuOX4ksAjQMM/PVyM3h7Xt09GOiro6Im0LsaaL3
         zCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fLj1LagTykAlJCRSDh4e9kMYyRh8wa9GnWLBaS5svqw=;
        b=Nra9rEDrObVi492rb35OzdMm/yHPgi6jWWR5vYq4mwNIDloKIhodwjoDBT3jlOou5y
         DFTevUJG05JWuuNGb3StGe1WP3Vjdmvh3+kVh07urPx50/GsEktXnJsHVeOTRZs6CLiN
         tbdD1Pu2K4z/grijWv6+siLzeWNk7T9EYW3fCii3TZ6+q+bFQGejHI/VuXfkO0fc2PfS
         12SKr7LCRovmOUpNUi/0+nxW7tGGTe/21WV4M327NAr06HJKHl/6M7wfxLw5Q7Cmrnxe
         WBimLOE0+7942bQcB99PrYOPvCvXtofvusZ+68jO2nmNAchuMjf3ccBy3no+HRZ7K96n
         B/QQ==
X-Gm-Message-State: AOAM533GmdAYulcM6FnrLQiKv9onSc+t9eRXufMcGqGR99l83euDR9u/
	8QGXAGyt62DZaWgIVjzcJk+vGFkWQhc49LxXJI0=
X-Google-Smtp-Source: 
 ABdhPJwOLu2sdK5TTdKONNg4bBWhcXm03+9B+24axEARloNEc7qPOlkQr4AsPa2rmic3pDR0vtjfHyhU7esjSTPX41o=
X-Received: by 2002:a05:6122:50d:: with SMTP id
 x13mr587921vko.4.1644591994124;
 Fri, 11 Feb 2022 07:06:34 -0800 (PST)
MIME-Version: 1.0
References: 
 <CH0PR20MB3948AC26096D485ED45706F6BB2C9@CH0PR20MB3948.namprd20.prod.outlook.com>
 <CANNYZj9_bX2BLzXWM6f+OZL9dsjDrycc8TWrZkQMkW0MznYfgg@mail.gmail.com>
 <CH0PR20MB39480F83C8949247D7968800BB2D9@CH0PR20MB3948.namprd20.prod.outlook.com>
 <CANNYZj8FiA8==JdmsV-ws=q+0W8hQQRPM6o0+OsGrrjpRo+gXg@mail.gmail.com>
 <CH0PR20MB3948F3D57A8F78D131B9B246BB2D9@CH0PR20MB3948.namprd20.prod.outlook.com>
 <CANNYZj80JaZqGQQyYPB_8S7gejDKSc0fpYCmY-2=Z+=YoqKtMA@mail.gmail.com>
 <CH0PR20MB39483D12D0719FB606E87560BB309@CH0PR20MB3948.namprd20.prod.outlook.com>
In-Reply-To: 
 <CH0PR20MB39483D12D0719FB606E87560BB309@CH0PR20MB3948.namprd20.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Feb 2022 16:06:22 +0100
Message-ID: 
 <CANNYZj9zbHH7oef1KeVk+TRBbm6kyur9Ao+hkqTJycv5UcxEzA@mail.gmail.com>
Subject: Re: [OE-core] gio-querymodules: error while loading shared libraries:
 libffi.so.6: cannot open shared object file
To: Bryan Evenson <bevenson@melinkcorp.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 15:06:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161654

On Fri, 11 Feb 2022 at 14:46, Bryan Evenson <bevenson@melinkcorp.com> wrote=
:

> However, I still think that a package upgrade should have a way to exit g=
racefully for something that is an optimization and not required for operat=
ion.  In my case, my device isn't even using the GIO library and the gio-qu=
erymodules serves no purpose.  I don't know enough about the entire Glib pa=
ckage to know If there is a way to make this functionality optional or not.=
  If there isn't, then I will continue with my own out-of-tree changes to f=
ix the operational problems I am seeing on my device.

Thanks, does rpm do something similar to debian? This does look as a
shortcoming in opkg design; what would help you is perhaps a comman
line option for opkg, --ignore-scriptlet-failures or similar.

Alex

