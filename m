Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F41C001DF
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 14:02:57 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.32851.1690552969812759003
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 07:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=VgrLhhBW;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b974031aeaso32896871fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 07:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690552968; x=1691157768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XhpkW6jhgiWNoRwbc6nprPrfRAZiQnUQb0VO3mhS3U=;
        b=VgrLhhBWXuQ/KrV/mXneg3AvuHPlTF3LF4pLHbbcYMlwJR9+avuGbcjivEAR+j2idE
         /GPiHfQqwSRC+BqY6W44yrIuxZFibf64czD7KsW4jYu6NzlMUjKeBGlLJMD0GKeSsPIW
         Nom72e1VrC3ak+Uxoou2Kr8AcehOMvUHWAbTDSIMahv9aOD56Xo9oJTlcD5ZyziA+RH2
         wn/neeS3r+ftvsHyp6jP2o7cIM0CsANlRCFSPMShWAtd9/QVjI4CZ/KqERr6r1uh8+d4
         me1DbUoxwBGRJArAi6LSShFxMNwTxk1CbD9zFGDEaXWhvQh3O9F06HWpFNBQa7M0MdfD
         iwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690552968; x=1691157768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XhpkW6jhgiWNoRwbc6nprPrfRAZiQnUQb0VO3mhS3U=;
        b=ax5/kp1vfS0MnTdZxrDzremsn3x3MYUplCKmVgqBmDcMc5WLYBM/vrWNGkIzjBoVQf
         viVJMZoFDi/c0Tjq9qDslQPGO92gGTK4inw2A/7uKYlqdpc2dBeJ9uB2PznUB9lwtq5o
         XgzFXpOFM5dFByPNvzTG/HXyli2P74vtYqm2g8ENnu1pWj/K0e1pjcWvMkSQtZXOiu0u
         0cNcXHHlQuohvZ2KrqNVC/MXIAbDt1vksxijNt3jxqCM/epYS1UD8qLdH8hKwOSrXMs/
         J7Kng1b5g4GcRGyEgM1sXWVyGUeF/01pddnROhX+1lU2NX1ULO5Hp8HfJGRqiINb/JKn
         Jxrw==
X-Gm-Message-State: ABy/qLZj4Y5euZD9h4mqbPbSTgD94ol9hxbCUyNJWYezmWROn8pc2Vvs
	tbn2s8L+Cuo8kM7/ZNsrhWugJnLE01R2BEgGTtbPxyvJ
X-Google-Smtp-Source: APBJJlEjeKzi7NMc5n2EWkDYUxke8ZkhvBylJj0QZVI7yLAlneeCU4JWsB8Nxx8Dnmtw8TGl954ZPigoDQETd+TSkJE=
X-Received: by 2002:a2e:7218:0:b0:2b9:b4eb:c39c with SMTP id
 n24-20020a2e7218000000b002b9b4ebc39cmr1642486ljc.8.1690552967678; Fri, 28 Jul
 2023 07:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230728111311.1665976-1-richard.purdie@linuxfoundation.org>
 <20230728111311.1665976-4-richard.purdie@linuxfoundation.org> <CAJdd5Gb8yjOct61J4nc+Q8WzwXrL2au2HJM0oidm_At2SbRgVw@mail.gmail.com>
In-Reply-To: <CAJdd5Gb8yjOct61J4nc+Q8WzwXrL2au2HJM0oidm_At2SbRgVw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 28 Jul 2023 08:02:35 -0600
Message-ID: <CAJdd5GbErH=8fCx5fimgC8dTRdx8rX5r=AxYcnjNLmoPsKrTGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] target/ssh: Ensure exit code set for commands
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 14:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185033

On Fri, Jul 28, 2023 at 8:01=E2=80=AFAM Joshua Watt <jpewhacker@gmail.com> =
wrote:
>
> On Fri, Jul 28, 2023 at 5:13=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > As spotted by Joshua Watt, the returncode isn't set until .poll() or .w=
ait()
> > is called so we need to call this after the .kill() call.
> >
> > This fixes return code reporting so that timeouts for example now retur=
n an
> > exit code when they didn't before.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/lib/oeqa/core/target/ssh.py | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/targ=
et/ssh.py
> > index 243e45dd99e..72ed1adbf89 100644
> > --- a/meta/lib/oeqa/core/target/ssh.py
> > +++ b/meta/lib/oeqa/core/target/ssh.py
> > @@ -265,6 +265,7 @@ def SSHCall(command, logger, timeout=3DNone, **opts=
):
> >                  time.sleep(5)
> >                  try:
> >                      process.kill()
> > +                    process.wait()
>
> I think this can still result in a orphaned process; if the
> process.terminate() on the line above is successful, the process will
> exit and then process.kill() here will raise an exception and will
> call wait. This is true generally everywhere; wait() must be called

"will _not_ call wait" - Need to proofread better

> regardless of if kill() successed, because kill() will fail if the
> process is already dead. It's a little tricky because
> process.commuinicate() calls wait(), so you can't unconditionally call
> wait(), but my solution was to remove all the kill() and wait() calls
> that already exist and add:
>
>  try:
>      run()
>  except:
>      logger.debug(....)
>      raise
>  finally:
>      if process.returncode is None:
>          try:
>              process.wait(timeout=3D5)
>          except TimeoutExpired:
>              try:
>                  process.kill()
>              except OSError:
>                  pass
>              process.wait()
>
> >                  except OSError:
> >                      logger.debug('OSError when killing process')
> >                      pass
> > @@ -287,6 +288,7 @@ def SSHCall(command, logger, timeout=3DNone, **opts=
):
> >              except TimeoutExpired:
> >                  try:
> >                      process.kill()
> > +                    process.wait()
> >                  except OSError:
> >                      logger.debug('OSError')
> >                      pass
> > @@ -316,6 +318,7 @@ def SSHCall(command, logger, timeout=3DNone, **opts=
):
> >          # whilst running and ensure we don't leave a process behind.
> >          if process.poll() is None:
> >              process.kill()
> > +            process.wait()
> >          logger.debug('Something went wrong, killing SSH process')
> >          raise
> >
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#185024): https://lists.openembedded.org/g/openembed=
ded-core/message/185024
> > Mute This Topic: https://lists.openembedded.org/mt/100408183/3616693
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
JPEWhacker@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

