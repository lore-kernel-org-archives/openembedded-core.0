Return-Path: <alex.bennee@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39621C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 15:56:14 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.40478.1701273368948497574
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 07:56:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Al7et1x3;
 spf=pass (domain: linaro.org, ip: 209.85.221.52, mailfrom: alex.bennee@linaro.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3331752d2b9so627167f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 07:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701273367; x=1701878167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ru5ggTTrwCBwObQGDCJ6b2WgaC47K1Kpv7ycvMzm3LM=;
        b=Al7et1x3SEX9mlhk2e47/eCQ4y3ieWlu6eVK/bdxOf8WHst3x1sleQffqvIVRXCNwy
         FgfjbMoLGmp7zN9UsMDdaa2HjXN7yD32XMPK9vsYJU5aj65eZt7U8bhEwPo/z3uCV1PD
         EGqR28et+Yael7VYufxdNI6KMNZXFWiUIkp+kGXJghHHYDBIbjqKTvaR4ywRYWRtwPfX
         IXRqFkE54xk5mMJONfcWhw2SRvbt1OlnW4GpRrpGryLt0Ok7Hfb7/gabWecBkaFWCfxu
         vv1KECTn+X2tEzUhR8Kd3nFjVGaECaa2t5op3NSNgYnLMo17AVyv1KGcu7i00chEp//C
         1hMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701273367; x=1701878167;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ru5ggTTrwCBwObQGDCJ6b2WgaC47K1Kpv7ycvMzm3LM=;
        b=b99Vi8ljA014pbDZ1VQojia47ivh+df+6LxOhwDxev7vnybW5QK+h/o+c3WFZZqYok
         PVtak4x+xp58XZmk5oLGz1RvnWreBQeCUkLv9h5uzRTSOLXGgunSKrvbqfiKLYN2gOaq
         Tncu9Jh9W8yO5+xvmaD7N99M9q6G5Y4GdKgGtZxQZ1MkJm+17vBEiYM/u/G+pX+BCOOh
         cSzA7Y+ZMr8ATuZbpBzPwOt1G6MouvS1ECxmdXhqPYIHLuGAIBjiz8PoP7S6pMFk7yu3
         on+SqkqPa5c6rDyLF6/vpx4Jl+R7KvHhoJnLsholJeU5X8bNSyDbvorgcTlkxQk9MCbi
         ISuQ==
X-Gm-Message-State: AOJu0YyZzrgyAo1jsXyF4YkpLmuvFIirGD63usnvKYxgwZLmGsz8YEpL
	3U3HfhhNUMYT8L49509zkCdUmA==
X-Google-Smtp-Source: AGHT+IHDYjAfF65EHodICejn2xGl37+A2litIyOEY530Sz41Bw6De9HJ6mETQ2SS5J+lc2bPQFxkig==
X-Received: by 2002:a05:6000:bc1:b0:333:1401:ea84 with SMTP id dm1-20020a0560000bc100b003331401ea84mr2826954wrb.4.1701273367200;
        Wed, 29 Nov 2023 07:56:07 -0800 (PST)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id dm16-20020a0560000bd000b00332cb4697ebsm18427054wrb.55.2023.11.29.07.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 07:56:06 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4E8B65F7AF;
	Wed, 29 Nov 2023 15:56:06 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Erik Schilling <erik.schilling@linaro.org>,
  openembedded-core@lists.openembedded.org,  alexandre.belloni@bootlin.com,
  Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [RFC PATCH] qemurunner.py: ensure we drain stdout after boot
 prompt
In-Reply-To: <ff32574a394a23880d8e578254ef5f68dc5f49c6.camel@linuxfoundation.org>
	(Richard Purdie's message of "Wed, 29 Nov 2023 14:56:09 +0000")
References: <20231129124501.86503-1-alex.bennee@linaro.org>
	<CXBCUNG34QJ6.2CKPAM8PWBE82@ablu-work>
	<ff32574a394a23880d8e578254ef5f68dc5f49c6.camel@linuxfoundation.org>
User-Agent: mu4e 1.11.25; emacs 29.1
Date: Wed, 29 Nov 2023 15:56:06 +0000
Message-ID: <87edg8a6zt.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 15:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191456

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Wed, 2023-11-29 at 15:11 +0100, Erik Schilling wrote:
>> On Wed Nov 29, 2023 at 1:45 PM CET, Alex Benn=C3=A9e wrote:
>> > If qemurunner doesn't continuously drain stdout we will eventually
>> > cause QEMU to block while trying to write to the pipe. This can
>> > manifest itself if the guest has for example configured its serial
>> > ports to output via stdio even if the test itself is using a TCP
>> > console or SSH to run things.
>> >=20
>> > This doesn't address a potential overflow of stderr although generally
>> > stderr from QEMU will be a lot less likely to block due to the volume
>> > of data.
>> >=20
>> > Suggested-by: Erik Schilling <erik.schilling@linaro.org>
>> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
>> >=20
>> > ---
>> > AJB:
>> >   As a QEMU developer I should note that we've had to solve a lot of
>> >   similar problems within our own internal testing (e.g.
>> >   https://gitlab.com/qemu-project/qemu/-/blob/master/python/qemu/machi=
ne/console_socket.py?ref_type=3Dheads).
>> >   Perhaps in the longer term it might make sense to consider using
>> >   QEMU's own python tooling for configuring and launching QEMU?
>> > ---
>> >  meta/lib/oeqa/utils/qemurunner.py | 12 ++++++++++++
>> >  1 file changed, 12 insertions(+)
>> >=20
>> > diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/q=
emurunner.py
>> > index 29fe271976..1ec472c49e 100644
>> > --- a/meta/lib/oeqa/utils/qemurunner.py
>> > +++ b/meta/lib/oeqa/utils/qemurunner.py
>> > @@ -243,6 +243,7 @@ class QemuRunner:
>> >          # to be a proper fix but this will suffice for now.
>> >          self.runqemu =3D subprocess.Popen(launch_cmd, shell=3DTrue, s=
tdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT, stdin=3Dsubprocess.PIP=
E, preexec_fn=3Dos.setpgrp, env=3Denv, cwd=3Dself.tmpdir)
>> >          output =3D self.runqemu.stdout
>> > +        output_drain =3D output
>> >          launch_time =3D time.time()
>> >=20=20
>> >          #
>> > @@ -539,6 +540,17 @@ class QemuRunner:
>> >                  self.logger.warning("The output:\n%s" % output)
>> >          except:
>> >              self.logger.warning("Serial console failed while trying t=
o login")
>> > +
>> > +        def drain_log():
>> > +            while not output_drain.closed:
>> > +                more_output =3D self.getOutput(output_drain)
>> > +                if len(more_output) > 0:
>> > +                    self.logger.debug("Logs since boot: %s", more_out=
put)
>> > +                time.sleep(0.1)
>> > +
>> > +        t =3D threading.Thread(target=3Ddrain_log)
>> > +        t.start()
>> > +
>> >          return True
>> >=20=20
>> >      def stop(self):
>>=20
>> This is of course just a hack to demonstrate this was the problem. A
>> better solution would probably be to collect the logs through the
>> existing supervision process that gets forked off... That then also
>> solves the problem for the earlier code (and would transition nicely to
>> also drain stderr).
>
> I was wondering about that, this would ideally be handled by that
> existing log processing thread. Would you be willing to work out a
> patch to do that?

Sure - but I'm a little unclear about how things are meant to work if
you can offer any pointers. I assume we can just allow the existing
logger to continue once we reach the login point?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

