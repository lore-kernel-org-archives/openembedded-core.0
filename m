Return-Path: <charles.embedded@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C5DE6E814
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 11:25:55 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14576.1770117946132347167
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 03:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gJqYbMup;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: charles.embedded@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6582e8831aeso8453905a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 03:25:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770117944; cv=none;
        d=google.com; s=arc-20240605;
        b=COsrag9Cpj8sEXWo+eqznW3gj/DparW//D+qIiTcA73K0BGPO1yMYZNY3VALJl7nmf
         HMNI+8z1i/SpaLpO73qJLCWELItJe1w6/NGTMAI5FsYCTAJDzRTBCcfeRwmgzm+iZej2
         4+qHXPAOHRtxmjynQGoE4S9EsiwYfdL4dxls3+VBCiYHZqcTzyfXPhTcVuszyOYIhE1X
         28Krt5dqJw2Lo/YP4DYvIBeTY0LSez9UPQRIjtjMJuvbUcNqX6si5w8E8Eod2bKpJjxB
         8m2hezBTAn+cGj2Gg0XYl04T4oJriVuAKrGAAtOM7MkKhWHB83T01N6yHhcS96xZT4cS
         mn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gWJBftaO/da//1K28Qdw7RaMskDmAnZftfaOPc6jy/o=;
        fh=toEqJZwqRVBtWFdjvbnHcK/jgjDz0NeahqiJS/bEzeo=;
        b=UNNVBpcj3RrWEZmdlpoKiCrlMFmD+FZbFN+AlF7t7pdX2B+xCZooj/N60i9LSB1Ll2
         LH7VKlrlUUFCI+ApVffaL52r9/M7XrAngeE8gecnIRu2O3gqvz4+NFB1HbCeZLlIzuFY
         7Efd5KHu/PQY5z/lxjy2GfnIOX6rXoam9QYF2NpPodR+GkBfLALaqW5MYtzb2E4iL9Ga
         1jn/0AV2XGyuf5fLnSpto9MwODs4HkfZguJd7tK5VWAfsoj9sNFuP0hWZStdO8C1KTWA
         ytCFpSUKmAysZhsub6r8Po78DWO6Rr3fo367Ou+5r9kxSmVbfpnK4zt8ntmxiJVFPD86
         MxBg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770117944; x=1770722744; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWJBftaO/da//1K28Qdw7RaMskDmAnZftfaOPc6jy/o=;
        b=gJqYbMupzBe7O3nMGImvEh8CGXlEmhz7HLQqFCZvlytOE/7HHZgdBCxzJoc3cARlHM
         JaArciNkqepFB8u7IQngiuKWenPMFoELRMVeCYBUjj8MYR7uH7IP3XbkTW90FMz9Nosd
         u0ZSYqj/8QK3UcEjT9KMJN9jj/8bK4e8rnNBB5GmutGPuFSwtVoLRqalc9c9QdTBtA/s
         K6an3UlwPxL6Qq1jnse2Qkb4RDitFWr6mktXHhYj1sNVPQpHymEH2vjexkKQw7U4RRLN
         HGsvC7mVq5Eqclbtxs+qydZPawM/xW0m2CkIhGeRujj3RAAGkzOoRrocEpQKQleAZbQ4
         n5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770117944; x=1770722744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gWJBftaO/da//1K28Qdw7RaMskDmAnZftfaOPc6jy/o=;
        b=J3ypaSJ2eniOVryqtuEbrXaATX4P7q7ltm9qpSNA2Z3CarlYlz7hhFlgCscPVH7Hii
         L47lU9HrGMb6k7ZmXNhpJLXXE8rGvVv4Ng+ClhWD7GlMqLa8ShrDMeQTn58y6Vz3KdIc
         f9+KioE2a3CG5mPZ7LzDTuhzji2x/dlZxq1AyYtoCYIq4f1VXfp8BMIyuvUJS4qSh/l6
         Bc3lD1lSPWCxS0QrnbSJGP0NZQrhdvmX8eTVurTaG6BePu1N3MxZTEdki2zc7dUCn6R2
         c00a3sLxMmPpktBBSC7XHToQFUxuLB70O5vFbI+BADkRAieP/1xlIOcxM6xIkU2aW1iK
         Bhhg==
