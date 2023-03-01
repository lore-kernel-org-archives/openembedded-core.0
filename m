Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CE5C64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 10:16:16 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.18685.1677665771168559110
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 02:16:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aPvbhe3A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so11417196wmb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 02:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1K1bSTDufDhIpURFZIBxixnq2I/h6VUNfHL19KUtaWo=;
        b=aPvbhe3AktVBiXb8b1mUCREBMM6keHkG7edHkmDBF8/JbZ0qGOeCYEEcLrmw4ZoLEM
         wo4cUUovoGbLvaaNaXSUhP+XDPoMd3KHvPLT+ZW0G4IE50u0QvGYimRli1PpZge7l6Yg
         YOe1FipDiQZObruakbcRZNC/0ZKKMMvyEQ3wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1K1bSTDufDhIpURFZIBxixnq2I/h6VUNfHL19KUtaWo=;
        b=IxIdRPIiEwXa4pF64Z4g0y++aJ+VRbq98HZ7yn8e/W8HeP8bnnkCLZYg3+WgT/lS27
         BOSUFuvUXihnXcOiSY8SPCxAFU+iKmWiX/Ss6tGdHxCBuLQHfxlZgwCb5SGc19MBICLY
         ZSCaTnzYsyTB47KFUZWUC9VpohDmDCe0Don0SQTj9o7PsePbqu7lGM2umE7T5xkUpt+g
         ReVv5E5U193CwKU3TPIVzxFnHcgvcEnkURDzFIcZ0z3ruT6C+Mgs0SWHMUvhbfMRDuuF
         24pA1f44FHkLVJVh4cpupivn2VpY188EFEztxGey2N9KHnD628L2bJsfVvO5Ey0x9aFV
         Dbdw==
X-Gm-Message-State: AO0yUKUAQk2RTvQrOkLB1ZjK85JsYWh9oQ3sMXJnoge/y+Gd4LmqzEJ0
	OI4lmFzGtC+XFjKcjXLdVADRRQ==
X-Google-Smtp-Source: AK7set+sSTEEntonuDExy8w1IV06WeAdeFE//WHYdearKA+ET4D1WxovO8Qfc7EymGglz966pO6+Vg==
X-Received: by 2002:a05:600c:4fc3:b0:3ea:ed4d:38ee with SMTP id o3-20020a05600c4fc300b003eaed4d38eemr4550892wmq.4.1677665769357;
        Wed, 01 Mar 2023 02:16:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc9e:5433:f22d:3a1c? ([2001:8b0:aba:5f3c:cc9e:5433:f22d:3a1c])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c379300b003e2052bad94sm18579929wmr.33.2023.03.01.02.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 02:16:09 -0800 (PST)
Message-ID: <30c5f60ba79809b77cd43b662f1fc193d30808c5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [pseudo][PATCH 1/1] pseudo_util.c: Open file with
 O_CLOEXEC to avoid fd leak
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Mingli Yu
	 <mingli.yu@windriver.com>
Date: Wed, 01 Mar 2023 10:16:08 +0000
In-Reply-To: <f6d3523d-bfda-e849-3693-54d4337e71a7@smile.fr>
References: <20230301000302.93660-1-yoann.congal@smile.fr>
	 <20230301000302.93660-2-yoann.congal@smile.fr>
	 <Y/8SQZ9wDOAtztSX@mail.local>
	 <f6d3523d-bfda-e849-3693-54d4337e71a7@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 10:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177880

On Wed, 2023-03-01 at 10:00 +0100, Yoann Congal wrote:
> Hi,
>=20
> On 3/1/23 09:52, Alexandre Belloni wrote:
> > On 01/03/2023 01:03:04+0100, Yoann Congal wrote:
> > > From: Pavel Modilaynen <pavelmn@axis.com>
> > >=20
> > > Use close-on-exec (O_CLOEXEC) flag when open log file to
> > > make sure its file descriptor is not leaked to parent
> > > process on fork/exec.
> > >=20
> > > Fixes [YOCTO #13311]
> > >=20
> >=20
> > This is missing the author's SoB
>=20
> That is right. But, as you would have noticed by now, his mail address is=
 not valid anymore...
>=20
> What is the proper way to handle this?
> * Should I track him to ask him a proper "Signed-off" patch ? (He seems t=
o have changed company)
> * Should I change the author of the patch? (I do not like this but on the=
 other hand, the change is quite trivial)
> * Something I have not thought of?

We need the submitters SoB line, it doesn't have to have the author's
although obviously it is better if we can. Since we can't here it just
means others have to verify the terms of the contribution. The patch is
trivial so it should all be fine.

Cheers,

Richard


