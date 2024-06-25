Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3C9C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 09:02:47 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.166984.1719306158233302712
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 02:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YlG9xky/;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52cdf9f934fso2755775e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719306156; x=1719910956; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLQcjpb5xNlAkmTy7DXMfy9wKocIZUZgI1EiaXcZYvE=;
        b=YlG9xky/0JOE58lyUP24t/sVY6dy+pIBFeO0x6cUkkGMfYOjxO7peUDxydSXPC026R
         eWqKpuwAQpWOv9X5QpMPQEYm8Zom/hNq1vgCfusGS2dD6mBOuQsYNe4v1SUmOAxdg0d/
         gvj38YjLJsY3rDdd7rQWrCEvcARjcAXHSA1Hq7T/ypaLV3cp6Itr64qCPzK+m71J+9Mu
         du0zWNNN0SFTPt+oGQJyvonO3QUShZ7A9usHq+x7IospH/r2/o+EsmENriZxCevb7iWW
         imWpQ0xr6bOidPMp1yyHbZ4TufhFmg+FfWuxsASNdZv9Wg/ksh9DICZwXvmP9aqxg/1P
         KsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719306156; x=1719910956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLQcjpb5xNlAkmTy7DXMfy9wKocIZUZgI1EiaXcZYvE=;
        b=ZKDK4ULrgCxtlpOL3P27R21FkfZkxFYFPUMoLuFmxyeTGZkOsNQElwhz1R7BW2u+S/
         V7u/jCy8d1ltfLL/MI424cUM8DYO+6zIhovWIy5gqfp9+Axs/jCE3fBPvctpcIA+M8T5
         z44r2E7A9qKGwfhZXm06gn05uWtU0PYe3YXKSMEojChVUN00DS1VJvGygRRztvwC91Rj
         68wrNY12AwVfy5gMkcBUCa9DpdCnrRVrN7BPi/iRtp3R4zYPtzrq8Hzaz5ZxYurP+nak
         j0c5om7Jy5jGEFB1pgj2awo4PyUbKj2wuxt45NwnxvztXJnMfsn5fFhKwX39QnVy+CGa
         /2Bg==
X-Gm-Message-State: AOJu0YxogQjpkTOQ2yzURHNR45o7xiB/ou5Onz6nwmCKA/xASnb18fGd
	7DHdteBhrdoa3o2iedcfp8T3ObBrEy0skhgF/C2BGh5fI3kd9knRMNktbYip+jXu05MGT9Qj6I5
	P48a1xMZgHjJY9X2+VN76mXgQg4Y=
X-Google-Smtp-Source: AGHT+IG4xtBnU3PRdYqzXWzxQ3JqTX5GPYn7Xyu6uWgkG0X8S2nGrRqpYvklCG6KVbzKnteP4Sl+qPahcbVCAuMx4Dg=
X-Received: by 2002:ac2:53a8:0:b0:52c:c174:4bc3 with SMTP id
 2adb3069b0e04-52ce064ecf0mr3961770e87.35.1719306156119; Tue, 25 Jun 2024
 02:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240624203215.2470081-1-gudni.m.g@gmail.com>
In-Reply-To: <20240624203215.2470081-1-gudni.m.g@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Jun 2024 11:02:24 +0200
Message-ID: <CANNYZj-sOYcMDhuMhrqOLUw_BrHnkBbW+9=b_jRZD30FvKFYzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gobject-introspection: split tools and
 giscanner into a separate package
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 09:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201122

On Mon, 24 Jun 2024 at 22:32, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
> +FILES:${PN}-tools =3D "\
> +        ${bindir}/g-ir-annotation-tool \
> +        ${bindir}/g-ir-compiler \
> +        ${bindir}/g-ir-generate \
> +        ${bindir}/g-ir-generate \
> +        ${bindir}/g-ir-inspect \
> +        ${bindir}/g-ir-scanner \

Simply ${bindir} is enough, no need to list the tools separately (also
that is prone to becoming mismatched on version updates when upstream
changes the set).

> +RDEPENDS:${PN} =3D "python3-pickle python3-xml glib-2.0"

I guess pickle and xml modules, and glib are needed only by the tools
as well, so they should be moving to RDEPENDS:${PN}-tools too?

Alex

