Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7456BC54E90
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 05:26:42 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.4328.1748150795960773593
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 22:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NT3OdPG/;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2e3dea42465so771945fac.0
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 22:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748150795; x=1748755595; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyDd6PawNp2+Wl7JpqTSHsGycp5kqsseKGg6cnWzwKo=;
        b=NT3OdPG/3lrQZpLB07TQOhOoQ+f2peZcY0T5aCY1M/hzZEg/Enr1/fYq4rQucWRysL
         Z488HNDdfgCgxrXlcVQWxPsWpiG/7e+Tz/sRQ+nxaCXBmLq/vvd3Gh2QmPGpEMDkVAyg
         OHCGYXyvuLnXAyZLC63+QJePDodhUvN2z3CLuwLLvpeMdl2Oq4bGsT5AjFqkei0m+m/S
         f/Bf5aQq6co8I9WgBHoDnmvbgqFbonmCmwHbN7rJW5xc+YzNGyeku6ptQNz7HvrW6o+T
         HMWIyEHCYC15YZo3JnRHTtYpXBnYXNITrcIGDdQTPPYk41P0FX4Gr7bocf83Wz8VGhC5
         BFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748150795; x=1748755595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyDd6PawNp2+Wl7JpqTSHsGycp5kqsseKGg6cnWzwKo=;
        b=PkcHCRXQMcVXOUjtOk6ScKzY1LJmqgPn1HN5sjVDlY42hd9RQXYpElcaI0S+qQamvW
         xY3C2Zr+zyV/9uv3ZAnDsMKySraetUT+5PO/H1qCParnWyU+QPlYuo2zUN0tOW3YpFun
         gT762FbCDASd0NQ+YXTNNSMVB4ILxKLO7gX427ZA174tuARp0i8ufIgoEyGTQCfJ+9GJ
         Y8AOhB3L7w4+ibBfA8a3V/Sbb8WAnMRmlp/BJ69UG0rBCM1RLKzS4pom2YfR8J1olBSE
         0YfrK2I9dHOq8r4OnaPzj+q9Gg9NsWklro9mGF9U635bJdh6qaJxJVp74L6IXGiRohUU
         y1+Q==
X-Gm-Message-State: AOJu0YxY/Abez1D5otSSQyGlLx3jFroenAJxMXENR1M1Vt+7VhwMyiYb
	1w7cwWGX40Qw9T3fzkd/1Ao1HWsnP/ng+QGnnTy06PRcC4dd6WOEwD5ajTeC6L6RuTgDnuFJKHn
	Ii9ULKCA68Kpz5Hn3yKQerUm4ZaOjO28=
X-Gm-Gg: ASbGncuW7p4wq07Kpnl304eUNrnD8Zw5yeCHBx6/RdlBaLiGNbAmvroxXkad1fHBjzd
	b2XebZB+hlYoDp6ocpptJPZxbAoRNkkui9jwpZtAinAbzgEQBJ21vsZrj44oMBsqq6eSnX+RoaT
	R/WElqxvvyQ5oA9dJdZ+Xaf10SECEUCe+X
X-Google-Smtp-Source: AGHT+IECyWhUeuNKMM/QzbPsP8bZeNvBVw9r/uNEEpg0altpsrS9vN4L/QNTEWKSt+m85BJOJw8KJ7+WHPBhr5dwaC4=
X-Received: by 2002:a05:6870:3d85:b0:2d4:e101:13f1 with SMTP id
 586e51a60fabf-2e860afe74amr3084288fac.13.1748150795066; Sat, 24 May 2025
 22:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250524035958.3809327-1-raj.khem@gmail.com> <CADkTA4Ok10vyyr7hPK75=vj-GF47zf_J+RW1LKM+t2dS4_LioQ@mail.gmail.com>
 <CAMKF1so7kadvSTZuS5UpV42H2ra2NakAH4ToQNxaD8QM=ohMhg@mail.gmail.com>
