Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA8DCD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 18:53:04 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18144.1779994382869480524
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 11:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PkIUCeXT;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8b5232009a6so181172996d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 11:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779994382; cv=none;
        d=google.com; s=arc-20240605;
        b=cNDtZNEymSnvOfQ600T/BKihkhhDSqvhBiCbz1qlfOTrwXo6DVkGEMKqLlRnmNm2P5
         wikMmCBAc8B4fzqVj9gqGpDXMedeAV7qXg2eceUusxgkDvRn/o1ho8h5sRp8Uxnz7Vnr
         8M5hyAYJMLXBE5b43IQIlvPHExLkh8Erw5ewQh1H/gwZNoD45Bcwwp7O5ksTtocc8j32
         V5/4iCa2GL+1d4aRPsK3zy0eCab+JH+2JCg1/+FtSmpCkxAEIo1uofdGYjEdbipuDMnx
         L2S0bgS/Myqg5BTuHgKX5md/qPPhMKNzIjImFaPmrmWvTtClqWn8dONVyv/j/zaBDTuD
         4Aig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bWcznvHY+jsmzlGCg3/bjznQstbc78obw6j+fgNpVZY=;
        fh=mknMAB465/bsbMm77BFD2bx8Fk8ciagIJ0ZJVcHYAd4=;
        b=axOZRldS5DSd9YC5/Gw4N3snklfNdMJIjRzzw+BBsSAg1HJPdqVElpaJAJdkkViixz
         lecv1y/Nj7zkNsa3uk46GOA6wGIEJc8citybW9Tx5UoECinBlkKTrj2culVMqvvvQMQI
         PRCyCHKFTnNebrlATvDui3o0J4dq5J/caiKkKShQ2p+TneZdrL3FXWw/x8SORIbQwcuo
         qR3cnXazrOLi9ETFENkEa5Y6b09pX1Rzr4Cnpj+J43/utjxIb/1csKmYOYgjvket+YZl
         KbA0UY2E7UgIhAdqjTlG26Rk9jkaI5tOEFYcddSl2DmKUdwsacqZjLs4g4UM3ouiYCoD
         7bmA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779994382; x=1780599182; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bWcznvHY+jsmzlGCg3/bjznQstbc78obw6j+fgNpVZY=;
        b=PkIUCeXTCX6s4p4HsinFcX49bs5B4NrdJVoe+nrwaO69/F+WpVEJggoWt0st20VQO9
         w1mo2UioFDqEzMEr2t02FzbpS2iJFabgxhh8ghv84fD6lpf28lQEL8VV+sTbtFAFSLYO
         Cg6o/Gv53vOpjYmOVvCv+cCKF09p+vtBFAkDpsnP4271uhVKsENLrvCA4aeoKCYZbPp8
         PA0hEEfBqCRo5kO0378xb5AdQK5iOsAmBnLhEkIM0F0QfrmjypF2bs6JmRMHuls5bfq1
         TaFa/1nA4f8AkB4SlUwWsIQdDZWYDJe1FsZv9WtiMvT2bK3/a7c+WROMVDsw9aDDxMzc
         0iKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994382; x=1780599182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWcznvHY+jsmzlGCg3/bjznQstbc78obw6j+fgNpVZY=;
        b=bnkfZl6fAwnDpQyrVKepk383N+p2ClgfVKYG6Pa3EYwhmsbc+hYltFKakzK46i9B/B
         xcYI8AFuGxi2eEJLIZ9m4T1u+76DwOfbQIlxtbQSTo8C9jhkJ3lw81aoTZFYblL7jTIy
         ojCxkoP+3TnWgehb4dlcNpnoscGnKBliSchSHpfhoa30GUfN/88+uco9ce5fBdW9KnhE
         Zkj3U8E7Lz7BU9ugH6hWe39DnzqAcmvu/XNUn33dER8PI8ISDey/sLAxB7YfSERnzpqa
         zPMd/XGWXGsJ8kAlxWgQQQMJ0aYdfcPeFipunySe//vCE/6+5H7TeXNPiYEsYgGDc03x
         cjnQ==
X-Gm-Message-State: AOJu0YwYs33TaI1N6N+fYn8IyTfi4oAL5VqZKFbTsfhcbHJM8MqDUHLq
	yGxMZNy1m9SbeHHCfMocflj8BmIVE5LYa/ir2a3pEoF4pLmEMfiBNNLeWsEDUyRW60VUtk9/tQw
	7LgPPIXWApzA9unihT0zhxlsgqdPMAYc=
X-Gm-Gg: Acq92OEKUKb3IgUFiDqjrORaG8MhcpKAZ26XreH1Dlgdq4jPkT4uSo9FBb+98c29qky
	XRvxafIn0yrx4Oiru7uuE8uhtc1NdZQ4sngBonF3nAf4BfJ3CJfXazbZnB9t0PlYs0Hb508i7mV
	Yc9TPpgE9p2DjVTEVjg7x/LG/hDISBR+mJ/dRtaGNWS/KFtQcC370GXeYPc8gTI/YKrYgQ3bMaB
	PmQpSVr8Y/2Zws4BXJACxTi09tVhAaMFzLxjfK2bigYMJdjBDvcG5nLZ2mC3Dxv2X0awqV4oNK9
	KYf+qfyYwkag71qchQDng+TkJWelCdOrL2A2xqDoG8YIXLLgP65r
X-Received: by 2002:a05:6214:5bc3:b0:8be:17c6:cab2 with SMTP id
 6a1803df08f44-8cce20d5d02mr7046626d6.13.1779994381866; Thu, 28 May 2026
 11:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260528184427.517-1-adityags2004@gmail.com>
In-Reply-To: <20260528184427.517-1-adityags2004@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 May 2026 20:52:50 +0200
X-Gm-Features: AVHnY4J44g_JxZTY8qceRvyye2zOQNEh5PJyN9KNvE2MExHHa_D0sr_5m9brfsc
Message-ID: <CANNYZj_6N=Dmzq5nb_BFYRwzserLQJSSge_n2m8DJiO-YOchiQ@mail.gmail.com>
Subject: Re: [PATCH] gawk: backport randtest stability fix
To: Aditya GS <adityags2004@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 18:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237722

On Thu, 28 May 2026 at 20:44, Aditya GS <adityags2004@gmail.com> wrote:
> +Upstream-Status: Backport [f2250f4bc864913437619af7a9834a1c24915acd]

This still has the commit id instead of the link.

> @@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
>             file://0001-m4-readline-add-missing-includes.patch \
>             file://run-ptest \
>             "
> +SRC_URI += "file://randtest-fix.patch"

This also hasn't changed since the first version of the patch.

Did you forget to run 'git add' before 'git commit --amend' ?
(another option is to use 'git commit -a --amend' which auto-adds
everything that's already known by git)

Alex

