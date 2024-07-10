Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE646C3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 20:06:09 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.4626.1720641962997867464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 13:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NHQQoeCn;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ee910d6aaeso1454311fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 13:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720641961; x=1721246761; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76QxUdAKVLo/dz+zWlA0ilm2LGvH1m+yykntams+QFE=;
        b=NHQQoeCnGyScmtIfLmkhNrAvx6KjKeJ66M2erivM+TZYebz9Ew8YyGIVV2rlQYsNme
         q2Z7ePQ0xANjmtG6jnbRfphF+rFjNNgjZk+vV0VR8Qi++EEH/g93jifIPn4exeQTM8rv
         4C2QytYhZX1J5KJZVu2LPDGkJBtbtvvTrlI6vN8mkuz2CZnk1TaCbn5BSO6MFCzvTpVD
         +Xjh4bPrwNu24uEDGwAmJIgUvJGjhH4oNuy2Hu+k0wnbKbM3EG3C4gACMd/CXxghWw4r
         S+gSi+9LVtw/E13wQEDw69g/8jrovN01Ef9cQZaWRAoyKWtCdrao9yn0z6DWXx/XpQjZ
         cJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720641961; x=1721246761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76QxUdAKVLo/dz+zWlA0ilm2LGvH1m+yykntams+QFE=;
        b=KKlzTpCTYBU2eWbFpzhj/v6PRMwhNbhCU//PqY8UQMKukbL0E5HaJoLwMu/E5ddJz6
         J8RzozIGeMoqJiW6rJC7MJX1oRKZyez6k7lhOMNQdXfuPfZE7M/TJi05AU4VpcmlAjB7
         YpwWw2Mjeav7ew1vlXCWpK2ynAH8LdL5MmaxXmuC+LRw77FDEAlPqyI4Jg7tHCNorjd2
         eIBKemqJ8uuBpOwJ3M1RsYrgy6GMfQ8xhiKh5MNmXff/MrEnoHt3yq1M57y8Stu51CyQ
         6dxW0PXM0zWM/f+MTvxDkUi4gurTpp9YZEbgAyDTwlBQ/JcktXkQFogSzlSRwEjajJKu
         yVIA==
X-Gm-Message-State: AOJu0YxyrzldMaJJpVQje96ZQpC5rl3Uz+lqoIxVjOIZ70XyeqJhuzF/
	7+YVztqYB8x9brHgTSBWSCiVrukY8NhVXjtffuTKOaeiW6Y0fKeYqLTiAU1oKqK4js8K3ndfUhG
	Gu8/zoYyZ/jkziyTtOLVeOGo0rBw=
X-Google-Smtp-Source: AGHT+IEO1KtrsN/FhkFGyqFiIohiBN3C5u7Aq3iTcgr1RX5IR+JjdhtFoplrKOuY/mrLSDJpTFSMjmqSvKuLaibEOow=
X-Received: by 2002:a2e:3003:0:b0:2ee:87ef:825b with SMTP id
 38308e7fff4ca-2eeb3189e53mr41355381fa.40.1720641960807; Wed, 10 Jul 2024
 13:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <PA4PR01MB93565CBE2F447A255D0E0D7FD5DB2@PA4PR01MB9356.eurprd01.prod.exchangelabs.com>
In-Reply-To: <PA4PR01MB93565CBE2F447A255D0E0D7FD5DB2@PA4PR01MB9356.eurprd01.prod.exchangelabs.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Jul 2024 22:05:49 +0200
Message-ID: <CANNYZj8pWKGuwe4i4LrEqEC1xVdmuz+zutEV0kc0dr4kBZifHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] execute pkg_postinst_ontarget task for read
 only rootfs when read-only-rootfs-delayed-postinsts is set
To: Tobias.Gassner.ext@karlstorz.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 20:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201744

This patch needs to be sent with 'git send-email'. I think this was
requested before already?

Alex

