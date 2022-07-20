Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D2AC43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 09:58:55 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.52010.1658311129753379728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GuCZtFf3;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id p6so20510348ljc.8;
        Wed, 20 Jul 2022 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=f/7ujSQqYl/X/bnhOoq3q/4kBtn2PoaQm8BLwgjgxmU=;
        b=GuCZtFf3z1vlqO9Gpc1er2WF5MrfEzRZZEnrioJdhlsbPkin0bd8UKS9Mdn6+QvR1H
         /SjuDTYMuSl0JL1sqYJEiZzCs1VAgvG7BVWmLaZBA6mmrCFZAWhB3EsFJ3NP7JcOQbpz
         VQ8SZmjai3fx229Qn2g/tV3ZspwVzHpUP6OyX7g+xNTAa10CjSyDgwhvHA+23DiDr2qt
         zeqz7XbeZ2BgrTfE0MBEFs9WdUnsEvkLh38+hLo/lfCG1qZGeV4bNVoIDCL8Of+CNsUf
         hFf+Uqiw2z1TkdZOk1hetSxjchbpfzlAMuJ9z0ExEDZjwJZBnOrU7yPl4rr4XC8qMIxb
         r9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f/7ujSQqYl/X/bnhOoq3q/4kBtn2PoaQm8BLwgjgxmU=;
        b=NIZTMC3/iXgv06TnFjYzWIFDz3ozGDtgsdQOpeELQYwfiahHBykzYqm+vklgP3voVb
         Xi5iXRzsbbPSvgeJaVizSE7ECQN+zNqqHZbCOBn4rDiHJQQaDyiCEU/bGPeJ4UQ9z2QN
         o27tIm3mL1Q8hdZVYOaUHd2jmftyP/R7yQo1WgjU9atFL0ZAy8N2oo6Gm08/oGauihkQ
         6XT3I1luFMhDB8LYdZYIe2/1CZ5pljpv/gCp49i2SoOw9s4b75OClAW1fRnHK9izWJ4T
         eWg3bkSEtiUt5je1+lrcNtBXvgYiJjCGu9qrFMIms9QFyqybJEtDqhIo9jLQ7X5EpbvR
         cJkA==
X-Gm-Message-State: AJIora+fziGBsrgaFiojmWctZfO75K31GUky4ekRY0GoNZLx0amJX6FX
	FmXig+QUfh9u0l5crxKYAQfjkGkkM00ZWpd6hG4=
X-Google-Smtp-Source: 
 AGRyM1t20E2ofe6DqwfXfzJALQnV9IbuWPyftVglysLWMRAVFUI1qZwGJuqaPqE+iVlA/JSjzdD9fgv7ItA4wet996s=
X-Received: by 2002:a2e:a4a5:0:b0:25d:980f:8ba7 with SMTP id
 g5-20020a2ea4a5000000b0025d980f8ba7mr14773584ljm.513.1658311127976; Wed, 20
 Jul 2022 02:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220720084442.2940187-1-alex@linutronix.de>
 <17037D268C38CE83.21682@lists.openembedded.org>
 <CANNYZj9KKfqK8fH6HB3mLP8Vhi=U-VCMOus1uAq9kUQ7+6D74A@mail.gmail.com>
 <ee397d3552782e6fd969a497e55396ff474fee92.camel@linuxfoundation.org>
 <CANNYZj8EVF79=r4agVTa_5rfqtsU_mdBu2bD8eLv9TbD8U3fHw@mail.gmail.com>
 <0A7591F9-3D0D-49E2-A067-67485A8B3B0D@arm.com>
In-Reply-To: <0A7591F9-3D0D-49E2-A067-67485A8B3B0D@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Jul 2022 11:58:36 +0200
Message-ID: 
 <CANNYZj_kuU9GQMYwQyPjvqv47PYq=o8LXNbHzAVWdOwN7DFeNQ@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Let's drop x86-x32 (was Re: [OE-core]
 [PATCH 05/51] rpm: update 4.17.0 -> 4.17.1)
To: Ross Burton <Ross.Burton@arm.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 09:58:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168352

On Wed, 20 Jul 2022 at 11:50, Ross Burton <Ross.Burton@arm.com> wrote:
> Also, Intel should get to have an opinion on this.  If they actually care=
 about x32 then they can help fix the issues, if they don=E2=80=99t then we=
 can easily switch to a platform that has support.

Ok, let's ask Intel, specifically Anuj :-)

Anuj, does Intel still care about x32, and would anyone notice if
yocto drops x32 support from master branch?

Alex