X-Gm-Message-State: AOJu0Yzephe+g5SppjFS1l+IJiOEA31vyMRZDDhNcXxJVPRiLuwDTMJT
	LvAfx6mbvMbTG9IT5TNq5BZGxkMdqq49r10JFT+2FcbECTgDk/AC8egzqKWdN9XdXUSan+WOAG4
	TbJ5i91miVKrgMV9F0YCxqNPxzQLOTc4=
X-Gm-Gg: AZuq6aJa4nRRcwsiqnxuzBWRUBYjYUmUn33s2PSoNnl2M02ObjoanPlKSL9HCi0aGXv
	kzvXXMfKapaWLb0PKKrZcFYKLixJxqbAp1s0LtkmRxB4rwu8zs4NhQa6CYsZjbsU6A1REEhnZvy
	CZ3UJPfscG3H77Ic2QbBXOE7NWyZLG71qN4K4Zzm3s9PUGl3kBEg+mF9nHE2yH9W2Wa1bFbZS75
	QCYkNiEWiQ2Xxnlo1zCZrhSCNPi3KO06rsVC/xiO+JpQPP20V7UCr6QXu4VAb2HJ+lxMfEVfKh0
	DGX1I4T1l2YCMbfnETegSVwun3mU
X-Received: by 2002:a05:6402:f02:b0:658:11c3:4221 with SMTP id
 4fb4d7f45d1cf-658de53d01fmr6592360a12.7.1770117944216; Tue, 03 Feb 2026
 03:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20260131211111.1189479-1-charles.embedded@gmail.com>
 <CANNYZj82ZMXiNpFC4tihxgmcLJEJ143Jui+1KAaAXokrj-uYXw@mail.gmail.com>
 <496119.1770070130858397788@lists.openembedded.org> <CANNYZj8xg7TQQXEHXaxq=S9qAs4jWm7p_Gbi-v+iZ0HV0f0GFg@mail.gmail.com>
In-Reply-To: <CANNYZj8xg7TQQXEHXaxq=S9qAs4jWm7p_Gbi-v+iZ0HV0f0GFg@mail.gmail.com>
From: Charles Dias <charles.embedded@gmail.com>
Date: Tue, 3 Feb 2026 08:25:33 -0300
X-Gm-Features: AZwV_Qgcd1CVhCum8Ohy9OluWlTPbDzXKEVA4dp0WuSebvZ642cz2Xk2-I4yk28
Message-ID: <CAHua+ANnYuP9+Fhhbmcf9v+6J0MPjip3bub1hKNSoM17dw+Sqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: parse QB_GRAPHICS for nographic flag
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 11:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230451

On Tue, Feb 3, 2026 at 7:00=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> nographic is an option that can be passed only as a command line
> parameter to runqemu. It is also not the default: when you run runqemu
> with no parameters, it will default to having graphical output if that
> is detected to be supported (via trying 'qemu-system.. --help' and
> seeing what is enabled), or no output otherwise:
>
>         # If we have no display option, we autodetect based upon what
> qemu supports. We
>         # need our font setup and show-cusor below so we need to see
> what qemu --help says
>         # is supported so we can pass our correct config in.
>         if not self.nographic and not self.sdl and not self.gtk and
> not self.publicvnc and not self.egl_headless =3D=3D True:
>             output =3D subprocess.check_output([self.qemu_bin,
> "--help"], universal_newlines=3DTrue, env=3Dself.qemu_environ)
>             if "-display gtk" in output:
>                 self.gtk =3D True
>             elif "-display sdl" in output:
>                 self.sdl =3D True
>             else:
>                 self.qemu_opt +=3D ' -display none'
>
> Once again, it is not up to layers to force a decision where qemu
> output goes. Maybe users want it in a graphical window. Maybe they
> want it in a vnc server. Maybe they don't want it at all, because they
> will ssh into the system. We can consider whether the above logic
> makes sense, and if nographic should be the default (instead of the
> above if..else block), but taking that choice altogether away from
> users is not right.
>

Hi Alex,

Thanks for the clarification. I=E2=80=99ll drop this patch.

Charles Dias

