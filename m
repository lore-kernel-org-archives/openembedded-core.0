Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C60ACE7B02
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 12:01:15 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.33029.1725624068852049760
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 05:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AU+SExw0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a868d7f92feso271403166b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 05:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725624067; x=1726228867; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xagEReUfdblkE2+nOlX1G9P+wXx3rdQwTgo8UXap2pk=;
        b=AU+SExw0+2J+MUAG64LfMJfvl18v6rqJhR2rAg20dRG9driajYWhvBL1wCR1+reN+y
         yKyLQncbqXIqUZqj/oVr3UzScd+wLRz+S2a93RuWh1hauJgVJU+6rxPVW1njo3kDf0UH
         QAiqh8zcmy3AeMmPQZoCYCXGs4GyBw+EFVeaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725624067; x=1726228867;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xagEReUfdblkE2+nOlX1G9P+wXx3rdQwTgo8UXap2pk=;
        b=wBkUrWP5SIZ8cEU18+dum7H3DUPxT+yr0DWJ6yA7HGZTQEQ+OWxFKxjGfAFm2Iuuhf
         fSVV5arBNQ8S6x5/ZLcVoXOIjQkw1mdipNqllpX3IdSRIJ5/UFQB7oKwbm12j66cBhRL
         hBx2Xj9LSSdn3DQ8UUvYV6tX7oQJUPGCJI4cGxK86omo1rKIH/ok3YzzkyyYohB9bjRL
         6fwWGTUSCjG9p+KcGM6LU3q3KR25mYionx2y3/pXMr+6OdQOzBKmDjUxRI1HLdJ5rPEp
         OlL2CDFBDE88skLskwYkG5Ok9PyQZu9klOPqv08DaRQTDlEKZilntvn2BC3IlZDGh1b6
         /zUw==
X-Gm-Message-State: AOJu0YyMOpivglPQpcEyAE+tU10MceGiceFpksZFgVn5NUMc+AV3K9Ob
	Ri0k8ohvZjNhxUXzCXSLVdM1OK+h57y+JkXWvgpiaDbZOcpjnYbaBFsXNiqF8l4=
