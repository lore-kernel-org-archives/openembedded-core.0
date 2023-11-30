Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF93C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 11:16:22 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.70016.1701342978167967244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 03:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gWqIW/q3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3316bb1303bso574678f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 03:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701342976; x=1701947776; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H4eK1gDfFJjuwgFsFiwLZUVjQ9JZfjYsmPx0/CRkjq4=;
        b=gWqIW/q3xjC9rRcMEy2n0bzMl1PHmgunRH9hwDu57E3UCeO+DorMn8Jbf66A7mqb6H
         Mb42H8VwIWQpb2/MxfXmHFiP82yJdB66gF/XKBMYbCG8E9IqWXuCqiRumpdDfnURDxgd
         fph/AfqSaLlhLcJc1NQMxXTCDOhSfUbqaVujA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701342976; x=1701947776;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4eK1gDfFJjuwgFsFiwLZUVjQ9JZfjYsmPx0/CRkjq4=;
        b=Ot1PgLTlPUQ5gO1zz8v4j86NcX02SJUSFm4qYI41ng3/OVjs6bCjGsoTPmu/j2jaT6
         OmWL/WEUmpAn6tK08UbMximBFQ4WQodOeQChBiBlmNr1xz6CPiUL8aIMsqwJ/afPxtYM
         eZphao+O9atO2ELQfpUYuD2rimx1RGgBVDL/yyJ59jDywGmAnWsZW4IWmIrcQL2N/dI0
         +cAeoM8k2RuElzaeiBG0Vx1yu5N3ZI1VqMuSrr64PmwzoCt6DXzJrr4Rt2bQC9jN3j6B
         amcM/LAPOAAjBGJ2ma/M8HNUtLMO+SMWWqzT4ieUDc02aDGPg2+3sfVoummMpr1+L/1J
         72CQ==
X-Gm-Message-State: AOJu0YxBckmb/mhYR4MvsK/NTmh2nQ1hZNA+/5kys20tEm7K/3vZ95ym
	Oio8isW08nDBg5C50uJz+hGYag==
X-Google-Smtp-Source: AGHT+IF+j3MEV76XSYbgBd+NJbND1WiQsLw5uLCcMCWZYYEcIN3MNdZAGlNaBSB9DWSmzdzf4Nij/g==
X-Received: by 2002:adf:db01:0:b0:333:1bc8:4105 with SMTP id s1-20020adfdb01000000b003331bc84105mr2698455wri.46.1701342976090;
        Thu, 30 Nov 2023 03:16:16 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cb09:1509:8dbd:5aaf? ([2001:8b0:aba:5f3c:cb09:1509:8dbd:5aaf])
        by smtp.gmail.com with ESMTPSA id v13-20020adfedcd000000b003331bd6f58esm1249200wro.69.2023.11.30.03.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 03:16:15 -0800 (PST)
Message-ID: <acdf403d9e703d9bd88c96b80f5123fe7115a8e5.camel@linuxfoundation.org>
Subject: Re: [RFC PATCH] qemurunner.py: ensure we drain stdout after boot
 prompt
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Erik Schilling <erik.schilling@linaro.org>, 
	openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com, 
	Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Thu, 30 Nov 2023 11:16:15 +0000
In-Reply-To: <871qc78po3.fsf@draig.linaro.org>
References: <20231129124501.86503-1-alex.bennee@linaro.org>
	 <CXBCUNG34QJ6.2CKPAM8PWBE82@ablu-work>
	 <ff32574a394a23880d8e578254ef5f68dc5f49c6.camel@linuxfoundation.org>
	 <87edg8a6zt.fsf@draig.linaro.org>
	 <bf208cf1b2cfa10155bc754b56cfa0c1127ec7be.camel@linuxfoundation.org>
	 <871qc78po3.fsf@draig.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 11:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191496

