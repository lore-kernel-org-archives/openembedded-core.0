Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611A2CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 18:46:22 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53700.1781203574781957559
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 11:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Wo2/f/GH;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6605469c263so82595d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 11:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781203574; cv=none;
        d=google.com; s=arc-20240605;
        b=ZH3KH41PmFxDBcUJE2sPLmCBs00cX5+HEBmxcpqqbItn53zd4YBuwNLRVMaEmznhzy
         se+mC7mORc4jPgt4vMqRv+HYrigV7sbUVpLvCZrgXGb+otptgx3akhEYUMJR/Rytzm9p
         BRDLVy2L8GtkaVc9e9csB5jdBy36UQEte/AsDDO7kBulGShF3XpxASzyAdoz0AZzMyZ5
         z83c2g9CRI1ARzg+aEK22FtU3DoWd53ZpcxeF6uv8N4TgZLNa/a3m5K3q9PnUTHFCB0S
         KS56MryKhz1QSZyyeMCNwhPWhXxlj7O2l1o+qeC1E/DAxKFCf90LRs0xXHAqiVy9zk0f
         L4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GuvFDTgmPMlkU86OkfV+571AA4Y8b9zhizbewPTMm5k=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=ct51K6Fb8A/fn92F+kfoXRMA9hjwg3S80g9XoNpyVyR/aTiei7QD4LhhdJPzMVgels
         QkW5yUql664e5PpGec2fv2trbnRY41IohW8xXv30YsZ2vIWHkG9TfAfjBY+XOsTlrRyK
         594mH2xuDnFKhxfSSTxiiNFbLSNC60+oD+NWmlQgckUyGWsyGgCDQtcJEwUjjX4oHA75
         ZXiFh3che7+CwaySS0a4Kc2JOWzzSYTasv/cF3HexkATEPZTr24yUkI1QnQmdZVCgRj3
         dj2mqPFjOoBFXdYJ0LXKvEZ1Je/IFhVEpS6rynBhKzh+cNjDxNq13pNx3gqzBxG/OMyG
         aeSA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781203574; x=1781808374; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuvFDTgmPMlkU86OkfV+571AA4Y8b9zhizbewPTMm5k=;
        b=Wo2/f/GHEsQcykTsQT6LNcB0PGcl7DJth0OwaTnk+2kP0TRSMH3+IC3sZkf4k76fJr
         sJz8UUT+mW+VNJQPIJ26jo4iNNb0cPnDsJxQYp8rcOnyh2tK6A1mYod34fMDsdpXt7p8
         hXXDdF/MNZhI8OssQ76mO3nQM72KQXF5dsfMef9aw2m6hu1PUcLmWYcyXqdpFnToYNNH
         x+rLKdr8QsBELkHIQKGTGmjVdVMvQvvraCDcTTCpOfs+KljbCU2RHmt/TuuY6tOa3gDL
         jzWCDcOsRZa0vlkBotOdASL7PTbsIXFANXrxF9MZTzOcB12bQA1Jhpppgea6sSyYYMOt
         52IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203574; x=1781808374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GuvFDTgmPMlkU86OkfV+571AA4Y8b9zhizbewPTMm5k=;
        b=mtIbC77Hl7RlLorh5KIAc22JB00V4zfi8P+cxnoyDorYkD7KmpTrNQY/+PqBIZW9Tm
         w9bvkeWMZwjIqzjyFFQIPo4MkJw4mXPaUsV+/Ea2sKYm4OmxSl48hTzjtG2G8x3coJXa
         8pn4IFu+goh6LtUQVZZuPbyEblBjiMmjo3Vag14BAyakM2DmrENG31AxPHFSZBNF8Ga+
         unca7oJgCziizdrnALSjrVfvDqUIvYkwEwXRbwnkSATDNp/kLODgc7YhiS/wLwcEXpAa
         qud3le6Xk5eZUloYRGjYpgDFW4nTMBMqlmjsA/e1cHkgy5f+HSnEneGlELzPnqbfbkoI
         G1ew==
X-Gm-Message-State: AOJu0YxtCQ4mDsRWUy2PbDe9VybOrABQIwdVG6eiAoDQPFkT8Ys3ac7f
	otzvmYASmb9ljN2aTGKrJvL8FxMq01U0dLEdKbeW+JXIa+IaPNfcvPp7rHPwfOwv11Ya/EkuGN5
	2M5drs7zyM+6rlLxpUncT7Pid5Mug06qD85Li
X-Gm-Gg: Acq92OF8Uxmh8b+Hk98FaaZsvtfvtVbzybhp5It8c0Uyd6+KOcfgJDOwuXNn9dnYJgY
	jHeeAVx3rHnCSgidZtFOQFrYjLSksUDa9OPBy+riDk0YY6Bqtlb8TmfvFyXEdRXrXgJISBvSL92
	Zmvfl11VHdYIY8DDoOjBci+xbYi0Ayh/H6BKP7gyU4H76/QKe2T8O2MNwHK73wHOTabcyVFL2+v
	r6s53bY84WPKizRUKLmsxpDPX70iJoLJw/lQBA+++rXxlEddKsIgvwUTrsVyP45cPMXwgL9rXQS
	Ivzj0Pc5WrK6FClyoici4lv9ls9QpBYT
