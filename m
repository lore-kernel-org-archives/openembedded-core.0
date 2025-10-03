Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9AACCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 14:42:31 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.9347.1759502544990850523
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 07:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=xh5aMLOd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.42, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3588a4b1205so1382329fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 07:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1759502544; x=1760107344; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcKxBtwsQpdvx6pugoxTQZzR0u1WSiGHDxa962htYcA=;
        b=xh5aMLOdxWAK47kGi+N4qbX6n7yNEw8omlukrnGELSSEJ9mWuTCyo7E0rrgdpcBiMR
         LvAG7X23ixhCnYQmsRcWWAaO5Hi8I47KMIul7lvSQ7DRZLShTJSYRFqSKaHqpwTvKG7+
         5KQsHELVkKUCPWAzmEauhagowuqK3DgKK4UmFO9kLQkoGrdLPQVcaG+TT93IUb4Yqn/C
         9rdpUZAY09Lu6Vy+daIWfsrZBuyC4waZBt93KjYEMe3fJsdCc4BNUkVtHOk8RQCj+Obj
         C+ZXognujBv52syMDCrgOGZJOoDefDwd68k0XWGaMDuOxaiz1Gbn+P8Ip2eKteiKPHaV
         hQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759502544; x=1760107344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcKxBtwsQpdvx6pugoxTQZzR0u1WSiGHDxa962htYcA=;
        b=LnPdWz6Jyv2FN3MgBoi8J6BTVEusMbTOckLPH7L88LGeqcedDjc8t0FP/wYAmMIjte
         fOmqPywziyWnfxqJnriovzK+pGCtLOEIdGw+W9zXAPdOYC+z9PqN06JDsQGdn9w/J5ua
         scYeM6uW/Rhemddfeg0lnqdfHu4o4EFPCN17zJiUjX8Hx1bhFl6lwjsvnEW5HHpyqZG7
         Zk0ixOKsrcihECT5E8H4dvSurCmiRouafXKrhVf0GjgRefuAv/24FLZVMkfd+FiyrVQt
         t5jhYBZdJWwiAJq8SMmyGBGr7szqxVth3/lKcq1tLIG7EzjAH4XNLxYCiOSYuhbiS0RF
         YkDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV++d2esBeYn+SvLd8WBpTHe0qaeIeRhARky2TEKf5T/tBNTEeRkXcPOlc/R1zouAh4fmNPBWQ2BfkSvzg1d4lMdA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyu1r4da+Or4C8oQ6xMuB73N6uNGSCdeExEO/tezwNgnNpoTQmN
	2lvjYwPRry4Eo0M9hLuEtUV8l9RLzXMX2sNcEoiwIqgRcO92V88eXZFrSp4TiV7xpks9H2aSM68
	iyULjRqep7dXKvtlEl3lEgWDD4h6UJXCzDc5F9bec
X-Gm-Gg: ASbGncsRKcxEyIMZkBFOTSPYfehUZety9NNT9tytxdvPQSz4Z480G5q32YzhGWbpmcb
	YefidBvV7QTDGVB6gyUd2cpDK0HJ6KnCJSLwt4q0ZyirMsR7q6K9t1wBwTL0Gck+mvIO4QEXonz
	9s3/xDLv5+br9Ugwb+5EiGB0qy1TJDPPZnOIkaLZIZ4MlQY5y7PZ6gvjnx35p2DFx/2GujG7gT3
	QMxpO1VNT3s4EJnt6CsXe6AtHoHu3U=
X-Google-Smtp-Source: AGHT+IGGBkh829UQWxfsZs9CuGWBPhKuDrFqn/woIq3EhPWxGp87ICpVXCgYxc0UeACXaQ4UvEmm7dbchzBuRP//OB4=
X-Received: by 2002:a05:6871:7998:b0:344:34e3:5140 with SMTP id
 586e51a60fabf-3b1039b5ea1mr1906328fac.45.1759502544111; Fri, 03 Oct 2025
 07:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251001175702.62563-1-jon.mason@arm.com> <20251001175702.62563-2-jon.mason@arm.com>
 <5cc51968-6aeb-4b61-9724-17bf112c771f@gmail.com>
