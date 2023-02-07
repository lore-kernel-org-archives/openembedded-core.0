Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0ADC636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 12:32:41 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.82003.1675773153897731563
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 04:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L0Iwx5VF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id k13so5988089wrh.8
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 04:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4sNElS/rjnhNQRmlAN8ecoFoybGs9uR2XPC7REVAFQM=;
        b=L0Iwx5VFudxWbjDgvatjO8ocpvEkPr+IcdCuMxSSfFxMOgtxSIM/VJQ9tymdqpGPwF
         i+CSNR4ApYl8t6WbaFkJkgaCB8+kjZjuz4jLKfzzzWbJTM1fPI+tZnq0ZBCUdUMJVkN/
         3FK37QXPkN/11KBOkNGhFP/FPCqAwQtLUKaKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4sNElS/rjnhNQRmlAN8ecoFoybGs9uR2XPC7REVAFQM=;
        b=YCT6AqbkwWo1E1AB8JdyeXfDq/C1Sx4TTNP62T/0QIabB+VS5akNOritNni30pLZ1h
         3+7iE417Sb3SUkNwY32NlDEP5sBZWiuXZYKwzep/aLwRdNW1Y6U5bOIYs7K6asQLoXxi
         emRALw0au10N1+otWfl3Q+1kWCu7bZYSwPHcXLR+m1e0Pwc4Uyhbej/BUXgAV12dCJD0
         bRPdRRVB9Iukkakao/wSrBRF9rhIpi7HgetoGzjmtzoLes+3VsclBkAKrjH6UZogk2UY
         rjISCzQCAtiocAO404zyaok7xur1x5V9KlkPMcT8UuQHWlHRX4F4LsbwIZih/gwh8BJ7
         KNjg==
X-Gm-Message-State: AO0yUKWkxQP71wzEzKsXyZ3hLH1K8bPDdsXGtrKK4tFvmOVVN0jYoz5c
	7TQjvu7Vk9MfthJWS382dgHHCA==
X-Google-Smtp-Source: AK7set9Lh2oBAQmgGQmvTYITV1RF1cYDEKdyyo1yAgUO+IlqPANYTX5E11rqIaJhDGwJMj3WpbCmSw==
X-Received: by 2002:adf:e706:0:b0:2bf:b27f:c9b3 with SMTP id c6-20020adfe706000000b002bfb27fc9b3mr2486509wrm.32.1675773152156;
        Tue, 07 Feb 2023 04:32:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:52fa:55ec:3791:f6b5? ([2001:8b0:aba:5f3c:52fa:55ec:3791:f6b5])
        by smtp.gmail.com with ESMTPSA id h12-20020adff4cc000000b002c3d814cc63sm10291011wrp.76.2023.02.07.04.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:32:31 -0800 (PST)
Message-ID: <9910648fe8bc6cf03ce56385c038edee6502ea57.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wic/plugins/source/bootimg-efi: Skip
 installing kernel-image into boot.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: luca.ceresoli@bootlin.com, Kareem Zarka <zarkakareem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Stefan Schmidt
	 <stefan.schmidt@huawei.com>, Kareem Zarka <kareem.zarka@huawei.com>
Date: Tue, 07 Feb 2023 12:32:31 +0000
In-Reply-To: <20230207114926.0c04b79d@booty>
References: <20230206191615.2675373-1-kareem.zarka@huawei.com>
	 <20230207114926.0c04b79d@booty>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 12:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176813

On Tue, 2023-02-07 at 11:49 +0100, Luca Ceresoli via
lists.openembedded.org wrote:
> Hello Kareem,
>=20
> thanks for your patch.
>=20
> I have a few suggestions to improve it, see below.
>=20
> On Mon,  6 Feb 2023 20:16:14 +0100
> "Kareem Zarka" <zarkakareem@gmail.com> wrote:
>=20
> > The issue with installing the kernel-image to both rootfs
> > and boot partition is that some systems rely on the kernel-image in
> > rootfs and not in the boot partition.
> > This leads to duplication of the kernel-image, which can cause
> > unnecessary storage usage and potential compatibility issues.
>=20
> Except for the use of unnecessary storage, I don't understand exactly
> what problems can be created by duplication.
>=20
> > This patch provides a solution to this problem by adding a new
> > parameter "skip-kernel-install" to the wic kickstart file, which can
> > be passed to the plugin.
> > If the parameter is provided, the plugin will skip installing the
> > kernel-image to the boot partition, avoiding duplication and potential
> > issues.
> >=20
> > By adding this new parameter, we give the users the option to install
> > the kernel-image only in rootfs, or to install it in both rootfs and
> > boot partition, depending on their needs and preferences.
> > This will help to improve the system's storage usage and compatibility.
> >=20
> > Tests for this functionality will be added in the next patch.
> >=20
> > Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
> > ---
> >  scripts/lib/wic/plugins/source/bootimg-efi.py | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/li=
b/wic/plugins/source/bootimg-efi.py
> > index 4b00913a70..363b9f5242 100644
> > --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> > +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> > @@ -363,9 +363,13 @@ class BootimgEFIPlugin(SourcePlugin):
> >                  objcopy_cmd +=3D " %s %s/EFI/Linux/linux.efi" % (efi_s=
tub, hdddir)
> >                  exec_native_cmd(objcopy_cmd, native_sysroot)
> >          else:
> > -            install_cmd =3D "install -m 0644 %s/%s %s/%s" % \
> > -                (staging_kernel_dir, kernel, hdddir, kernel)
> > -            exec_cmd(install_cmd)
> > +            # skip-kernal-install was added to source_params to conifg=
ure installing the kernel-image.
> > +            # set skip_kernal_install in the kickstart file to skip in=
stalling it into hdddir.
> > +            # if not set then the kernel-image will be installed.
>=20
> s/conifgure/configure/
> Also check underscores vs dashes.
>=20
> A comment in the code is welcome, but it should not include the history
> of why this got added. When someone will read this three years from now
> they don't care. So just remove the first line.
>=20
> > +            if not  source_params.get('skip-kernal-install'):
>=20
> s/kernal/kernel/, also on other lines.
> Also remove the unneeded double space.
>=20
> Out of personal taste, I would prefer a positive logic rather than a
> negative one, e.g.:
>=20
>     if source_params.get('install-kernel-into-boot-dir') !=3D "false":

Whilst I know what you mean, that isn't valid python and the original
code is probably more pythonic in that "XXX !=3D False" is a bit
different to "not XXX" in python.

Cheers,

Richard






