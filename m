Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC1EEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 15:23:10 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.15024.1688743388763030781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 08:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ksGigKV5;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso3252044e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 08:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688743387; x=1691335387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekpK+RHXK5kZuvpTHdPppVBXuOHkas03qb5kD/NIhis=;
        b=ksGigKV5os62vvm+88IkHFjccjAbR1tDxmwbycwyQ6GkD3ojx3JCRATVYBQUjTdIo8
         eSn5/Jz0hJv4K6LCV4+aaG3I6PzxYTd48LjEXYB4XRAFo8W1AeDt5zXmemlltfuq2og5
         VHD1krnPlHNyQRwjCsgYh3uUi2NMiK1U1ypeBfNr7eFC0J1ydBFkMmtxK19WfPPOJgGj
         +Ki11jgdtb7t+EFdDJ12DlRpnBEK3Slh3Dr9F/GXl+/L6DtRpuCDCXM46gstYcpWoeZM
         OBrd0KnaD0IjqFbVWX7Dnez/Dv9Rbq3MUb0HLqLJK/H0tCf2wkCtcxMy/4nnpVwkf88y
         ZX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688743387; x=1691335387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekpK+RHXK5kZuvpTHdPppVBXuOHkas03qb5kD/NIhis=;
        b=BNf9gy08Qt0hQcBbNtnvft+WvGPaM3RgwGgN6oIzPNjRlAYwZmyz+oaKR+ZFe6507u
         S72MSkpO6fyY6GmIV5JC64/V2rE7l9/rIvCeO7kymKQcK6Ld+8WyAVpy9nyIhPwL/Hsn
         LKy12VtZOsfP58QWAMEQnGPt3yXcF68a7ulj++k42l3eBI+tR0Oz9UsS+ZCZQq/U64Ux
         7/dDEenYFthvmToWaoQ/EL1r0M3kjI5+L1qkbac7xA8fHjBnmi+CefvU1iYVK+XXfKDb
         /aX9IuajzARa72yzjXw5TMBT1xd3eNn6kvsoX+g82Ln72RfYRke4Kr7Lk4tw7dn7lDQ8
         z1YQ==
X-Gm-Message-State: ABy/qLYSKpGLThdYRkIfJm8o3tKsGeVzWDhK986RI62/qHM+8UG6vIWE
	Ey2PfnsWe/px58wyokTzVTbMerH7j3qnC0kP0vs=
X-Google-Smtp-Source: APBJJlEn/8OLsA3gOHJW3PbUGF+JmZ1OlE91Gl20PqGZDeLqdfoufLtQm647ZicSvGyyQD2YFUZnDMZkpX4S8vOhies=
X-Received: by 2002:a05:6512:114b:b0:4f9:ec5e:d624 with SMTP id
 m11-20020a056512114b00b004f9ec5ed624mr5266810lfg.38.1688743386625; Fri, 07
 Jul 2023 08:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230707132649.3841870-1-alex@linutronix.de> <386DC5D1-AEB1-4799-94F5-C999E1DD8C10@arm.com>
In-Reply-To: <386DC5D1-AEB1-4799-94F5-C999E1DD8C10@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 7 Jul 2023 17:22:55 +0200
Message-ID: <CANNYZj9v2CsZSVnfGgGrgKagZYJG_akW4v43-gqLpw2QHwVvyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: rework ptest handling
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 15:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184014

On Fri, 7 Jul 2023 at 16:59, Ross Burton <Ross.Burton@arm.com> wrote:
> My only concern with this is that we=E2=80=99re missing the breakdown of =
tests so resulttool can=E2=80=99t report individual regressions.

Python prints at the end:

3 tests failed:
    test_cgitb test_cppext test_zipapp

Perhaps the module could be patched (no sed please :) to also print
those as FAIL: lines?

Alex

