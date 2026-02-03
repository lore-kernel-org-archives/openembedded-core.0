Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469A5E83073
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:00:24 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13114.1770112809706934059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V76LKO6n;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8946a794e4fso60061196d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:00:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770112809; cv=none;
        d=google.com; s=arc-20240605;
        b=a6YZYwQh4KF+0D6dRa81uglV5MpFHwrSOs00DhqWlpycCCMIsS0nTCGUEfBa4tTNN1
         5zSYI9OSCLVWtHEO2mLRNzaBV8MjhMTuwJF2XxjN1G56g7aAHfh1keMco3MDuBwGK9fx
         UWjHpUUplPC/2kBZwgcBtCiXf8ebnhEfmApRA+nYdhw+DvhVgzQNB01YX8Y3WSSNJd6f
         lAlSDYk0BpJrZjaBBw31RCQJMbHgQSqu+dRtMVTiV983icCejyqGA0+8j27GeDkyyyGT
         4uj/SsRUJdhu0L3ntzcXjIEO9zx6ZFhtXMS8cBddvTwsWEW7fDd7q91C0v8/Y8JbWPKy
         6vLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+bjKS6c+i4C3gFCmrjPd9ix+At14dG2edNgssCuJ/q8=;
        fh=BzR9AKdby3nrohL98VVlIA9xjzNFlvJ3+skEQM12voo=;
        b=AgWNXFE25DiILbggtkYx7ypT/45kcKBudOXBtMMb0men4+6yN3yASvGufttkNci/bP
         w1604Vx2JkNbTYKfFumXmWiTkmBq8oylZJXS/aKJklA8ZPmYYfzDt16+4U36JJCT0YKQ
         8M5lMZ3lBb58NTD3/VW47LWK3ZYgj6R6TMmrn+kp3yC5Uqc8xVPhdvNXd2icSY/AZu6k
         WJfsuMRDeQ23OJdB/Be0IZvg/0thZtUKKVkb6pdkZmw21I48PNBYfd7B6HAqzSCxLtxY
         +sPY5r66SbSdO5/Bu5Gir9RacqdZfrCpX5VSJs5cHGL8pxo4Za8TBTBLMKyCG/cXyupI
         fjYw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770112809; x=1770717609; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bjKS6c+i4C3gFCmrjPd9ix+At14dG2edNgssCuJ/q8=;
        b=V76LKO6nqJYqTKUr46d9g9bf64884cBH50ZNdIB2OCXLuGWMM1tVbQMvDA/ctY6RRU
         m5BTf5u64yw0szf0WT0m4jwts0xGBml4MV9dHDAO9A6DkbJx4gwC3qPISXJLfHZ0COGP
         gJzzpBephvD2npMVBODKRebSOHAXQNzplvv4xNz7tW+379+6LO7wap+7WyrgM9trz497
         xtQqQEMFRohwwuCgX+OaH3GPNnD3Z7g3L7JWbGewN8OdCeYMD04Sw43o1GGq8WbYWOUY
         JH4VTtbIIRimBQNy/8Zbj/xeVjF2S68WSzGaRlSwiD6/LLo+uhwAav/pgJ7RHsOJ5p8P
         Lymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770112809; x=1770717609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+bjKS6c+i4C3gFCmrjPd9ix+At14dG2edNgssCuJ/q8=;
        b=LgFSjlIOmXMidssaoZHIlYpNCXGHCgGvavrl6MraQT4aE6nx1mTIcDMaXIgpqr6RdJ
         cmlZ1tYNHCFGZxlHILxqJtWDuY/r7OzkUu2/ZwVduAjTvAFT0gUHSzLbyn0vA+Aaj/Qh
         lH4/ZRH/xlZPgWNtTH2GakrmJnD1afM2eRyBcpFhcdQJR1JRD1q/O7XGrboectUB43wi
         NhBwygzmfj0IG2AxDE4gHkb9DthqnNcYcQ9lT2BWpUhShxP0UuRNEyuCmP7eRBx4/Xa/
         LkWtVYlFCe22wDjk90gcjaTAh+YDH3YpqxrLeLHHhC7WTYjMwUUMKQCtmwYIPeTyl2z0
         qE+Q==
X-Gm-Message-State: AOJu0YyAKGlhbv3c92wlJMwRU7nusMBIb/x5RDCHWMJuhbjtGdiSqkSM
	C3n3mbY0V+Z0meUa3otEID0SOpJlu9ddApObF31s67mYZ7V6rLiBO/mGGgn+fhCo258f3yXePue
	8fTVfJJZvi2JiZJ7ntWRZwofSvizehXM=
