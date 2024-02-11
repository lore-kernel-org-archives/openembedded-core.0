Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C65C4829A
	for <webhook@archiver.kernel.org>; Sun, 11 Feb 2024 15:25:09 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.39088.1707665101399649386
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 07:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C0P0EMPm;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3394bec856fso2067629f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 07:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707665099; x=1708269899; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EK5pJofR8O+8VjdiGGDQ2Un/kr1KozUT+xptJ8gSdeY=;
        b=C0P0EMPmKWpoTcTcnP1DF2Z1Y37JyncMIvdS62e+2ozXFHzoat3dou1U/Maz6f8cLm
         txQsI0/jXAZ0cVVAx93Gyg4B0i/oV+E7vviARQ+jJ6of4uiG99VFHV1KR0ThY0wUJl/3
         JFKm9bvq4xI1H/f63SevEZiwBfqnRNLr6SuHLxU7zYgI0vb1kJ8WfENDrizZVrFFA1Of
         ORfsEWfTv3KPuMngy3PVWo5BnDuejg0c2Wv/BdDYt+SyKnu9fzj03lYdehQIsRp1Nbw9
         6pciOyvBCC2DankUsfI6umm8mbLlXtTNklS/36aUNOQkCAO3FgoP2B4O4+ZdSztuC8rE
         lr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707665099; x=1708269899;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EK5pJofR8O+8VjdiGGDQ2Un/kr1KozUT+xptJ8gSdeY=;
        b=ldpXPbMgyZ4zFoe2zI12aKU9KEwZFfChTLlS8C8ZNJaafP/tjNok6RulJjctk7szre
         XeNbjStoNJJmk7wblqO1uTmVxR7/PT5cufLWJwbXrBIMqgDm+IkgN7vbzS1UD55Q/ofe
         RaPWHAK5YeOQiYFLABBZq6NeYPQUmf5zVLcgumHbXMhZtiaMjjEC0VO2E11x1UkE0sAQ
         PU9Yg6E7K0okpw/zVgmjPUFeHCoJyE5Kv3l3Kpn08ev8YgTho3icwdWaDxrELSnmcbw+
         SogtbXbHGoS1yei3xjasvK1qnxGC1wse9V5INdC3XifgDjbEYIIuOL3mrn2Lmao4nbSJ
         PAQQ==
X-Gm-Message-State: AOJu0Yw0SNKtwgJKLgxN6iiR+08ZaWR9Rg6jtWBYSuMxX8WWWsGuFN7T
	7TuxHw2lE3U9Go36ZSr0plDNuVNayw/Q7p4timsc+sNQ2eI2QYRN354JGND7C8M=
X-Google-Smtp-Source: AGHT+IGbUYZ83ct1wRfjsdh8V47XZyvL23URTnxFhvIbdPaHx6v+LDr1isPTRslIngetKqgF/wFyjQ==
X-Received: by 2002:adf:ce92:0:b0:33b:5ee1:92d3 with SMTP id r18-20020adfce92000000b0033b5ee192d3mr5229578wrn.9.1707665099396;
        Sun, 11 Feb 2024 07:24:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAUYm8NT+DrdgH9sj3M68P/ftZmr03/dQ7GqJ9prCy+xkx1IhCN+3JLX/lS23m4oHUGu44W5+WX3hyKQ/Wv0EqofxjK+yl4QH7dF657/FTZw2yu/NqZwkXuPNGOrLzLfvlR9kWSnlhjI+GLyREMidiPF4dMbshBLkTiwkjQCkCTb+rwv2cjdoN3ucB8wVKAzLHrpN6whg=
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id jx6-20020a05600c578600b0040ffd94cd27sm5976684wmb.45.2024.02.11.07.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 07:24:58 -0800 (PST)
Message-ID: <40d4cf0612a459eb5405a802aebb0fb09fbb5b8a.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] vscode: improve settings for new yocto plugin
From: adrian.freihofer@gmail.com
To: openembedded-core@lists.openembedded.org, 
	enguerrand.de-ribaucourt@savoirfairelinux.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton
	 <ross.burton@arm.com>, Mohammed Raza <mohammed.raza@savoirfairelinux.com>
Date: Sun, 11 Feb 2024 16:24:58 +0100
In-Reply-To: <7bfdb37aa85722d20776c58b4d8a61233f5ae23a.camel@linuxfoundation.org>
References: <20240209203029.3801065-1-adrian.freihofer@siemens.com>
	 <7bfdb37aa85722d20776c58b4d8a61233f5ae23a.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 15:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195294

On Fri, 2024-02-09 at 23:43 +0000, Richard Purdie wrote:
> On Fri, 2024-02-09 at 21:30 +0100, Adrian Freihofer wrote:
> > There is a new official bitbake plugin:
> > https://marketplace.visualstudio.com/items?itemName=3Dyocto-project.yoc=
to-bitbake
> >=20
> > This plugin automatically updates the .vscode/settings.json file.
> >=20
> > Having the settings.json file in git and a plugin which modifies
> > this
> > file is not ideal. It can lead to anoying situations especially
> > when
> > working with git. For example a git stash reverts the settings
> > which are
> > automatically applied by the plugin. While git stashed the
> > settings.json
> > file the plugin immediately changes the file again and tries to run
> > bitbake based on the newly generated settings. When git does a
> > stash pop
> > the restored settings.json file conflicts with the new
> > settigns.json
> > file which has been generated while the git stash took place.
> >=20
> > Removing the settings.json from git would lead to other issues as
> > already described in the commit message of 5ff688fe29. Until VSCode
> > or
> > the plugin supports multiple config files like bitbake does with
> > the
> > site.conf and the local.conf files, there are probably some use
> > cases
> > and workflows where the plugin needs to be disabled.
> >=20
> > This commit aligns the default settings.json file with the default
> > settings.json which gets generated by the plugin. This is a
> > workaround
> > for the issue described above. But it works only for the default
> > build
> > configuration with one build folder named "build".
> >=20
> > Discussion is here:
> > https://github.com/yoctoproject/vscode-bitbake/issues/95
> > ---
> > =C2=A0.gitignore=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 4 ++--
> > =C2=A0.vscode/settings.json | 28 +++++++++++++++++++++++++++-
> > =C2=A02 files changed, 29 insertions(+), 3 deletions(-)
>=20
> I am very worried about this as we can't mandate a layout. There are
> many people who use different locations for bitbake and others who
> use
> different directories for builds. Even our own test runs do change
> the
> build directories.
>=20
> I don't think we can solve this like this unfortunately.
>=20
> Can we inject something into build directories when we create them?
>=20

Here are some patches:
https://git.yoctoproject.org/poky-contrib/log/?h=3Dadrianf/vscode-yocto-plu=
gin

I will send them as V2 after I have tested them some more. (There are
already oe-selftest)

@Enguerrand your review would be appreciated.

Regards,
Adrian

> Cheers,
>=20
> Richard


