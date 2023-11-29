Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C44BC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 15:59:24 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.40456.1701273554371314568
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 07:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YyyIzMLM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40b54261534so5684815e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701273553; x=1701878353; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N1pYS4BAzTn8h2inG9p+EM1NgpiedOUj3TVTwrzNTuI=;
        b=YyyIzMLMB3dIgY9w1K7GxNAlCDBVtajMXEenDgrcaQESNKPAZdRc8jyRMhMsb1JnHv
         2CUb35oAD1BZYeYIzR5oqveTVSFIoLWmC0luSV7EKZZ2nU51DaP9nBDldN6WHPXa69/F
         MeKWavNGAMLex4QxdlH0gp/tIx1u22zM+XA8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701273553; x=1701878353;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N1pYS4BAzTn8h2inG9p+EM1NgpiedOUj3TVTwrzNTuI=;
        b=t1cwMhotR5eTUGxVdx6ClVwKfVoBv7yQJz3wIC44qPwVaiPPQ5pRf5MmvcCkuE9lA4
         8r6C+WRprG/6MoOUdXHuRDLYQUtqFyGwVuAl0AMEgeegBaITp1LuYCYI1csqHzSJMsNw
         XSIwybQkfZTr/vAuiZX1V/Acca3Ony0hanDWtv3Aci+TgICKTr1IgmNq228sIQyuzBix
         EKNAfGOKRgD1LLvW+BpzZWehQ3jkVjtPdr+wCpch274SRFle+7R7VdguWg1J0k8yH/4q
         kfl89sPXmo73roWCg09oEjR5uh4pScMMzJZrrTflX5iomG2jO8x1xsx6ZjPwVq+UOgKc
         yBAw==
X-Gm-Message-State: AOJu0YyKyp6lhp3jCG8S/a1OnCuMR/MxqV0xG5oDmm08zSa95sxxpOEX
	uhkiKPp5J1CNGhXUOKc7SYeQhw==
X-Google-Smtp-Source: AGHT+IFzHUIezdvr3ey0hkHSUBumgeVNfBESPDJ1RjYCfeKyS5w05TZx34b7+vPwCV9dNgdVjNgh5Q==
X-Received: by 2002:a05:600c:1909:b0:40b:4b9d:6953 with SMTP id j9-20020a05600c190900b0040b4b9d6953mr4564385wmq.38.1701273552705;
        Wed, 29 Nov 2023 07:59:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ea1:d952:d81c:3bac? ([2001:8b0:aba:5f3c:8ea1:d952:d81c:3bac])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c444d00b0040b3867a297sm2677649wmn.36.2023.11.29.07.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 07:59:12 -0800 (PST)
Message-ID: <bf208cf1b2cfa10155bc754b56cfa0c1127ec7be.camel@linuxfoundation.org>
Subject: Re: [RFC PATCH] qemurunner.py: ensure we drain stdout after boot
 prompt
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Erik Schilling <erik.schilling@linaro.org>, 
	openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com, 
	Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Wed, 29 Nov 2023 15:59:11 +0000
In-Reply-To: <87edg8a6zt.fsf@draig.linaro.org>
References: <20231129124501.86503-1-alex.bennee@linaro.org>
	 <CXBCUNG34QJ6.2CKPAM8PWBE82@ablu-work>
	 <ff32574a394a23880d8e578254ef5f68dc5f49c6.camel@linuxfoundation.org>
	 <87edg8a6zt.fsf@draig.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 15:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191457

On Wed, 2023-11-29 at 15:56 +0000, Alex Benn=C3=A9e wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>=20
> > On Wed, 2023-11-29 at 15:11 +0100, Erik Schilling wrote:
> > > On Wed Nov 29, 2023 at 1:45 PM CET, Alex Benn=C3=A9e wrote:
> > > > If qemurunner doesn't continuously drain stdout we will eventually
> > > > cause QEMU to block while trying to write to the pipe. This can
> > > > manifest itself if the guest has for example configured its serial
> > > > ports to output via stdio even if the test itself is using a TCP
> > > > console or SSH to run things.
> > > >=20
> > > > This doesn't address a potential overflow of stderr although genera=
lly
> > > > stderr from QEMU will be a lot less likely to block due to the volu=
me
> > > > of data.
> > > >=20
> > > > Suggested-by: Erik Schilling <erik.schilling@linaro.org>
> > > > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > > > Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > >=20
> > > > ---
> > > > AJB:
> > > >   As a QEMU developer I should note that we've had to solve a lot o=
f
> > > >   similar problems within our own internal testing (e.g.
> > > >   https://gitlab.com/qemu-project/qemu/-/blob/master/python/qemu/ma=
chine/console_socket.py?ref_type=3Dheads).
> > > >   Perhaps in the longer term it might make sense to consider using
> > > >   QEMU's own python tooling for configuring and launching QEMU?
> > > > ---
> > > >  meta/lib/oeqa/utils/qemurunner.py | 12 ++++++++++++
> > > >  1 file changed, 12 insertions(+)
> > > >=20
> > > > diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/util=
s/qemurunner.py
> > > > index 29fe271976..1ec472c49e 100644
> > > > --- a/meta/lib/oeqa/utils/qemurunner.py
> > > > +++ b/meta/lib/oeqa/utils/qemurunner.py
> > > > @@ -243,6 +243,7 @@ class QemuRunner:
> > > >          # to be a proper fix but this will suffice for now.
> > > >          self.runqemu =3D subprocess.Popen(launch_cmd, shell=3DTrue=
, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT, stdin=3Dsubprocess.=
PIPE, preexec_fn=3Dos.setpgrp, env=3Denv, cwd=3Dself.tmpdir)
> > > >          output =3D self.runqemu.stdout
> > > > +        output_drain =3D output
> > > >          launch_time =3D time.time()
> > > > =20
> > > >          #
> > > > @@ -539,6 +540,17 @@ class QemuRunner:
> > > >                  self.logger.warning("The output:\n%s" % output)
> > > >          except:
> > > >              self.logger.warning("Serial console failed while tryin=
g to login")
> > > > +
> > > > +        def drain_log():
> > > > +            while not output_drain.closed:
> > > > +                more_output =3D self.getOutput(output_drain)
> > > > +                if len(more_output) > 0:
> > > > +                    self.logger.debug("Logs since boot: %s", more_=
output)
> > > > +                time.sleep(0.1)
> > > > +
> > > > +        t =3D threading.Thread(target=3Ddrain_log)
> > > > +        t.start()
> > > > +
> > > >          return True
> > > > =20
> > > >      def stop(self):
> > >=20
> > > This is of course just a hack to demonstrate this was the problem. A
> > > better solution would probably be to collect the logs through the
> > > existing supervision process that gets forked off... That then also
> > > solves the problem for the earlier code (and would transition nicely =
to
> > > also drain stderr).
> >=20
> > I was wondering about that, this would ideally be handled by that
> > existing log processing thread. Would you be willing to work out a
> > patch to do that?
>=20
> Sure - but I'm a little unclear about how things are meant to work if
> you can offer any pointers. I assume we can just allow the existing
> logger to continue once we reach the login point?

I was a little unsure about that when I recently worked on that code. I
think you're right, we should keep the data flowing to the log files
after login.

Cheers,

Richard



