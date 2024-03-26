Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278CDC54E58
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 08:41:08 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.3865.1711442466969212517
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 01:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WsGChpUW;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so66209471fa.3
        for <Openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 01:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711442465; x=1712047265; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ADsAFNcb2HYkudrd4uwqDqDNZI4CbyEHsP3hV/XvUxU=;
        b=WsGChpUWYyNCZSgYmSgXpZ1ZnWyKqLH+zW9QNxA4Q+HNuAfAqmfsYc5C6YIA4kWTs2
         ea5aCsx5unUkjcB4zwXj81tjh3WyyF2XzTxQgER4xBZfrpzrkuxzeZTkjvrQCc5LUQD6
         CI3nO/sT3de1S852fz/EwGWgdBTo7FHZC/kS/qp00vhEAtmxrWPkZM8nDG8j1GDHE5B1
         mKZ3vDp6mkxoCOHcMKglfXAEzb9RSMqmMy1O6EixEhWf4VXDtoy+6v242YraFNpJboA7
         dvI1w2Z7hq0gYygGXtabYs3lIgAn0o1rfVtokNwEgBRtx2Y02HvK7CRWaSpoGUC7PiPS
         f8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711442465; x=1712047265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADsAFNcb2HYkudrd4uwqDqDNZI4CbyEHsP3hV/XvUxU=;
        b=MjQIa946MXZcRxkmnF8Uox0Vpp73yaQQGwXBFa0PxiE5RYErAd8IhobFMqiQVoRrVz
         MuNXvWRJjvxKC89FouV2lkt8+66SZVpk7l+OPC3YF54d+zgJHOz7gShbaFPA7DuxDQqc
         fkURB3/npLCgvANzmPiY3VvSBESXGckE768OUy2ju9TlmxHMX+QcDD+y0Y1JMeUX/w3l
         F2kIz90QSvmqEBK1eq1BidbIldGSDGcJO2NeEOSMpTrp6PEuCQSC6AyRvRAYHt7YTZHi
         pOBupbygGTYVHUoVd5uf8ywa84ibx3mHXkDTvlkJpgSp7op6w4GYqsw6rDVwRLzpyMMt
         o6LQ==
X-Gm-Message-State: AOJu0YyNBLMMshA+WtAuowExuEhYx6uETCMSUyhN/eqeOZ4Ga6By2em7
	ymVhXCWRpa2DHj6Ee3JOsBosU1GtM4G34zDxrZS69TH5fPqz8AJnRLPe1cXJVwy0MYdnON9IJBO
	c7GM3ZpdxAKcmUn2pRBeSKePB2LI=
X-Google-Smtp-Source: AGHT+IHOv63Ik5wyF14oKcRIAjwIY0CuRwunJZ6eXEyEjdENo7G30fTeWaEIMPIHhMsbsNZqRjBYEzCTIyzFxDkq3Bo=
X-Received: by 2002:a2e:a784:0:b0:2d6:d8a3:8c08 with SMTP id
 c4-20020a2ea784000000b002d6d8a38c08mr3752609ljf.12.1711442464798; Tue, 26 Mar
 2024 01:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <17BDA4425135504F.24786@lists.openembedded.org> <24a3eab2-30db-4ee6-accc-7f51577fcee5@gmail.com>
In-Reply-To: <24a3eab2-30db-4ee6-accc-7f51577fcee5@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Mar 2024 09:40:53 +0100
Message-ID: <CANNYZj_2GrO+Tv0T5juE+bdNTuD1R-wmWYucmAhGq71yzybQeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/overlayfs: test read-only rootfs
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Openembedded-core@lists.openembedded.org, Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 08:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197528

Feature freeze perhaps? The patch is in abelloni/master-next and will
be handled later, possibly after the release is out. It's better to
not send it during the freeze period though to avoid adding to the
backlog.

Alex

