Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D0EC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 14:56:13 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.36902.1701269771913182911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 06:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UcGg+RpX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4079ed65582so50795435e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 06:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701269770; x=1701874570; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lDUtVQS4hiM9BAHMdU8kV5lpo1qHNQV6ypDeJgyu2QQ=;
        b=UcGg+RpX5stfEh0pfD6Szlo36oO6rWsv/AtXyV5HHeMQgSqfaKfKJpQtKFssFq2g99
         SbLpAxhpawanuXSN/JYuer9Xg/Aw47w9J4PeIdMufeZSuX9dlbvqJxhK2N31nlyqjk3T
         YSVbWwsLJSk3/lMZHWST5zsjXHPrWfZDMZwPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701269770; x=1701874570;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDUtVQS4hiM9BAHMdU8kV5lpo1qHNQV6ypDeJgyu2QQ=;
        b=L+8TnDve9nfIIYYs0rVd/Pjf9rcqQa8KdBoCQa5/rW11lVzN2FH7mHLXHYerhvc77i
         GlUAEtDLaqH10lwF89fuWz1WGSg5ZiIdsO+MKCIaz8Hw3wVXKGf91hRDu2vY4RtN/Hz6
         WPbnoYzHBmcdyjx6pB0AO1QKPBdF4TTdRuy0PIyD8vDlWrD4e4q8sLeijuWyn4R5xjr8
         7jvhKgJ2KCQq5REy19UE9FgrxvcJ6PsHoJSZJuZZo2Cdcq+1wq5mNadr6piyklw1UyIU
         Bc3Z7RBkpLBjWomwYDwuHTA86yPuJej1/WgouJkzYurrNgzoitaI12geLbSa4j9TTy59
         svcQ==
X-Gm-Message-State: AOJu0YyADIwIuf9ycyNH0HpyrcH4OkUyb5XqrLNaY4fFTghbhoqGFTwH
	syOz2/0Vb9W6DqZ1l68jax2lzg==
X-Google-Smtp-Source: AGHT+IF4M9BtQJMaUIDX1IrHv1EWSKZqT4MiW7qZRGiLP4HUCgby4nxtys+FnBuJYEP4zUqpbm7hLA==
X-Received: by 2002:a05:6000:bc7:b0:333:1307:eb1c with SMTP id dm7-20020a0560000bc700b003331307eb1cmr2848437wrb.63.1701269770193;
        Wed, 29 Nov 2023 06:56:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ea1:d952:d81c:3bac? ([2001:8b0:aba:5f3c:8ea1:d952:d81c:3bac])
        by smtp.gmail.com with ESMTPSA id f10-20020a5d568a000000b00332f95ab451sm11442256wrv.58.2023.11.29.06.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:56:09 -0800 (PST)
Message-ID: <ff32574a394a23880d8e578254ef5f68dc5f49c6.camel@linuxfoundation.org>
Subject: Re: [RFC PATCH] qemurunner.py: ensure we drain stdout after boot
 prompt
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Erik Schilling <erik.schilling@linaro.org>, Alex
	=?ISO-8859-1?Q?Benn=E9e?=
	 <alex.bennee@linaro.org>, openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Wed, 29 Nov 2023 14:56:09 +0000
In-Reply-To: <CXBCUNG34QJ6.2CKPAM8PWBE82@ablu-work>
References: <20231129124501.86503-1-alex.bennee@linaro.org>
	 <CXBCUNG34QJ6.2CKPAM8PWBE82@ablu-work>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 14:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191454

On Wed, 2023-11-29 at 15:11 +0100, Erik Schilling wrote:
> On Wed Nov 29, 2023 at 1:45 PM CET, Alex Benn=C3=A9e wrote:
> > If qemurunner doesn't continuously drain stdout we will eventually
> > cause QEMU to block while trying to write to the pipe. This can
> > manifest itself if the guest has for example configured its serial
> > ports to output via stdio even if the test itself is using a TCP
> > console or SSH to run things.
> >=20
> > This doesn't address a potential overflow of stderr although generally
> > stderr from QEMU will be a lot less likely to block due to the volume
> > of data.
> >=20
> > Suggested-by: Erik Schilling <erik.schilling@linaro.org>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> >=20
> > ---
> > AJB:
> >   As a QEMU developer I should note that we've had to solve a lot of
> >   similar problems within our own internal testing (e.g.
> >   https://gitlab.com/qemu-project/qemu/-/blob/master/python/qemu/machin=
e/console_socket.py?ref_type=3Dheads).
> >   Perhaps in the longer term it might make sense to consider using
> >   QEMU's own python tooling for configuring and launching QEMU?
> > ---
> >  meta/lib/oeqa/utils/qemurunner.py | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qe=
murunner.py
> > index 29fe271976..1ec472c49e 100644
> > --- a/meta/lib/oeqa/utils/qemurunner.py
> > +++ b/meta/lib/oeqa/utils/qemurunner.py
> > @@ -243,6 +243,7 @@ class QemuRunner:
> >          # to be a proper fix but this will suffice for now.
> >          self.runqemu =3D subprocess.Popen(launch_cmd, shell=3DTrue, st=
dout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT, stdin=3Dsubprocess.PIPE=
, preexec_fn=3Dos.setpgrp, env=3Denv, cwd=3Dself.tmpdir)
> >          output =3D self.runqemu.stdout
> > +        output_drain =3D output
> >          launch_time =3D time.time()
> > =20
> >          #
> > @@ -539,6 +540,17 @@ class QemuRunner:
> >                  self.logger.warning("The output:\n%s" % output)
> >          except:
> >              self.logger.warning("Serial console failed while trying to=
 login")
> > +
> > +        def drain_log():
> > +            while not output_drain.closed:
> > +                more_output =3D self.getOutput(output_drain)
> > +                if len(more_output) > 0:
> > +                    self.logger.debug("Logs since boot: %s", more_outp=
ut)
> > +                time.sleep(0.1)
> > +
> > +        t =3D threading.Thread(target=3Ddrain_log)
> > +        t.start()
> > +
> >          return True
> > =20
> >      def stop(self):
>=20
> This is of course just a hack to demonstrate this was the problem. A
> better solution would probably be to collect the logs through the
> existing supervision process that gets forked off... That then also
> solves the problem for the earlier code (and would transition nicely to
> also drain stderr).

I was wondering about that, this would ideally be handled by that
existing log processing thread. Would you be willing to work out a
patch to do that?

Cheers,

Richard

