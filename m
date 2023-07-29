Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58ADBC0015E
	for <webhook@archiver.kernel.org>; Sat, 29 Jul 2023 07:24:42 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.50350.1690615476969161179
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jul 2023 00:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vi8Hh8ZI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fbef8ad9bbso31616565e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 00:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690615475; x=1691220275;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VscvoMQUAPlWV7hw09GbjZOfqRjpoxKtD8bq7JhYpUA=;
        b=Vi8Hh8ZIxsWCnYulIDCws85YgI8bHZnvf4Grhp4QhIppZEL6gu49SFCbjNNGArb8BX
         IodxtuTYhIIOVRnU7ZCl6ySi6QhGQIfvYSMSXl2QkjWX6jkg4Kqtzfvhhym3FdqpIvtc
         sJPhThK2sdJN9ihmp1OalEXWSIbBtVn6rFsoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690615475; x=1691220275;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VscvoMQUAPlWV7hw09GbjZOfqRjpoxKtD8bq7JhYpUA=;
        b=KWgfCQ1ydboalej09LcCGtFfql6X6C2wWjJnwqCKgHJ7mluHj+HLSzhaQe+2l+uDPY
         lfroHXE8XLJnygzvqz0OByr+AYkccYsicXhta0DCWN8PTz3InH7p18Bl0KUlMVuDJ2k4
         cG5U5FUVeNJ6yLpuvQhMxfcFDxoU3JI/L55HYHVmhCvxEE4la+GYrWwCwwIheiwd0wxm
         ZH5Rx2GMs4VwMWeDogUjPErZb/uqn2IXcd6L6VyUvs11/JZgtYbne2OgcWAcIVrhTnbf
         KLaYZuH+gz9v4RHxIQz/GgJb+wyTtCMxBuQaA0i9Ef6UfK+ltd/JCiCQ89YsDI2iFQUB
         987w==
X-Gm-Message-State: ABy/qLZNLSXkptPfa/0sDsCfgY+cFsM7q/AEl9cOy59b5dGojJ/zk2U3
	zKXeKmJsGb7Hl1A1JhwRmzfkuA==
X-Google-Smtp-Source: APBJJlEdIDw9gZG35gZFNzWWPTpIaANLrTVn0g2IHx5P4m3kM53QPrA2VIW7ZvvXR1S8IhfAgEXauw==
X-Received: by 2002:a05:600c:c2:b0:3fd:e151:8ca with SMTP id u2-20020a05600c00c200b003fde15108camr3475625wmm.18.1690615475174;
        Sat, 29 Jul 2023 00:24:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f929:4921:3439:ee63? ([2001:8b0:aba:5f3c:f929:4921:3439:ee63])
        by smtp.gmail.com with ESMTPSA id m8-20020a7bce08000000b003fe18d03188sm350094wmc.17.2023.07.29.00.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 00:24:34 -0700 (PDT)
Message-ID: <267de47b24610d2521946d5d06f61f4f6833ad2c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] target/ssh: Ensure exit code set for
 commands
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jul 2023 08:24:33 +0100
In-Reply-To: <CAJdd5GbErH=8fCx5fimgC8dTRdx8rX5r=AxYcnjNLmoPsKrTGQ@mail.gmail.com>
References: <20230728111311.1665976-1-richard.purdie@linuxfoundation.org>
	 <20230728111311.1665976-4-richard.purdie@linuxfoundation.org>
	 <CAJdd5Gb8yjOct61J4nc+Q8WzwXrL2au2HJM0oidm_At2SbRgVw@mail.gmail.com>
	 <CAJdd5GbErH=8fCx5fimgC8dTRdx8rX5r=AxYcnjNLmoPsKrTGQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 07:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185049

On Fri, 2023-07-28 at 08:02 -0600, Joshua Watt wrote:
> On Fri, Jul 28, 2023 at 8:01=E2=80=AFAM Joshua Watt <jpewhacker@gmail.com=
> wrote:
> >=20
> > On Fri, Jul 28, 2023 at 5:13=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >=20
> > > As spotted by Joshua Watt, the returncode isn't set until .poll() or =
.wait()
> > > is called so we need to call this after the .kill() call.
> > >=20
> > > This fixes return code reporting so that timeouts for example now ret=
urn an
> > > exit code when they didn't before.
> > >=20
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/lib/oeqa/core/target/ssh.py | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/ta=
rget/ssh.py
> > > index 243e45dd99e..72ed1adbf89 100644
> > > --- a/meta/lib/oeqa/core/target/ssh.py
> > > +++ b/meta/lib/oeqa/core/target/ssh.py
> > > @@ -265,6 +265,7 @@ def SSHCall(command, logger, timeout=3DNone, **op=
ts):
> > >                  time.sleep(5)
> > >                  try:
> > >                      process.kill()
> > > +                    process.wait()
> >=20
> > I think this can still result in a orphaned process; if the
> > process.terminate() on the line above is successful, the process will
> > exit and then process.kill() here will raise an exception and will
> > call wait. This is true generally everywhere; wait() must be called
>=20
> "will _not_ call wait" - Need to proofread better
>=20
> > regardless of if kill() successed, because kill() will fail if the
> > process is already dead. It's a little tricky because
> > process.commuinicate() calls wait(), so you can't unconditionally call
> > wait(), but my solution was to remove all the kill() and wait() calls
> > that already exist and add:
> >=20
> >  try:
> >      run()
> >  except:
> >      logger.debug(....)
> >      raise
> >  finally:
> >      if process.returncode is None:
> >          try:
> >              process.wait(timeout=3D5)
> >          except TimeoutExpired:
> >              try:
> >                  process.kill()
> >              except OSError:
> >                  pass
> >              process.wait()
> >=20
> >=20

I think I'll probably merge this as it does work better than the
existing code and lets me clean up the ltp test results but I'd take a
further patch...

Cheers,

Richard