On Tue, 26 Mar 2024 at 08:47, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> Just checking if there's any feedback for the patch or something that
> stops it from being merged.
>
> Slava
>
> On 17.03.2024 20:33, Vyacheslav Yurkov via lists.openembedded.org wrote:
> > From: Baruch Siach <baruch@tkos.co.il>
> >
> > Use the read-only squashfs filesystem to test the read-only case.
> >
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > ---
> >   meta-selftest/wic/overlayfs_etc.wks.in    |  4 +--
> >   meta/lib/oeqa/selftest/cases/overlayfs.py | 34 +++++++++++++++++++----
> >   2 files changed, 30 insertions(+), 8 deletions(-)
> >
> > diff --git a/meta-selftest/wic/overlayfs_etc.wks.in b/meta-selftest/wic/overlayfs_etc.wks.in
> > index 1e1e5836e7..066cd35b15 100644
> > --- a/meta-selftest/wic/overlayfs_etc.wks.in
> > +++ b/meta-selftest/wic/overlayfs_etc.wks.in
> > @@ -1,4 +1,4 @@
> >   part /boot --active --source bootimg-biosplusefi --ondisk sda --sourceparams="loader=grub-efi" --align 1024
> > -part / --source rootfs --ondisk sda --fstype=ext4 --use-uuid --align 1024
> > +part / --source rootfs --ondisk sda --fstype=${OVERLAYFS_ROOTFS_TYPE} --use-uuid --align 1024
> >   part --ondisk sda --fstype=ext4 --size=5 --align 1024
> > -bootloader --ptable gpt --timeout=1 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0 ${OVERLAYFS_INIT_OPTION}"
> > +bootloader --ptable gpt --timeout=1 --append="rootfstype=${OVERLAYFS_ROOTFS_TYPE} console=ttyS0,115200 console=tty0 ${OVERLAYFS_INIT_OPTION}"
> > diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
> > index cd0dc60c64..e31063567b 100644
> > --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
> > +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
> > @@ -353,6 +353,7 @@ EXTRA_IMAGE_FEATURES += "read-only-rootfs"
> >   # Image configuration for overlayfs-etc
> >   OVERLAYFS_ETC_MOUNT_POINT = "/data"
> >   OVERLAYFS_ETC_DEVICE = "/dev/sda3"
> > +OVERLAYFS_ROOTFS_TYPE = "ext4"
> >   """
> >
> >           self.write_config(config)
> > @@ -367,13 +368,17 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
> >
> >       @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
> >       def test_sbin_init_preinit(self):
> > -        self.run_sbin_init(False)
> > +        self.run_sbin_init(False, "ext4")
> >
> >       @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
> >       def test_sbin_init_original(self):
> > -        self.run_sbin_init(True)
> > +        self.run_sbin_init(True, "ext4")
> >
> > -    def run_sbin_init(self, origInit):
> > +    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
> > +    def test_sbin_init_read_only(self):
> > +        self.run_sbin_init(True, "squashfs")
> > +
> > +    def run_sbin_init(self, origInit, rootfsType):
> >           """
> >           Summary:   Confirm we can replace original init and mount overlay on top of /etc
> >           Expected:  Image is created successfully and /etc is mounted as an overlay
> > @@ -384,7 +389,9 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
> >
> >           args = {
> >               'OVERLAYFS_INIT_OPTION': "" if origInit else "init=/sbin/preinit",
> > -            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': int(origInit == True)
> > +            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': int(origInit == True),
> > +            'OVERLAYFS_ROOTFS_TYPE': rootfsType,
> > +            'OVERLAYFS_ETC_CREATE_MOUNT_DIRS': int(rootfsType == "ext4")
> >           }
> >
> >           self.write_config(config.format(**args))
> > @@ -437,7 +444,9 @@ IMAGE_INSTALL:append = " overlayfs-user"
> >
> >           args = {
> >               'OVERLAYFS_INIT_OPTION': "",
> > -            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': 1
> > +            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': 1,
> > +            'OVERLAYFS_ROOTFS_TYPE': "ext4",
> > +            'OVERLAYFS_ETC_CREATE_MOUNT_DIRS': 1
> >           }
> >
> >           self.write_config(config.format(**args))
> > @@ -463,10 +472,14 @@ IMAGE_INSTALL:append = " overlayfs-user"
> >   INIT_MANAGER = "systemd"
> >
> >   # enable overlayfs in the kernel
> > -KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
> > +KERNEL_EXTRA_FEATURES:append = " \
> > +    features/overlayfs/overlayfs.scc \
> > +    cfg/fs/squashfs.scc"
> >
> >   IMAGE_FSTYPES += "wic"
> >   OVERLAYFS_INIT_OPTION = "{OVERLAYFS_INIT_OPTION}"
> > +OVERLAYFS_ROOTFS_TYPE = "{OVERLAYFS_ROOTFS_TYPE}"
> > +OVERLAYFS_ETC_CREATE_MOUNT_DIRS = "{OVERLAYFS_ETC_CREATE_MOUNT_DIRS}"
> >   WKS_FILE = "overlayfs_etc.wks.in"
> >
> >   EXTRA_IMAGE_FEATURES += "read-only-rootfs"
> > @@ -477,4 +490,13 @@ OVERLAYFS_ETC_MOUNT_POINT = "/data"
> >   OVERLAYFS_ETC_FSTYPE = "ext4"
> >   OVERLAYFS_ETC_DEVICE = "/dev/sda3"
> >   OVERLAYFS_ETC_USE_ORIG_INIT_NAME = "{OVERLAYFS_ETC_USE_ORIG_INIT_NAME}"
> > +
> > +ROOTFS_POSTPROCESS_COMMAND += "{OVERLAYFS_ROOTFS_TYPE}_rootfs"
> > +
> > +ext4_rootfs() {{
> > +}}
> > +
> > +squashfs_rootfs() {{
> > +    mkdir -p ${{IMAGE_ROOTFS}}/data
> > +}}
> >   """
> >
> >
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197527): https://lists.openembedded.org/g/openembedded-core/message/197527
> Mute This Topic: https://lists.openembedded.org/mt/104989652/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

