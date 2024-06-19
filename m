Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACFBC27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 15:40:44 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.24239.1718811637956246833
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 08:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JAY5HhCq;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5295e488248so7275346e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 08:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718811636; x=1719416436; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBspBhiMvKvfZu3CJVeiT2IiJiT+/N4Dad4DMgn4468=;
        b=JAY5HhCq0Y3kbE8QQQRwfkgqt7Exq60hy0/rc8+MUMlSfhavxYSSSaeQ39ceVlIc22
         tSLgQQsw4a0q+CU8S3xQOCmTdoRYiebICIL8QrHef5JvtIWr7XVxpWZUtCa98L6duCnJ
         pxJ3W0qWEVMh6pksO/itgoceVAoqkekl1viwJHJJcYeBqiX2tf00WKIJRKyzpxiNetco
         xjUQDpvm2JVHoLas8cwN/9YB7Q+IAhi1l7zdRLIx53YzPfvlk9qsr75/7cz3NzmdrHWI
         sJPHERF2kxT8cGMTuC5kuFSoHupJ1LOIpkJKTy4G20YQPNROx5jjtWDazlgPdmv+Zor2
         lXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718811636; x=1719416436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBspBhiMvKvfZu3CJVeiT2IiJiT+/N4Dad4DMgn4468=;
        b=rivXY+en7/K0dQTWDvM3+H9cK8XoYsXMVtGhzN5U3Ej31j2eWIyOuiVfMfUC69iTn1
         V9u/KJ5NKtt9cNfcEFAbHTu5d1TvTfWOLmI3w3ZdlOk8FUyqAq3JeTfv9q3MvnbX/qgF
         2rZcpySAejTgyaMKno4sBQzlLDR2kMwL4QFRnWb7WFL0A71U6IexVcD7I+EaoqODb4t+
         +5PXuHE+eEh0sr1G6HOG4a9BHr3yLxoQhtoJkux/p6clXUEt2JwozoC4cAxJBZuObcko
         8d97VMEXG5HCRyUt6rcDY3ZEO3rjSFRL60579BfmS5sCYPsISoOh0NM5UYcp6RjItH9I
         CoPg==
X-Gm-Message-State: AOJu0Yxytlp3SvIgxgr5SNB5pqwCsigE+V9uVXyDB3y03n5aApuRtmGI
	Ns8SKnTFMIVtI/+dUtgNf8WelERipgRYROKqLkfw/Ho+Ttdk4CKjY2EdPD2YJPNC1kwu0YM1qrw
	FnAHaLffHpJUrN7wjbezmlk/gSGs=
X-Google-Smtp-Source: AGHT+IEKd4WpBNtNp3xdihSdZu3oA5hPsIR4QX5/bljtovzrlBwMkSSh/OUDg5DlQ1CVQcH/dGLduySo/xTTjevyuZs=
X-Received: by 2002:a05:6512:3b29:b0:52c:8596:5976 with SMTP id
 2adb3069b0e04-52ccaa57999mr1985715e87.55.1718811635870; Wed, 19 Jun 2024
 08:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
 <20240619085957.2787700-10-alex.kanavin@gmail.com> <CANPvuRkyyjavWQn2gynunhJpXxAG42+DmKNZ6+eTyumCoUCQog@mail.gmail.com>
 <CANNYZj-ZUTSpxwpycadiwnAyWkK2SbvX7BguE5hr3ZY0Kq6XWQ@mail.gmail.com> <D479E782-0AE4-45EE-A0B7-A7277B728857@arm.com>
In-Reply-To: <D479E782-0AE4-45EE-A0B7-A7277B728857@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Jun 2024 17:40:31 +0200
Message-ID: <CANNYZj-Ynnex=dPFv+yD_pvV8VFafv5Mwmvyeik_5VCH_YqCqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/15] glslang: mark 0001-generate-glslang-pkg-config.patch
 as Inappropriate
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 15:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200918

On Wed, 19 Jun 2024 at 17:35, Ross Burton <Ross.Burton@arm.com> wrote:
> >>> +Upstream-Status: Inappropriate [independently developed patch submit=
ted at https://github.com/KhronosGroup/glslang/pull/3371]
> >>
> >>
> >> Maybe we can switch to the upstream submission. It is mostly the same =
with the exception of the -lHLSL -lSPVRemapper we have in yocto.
> >
> > We can't because it hardcodes usr/lib and usr/include. I left a
> > comment in the PR asking to fix that.
>
> I can=E2=80=99t see that comment in the PR=E2=80=A6

It's right at the bottom. Visible here as well:
https://github.com/KhronosGroup/glslang/pull/3371/files


Alex

