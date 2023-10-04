Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DB0E936E3
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 20:35:30 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.5480.1696451723201702118
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 13:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iMfnviFI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4066692ad35so2096445e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 13:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696451721; x=1697056521; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mljAW11pg9fYpW0RH3JnDgn31iVykpO0PfItN06Qsog=;
        b=iMfnviFI4FPCgCIWnmRBD/PLyO6aAWDS8qy3vR6K9uDusjt/x88RsqLQoOR+Ay55Iy
         UFo4mVXYIk4wfc6dYw77ie/qLwdKiIhlJyzB95ZG3TGlU5tz8A8ou4XDS2+8n/YykCfM
         nsyyxT4gXdQrD/4BS4WvaZQutit6Nv6Q93Lkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696451721; x=1697056521;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mljAW11pg9fYpW0RH3JnDgn31iVykpO0PfItN06Qsog=;
        b=JSP0FaeZIkyePkuJYCQrZUCjCCj+3BJkmPLV+Z0Xu9QPDo+XehLvmWD01wxGRFP7AE
         RnPhdjmTEgegIkaSkGArPnG0qGU8QE2OjZPYwNeOPhtm+HdkLV5eSeuol7pNTixJ9T3R
         R6gtZEC6tsM16rHoiywtr3ml7s2oeLIMPf3PEt7eECPSleIB96HgA6uG0s9jmZ4PzpYZ
         aK3Zmahx0cvLOefNP19jXzq+jJ0t3g8+47RV5SAA7hlX5qBBlhEwQkBeCA1Zxz6BMlsw
         GlezxOT92HtsfmNQ0+DsBTa4Iie6ncrDiO3WWt2IVe/posUGyUmwT168fGqXeydOhULH
         K4pQ==
X-Gm-Message-State: AOJu0Yw0KqDlAJYyfyznJuFXWi4qKKU5rqCbyXLRdOYAqoTGzO5RJlGq
	PS5b4ZKzeVLsrM3Gq6sMyNAkNg==
X-Google-Smtp-Source: AGHT+IHs1FZHWofimDL4Tw7LUm0l/xKai9j2e7tNHCWwc+g/Bwl7999uGSkfeTYJQsEzhnqgsnqvRA==
X-Received: by 2002:a05:600c:11cf:b0:406:517f:ac79 with SMTP id b15-20020a05600c11cf00b00406517fac79mr3118254wmi.39.1696451721542;
        Wed, 04 Oct 2023 13:35:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd34:260d:44d4:25bf? ([2001:8b0:aba:5f3c:bd34:260d:44d4:25bf])
        by smtp.gmail.com with ESMTPSA id k14-20020a056000004e00b003177074f830sm17719wrx.59.2023.10.04.13.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 13:35:21 -0700 (PDT)
Message-ID: <d8836f8a7338be3a8653be54319e21133cb125d3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/5] qemurunner: Show both the login console
 log and all logging upon failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 04 Oct 2023 21:35:20 +0100
In-Reply-To: <ZR2+Of26qhx9vRnv@nuoska>
References: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
	 <20231004123823.2990916-5-richard.purdie@linuxfoundation.org>
	 <ZR1jk6AlAXCswWJw@nuoska>
	 <61c00ad09a90ebc9886e2ddee069f0817b0069e9.camel@linuxfoundation.org>
	 <ZR2+Of26qhx9vRnv@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 20:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188700

On Wed, 2023-10-04 at 22:34 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Wed, Oct 04, 2023 at 02:29:40PM +0100, Richard Purdie wrote:
> > On Wed, 2023-10-04 at 16:07 +0300, Mikko Rapeli wrote:
> > > Hi,
> > >=20
> > > Acked-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > >=20
> > > for the full series. I hope our discussion over #yocto irc channel
> > > helped resolve these and the test failures seen with master-next.
> >=20
> > Yes, thanks! It was useful to have someone to talk the issues through
> > with and much appreciated.
> >=20
> > Sadly I don't think we've found all the issues yet.
> >=20
> > On the build N-1 we have a selftest failure on debian12-ty-1:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5803/=
steps/14/logs/stdio
>=20
> Can I get from this test run stdio to the more detailed task, qemurunner =
or qemu boot logs somehow?
> Or do you have to dig into the system manually to capture them, like in t=
he example below?
>=20
> I would like to check into the detailed logs from both passing and failin=
g test runs.
> Of course kernel dmesg would need to be there so maybe after your patch t=
o the runqemu
> side at least.
>=20
> If there is a regression in kernel to the serial device detection and num=
bering,
> then we need some way to see e.g. 8250 uart/tty0/ttyAMA0 related dmesg me=
ssages.

I can't capture everything in time in each case but I did grab:

https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/e/

which is from

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7863/step=
s/21/logs/stdio

which has this threads patches applied.

I've put two sets of logs there from the same builds, one success, one
is missing the getty on one log.


I also have the logs from:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5848/step=
s/14/logs/stdio

which I've saved here:

https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/f/

noting that:=C2=A0

https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/f/qemu_boo=
t_log.20231004134427

is 3 bytes in size.

Also interestingly,=20

https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/f/qemu_boo=
t_log.20231004140326

contains:

"bootlogd: writing to console: Input/output error"

which appears to come from sysvinit:

sysvinit/3.04/sysvinit-3.04/src/bootlogd.c:

/*
 *      We got a write error on the real console. If its an EIO,
 *      somebody hung up our filedescriptor, so try to re-open it.
 */
int write_err(int pts, int realfd, char *realcons, int e)
{
        int     fd;

        if (e !=3D EIO) {
werr:
                close(pts);
                fprintf(stderr, "bootlogd: writing to console: %s\n",
                        strerror(e));
                return -1;
        }
        close(realfd);
        if ((fd =3D open_nb(realcons)) < 0)
                goto werr;

        return fd;
}

and the werr goto must be triggering. I think we've seen these for a
while but it is interesting something is closing console fds.

Cheers,

Richard