In-Reply-To: <5cc51968-6aeb-4b61-9724-17bf112c771f@gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 3 Oct 2025 10:42:13 -0400
X-Gm-Features: AS18NWA1EcljjHv6MckK-yCk4JuL8BalRycojhEa-7R50a_stxru7H7snjz79xk
Message-ID: <CAPoiz9xUzOrK_n212HTw+9d2p=qXYZnPRJdsNQMBQHt9OznDXA@mail.gmail.com>
Subject: Re: [OE-core] [RESEND PATCH 2/2] runqemu: resize rootfs image to
 power of 2 for SD or pflash
To: skandigraun@gmail.com
Cc: jon.mason@arm.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 14:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224391

On Thu, Oct 2, 2025 at 1:29=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On 10/1/25 19:57, Jon Mason via lists.openembedded.org wrote:
> > QEMU requires that SD and pflash images are sized to be a power of 2
> > (e.g., 32M, 64M, etc).  So, if the image being used is not a power of 2
> > and it's being used for SD or pflash, increase it to the next power of =
2
> > size via the truncate command.
> >
> > This might not be an actual spec requirement, and is being investigated
> > in https://gitlab.com/qemu-project/qemu/-/issues/1754
> >
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  scripts/runqemu | 24 ++++++++++++++++++++++--
> >  1 file changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/runqemu b/scripts/runqemu
> > index a8144aa68c3d..cd2ded69916a 100755
> > --- a/scripts/runqemu
> > +++ b/scripts/runqemu
> > @@ -421,7 +421,27 @@ class BaseConfig(object):
> >          else:
> >              raise RunQemuError("Unknown path arg %s" % p)
> >
> > -    def uncompress_rootfs(self):
> > +    def rootfs_fixups(self):
> > +
> > +        """Resize rootfs image if needed"""
>
> Nit: the docstring now only describes the newly added behavior, but not
> the original. The original docstring is also present, but it is now in
> the middle of the method.

Thanks for the review, I'll fix this up and send out a v2

>
> > +        qb_rootfs_opt =3D self.get('QB_ROOTFS_OPT')
> > +
> > +        # Check if sdcard size is a power of 2, as that is currently a=
 requirement for qemu
> > +        # See https://gitlab.com/qemu-project/qemu/-/issues/1754
> > +        rootfs_size =3D os.path.getsize(self.rootfs)
> > +        rootfs_size_pwr2 =3D 1 << (rootfs_size - 1).bit_length()
> > +        if ("if=3Dsd" in qb_rootfs_opt or "if=3Dpflash" in qb_rootfs_o=
pt) and rootfs_size !=3D rootfs_size_pwr2:
> > +            logger.info("Using sd-card or pflash and is not power of 2=
. File size %d, power of 2 size %d" %(rootfs_size, rootfs_size_pwr2))
> > +            logger.info("Attempting to use truncate to correct this.")
> > +
> > +            # Ensure the 'truncate' tool is installed before attemptin=
g to make a power of 2.
> > +            if not shutil.which('truncate'):
> > +                raise RunQemuError(f"'truncate' is required to make {s=
elf.rootfs} a power of 2 in size but was not found in PATH")
> > +            try:
> > +                subprocess.check_call(['truncate', '-s', str(rootfs_si=
ze_pwr2), self.rootfs])
> > +            except subprocess.CalledProcessError as e:
> > +                raise RunQemuError(f"Failed to make {self.rootfs} powe=
r of 2 in size: {e}")
> > +
> >          """Decompress ZST rootfs image if needed"""
> >          if not self.rootfs or not self.fstype.endswith('.zst'):
> >              return
> > @@ -1808,7 +1828,7 @@ def main():
> >          config.check_args()
> >          config.read_qemuboot()
> >          config.check_and_set()
> > -        config.uncompress_rootfs()
> > +        config.rootfs_fixups()
> >          # Check whether the combos is valid or not
> >          config.validate_combos()
> >          config.print_config()
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224377): https://lists.openembedded.org/g/openembedde=
d-core/message/224377
> Mute This Topic: https://lists.openembedded.org/mt/115538558/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jd=
mason@kudzu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