On Thu, 2023-11-30 at 11:07 +0000, Alex Benn=C3=A9e wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>=20
> > On Wed, 2023-11-29 at 15:56 +0000, Alex Benn=C3=A9e wrote:
> > > Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> > >=20
> > > > On Wed, 2023-11-29 at 15:11 +0100, Erik Schilling wrote:
> > > > > On Wed Nov 29, 2023 at 1:45 PM CET, Alex Benn=C3=A9e wrote:
> > > > > > If qemurunner doesn't continuously drain stdout we will eventua=
lly
> > > > > > cause QEMU to block while trying to write to the pipe. This can
> > > > > > manifest itself if the guest has for example configured its ser=
ial
> > > > > > ports to output via stdio even if the test itself is using a TC=
P
> > > > > > console or SSH to run things.
> > > > > >=20
> > > > > > This doesn't address a potential overflow of stderr although ge=
nerally
> > > > > > stderr from QEMU will be a lot less likely to block due to the =
volume
> > > > > > of data.
> > > > > >=20
> > > > > > Suggested-by: Erik Schilling <erik.schilling@linaro.org>
> > > > > > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > > > > > Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > > >=20
> > > > > > ---
> > > > > > AJB:
> > > > > >   As a QEMU developer I should note that we've had to solve a l=
ot of
> > > > > >   similar problems within our own internal testing (e.g.
> > > > > >   https://gitlab.com/qemu-project/qemu/-/blob/master/python/qem=
u/machine/console_socket.py?ref_type=3Dheads).
> > > > > >   Perhaps in the longer term it might make sense to consider us=
ing
> > > > > >   QEMU's own python tooling for configuring and launching QEMU?
> > > > > > ---
> > > > > >  meta/lib/oeqa/utils/qemurunner.py | 12 ++++++++++++
> > > > > >  1 file changed, 12 insertions(+)
> > > > > >=20
> > > > > > diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/=
utils/qemurunner.py
> > > > > > index 29fe271976..1ec472c49e 100644
> > > > > > --- a/meta/lib/oeqa/utils/qemurunner.py
> > > > > > +++ b/meta/lib/oeqa/utils/qemurunner.py
> > > > > > @@ -243,6 +243,7 @@ class QemuRunner:
> > > > > >          # to be a proper fix but this will suffice for now.
> > > > > >          self.runqemu =3D subprocess.Popen(launch_cmd, shell=3D=
True, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT, stdin=3Dsubproc=
ess.PIPE, preexec_fn=3Dos.setpgrp, env=3Denv, cwd=3Dself.tmpdir)
> > > > > >          output =3D self.runqemu.stdout
> > > > > > +        output_drain =3D output
> > > > > >          launch_time =3D time.time()
> > > > > > =20
> > > > > >          #
> > > > > > @@ -539,6 +540,17 @@ class QemuRunner:
> > > > > >                  self.logger.warning("The output:\n%s" % output=
)
> > > > > >          except:
> > > > > >              self.logger.warning("Serial console failed while t=
rying to login")
> > > > > > +
> > > > > > +        def drain_log():
> > > > > > +            while not output_drain.closed:
> > > > > > +                more_output =3D self.getOutput(output_drain)
> > > > > > +                if len(more_output) > 0:
> > > > > > +                    self.logger.debug("Logs since boot: %s", m=
ore_output)
> > > > > > +                time.sleep(0.1)
> > > > > > +
> > > > > > +        t =3D threading.Thread(target=3Ddrain_log)
> > > > > > +        t.start()
> > > > > > +
> > > > > >          return True
> > > > > > =20
> > > > > >      def stop(self):
> > > > >=20
> > > > > This is of course just a hack to demonstrate this was the problem=
. A
> > > > > better solution would probably be to collect the logs through the
> > > > > existing supervision process that gets forked off... That then al=
so
> > > > > solves the problem for the earlier code (and would transition nic=
ely to
> > > > > also drain stderr).
> > > >=20
> > > > I was wondering about that, this would ideally be handled by that
> > > > existing log processing thread. Would you be willing to work out a
> > > > patch to do that?
> > >=20
> > > Sure - but I'm a little unclear about how things are meant to work if
> > > you can offer any pointers. I assume we can just allow the existing
> > > logger to continue once we reach the login point?
> >=20
> > I was a little unsure about that when I recently worked on that code. I
> > think you're right, we should keep the data flowing to the log files
> > after login.
>=20
> I'm having difficulty following the logic. I can see the main loop:
>=20
>         while time.time() < endtime and not stopread:
>             try:
>                 sread, swrite, serror =3D select.select(filelist, [], [],=
 5)
>             except InterruptedError:
>                 continue
>=20
> but I guess we have to exit that for the tests to start running.

Correct.

>  Can this be punted to the logging process?=C2=A0

Probably not since we want things booted before running the tests which
is partly why the code does this.

> We'd need some sort of signal
> from the logging bit that we'd reached the login point. What does python
> use for that? mutex?

A threading.Semaphore() might work for this use case? Created and held
before the logging thread starts and the logging thread can non-
blocking acquire it and take over.

https://docs.python.org/3/library/threading.html#semaphore-objects

Cheers,

Richard


