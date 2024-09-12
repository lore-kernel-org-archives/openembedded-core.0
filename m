Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EC1EED629
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 17:22:24 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.53618.1726161738750948916
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 10:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U7s5pilk;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5365cf5de24so1589454e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 10:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726161737; x=1726766537; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mghwnWCFTrSsLHHR5dMASsGNMk5ZP6tqJGT9t6eSBns=;
        b=U7s5pilk7X/kCMtO0g+FEJeY+hIfvfXDgv09J9A+6g388StIs4GpX0GO8e6ukuqgcs
         /oBhSiRbEahRSxrE5gk7y6iaaZBgxu8n+aRq9L+hiyCTaGmhgFLwI62N6FI0jtrgJaPN
         IFyEyhzOm4G9qnt6/KqTko2eAIfJZNcVIFMBjr6BBZUJnLepvcHx/+HBZyxLhQD12ruT
         JhJdWXHPokZfCy00xFhPUYynlyaGsxOVuU1bIgSO89AIA9HTCD9Qnrn/QrUCWGoRYuU6
         ZygJH0pxI4ou2la3vpxNjHZlbhCxCrDwHho7G12pEkDnyB6VINg19cSoW4HCJzPi91u4
         9bGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726161737; x=1726766537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mghwnWCFTrSsLHHR5dMASsGNMk5ZP6tqJGT9t6eSBns=;
        b=XWvcmmAXN4Xgdm2qi6+rPsNC+kg1DlcTIkuJ2zHNLnfxZmsu7AUpjeMtjSfQhXMgk1
         IQCxQwJkdcUMWACSCnzbFDeWWvg+kVDkXofIxSy/rYDmh4DRaVXRr2Gb6SAwkaS1lPHs
         ce4L5/ab0070cpMQzfYf9iNDtOiSwnsmd95FtsJ1xFnepIHIcf2wTQLb4ipn5U7Nowyl
         RlzpO8qm98cRol4/HHsHZKbfqea3P9+DHOsQjXYQCSscB1JAKnB75Utkr3/7f1d/t08f
         IEB2zlooKPK+C5CwAYgH+TNXZE630MPDt0C8UrZDJgKpBHsRm/KbxBRaz2LHKYLuPK31
         kVVg==
X-Gm-Message-State: AOJu0YzT8XicZ8MSV8R3ug6ox8Hf/xNoQ6ptzglCzVLV23mLovDe714t
	/uXY5BmM37ZHzAkOSNkYa+edoUJOpA6moipsXzqLVzRpxH8ngkFWWFcbdq24FTVNcawfVRFUTZ8
	i0pvef0yEmuAGzZDp1JSUAGhYEBQ=
X-Google-Smtp-Source: AGHT+IG5FU6bJmJJXV6WQiSHD2DSZ6YxWB0VQkgGEurZyYRf+kDvk/3Cvki3lp8Sr1XszXd7DgaOYp+AGPz/zzxwpfs=
X-Received: by 2002:ac2:4bd0:0:b0:530:e323:b1cd with SMTP id
 2adb3069b0e04-53678fe64f6mr2558373e87.40.1726161735910; Thu, 12 Sep 2024
 10:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240912165736.1531460-1-ross.burton@arm.com> <64B7E637-6165-4267-A45E-470A16DE53C1@arm.com>
In-Reply-To: <64B7E637-6165-4267-A45E-470A16DE53C1@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Sep 2024 19:22:04 +0200
Message-ID: <CA+chaQf3yD3bLOihOAQC+wfzZpsJ5QJgOvcDiAG0YowuRobpGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: check for working user namespaces
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 17:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204452

Works as expected, the build failed :).

openembedded-core/build$ bitbake -k zlib-native
ERROR: User namespaces are not usable by BitBake, possibly due to AppArmor.
See https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-release-no=
tes/39890#unprivileged-user-namespace-restrictions
for more information.

The only issue might be that these checks are executed only once, so
if you have existing TMPDIR (where it was failing) then it will
continue failing with:

ERROR: PermissionError: [Errno 1] Operation not permitted

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/martin/work/bitbake/bin/bitbake-worker", line 278, in child
    bb.utils.disable_network(uid, gid)
  File "/home/martin/work/bitbake/lib/bb/utils.py", line 1696, in
disable_network
    with open("/proc/self/uid_map", "w") as f:
PermissionError: [Errno 1] Operation not permitted

until TMPDIR is removed and sanity re-executed.

On Thu, Sep 12, 2024 at 6:59=E2=80=AFPM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> Note that in its final form this isn=E2=80=99t had any testing on an Ubun=
tu machine, so testing would be appreciated if anyone has an Ubuntu 24.x ma=
chine (not a container, need their kernel) with apparmor enabled.
>
> Thanks,
> Ross
>
> > On 12 Sep 2024, at 17:57, Ross Burton via lists.openembedded.org <ross.=
burton=3Darm.com@lists.openembedded.org> wrote:
> >
> > If user namespaces are not available (typically because AppArmor is
> > blocking them), alert the user.
> >
> > We consider network isolation sufficiently important that this is a fat=
al
> > error, and the user will need to configure AppArmor to allow bitbake to
> > create a user namespace.
> >
> > [ YOCTO #15592 ]
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> > meta/classes-global/sanity.bbclass | 24 ++++++++++++++++++++++++
> > 1 file changed, 24 insertions(+)
> >
> > diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/s=
anity.bbclass
> > index 1d242f0f0a0..72dab0fea2b 100644
> > --- a/meta/classes-global/sanity.bbclass
> > +++ b/meta/classes-global/sanity.bbclass
> > @@ -475,6 +475,29 @@ def check_wsl(d):
> >             bb.warn("You are running bitbake under WSLv2, this works pr=
operly but you should optimize your VHDX file eventually to avoid running o=
ut of storage space")
> >     return None
> >
> > +def check_userns():
> > +    """
> > +    Check that user namespaces are functional, as they're used for net=
work isolation.
> > +    """
> > +
> > +    # There is a known failure case with AppAmrmor where the unshare()=
 call
> > +    # succeeds (at which point the uid is nobody) but writing to the u=
id_map
> > +    # fails (so the uid isn't reset back to the user's uid). We can de=
tect this.
> > +    parentuid =3D os.getuid()
> > +    pid =3D os.fork()
> > +    if not pid:
> > +        try:
> > +            bb.utils.disable_network()
> > +        except:
> > +            pass
> > +        os._exit(parentuid !=3D os.getuid())
> > +
> > +    ret =3D os.waitpid(pid, 0)[1]
> > +    if ret:
> > +        bb.fatal("User namespaces are not usable by BitBake, possibly =
due to AppArmor.\n"
> > +                 "See https://discourse.ubuntu.com/t/ubuntu-24-04-lts-=
noble-numbat-release-notes/39890#unprivileged-user-namespace-restrictions f=
or more information.")
> > +
> > +
> > # Require at least gcc version 8.0
> > #
> > # This can be fixed on CentOS-7 with devtoolset-6+
> > @@ -641,6 +664,7 @@ def check_sanity_version_change(status, d):
> >     status.addresult(check_git_version(d))
> >     status.addresult(check_perl_modules(d))
> >     status.addresult(check_wsl(d))
> > +    status.addresult(check_userns())
> >
> >     missing =3D ""
> >
> > --
> > 2.34.1
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204450): https://lists.openembedded.org/g/openembedde=
d-core/message/204450
> Mute This Topic: https://lists.openembedded.org/mt/108416977/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

