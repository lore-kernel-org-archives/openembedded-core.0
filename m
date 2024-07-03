Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E47C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 13:31:26 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.51168.1720013475444205409
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 06:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bXngJJBN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-36796a9b636so260867f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 06:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720013474; x=1720618274; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w6Y5iEkMbfY3FrioN/aw8e4QSyJLgnd6ll6K6suGFj4=;
        b=bXngJJBNnXcL8Wg1LVpyL1wcyAB0R6f8Csw881/guKvnhwh5YzEYIvdkwvWq25kkgp
         GUbJUd/VFDOWSnk3kq7/QnmtayHeLbBJk5v78oNsYgpEpSWtKq1/ST3y+hHMbj+0QXAb
         zgIRY+0aK2Go7V51zVxkAjGcN7sCXBj9zu4dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720013474; x=1720618274;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w6Y5iEkMbfY3FrioN/aw8e4QSyJLgnd6ll6K6suGFj4=;
        b=sj83r+SDODLBbGihooNv5xOe+YB1VfXIC0AjSomFevP0lKAORNNCheip9QbMG9FEbS
         xje1D5QnUF6JzawbvsjVcX46zEIEhRFqstF+h4dwSpgLD7ylTCyHVbmXr2c3QW4CKSy2
         Wn/KE/NY73Dw2oNX24+wXM8pDUw1dHxjvt8MccyVG+tHzTnGxFtnbS2dLDf7FEXJ49mB
         E3ffTZDdiGhnxb2w83oUwekxdwQMn7WWbDMDau/3Cxh4shhGnEZ5vgXT18aDqgQ7FJDX
         Mor+BzJ4NZIirLgo8KdE16XI31dpnHlXoNPJYekk86g5o6jM8U+je+ZYOL3WovN6afbn
         H1cw==
X-Gm-Message-State: AOJu0YwUK9CX2pjyf5gVs+QEKdEYfQ8K4hZATsRPHSkZPqwI8cLvmN1q
	VlhnJrl04QG1LKT66aUo2RlzPZfy/nKFWCV1X/Btm5y3/a/QW8+q5alPlQJ568A=
X-Google-Smtp-Source: AGHT+IEcmu3EvLFGz534begKeQoxXTvXMpRLazAGaIkzmxv1zYYmiXxlSVuA88F+M4oVuTs+0j/iOg==
X-Received: by 2002:a05:6000:b0a:b0:367:98e6:2a1b with SMTP id ffacd0b85a97d-36798e62b51mr1499f8f.4.1720013473851;
        Wed, 03 Jul 2024 06:31:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fad2:e8e1:212e:cafd? ([2001:8b0:aba:5f3c:fad2:e8e1:212e:cafd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a1030c8sm15863966f8f.98.2024.07.03.06.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 06:31:13 -0700 (PDT)
Message-ID: <d6da4fb9ffe93b23d095b72c8310fd7bfa7ade4f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/11] devtool/upgrade: add
 RECIPE_UPGRADE_FINISH_EXTRA_TASKS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Wed, 03 Jul 2024 14:31:13 +0100
In-Reply-To: <CANNYZj_o8bFtNGWj48mhDwbrisjjowV1xR_xOfWWJ-Jx3pRwbg@mail.gmail.com>
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
	 <20240621103414.2842509-2-alex.kanavin@gmail.com>
	 <de66e3216fb54cf24171e800ea032770517fab69.camel@linuxfoundation.org>
	 <CANNYZj9hXzes_pH_tH1P4wVUsLOKiQpRnucds-YpVtJDQRTMuA@mail.gmail.com>
	 <f9d0520c75c0144cb6f7a433769b593ddcf9091c.camel@linuxfoundation.org>
	 <CANNYZj9xwEDEw9HxHQ5zAPJY2--iuq_JvTW0foOVTF=83zefsQ@mail.gmail.com>
	 <3bd89c381318290050137e1ab5f65bd25f94ec83.camel@linuxfoundation.org>
	 <CANNYZj_o8bFtNGWj48mhDwbrisjjowV1xR_xOfWWJ-Jx3pRwbg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 13:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201475

On Wed, 2024-07-03 at 14:28 +0200, Alexander Kanavin wrote:
> On Tue, 25 Jun 2024 at 13:54, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > I appreciate it calls this "inherits" but this is actually a list
> > of
> > any file included by the base recipe so any bbclass, .bb, or .inc
> > file
> > that was included should be listed here. The True/False associated
> > with
> > it is whether the file existed or not so that if it changed, we
> > know to
> > reparse.
>=20
> This doesn't seem to be correct. I added
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> logger.info(tinfoil.cooker_data.inherits['/srv/work/alex/poky/meta/re
> cipes-devtools/cmake/cmake_3.29.3.bb'])
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> logger.info(tinfoil.cooker_data.inherits['/srv/work/alex/poky/meta/re
> cipes-devtools/cmake/cmake-native_3.29.3.bb'])
>=20
> to devtool to see how the data in that attribute looks like, and
> unfortunately it contains only .bbclass filenames and not .inc or any
> other dependent files:
>=20
> INFO: ['/srv/work/alex/poky/meta/classes-global/base.bbclass',
> '/srv/work/alex/poky/meta/classes-global/patch.bbclass',
> '/srv/work/alex/poky/meta/classes/terminal.bbclass',
> '/srv/work/alex/poky/meta/classes-global/staging.bbclass',
> '/srv/work/alex/poky/meta/classes-global/mirrors.bbclass',
> '/srv/work/alex/poky/meta/classes-global/utils.bbclass',
> '/srv/work/alex/poky/meta/classes-global/utility-tasks.bbclass', ...
>=20
> etc. - no cmake.inc mentioned anywhere.
>=20
> So assuming I didn't miss something, this either needs further
> bitbake/tinfoil extensions (even more work), or we can just write
> manual hints for lockstep upgrades into recipes (there's not that
> many
> of them so I'm leaning that way tbh).

Sorry, I've got confused. Look at tinfoil.cooker_data.file_depends=20

Cheers,

Richard


