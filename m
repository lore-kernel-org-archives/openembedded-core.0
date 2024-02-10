Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0480CC4829A
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 13:42:42 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.13763.1707572561247594522
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 05:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GLuoDZA2;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so246188366b.2
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 05:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707572560; x=1708177360; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tvrtfqwZEQOnT6J9C4/KX2R82l631OM7aYGQDbEndPk=;
        b=GLuoDZA2mgvAdaLWi30qpFjI/R0WEoYw5eokElJL7Vc7g3ujvnnQtB4Rig3M1JWLf2
         KNXOFG4R5Zbg6ea5ClAXMgkUGXifK1bPRVJi3ilZzTsxkkWo5eo6aQvcoeozahq0SCTd
         mFQjS8U1cCSSqJ1+w2PKzPtfnEU4eLD0MllWWvt+t0M23DGEA8UvNjC504+1JwUTI/fI
         Gixfx0xB0auytsflVTChRfnBB3xzI3Ers/ObvGoxD4O3ZL1mWxVR0ELIarxDxqz1JTRu
         abTf5w+SubtPy9YGGxnTuvIS0mi5jUP6z4kFvmGGs9/RXIyb862kJT6bjZmsrTCk7eRb
         CX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707572560; x=1708177360;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvrtfqwZEQOnT6J9C4/KX2R82l631OM7aYGQDbEndPk=;
        b=hlPZ5PYnqZF36/1vHlEuqSHLI9MfBXO5Xd3mctLptWBA1v02q9mkOsrS1ESwOIGYMu
         ret/vcfOhjnKwbGRHyVO3AStuehB0aPSWEBrhOOgX6J/BaYqV6olgwXaynsHpZmZgs6E
         /LQh3p3kbHJ2xmOpDIeSj32EUMsfjTnWq8n8dQ/jEXH9SwomMRoiwH6c0LMtwW2OFBFh
         f1uwxCX9hLKrDpLLMGVUml0OnW3d3eDYyvb9/hJ4bw+a9WRnrCokAYOQYsYB7imy6LGh
         QKjFRQ407YhMJckKRoaH5wuQyRGY033NP2SshDz1BZpBMEGrYvBI+2JjuEABekMW+i5q
         abqQ==
X-Gm-Message-State: AOJu0Yzed9fSccTVr8xwD3i34HX1lBQcdJTKCodOQTaWXaO4E/GxMEWm
	e5LlDsMaEoSVznldcom/SPwhGW5wlylRmYraPklAI6roTEvRB8SS
X-Google-Smtp-Source: AGHT+IF3gczKYKA/5Jw3zdRBH9b2Sxk2s4jQ6LKKB7CvqWMi8jUAh9O7toW+vIAG5T5CT15Jzj0H0w==
X-Received: by 2002:a17:906:2c56:b0:a3c:4906:d802 with SMTP id f22-20020a1709062c5600b00a3c4906d802mr499056ejh.23.1707572559505;
        Sat, 10 Feb 2024 05:42:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXowuiVWzw4rYquWnVuYk5jJoQcgswtBduEabsY20jmBxj/9aZDGwO024bu9fZHTV5mSVeq292MzSvVAV8dZzplsFDKfVzDsG8S9m5kxWIiCL/xQiJeZwBiRsckHnbuenFNjH71CCgj5Ad+Do2dJFg4do7E+TIhkfab7TSZ7uvVpcq2U8w8DxNHA4Wfu0Tp+byVII+aWySmbCbN0xfDSkaCg576zK9PsiWguRHtTxurVRSdBB7j64zl1NyLleFGpz0=
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ag13-20020a1709069a8d00b00a3c24e20d56sm708515ejc.102.2024.02.10.05.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 05:42:38 -0800 (PST)
Message-ID: <41316e933763917afe44dc7ad249f3d34b310fd2.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] vscode: improve settings for new yocto plugin
From: adrian.freihofer@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, Ross Burton
 <ross.burton@arm.com>, Mohammed Raza <mohammed.raza@savoirfairelinux.com>, 
 enguerrand.de-ribaucourt@savoirfairelinux.com
Date: Sat, 10 Feb 2024 14:42:38 +0100
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
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 13:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195272

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

Unfortunately, you are right. I agree that we need a better and most
likely a completely different solution.
The intention of this patch was to get the plugin working as a short
term solution for the default Yocto setup and gain more time to find
and develop the right solution. But I agree, we should skip this step
and find a future-proof solution now.

>=20
> Can we inject something into build directories when we create them?

Yes, that's probably the way to go. I will send a better patch:

- Remove the .vscode folder from git
  (which works without any issues with the old plugin)
- Change the .gitignore to ignore the complete .vscode folder
- New script scripts/contrib/oe-init-build-vscode which generates the
section which is currently in git and which is very important to be
present before VSCode gets started.
- Add the following to scripts/oe-buildenv-internal
  command -v code > /dev/null && ./scripts/contrib/oe-init-build-vscode

The script will not alter the settings.json if not needed to prevent
from race conditions when VSCode will do the same.


Alternative ideas:
- Use a BUILDDIR that is not in the Git tree. This is difficult because
the opposite has always been the standard.
- Improve VSCode. This would require splitting the settings.json into
different files, some of which can be in Git and some not. This is
difficult to achieve as discussions have been going on for a long time.

Thank you and regards,
Adrian


>=20
> Cheers,
>=20
> Richard