On Wed, 10 Jul 2024 at 21:47, Gassner, Tobias.ext via
lists.openembedded.org
<Tobias.Gassner.ext=3Dkarlstorz.com@lists.openembedded.org> wrote:
>
> Hi,
>
> this patch will ensure that pkg_postinst_ontarget task is executed for re=
ad only rootfs when read-only-rootfs-delayed-postinsts is set as IMAGE_FEAT=
URES. In addition to the fix, a test in meta/lib/oeqa/selftest/cases/overla=
yfs.py testing the fix has been implemented.
>
> See https://lists.yoctoproject.org/g/poky/topic/106869018#msg13391 for th=
e discussion of this patch; this patch consits of patches 608050984c5be67f5=
06a0877fadbbe0b61575e54 and da51462765e24b186c55431b53856eebd5f6e8da in tha=
t discussion.
>
> Greetings
> -Tobias
>
>
> From ecf1d8c47ecb72c2f27464f01e932091374f4e6c Mon Sep 17 00:00:00 2001
> From: "Gassner, Tobias.ext" <tobias.gassner.ext@karlstorz.com>
> Date: Tue, 9 Jul 2024 08:34:30 +0200
> Subject: [PATCH] execute pkg_postinst_ontarget task for read only rootfs =
when
>  read-only-rootfs-delayed-postinsts is set
>
> Signed-off-by: Gassner, Tobias.ext <tobias.gassner.ext@karlstorz.com>
> ---
>  meta/lib/oe/rootfs.py                     |  4 +++
>  meta/lib/oeqa/selftest/cases/overlayfs.py | 41 ++++++++++++++++++++++-
>  2 files changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 8cd48f9450..5abce4ad7d 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -269,7 +269,11 @@ class Rootfs(object, metaclass=3DABCMeta):
>                  self.pm.remove(["run-postinsts"])
>
>          image_rorfs =3D bb.utils.contains("IMAGE_FEATURES", "read-only-r=
ootfs",
> +                                        True, False, self.d) and \
> +                      not bb.utils.contains("IMAGE_FEATURES",
> +                                        "read-only-rootfs-delayed-postin=
sts",
>                                          True, False, self.d)
> +
>          image_rorfs_force =3D self.d.getVar('FORCE_RO_REMOVE')
>
>          if image_rorfs or image_rorfs_force =3D=3D "1":
> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/se=
lftest/cases/overlayfs.py
> index e31063567b..580fbdcb9c 100644
> --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
> @@ -5,7 +5,7 @@
>  #
>
>  from oeqa.selftest.case import OESelftestTestCase
> -from oeqa.utils.commands import bitbake, runqemu
> +from oeqa.utils.commands import bitbake, runqemu, get_bb_vars
>  from oeqa.core.decorator import OETestTag
>  from oeqa.core.decorator.data import skipIfNotMachine
>
> @@ -466,6 +466,45 @@ IMAGE_INSTALL:append =3D " overlayfs-user"
>              line =3D getline_qemu(output, "Read-only file system")
>              self.assertTrue(line, msg=3Doutput)
>
> +    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific curre=
ntly")
> +    def test_postinst_on_target_for_read_only_rootfs(self):
> +        """
> +        Summary:  The purpose of this test case is to verify that post-i=
nstallation
> +                  on target scripts are executed even if using read-only=
 rootfs when
> +                  read-only-rootfs-delayed-postinsts is set
> +        Expected: The test files are created on first boot
> +        """
> +
> +        import oe.path
> +
> +        vars =3D get_bb_vars(("IMAGE_ROOTFS", "sysconfdir"), "core-image=
-minimal")
> +        sysconfdir =3D vars["sysconfdir"]
> +        self.assertIsNotNone(sysconfdir)
> +        # Need to use oe.path here as sysconfdir starts with /
> +        targettestdir =3D os.path.join(sysconfdir, "postinst-test")
> +
> +        config =3D self.get_working_config()
> +
> +        args =3D {
> +            'OVERLAYFS_INIT_OPTION': "",
> +            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': 1,
> +            'OVERLAYFS_ROOTFS_TYPE': "ext4",
> +            'OVERLAYFS_ETC_CREATE_MOUNT_DIRS': 1
> +        }
> +
> +        # read-only-rootfs is already set in get_working_config()
> +        config +=3D 'EXTRA_IMAGE_FEATURES +=3D "read-only-rootfs-delayed=
-postinsts"\n'
> +        config +=3D 'CORE_IMAGE_EXTRA_INSTALL =3D "postinst-delayed-b"\n=
'
> +
> +        self.write_config(config.format(**args))
> +
> +        res =3D bitbake('core-image-minimal')
> +
> +        with runqemu('core-image-minimal', image_fstype=3D'wic') as qemu=
:
> +            for filename in ("rootfs", "delayed-a", "delayed-b"):
> +                status, output =3D qemu.run_serial("test -f %s && echo f=
ound" % os.path.join(targettestdir, filename))
> +                self.assertIn("found", output, "%s was not present on bo=
ot" % filename)
> +
>      def get_working_config(self):
>          return """
>  # Use systemd as init manager
> --
> 2.45.2
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201739): https://lists.openembedded.org/g/openembedde=
d-core/message/201739
> Mute This Topic: https://lists.openembedded.org/mt/107118664/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

