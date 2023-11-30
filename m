Return-Path: <alex.bennee@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDFEC4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 11:08:02 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.69905.1701342478994275207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 03:07:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Gb4C6pa0;
 spf=pass (domain: linaro.org, ip: 209.85.128.43, mailfrom: alex.bennee@linaro.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40b397793aaso4558115e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 03:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701342477; x=1701947277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ww9V5I4OwPsJIl26wS3si70WmejMIBAqI/JhCWI3nk=;
        b=Gb4C6pa0eLCyARa7QuEHCLk+EsDHxxkRS5G87FtAI3R8a58Dml27wMqYmpmUFHCJU1
         AZDHzKu174LGUPivuzoCnU743NKeq4c69hrttT4LmUOd6LENSZF79M0urD5VUOb1R+Yd
         wHYzcF9dm4P1q8R25sTG36aLIYq07n2Rue0FrqBTUFre0KPANLNYx+Kv0AwAQdFoOkkl
         Faxp0G8nmlbgbXEpD2jFOBdbl1YGRnxZE20ZNeFBtYRN/EhpfCP+0kvv1x3iZigf0kGh
         BZJs8DtYr2LkgdQe0R2mxujy6AxbeAhRzWqfwYQsuA7rrNZ+xfBqhzqodIw7CynaVhmd
         ieHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701342477; x=1701947277;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ww9V5I4OwPsJIl26wS3si70WmejMIBAqI/JhCWI3nk=;
        b=wzRLOoNdBBSfLQc3KsGi7sgFIL7Un9XQY5Fz2u4Muj8m158y9w94WyhcMGnXaKFO4B
         /63vtE4KJgVLGW1kxp+5ObJWIdYEJGzprLr+MNZ3hgYBXpA/Tin80dr7awvRSJ6miwRz
         Ar8xEyrRyJbovMlY94OR1vq4Q9APvGOa5GnzyGvLiYWrQM+VwhlkyeoLMPVdTzooUefh
         YZw5vN4rtj+VQWGRucv8vi/j3dtBhceFPpjH5BMqTUbvyRPZfVNB8W5tUau3Hj3MeZtc
         x/GXTgyhcRbitImEVywJhKwUJVN0J9GD28ZTbISlIYXq2BRmqbXBwgtKyRAioizThube
         0ChQ==
X-Gm-Message-State: AOJu0Yyjqm9EMjzyH80pA1HoFTLBmS1M8j/7YLKGmZGLiItRuDYk+MES
	QuyVwwYhWrW8sl6mv0pABwlwAg==
X-Google-Smtp-Source: AGHT+IGxMrV3aqBygiWZNBGxDK56uiywzh7eI9WjlQbVTt9NHp0mpFAFtgqolrIbkSjUESlJASxa+A==
X-Received: by 2002:a05:600c:1da5:b0:40b:50bf:e6df with SMTP id p37-20020a05600c1da500b0040b50bfe6dfmr4840844wms.10.1701342477333;
        Thu, 30 Nov 2023 03:07:57 -0800 (PST)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id bg36-20020a05600c3ca400b003fe1fe56202sm1640008wmb.33.2023.11.30.03.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 03:07:57 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 936BE5F794;
	Thu, 30 Nov 2023 11:07:56 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Erik Schilling <erik.schilling@linaro.org>,
  openembedded-core@lists.openembedded.org,  alexandre.belloni@bootlin.com,
  Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [RFC PATCH] qemurunner.py: ensure we drain stdout after boot
 prompt
In-Reply-To: <bf208cf1b2cfa10155bc754b56cfa0c1127ec7be.camel@linuxfoundation.org>
	(Richard Purdie's message of "Wed, 29 Nov 2023 15:59:11 +0000")
References: <20231129124501.86503-1-alex.bennee@linaro.org>
	<CXBCUNG34QJ6.2CKPAM8PWBE82@ablu-work>
	<ff32574a394a23880d8e578254ef5f68dc5f49c6.camel@linuxfoundation.org>
	<87edg8a6zt.fsf@draig.linaro.org>
	<bf208cf1b2cfa10155bc754b56cfa0c1127ec7be.camel@linuxfoundation.org>
User-Agent: mu4e 1.11.25; emacs 29.1
Date: Thu, 30 Nov 2023 11:07:56 +0000
Message-ID: <871qc78po3.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 11:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191494

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Wed, 2023-11-29 at 15:56 +0000, Alex Benn=C3=A9e wrote:
>> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>>=20
>> > On Wed, 2023-11-29 at 15:11 +0100, Erik Schilling wrote:
>> > > On Wed Nov 29, 2023 at 1:45 PM CET, Alex Benn=C3=A9e wrote:
>> > > > If qemurunner doesn't continuously drain stdout we will eventually
>> > > > cause QEMU to block while trying to write to the pipe. This can
>> > > > manifest itself if the guest has for example configured its serial
>> > > > ports to output via stdio even if the test itself is using a TCP
>> > > > console or SSH to run things.
>> > > >=20
>> > > > This doesn't address a potential overflow of stderr although gener=
ally
>> > > > stderr from QEMU will be a lot less likely to block due to the vol=
ume
>> > > > of data.
>> > > >=20
>> > > > Suggested-by: Erik Schilling <erik.schilling@linaro.org>
>> > > > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > > > Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
>> > > >=20
>> > > > ---
>> > > > AJB:
>> > > >   As a QEMU developer I should note that we've had to solve a lot =
of
>> > > >   similar problems within our own internal testing (e.g.
>> > > >   https://gitlab.com/qemu-project/qemu/-/blob/master/python/qemu/m=
achine/console_socket.py?ref_type=3Dheads).
>> > > >   Perhaps in the longer term it might make sense to consider using
>> > > >   QEMU's own python tooling for configuring and launching QEMU?
>> > > > ---
>> > > >  meta/lib/oeqa/utils/qemurunner.py | 12 ++++++++++++
>> > > >  1 file changed, 12 insertions(+)
>> > > >=20
>> > > > diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/uti=
ls/qemurunner.py
>> > > > index 29fe271976..1ec472c49e 100644
>> > > > --- a/meta/lib/oeqa/utils/qemurunner.py
>> > > > +++ b/meta/lib/oeqa/utils/qemurunner.py
>> > > > @@ -243,6 +243,7 @@ class QemuRunner:
>> > > >          # to be a proper fix but this will suffice for now.
>> > > >          self.runqemu =3D subprocess.Popen(launch_cmd, shell=3DTru=
e, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT, stdin=3Dsubprocess=
.PIPE, preexec_fn=3Dos.setpgrp, env=3Denv, cwd=3Dself.tmpdir)
>> > > >          output =3D self.runqemu.stdout
>> > > > +        output_drain =3D output
>> > > >          launch_time =3D time.time()
>> > > >=20=20
>> > > >          #
>> > > > @@ -539,6 +540,17 @@ class QemuRunner:
>> > > >                  self.logger.warning("The output:\n%s" % output)
>> > > >          except:
>> > > >              self.logger.warning("Serial console failed while tryi=
ng to login")
>> > > > +
>> > > > +        def drain_log():
>> > > > +            while not output_drain.closed:
>> > > > +                more_output =3D self.getOutput(output_drain)
>> > > > +                if len(more_output) > 0:
>> > > > +                    self.logger.debug("Logs since boot: %s", more=
_output)
>> > > > +                time.sleep(0.1)
>> > > > +
>> > > > +        t =3D threading.Thread(target=3Ddrain_log)
>> > > > +        t.start()
>> > > > +
>> > > >          return True
>> > > >=20=20
>> > > >      def stop(self):
>> > >=20
>> > > This is of course just a hack to demonstrate this was the problem. A
>> > > better solution would probably be to collect the logs through the
>> > > existing supervision process that gets forked off... That then also
>> > > solves the problem for the earlier code (and would transition nicely=
 to
>> > > also drain stderr).
>> >=20
>> > I was wondering about that, this would ideally be handled by that
>> > existing log processing thread. Would you be willing to work out a
>> > patch to do that?
>>=20
>> Sure - but I'm a little unclear about how things are meant to work if
>> you can offer any pointers. I assume we can just allow the existing
>> logger to continue once we reach the login point?
>
> I was a little unsure about that when I recently worked on that code. I
> think you're right, we should keep the data flowing to the log files
> after login.

I'm having difficulty following the logic. I can see the main loop:

        while time.time() < endtime and not stopread:
            try:
                sread, swrite, serror =3D select.select(filelist, [], [], 5)
            except InterruptedError:
                continue

but I guess we have to exit that for the tests to start running. Can
this be punted to the logging process? We'd need some sort of signal
from the logging bit that we'd reached the login point. What does python
use for that? mutex?


>
> Cheers,
>
> Richard

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

