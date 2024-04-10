Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEB7CD1297
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 06:54:56 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.160843.1712732091900876200
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 23:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Yt11cWF+;
 spf=pass (domain: baylibre.com, ip: 209.85.208.52, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so7201768a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 23:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712732090; x=1713336890; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STSLFqKFOSOXNMIF9ZpDj7dPFbR/p48/1Hf95JoQX6U=;
        b=Yt11cWF+Pa0TZsioXWBekmf+3r8gcZUh0wOySZhO/iC4dsttyUH/+dNErf8B6tECzL
         LSZoZYR7/RaeEMqSDLUeaG8n0obPK8xjspnPKkRaSyVWB1ZGKju5sD+nILc3L29DAqNl
         dE+90gTRE/CpQqZY4x1uwSQd9dwMh/Lmw6i3LWyG/RHNV5Wvu8+Glg99DLMUDfGWX2nl
         t0Z96i/Yfbnid2UR2CEcUACHS0FZf7QnXXj55cX2MRdFzA0BBDo2zrk/K1zabUAiOwZv
         xwmo1x47uEHxPMU3A/GSFbuGxwsVfOscMm7YfL96jKFDiXXcvRfbL49e/O7/gRxk4RT9
         SC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712732090; x=1713336890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STSLFqKFOSOXNMIF9ZpDj7dPFbR/p48/1Hf95JoQX6U=;
        b=aTZVGeF7mFOWEEZIfDvbYb+BCPMKhBonU/ig2uZ6PQrXG78r8RA6tvdqRfxOcaHbm1
         ckdSxmCdfroLQTV92kiETcnjzxrxa8p3v8ppJVwL+XFAOcr2d94HMnMO4lTUof+XwGwY
         2+0Tapfz4rC+suB7c7fv7CopR8NQHGQRWhsbaTaOhR1uwq9LtNpoI6rtzjZOWBjTGWUi
         104PNmKPd12XsgWuX9CFxvIPng+v3LE68CXWjNv0/vhDFo+0uHWumbItMNYNAQXI1YOS
         1aESXNXK7H1mUEmh240ZQdHLkMpeWRJYFyXlUZljHSd/NTnvzolAKciUEt5CYjaehL6j
         iI1Q==
X-Gm-Message-State: AOJu0YxBpILllpI6zlkijL7AuiHBPKX0kCZFOV57SWKbQKJ5ZudA42vz
	BpI0XGSmxgtLWCQkL4Wt1vQx3DzZSp7MQlMuDGJWT/OllJ1jcQgCXv2bhHddgVQklKTcbPEzteC
	VBog1DFJ4TWAktbcO2z6ykAmh/Xl7iLPRkucJBQ==
X-Google-Smtp-Source: AGHT+IG+BAGr3+LpNg+UVkxQ4JYIcl678/erEYb0nm3wyaTIj2/yoltTz3SUsQ49nROtuboBQjL8mrhCq6/Wpt4ASxg=
X-Received: by 2002:a17:906:3c4a:b0:a51:e8cf:460b with SMTP id
 i10-20020a1709063c4a00b00a51e8cf460bmr1089641ejg.27.1712732089746; Tue, 09
 Apr 2024 23:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240409071905.3625142-1-jstephan@baylibre.com> <DB5PR02MB10213B28D971EC428E142F18FEF072@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213B28D971EC428E142F18FEF072@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 10 Apr 2024 08:54:41 +0200
Message-ID: <CAEHHSva2hjzV03FcW=spEy+3tFhqsAJvOvZdXdq1+E7JrRaNNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: standard: throws appropriate error if
 source is in detached HEAD
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 06:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198078

Le mer. 10 avr. 2024 =C3=A0 01:11, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> a =C3=A9crit :
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Julien Stephan
> > Sent: den 9 april 2024 09:19
> > To: openembedded-core@lists.openembedded.org
> > Cc: Julien Stephan <jstephan@baylibre.com>
> > Subject: [OE-core] [PATCH] devtool: standard: throws appropriate error =
if source is in detached HEAD
> >
> > If source is in detached HEAD, we get the following error when using
> > detvool finish command:
> >
> >     [...]
> >     File "<...>/poky/scripts/lib/devtool/standard.py", line 1938, in _u=
pdate_recipe
> >       bb.process.run('git checkout %s' % startbranch, cwd=3Dsrctree)
> >     File "<...>/poky/bitbake/lib/bb/process.py", line 189, in run
> >       raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
> >   bb.process.ExecutionError: Execution of 'git checkout (HEAD detached =
at 9bbf87e)' failed with exit code 2:
> >   /bin/sh: -c: line 1: syntax error near unexpected token `('
> >   /bin/sh: -c: line 1: `git checkout (HEAD detached at 9bbf87e)'
> >
> > Check this and throws an appropriate error in this case
> >
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  scripts/lib/devtool/standard.py | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/scripts/lib/devtool/standard.py
> > b/scripts/lib/devtool/standard.py
> > index 7972b4f8223..7f32b0999a4 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -1885,6 +1885,8 @@ def _update_recipe(recipename, workspace, rd, mod=
e, appendlayerdir, wildcard_ver
> >          for line in stdout.splitlines():
> >              branchname =3D line[2:]
> >              if line.startswith('* '):
> > +                if 'HEAD' in line:
> > +                    raise DevtoolError('Detached HEAD - please check o=
ut the main branch in source tree first')
>
> Using "main branch" here might lead to confusion since it is unclear
> if the error is referring to an actual "main" branch, which not all
> repositories have, or to whatever branch is primarily used.

Hi Peter,

I used the same error message as the one already existing a few lines below=
.
To be honest I read it as "the primary branch" not "the branch named
main" but I understand it can be confusing.

> Additionally, when using devtool, the branch is typically "devtool".
>
> I would change it to:
>
>                     raise DevtoolError('Detached HEAD - please check out =
a branch, e.g., "devtool"')

makes sense, let me send a v2.
Thank you!

>
> >                  startbranch =3D branchname
> >              if branchname.startswith(override_branch_prefix):
> >                  override_branches.append(branchname)
> > --
> > 2.44.0
>
> //Peter
>