X-Google-Smtp-Source: AGHT+IHtU2a9LLCOic5xYVeq23sIx7sjMZsGsyZQtJNDTxks5Wz3cL8kXVaUbC5pjrUpZZ0Hbea0+A==
X-Received: by 2002:a17:906:dc8b:b0:a8d:e82:bdb3 with SMTP id a640c23a62f3a-a8d0e82bed3mr14268666b.18.1725624066753;
        Fri, 06 Sep 2024 05:01:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3f86:8879:5d66:675c? ([2001:8b0:aba:5f3c:3f86:8879:5d66:675c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d0ce0a5cbsm20524566b.141.2024.09.06.05.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 05:01:06 -0700 (PDT)
Message-ID: <f9f9aaf694f21e5f09f6cc879c02e52c3478d7b6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] runqemu: lock tap creation process
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 06 Sep 2024 13:01:05 +0100
In-Reply-To: <GV1PR07MB9120DE957E20379890ADDFADA89E2@GV1PR07MB9120.eurprd07.prod.outlook.com>
References: 
	<GV1PR07MB91203A774F08D3110C579514A89C2@GV1PR07MB9120.eurprd07.prod.outlook.com>
	 <67ea9ebc458af8adc9b8c625fea9b27e3b452f76.camel@linuxfoundation.org>
	 <GV1PR07MB9120DE957E20379890ADDFADA89E2@GV1PR07MB9120.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 12:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204261

On Fri, 2024-09-06 at 10:18 +0200, Konrad Weihmann wrote:
> On 05.09.24 11:56, Richard Purdie wrote:
> > On Wed, 2024-09-04 at 12:21 +0000, Konrad Weihmann via lists.openembedd=
ed.org wrote:
> > > in case of running two or more runqemu instances in parallel
> > > with no previously setup tap devices, the following happens:
> > >=20
> > > instance A probes for tap devices, but doesn't find
> > > any, proceeds to generating tap devices with the sudo call,
> > > resulting in tap0.
> > > instance B starts to probes, finds tap0.
> > > Both will lock tap0.
> > >=20
> > > tap0 will be then forwarded to qemu.
> > > Instance A reporting
> > >=20
> > > "Using preconfigured tap device tap0"
> > >=20
> > > but then failing with
> > >=20
> > > qemu-system... could not configure /dev/net/tun (tap0): Device or res=
ource busy
> > >=20
> > > To fix that, lock the entire tap creation process with
> > > an exclusive file (blocking) lock, so only a single instance can
> > > perform the non-atomic changes.
> > >=20
> > > Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> > > ---
> > > =C2=A0=C2=A0scripts/runqemu | 10 ++++++++++
> > > =C2=A0=C2=A01 file changed, 10 insertions(+)
> > >=20
> > > diff --git a/scripts/runqemu b/scripts/runqemu
> > > index 2817acb19f..e5db06be37 100755
> > > --- a/scripts/runqemu
> > > +++ b/scripts/runqemu
> > > @@ -1163,6 +1163,9 @@ to your build configuration.
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.make_lock=
_dir(lockdir)
> > > =C2=A0=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tap_setup_lock =3D open(o=
s.path.join(lockdir, '_tap_creation_lock'), 'w')
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fcntl.flock(tap_setup_loc=
k, fcntl.LOCK_EX)
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D (ip, '=
link')
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logger.debug('=
Running %s...' % str(cmd))
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip_link =3D su=
bprocess.check_output(cmd).decode('utf-8')
> > > @@ -1187,6 +1190,8 @@ to your build configuration.
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not tap:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if os.path.exists(nosudo_flag):
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 fcntl.flock(tap_setup_lock, fcntl.LOCK_UN)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 tap_setup_lock.close()
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logger.error("Error: There are no availab=
le tap devices to use for networking,")
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logger.error("and I see %s exists, so I a=
m not going to try creating" % nosudo_flag)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise RunQemuError("a new one with sudo."=
)
> >=20
> > This doesn't make sense to me. Surely you should be taking this lock
> > *within* the "if not tap" code block since that is where the ifup is
> > called out to with sudo? You appear to be dropping the lock there
> > instead?
>=20
> Right before the raise of an exception the lock should be released,=20
> shouldn't it?

Ok, I see why you've done it this way. I'd much prefer to move the lock
to just be in that conditional though. I don't believe it is needed in
the earlier search code - that code works fine today and is only used
if the devices are pre-setup.

> Otherwise we would rely on the fact that none of the calling functions=
=20
> does any exception handling and
> the entire process fails to release the lock.
>=20
> >=20
> > It appears you're putting the locking around the search for pre-
> > configured tap devices which is already atomic and working well from a
> > race perspective?
>=20
> That is the actual race condition here.
> On the on hand you have the search function, which in itself is atomic=
=20
> and save yes but then you have the setup function below
>=20
> 1198=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tr=
y:
> 1199=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 tap =3D=20
> subprocess.check_output(cmd).decode('utf-8').strip()
> 1200=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ex=
cept subprocess.CalledProcessError as e:
> 1201=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 logger.error('Setting up tap device failed:\n%s\nRun=
=20
> runqemu-gen-tapdevs to manually create one.' % str(e))
> 1202=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 sys.exit(1)
> 1203=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lo=
ckfile =3D os.path.join(lockdir, tap)
> 1204=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 se=
lf.taplock =3D lockfile + '.lock'
> 1205=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 se=
lf.acquire_taplock()
>=20
> the section from line 1199 till 1205 is completely unguarded from a lock=
=20
> perspective.
> Meaning (and I think that is what is actually happening) that the new
> tap device is created as the result of line 1199 by process A but locked=
=20
> by process B, as the search function finds it and acquires the lock.
> So in my opinion the entirely function needs to allow only a single=20
> instance to work on it (at least that is the most straight forward=20
> solution I can imagine).
> The only thing I couldn't figure out in the hundreds of test runs is,
> why the 1205 line lock isn't failing with an error, nevertheless this
> should be fixed and a function wide exclusive lock fixed the issue for me=
.

Looking at acquire_taplock(), it will print an error instead of an info
message and merrily continue on as the return value isn't checked. That
is perhaps the first key issue to fix as even with your change, that is
still a problem.

I think rather than add potentially fragile locking, we should try and
acquire the lock, if we can't, we should try and add yet another tap
device and continue until something hard errors...

Cheers,

Richard