X-Received: by 2002:a05:690e:134a:b0:660:55a3:9b30 with SMTP id
 956f58d0204a3-662699df96cmr3235714d50.56.1781203573673; Thu, 11 Jun 2026
 11:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260609222331.1293007-1-JPEWhacker@gmail.com> <DJ5ECWT1RDTI.1242I56RX2AZ2@bootlin.com>
In-Reply-To: <DJ5ECWT1RDTI.1242I56RX2AZ2@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 11 Jun 2026 12:46:02 -0600
X-Gm-Features: AVVi8CdX8ybFsa5UF05EQfU_kLuyCXxRzWNYlFqJJZ6oc_gZ20zg8Wdw8lGivGM
Message-ID: <CAJdd5GbUXEABr1nHWnsgx32vOR+igz0rfOXW41Nbt1Vmn-QA0w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/5] Implement SPDX for deploy tasks
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 18:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238585

On Wed, Jun 10, 2026 at 7:17=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Wed Jun 10, 2026 at 12:15 AM CEST, Joshua Watt via lists.openembedded.=
org wrote:
> > The SPDX use case for file system image has been well defined since SPD=
X
> > was first implemented, however there has always been a desire to also
> > express SPDX output for other non-image deliverables (primarily, those
> > that have a do_deploy task or similar). These types of tasks cannot
> > easily use the traditional method of having a separate SPDX task that
> > runs to create their SPDX output as this causes lots of problems with
> > the way dependencies are specified. Instead, it is desirable for these
> > tasks to directly produce SPDX output that can be consumed by other
> > tasks that depend on them.
> >
> > This patch series adds support for this. Any sstate task can now be
> > added to the SPDX_DEPLOY_TASKS list and it will run a postfunc to
> > generate SPDX output that describes what is being deployed. For
> > classical do_deploy tasks, this is setup to be easy by automatically
> > capturing all the deployed output files in the SPDX data, but other
> > tasks can be added as well.
> >
> > Finally, the do_create_image_spdx task is removed and replaced with a
> > SPDX deploy postfunc using this new system. This means that any task
> > that depends on do_image_complete will automatically also get the SPDX
> > output for the image, simplifying the dependency handling.
> >
> > Joshua Watt (5):
>
> Hi Joshua,
>
> Thanks for your series. I believe we are seeing both a new error and new
> warnings because of it.
>
>
> ERROR: grub-efi-2.14-r0 do_deploy_setscene: Recipe grub-efi is trying to =
install files into a shared area when those files already exist. The files =
and the manifests listing them are:
>   /srv/pokybuild/yocto-worker/wic/build/build/tmp/deploy/spdx/3.0.1/core2=
-32/deploy/grub-efi-do_deploy-deploy.spdx.json
>     (matched in manifest-qemux86-grub-efi.deploy)
>   /srv/pokybuild/yocto-worker/wic/build/build/tmp/deploy/spdx/3.0.1/core2=
-32/by-task/grub-efi:do_deploy.spdx.json
>     (matched in manifest-qemux86-grub-efi.deploy)
>   /srv/pokybuild/yocto-worker/wic/build/build/tmp/deploy/spdx/3.0.1/core2=
-32/by-spdxid-hash/3c/3c29614c1a202bc0cc0a6f3dfd5b29235ea75ce5ee5bb0a847367=
bd8ce978004.spdx.json
>     (matched in manifest-qemux86-grub-efi.deploy)
> Please adjust the recipes so only one recipe provides a given file.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/15/builds/3852

This is caused because the grub-efi recipe changes subtly between
qemux86 and genericx86: From bitbake -S printdiff:
  Variable GRUB_IMAGE value changed from 'grub-efi-bootia32.efi' to
'bootia32.efi'
  Variable GRUB_IMAGE_PREFIX value changed from '' to 'grub-efi-

However, the recipe arch is PACKAGE_ARCH, which is the same for both
machines. I _think_ this means that grub-ef should be change to be
MACHINE_ARCH instead, since its expected(?) that it will change based
on machine and not just PACKAGE_ARCH, but I'm not sure about that.

Alternatively (or maybe in addition to), perhaps do_deploy SPDX output
should always be written to a per-machine SPDX directory instead of
using SSTATE_ARCH? This has congruence with DEPLOY_DIR_IMAGE
containing MACHINE. I think this wouldn't actually work though because
DEPLOY_DIR_IMAGE is an sstate output directory (so I think it can
change without invalidating the task), where as SPDX is writing to
SSTATE_ARCH as an sstate input directory.


>
>
> WARNING: core-image-minimal-1.0-r0 do_create_deploy_sbom: The following S=
PDX IDs were unable to be resolved:
>   http://spdxdocs.org/openembedded-alias/by-doc-hash/500473e510f927d1a990=
e932c4942f978ce9da778692ab840dec17ad0ece09a1/pigz-native/UNIHASH/build/reci=
pe
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/15/builds/3852
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/3887
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/65/builds/3874
>
> Can you have a look at the issues?
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

