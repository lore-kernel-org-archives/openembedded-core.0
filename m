Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26976108E1FF
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 09:27:07 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8919.1773998817902235379
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 02:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Op0vHPiM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso1552327f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 02:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773998816; x=1774603616; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IkTTCEGvqtz67PA/XQkMkDiTigp+Dhsw5RIREVRM4Ic=;
        b=Op0vHPiM0B5C+0U6DmyKBHN5YhuH7j5qF3b8DN8kKvQUAFq6CueMfG+Nfn9PVkLFgK
         OtW1Hgua+sxgjg/NERc2qInyJU5uOsXv+uLuPWoD5xORN0+UpgPkYCmT77rzDdki8VTu
         mVTL+K3Kjq6B8i5Rxq5Vl00cqAyCko/zZNvk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773998816; x=1774603616;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkTTCEGvqtz67PA/XQkMkDiTigp+Dhsw5RIREVRM4Ic=;
        b=f0UIxcDUFkx/pJxpb/UBeNc+kTL3vsoAPczfeSPsqbXecjYSyYFFTfiT+DVLu4RjOD
         W7FOEKCygnjZAtqHHE4sEcvyAwvRxWGHCVFSKHV3G5+wCO3ohxQgzevCtd6VbuniWOCR
         jPUHuH1LbEbEAEQ1ivB2em4krbKSx7dRIxV6dI1ZtKllCRr49vHxdKIqhvnIMp8vi44e
         X8K9T8mt+L/3+vqgs28YMtOno5DEMp9AOyC9uIQgWE5XT5mgrxmhxWzEs+u1s8HVvrNO
         fJbTML59hibd4gbizeS9ezaUD84A0gxhPCmMXxJl8UPktM9o1yttLI/0sX58YhAPRwJC
         UKQg==
X-Forwarded-Encrypted: i=1; AJvYcCWTND5QWqg1jWDD9PCdsrbJJGTfgoOzv1ziJrUzNXZf6w5/fPETDZIxuwpmfkY93aHKdlKYNP0cT1DlZJ4KdNp3gQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzOY1YAlkjyI8KfMD2CH1uvTuu1vUF4oZXDxWz0GoGeFO4f5Dgg
	IgDyfYewkVT5+AgfIvpHmvZXEdqtkU028hDzS3kvSxqOCGQ4OeJBP+UhEHBo/APYOB4=
X-Gm-Gg: ATEYQzwnasT+iLW7gX2yJ4Urt+LsjXGyvjRaO1VbF18Pe5heSFuHWJtBj6ajFhE0daw
	Yn7RCvzBcFudb5ci/PaMPPi+fMCtL8PvMIbQk48eP3AgMJCMlVfOF6zYNcIhQrnl8fUJ6pFZ5x1
	sawDAPmQ8ZZm0Pu13j8Mxq5FRfVylykCGS8RsTtD/ddS913QxQU92UL9+CxNITWaqA7fSVwJb7W
	eL+kKPWtozzU0bA4G5tAauZ1GAeRXQY9wvt5nAlJwhy0AnGrjTg+tel7hNQIiz6u0a1VSANstvu
	oTrhA8ytwPf4JrKyq6DMObJIlVLgPpzam+g2KX1SUcPBKgzp2VJAa7JhGLIG5w11OM5sCMMe1Fe
	xohBcTSPK11cpylezSiRyqitJsL2cxBZyS1ACs3HLFuYomxrK9f204dAsZJokTy1eT8YeQ/Xt5s
	N/QCGg7k7UgqGgG2ZmClS9aaAcwUNx2pyMMt2uQmUROaJkITvzlM+NcktJYHq5H6UM9SdW5cdQF
	rkKn2A+FRNrDcd+
X-Received: by 2002:a05:6000:24c4:b0:43b:6345:8d7e with SMTP id ffacd0b85a97d-43b6423a236mr4148127f8f.13.1773998816149;
        Fri, 20 Mar 2026 02:26:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:72df:cb96:568c:f7d8? ([2001:8b0:aba:5f3c:72df:cb96:568c:f7d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c7fsm5359021f8f.23.2026.03.20.02.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 02:26:55 -0700 (PDT)
Message-ID: <48f14806accaadc4f980677c47db1ca194bbc5a8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ltp: fix warning in remove_broken_musl_sources
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: joaomarcos.costa@bootlin.com, Mathieu Dubois-Briand	
 <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
Date: Fri, 20 Mar 2026 09:26:54 +0000
In-Reply-To: <d01181ac-b115-4d87-9902-e7dd5b888341@bootlin.com>
References: <20260319132904.1308436-1-joaomarcos.costa@bootlin.com>
	 <DH6XX5V3YO6B.2PRKV55NZP37I@bootlin.com>
	 <78bcbd97-e691-4381-9312-bae0fe0ebf73@bootlin.com>
	 <DH6YQYC6H8Z2.2B8KJW0XH6SI@bootlin.com>
	 <d01181ac-b115-4d87-9902-e7dd5b888341@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233592

On Fri, 2026-03-20 at 10:16 +0100, Joao Marcos Costa via lists.openembedded=
.org wrote:
> Hello,
>=20
> On 3/19/26 19:17, Mathieu Dubois-Briand wrote:
> > On Thu Mar 19, 2026 at 6:55 PM CET, Joao Marcos Costa wrote:
> > > Hello,
> > >=20
> > > On 3/19/26 18:38, Mathieu Dubois-Briand wrote:
> > > > On Thu Mar 19, 2026 at 2:29 PM CET, Joao Marcos Costa via lists.ope=
nembedded.org wrote:
> > > > > If this was originally intended to be an actual warning, it was n=
ot
> > > > > behaving as such: echo only prints to log.do_patch, so the messag=
e ends
> > > > > up hidden there.
> > > > >=20
> > > > > Replace 'echo' by bbwarn to display the warning message correctly=
.
> > > > >=20
> > > > > Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.c=
om>
> > > > > ---
> > > >=20
> (...)>>>
> > > Yep, it will. Would an INFO/NOTE be acceptable instead?
> > >=20
> > > Thanks!
> >=20
> > Yes, I believe info or note are acceptable.
> >=20
> > Thanks,
> > Mathieu
>=20
> I sent a v2 to fix that.
>=20
> One more thing, though: this same function uses an 'rm -rfv' and the=20
> "-f" option will not raise an error if the file is not there.
>=20
> Do you think this should be addressed? I would send this in a different=
=20
> patch, of course.

Tasks need to be idempotent, we can run then multiple times with the
same result. I didn't check where this is being called but the -f is
probably fine.

Cheers,

Richard

