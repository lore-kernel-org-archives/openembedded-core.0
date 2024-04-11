Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063D5C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 14:19:57 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.19363.1712845188314784196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 07:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=HfAIPU8u;
 spf=pass (domain: baylibre.com, ip: 209.85.218.51, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a520410b7c0so280518466b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 07:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712845186; x=1713449986; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PD59l7QomHqe5VyFXl7z+NMhAEJclCxCdA5cmUlAbwY=;
        b=HfAIPU8uUK515pPxMfPki8G8jS/Xqw7Np0Y/9Egtyc/1wBF0+67d1/pt8l39cKWzh9
         R0KIlsuJkLVJ1JlSkLfKXST5kpPfNstveG5OCm6qpmEkf3zQmzb7dyeo8tgv1E+nqLH8
         4it6kiyBBZJpawWNessMnycxLj/iWL/g/sBOhD8k8PAwGg+9YU8u1tSbHwzxhyQLuvM4
         s0i4AvuyWK+CkxpLgKXiiVrez57GBPXHPWc21f65ajixcV+6uEXR3xbhxaRUD3+0zUVp
         6S8hdeg+Bcz0yyoyU3Coa2wfLwpJXaz8zGHAu+xOb+5H6FW0UGRG/geEZcZZsbkw5Czh
         oVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712845186; x=1713449986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PD59l7QomHqe5VyFXl7z+NMhAEJclCxCdA5cmUlAbwY=;
        b=kZ0fv9cUJgIr86kUzTh0gA44pqLKRF0846SeoustLz93aiA/M44Wlmk9oB1BXlKP8D
         bjWHbt+Ep3hn7inG5v97XLKGERgYZkNOyuiLKWeZJ3sbgRAS4VA/iKSEKErk66se634H
         wK5jBzr0hIfJeub4Lu70oNMOxWm0Doj0Na79Ub79EUOUdewIKchBfbttIprMW9E7dvnk
         N0kt64kS7+sb82G9MAf97hMBN5Qdmy68uB0aJ6Rz5BN2mEPhkKZRJL+HQp+8RwPQRGDp
         7odoX75KyaQ2OT+3OYeYFMSONJJpQzjWk8k7/h7/ztRTAXhVNNMGZryj/L7yIYXco8q1
         unDA==
X-Gm-Message-State: AOJu0YyF2JszqwFE2NmOoD+gVjCWgmLn6ajbeOFay4RBztrT80eiAfSt
	WU9GQiBeGCJL3o451G8FgOXPTd7uPJPNqBF0bD1cn7/QnjQrZLRz3AHa0yNWTkPDqWfWcdFQ9Wj
	Jd77ZSQ1uUbcGDmElVR7GxLBXiBO3q7jVoZXtlLrx5YBYOdvhLAJwQQ==
X-Google-Smtp-Source: AGHT+IF0ZMeVAz28jxVWZhvL3NAoCsdHBAstBohxIKzMljuoYZhQ9GlNOxMDL1LGolLy2Ifd7ho6WW+NupdpupQr5Wk=
X-Received: by 2002:a17:907:9411:b0:a51:bed9:2cc8 with SMTP id
 dk17-20020a170907941100b00a51bed92cc8mr5167680ejc.51.1712845186419; Thu, 11
 Apr 2024 07:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240410070647.3783683-1-jstephan@baylibre.com> <DB5PR02MB10213986BBAF0B3810EB72AB2EF062@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213986BBAF0B3810EB72AB2EF062@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 11 Apr 2024 16:19:38 +0200
Message-ID: <CAEHHSvZedL+GnaaXaU3mUrxSE3Tih0KsMkUPxVcmjcvMit_=VA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] devtool: standard: throws appropriate error
 if source is in detached HEAD
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 14:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198134

Le mer. 10 avr. 2024 =C3=A0 13:23, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> a =C3=A9crit :
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Julien Stephan
> > Sent: den 10 april 2024 09:07
> > To: openembedded-core@lists.openembedded.org
> > Cc: Julien Stephan <jstephan@baylibre.com>
> > Subject: [OE-core] [PATCH v2] devtool: standard: throws appropriate err=
or if source is in detached HEAD
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
> >
> > ---
> >
> > Changes in v2:
> >
> > - update error message to avoid confusion with a potentially non
> >   existing "main" branch
>
> As you noted in an earlier mail, the same error message is used some
> lines later. Please change that one too.
>

Hi Peter,
Not sure we need to change the other error message, because in that
case it really means the *main* branch.

This error message happens if we have overrides branches and if the
currently checked out branch starts with "devtool-override" (and we
have several other branches).
In that case, devtool cannot determine the main branch (read it as the
"base" branch on which the devtool-overrides-* branches are rebased).
Most of the time it will be the "devtool" branch, but there is no
guarantee, the user can checkout a working branch for example.

Furthermore, there is also another log message few lines after :
    logger.info('Handling main branch (%s)...' % mainbranch)

So IMHO the log messages look fine here. Maybe we can rewrite them
using "base" branch such as (but not sure it will be more clear) :

   raise DevtoolError('Unable to determine base branch - please check
out the base branch in source tree first')

and
   logger.info('Handling base branch (%s)...' % mainbranch)


(do you also want to rename the mainbranch variable?)

Anyway, such changes have nothing to do with the Detached HEAD check,
so I will not add this within the same commit.

I can do another patch to respell main to base (or something else more
meaningful?) if you think it would be beneficial for clarity
(or you can do it if you prefer).

Let me know
Cheers
Julien


> > ---
> >  scripts/lib/devtool/standard.py | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/scripts/lib/devtool/standard.py
> > b/scripts/lib/devtool/standard.py
> > index 2c174927ddb..51e5794a0a7 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -1888,6 +1888,8 @@ def _update_recipe(recipename, workspace, rd, mod=
e,
> > appendlayerdir, wildcard_ver
> >          for line in stdout.splitlines():
> >              branchname =3D line[2:]
> >              if line.startswith('* '):
> > +                if 'HEAD' in line:
> > +                    raise DevtoolError('Detached HEAD - please check o=
ut a branch, e.g., "devtool"')
> >                  startbranch =3D branchname
> >              if branchname.startswith(override_branch_prefix):
> >                  override_branches.append(branchname)
> > --
> > 2.44.0
>
> //Peter
>

