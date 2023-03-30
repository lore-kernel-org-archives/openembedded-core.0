Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EA6C761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 14:42:12 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.27254.1680187330037469084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 07:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RGw4fEgH;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id y15so24817596lfa.7
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 07:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680187328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtWy/zEPtbtOY0Bcd1ehewlpOhF9KrJ3jEK0rWbqWUs=;
        b=RGw4fEgHkrSumVOeOLTWOnsg8p8KUkMFZWeu6vjeknu5OCLpyRT7Qns3gEXVPUbglP
         aB1qPP8UgduQuqIIE3Ci1vE+U0zMj9UtuAyI6ZIrQ/OzZQMQ/Xr6h0HgEVMo5W/CpEmI
         V1OMHpL9vzxMFQ+jA5uD14NOLJHtu3o5WwdFmoL6hxihgKOoCbSSbYlwgIMriIGJcPcl
         tX+9MNmEY5Of/nx6aLVn8EhAvdJmG/VmNJxk0YaPMg8DqFaqjIHua4kZW3yVV+AAOm2o
         53xh7Gwai/aSTFKLSQkDUryco7p2Os8YLPmCjOss4FWYsqheY8kXMy0DQvrxExINFL5Z
         CQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680187328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtWy/zEPtbtOY0Bcd1ehewlpOhF9KrJ3jEK0rWbqWUs=;
        b=r7tuMk6oQ8Fjyrj1qB5L2tTMAunK92LhYj+AxhoLLGgkYX2VudQe6rcLFPn9xA7Bld
         MflngIDwZyKeSuEFLuSN99BjwAY5ULlxxxTnt/tm7CoJkegzoyxMqRNFuhXJS5zd3T8j
         fSPzRB6E38Ulm97q6iDh8IwYJspec1A66WQ2ATG7CnbuVEVy0aLk4TrpBi3ARjYOYDyd
         6yD9htKCucv+2MT9Uzh72NBy2r0fAnf/Ut1SDuhGLa57TWGoCO3/lW5NwJgecz6M5AfY
         fITpWong9RRyphW9DHsjIxB3Uy5BsUWzsv0wEhIuC4//hCAqRUejFKnHSFol/92IxMSI
         f/dQ==
X-Gm-Message-State: AAQBX9eUaCYDJtTDWca3vBFveNf561j9fNgCLpnUeV+HBiiW/TAR1isT
	Os6mG+hdtMJc8bf7Evqs9znFxA7pTYUsW2vwxN0=
X-Google-Smtp-Source: AKy350Y3SlxLWudheAGJDkChAAyauODY2AixRy3SahlV8AOXJLEMScPsIDrPUOB+f5AaHRfoOFbyowHstmWag/iQHsY=
X-Received: by 2002:ac2:4a9d:0:b0:4e8:9988:f8ab with SMTP id
 l29-20020ac24a9d000000b004e89988f8abmr6967089lfp.11.1680187328055; Thu, 30
 Mar 2023 07:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230330134214.2772913-1-zboszor@gmail.com> <a25c3a41d623242edf004723dc94518228cfc1da.camel@linuxfoundation.org>
 <869f611a-1645-52b6-1f3b-e4b605f2ddd4@gmail.com> <CANNYZj9uYcBaDHgBABrnjCuH9AGTEQ8PhkxuJBm+FaTTNkwaPw@mail.gmail.com>
 <1deaad30-4816-af4d-910d-ef2242952033@gmail.com>
In-Reply-To: <1deaad30-4816-af4d-910d-ef2242952033@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Mar 2023 16:41:56 +0200
Message-ID: <CANNYZj_RSRs=e5NS4QT=BnyYasf8-PrpFjSkfhPZCPLqtwZ1+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179331

On Thu, 30 Mar 2023 at 16:31, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
> The mariadb change to use CROSSCOMPILING_EMULATOR
> instead of building mariadb-native was reverted because
> qemu is not ominpotent. The same applies to meson
> running executables via qemu. No custom wrapper would help.

Mariadb's problem was that (for a specific target) it somehow included
CPU instructions that qemu usermode doesn't support, and no one looked
into what those instructions were and why they were produced in the
first place, preferring to revert the whole thing. There are lots of
counter-examples in core where qemu usermode works fine, and has been
working that way for many years, for example gobject introspection, or
all of the scripts in ../scripts/postinst-intercepts/ which run every
time you bake an image, including update_udev_hwdb by the way that
runs target udevadm. I am not maintaining oe-devel, and I do not keep
an eye on things like that, otherwise I would've asked for further
investigation into what crashes and why.

I do not want to add complex native dependency chains when usermode
would work. It's me who's going to fix them when they break, not you.

> You seem to have omitted reading a large part in the
> commit message for the systemd change.
>
> > TODO? The new natively built systemctl binary may replace
> > the script in systemd-systemctl-native, as it supports
> > more options and works better than the script. For example,
> > the current script does not create the symlinks in
> > /etc/systemd/system for WantedBy=3D and RequiredBy=3D settings
> > and does not support systemctl set-default some.target.

This is a separate concern, and needs to be proposed as such.

Alex