X-Gm-Gg: AZuq6aLbxV47DYlbCJBe0RWnoANLmXuV0o0LoKB2QaxzAgFLAX0HFTb04xHpbhhbPrH
	NqQEZ0XwWmEz5S+B4vWR4WT1KmzcLn0/Dzc4F4Tg+7O/Jl4AmZuBdCMELFyUsEJNjJwqnLxFXkC
	8ECOC4PmeGCHFuEqGoG+vkXuUaZg2pyPi1Tix5PoJSmlYFy1RMsLxl+ka4woEIf8hPt0ZPayh20
	vo4JcEEqmrO9jAF6k/kGzheuOW2Ntz2wxAaFeZZFR/gmOkX8PiC4m8+eo+YhlUFgsu7TuJABX7p
	WW9UtZQLE07CYchCuwadXRjuQLZCNQ==
X-Received: by 2002:ad4:5c45:0:b0:886:3fd2:ea78 with SMTP id
 6a1803df08f44-894ea0133e4mr196879446d6.24.1770112808416; Tue, 03 Feb 2026
 02:00:08 -0800 (PST)
MIME-Version: 1.0
References: <20260131211111.1189479-1-charles.embedded@gmail.com>
 <CANNYZj82ZMXiNpFC4tihxgmcLJEJ143Jui+1KAaAXokrj-uYXw@mail.gmail.com> <496119.1770070130858397788@lists.openembedded.org>
In-Reply-To: <496119.1770070130858397788@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 Feb 2026 10:59:57 +0100
X-Gm-Features: AZwV_QiAm5LHoW8-mU2MzYCcIIRvpj8odouigkpHG5DW4izXn6KEBWCThgAaD2M
Message-ID: <CANNYZj8xg7TQQXEHXaxq=S9qAs4jWm7p_Gbi-v+iZ0HV0f0GFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: parse QB_GRAPHICS for nographic flag
To: charles.embedded@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230424

On Mon, 2 Feb 2026 at 23:08, charles.embedded via
lists.openembedded.org
<charles.embedded=3Dgmail.com@lists.openembedded.org> wrote:
> In meta-zephyr/meta-zephyr-bsp/conf/machine/qemu-x86.conf  are defined se=
veral QEMU settings that are used to generate the .qemuboot.conf file durin=
g the image build (e.g. ${TMPDIR}/deploy/images/qemu-x86/zephyr-helloworld-=
qemu-x86-20260201174846.elf).
>
> The expectation is that, based on the resulting .qemuboot.conf, running r=
unqemu should be sufficient to boot Zephyr and see the console output in th=
e terminal (no GUI required). However, in this case QB_GRAPHICS=3D"-nograph=
ic" is ignored, and the generated QEMU invocation still selects a graphical=
 display device, so the Zephyr output does not appear on the terminal as ex=
pected. Please see the QEMU command:

> /<path-to>/usr/bin/qemu-system-i386 -nic none -object rng-random,filename=
=3D/dev/urandom,id=3Drng0 -device virtio-rng-pci,rng=3Drng0    -machine typ=
e=3Dq35 -cpu qemu32,+nx,+pae  -m 256 -serial mon:vc -serial null -device vi=
rtio-vga  -display sdl,show-cursor=3Don -nographic -machine acpi=3Doff -ker=
nel <path-to-build>/tmp/deploy/images/qemu-x86/zephyr-helloworld-qemu-x86-2=
0260201174846.elf -append '  mem=3D256M swiotlb=3D0 '
>
> So even though -nographic is present, QEMU is still invoked with -device =
virtio-vga and -display sdl, and the serial is set to mon:vc.
>
> My intent with the patch is to ensure that when QB_GRAPHICS includes -nog=
raphic, runqemu does not select a graphical display device and routes the s=
erial console to the terminal (so the Zephyr log is visible as expected).
>
> Please let me know if I'm not on the right track. Thank you!

nographic is an option that can be passed only as a command line
parameter to runqemu. It is also not the default: when you run runqemu
with no parameters, it will default to having graphical output if that
is detected to be supported (via trying 'qemu-system.. --help' and
seeing what is enabled), or no output otherwise:

        # If we have no display option, we autodetect based upon what
qemu supports. We
        # need our font setup and show-cusor below so we need to see
what qemu --help says
        # is supported so we can pass our correct config in.
        if not self.nographic and not self.sdl and not self.gtk and
not self.publicvnc and not self.egl_headless =3D=3D True:
            output =3D subprocess.check_output([self.qemu_bin,
"--help"], universal_newlines=3DTrue, env=3Dself.qemu_environ)
            if "-display gtk" in output:
                self.gtk =3D True
            elif "-display sdl" in output:
                self.sdl =3D True
            else:
                self.qemu_opt +=3D ' -display none'

Once again, it is not up to layers to force a decision where qemu
output goes. Maybe users want it in a graphical window. Maybe they
want it in a vnc server. Maybe they don't want it at all, because they
will ssh into the system. We can consider whether the above logic
makes sense, and if nographic should be the default (instead of the
above if..else block), but taking that choice altogether away from
users is not right.

Alex