In-Reply-To: <CAMKF1so7kadvSTZuS5UpV42H2ra2NakAH4ToQNxaD8QM=ohMhg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 May 2025 22:26:09 -0700
X-Gm-Features: AX0GCFuJ0jYozxet6tx0jcN_n2UmZeRs-oJJ-mQ4r1KbxVyRW-mjT3LE9y1s0Z4
Message-ID: <CAMKF1sq7Q=Z7WxtbzAhcJGJCn8egeS90gZYqaemfYtFyhFD7CA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: Remove debug-kernel.scc for
 riscv32 kernels
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 05:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217240

On Fri, May 23, 2025 at 9:50=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Fri, May 23, 2025 at 9:12=E2=80=AFPM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >
> >
> >
> > On Sat, May 24, 2025 at 12:00=E2=80=AFAM Khem Raj <raj.khem@gmail.com> =
wrote:
> >>
> >> modpost fails to process the debug location lists for riscv32
> >>
> >> | ERROR: modpost: vmlinux: local symbol '__asm_copy_to_user' was expor=
ted
> >> | ERROR: modpost: vmlinux: local symbol '__asm_copy_from_user' was exp=
orted
> >> | ERROR: modpost: vmlinux: local symbol '__clear_user' was exported
> >> | ERROR: modpost: vmlinux: local symbol 'xor_regs_2_' was exported
> >> | ERROR: modpost: vmlinux: local symbol 'xor_regs_3_' was exported
> >> | ERROR: modpost: vmlinux: local symbol 'xor_regs_4_' was exported
> >> | ERROR: modpost: vmlinux: local symbol 'xor_regs_5_' was exported
> >> | WARNING: modpost: vmlinux: section mismatch in reference: 0x1560 (se=
ction: __ex_table) -> .LASF464 (section: .debug_str)
> >> | ERROR: modpost: __ex_table+0x1560 references non-executable section =
'.debug_str'
> >>
> >> poky adds features/debug/debug-kernel.scc via distro policy and hence
> >> the builds are failing for qemuriscv32 on AB. While this should be
> >> fixed in kernel build system or tools, this makes us proceed until
> >> then
> >
> > The question is .. how will we ever know to revisit this ? Can we raise=
 a bug
> > To track that this needs to be reenabled later ?
> >
>
> I plan to open a tracker on - https://bugzilla.yoctoproject.org/
> once its back online, but more importantly I am going to raise it in
> riscv kernel community once
> I have narrowed it a bit down.


Filed - https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15878

>
> > Bruce
> >
> >>
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> ---
> >>  meta/recipes-kernel/linux/linux-yocto_6.12.bb | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/reci=
pes-kernel/linux/linux-yocto_6.12.bb
> >> index fefed8c9c53..83be9fed428 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> >> @@ -72,5 +72,8 @@ KERNEL_FEATURES:append =3D " ${@bb.utils.contains("D=
ISTRO_FEATURES", "ptest", " cg
> >>  KERNEL_FEATURES:append:powerpc =3D " arch/powerpc/powerpc-debug.scc"
> >>  KERNEL_FEATURES:append:powerpc64 =3D " arch/powerpc/powerpc-debug.scc=
"
> >>  KERNEL_FEATURES:append:powerpc64le =3D " arch/powerpc/powerpc-debug.s=
cc"
> >> -
> >> +# Do not add debug info for riscv32, it fails during depmod
> >> +# ERROR: modpost: __ex_table+0x17a4 references non-executable section=
 '.debug_loclists'
> >> +# Check again during next major version upgrade
> >> +KERNEL_FEATURES:remove:riscv32 =3D "features/debug/debug-kernel.scc"
> >>  INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D "textrel"
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#217221): https://lists.openembedded.org/g/openembed=
ded-core/message/217221
> > Mute This Topic: https://lists.openembedded.org/mt/113276800/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

