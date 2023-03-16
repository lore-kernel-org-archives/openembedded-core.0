Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E10C7618A
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 08:12:16 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.7299.1678954333273683487
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 01:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gLYY0yYd;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id a32so770278ljq.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678954331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+UKbDpkyxW2nruiHO/A4TcOrNdeTvLG6GA22jx1kKM=;
        b=gLYY0yYdgfa5Fg1W0dTOdke3VAAY01ZR41dfhuYAU9LSoDAzCPfu1gD26nB7hXK/2k
         JfK2ov4M78l0Nh1/3CZc/xVb9jIZr4uboWlE08kmG+P/9ogKX9y3yv6UtwUPEEnt433S
         ws+CfaE9SNbofm5nfEULuB+hcuD6uagJk28XnQipWy4aYW0Cqs8W928NFHYOzYXCODB1
         D419I0KkDUoo+uo0k5/EdKRl2/1n+y16v20ul6/FlAseWL1z+PxeeGQnf5RKp87Kc+g9
         fbqv1CrKrwq7F4m/bjpChA7Ybyw+Fu0wvECVtYYVu/DuMkvwIfsyHKFNIRiAbbS/tvPT
         RrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678954331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+UKbDpkyxW2nruiHO/A4TcOrNdeTvLG6GA22jx1kKM=;
        b=U3HCpOCIy2QUtflRVU4AgSClwTxzlWZ/Y1Nfn03cvI0EIO1td2ZWqePBql73zV2gPE
         VkWTJRo3bKBSCWQ/beAY1Gqig9/rr1X0k09kf6muniZN20UFweHDksEuwSDFb20c4EKa
         hyarwCtb7gFZ3tM3k3TAwWk2wM2gu3yACaFkfvmGpP2YKWMEnAzAIbNnGCxmQi48aQqu
         FxS+qVc3StQ+FsrjT+9uOeA+hELBLFKbOLpjNnFs6ucFIZhKuKUwmAuMqKuqR9F9ze6l
         rZOZBOs2LD7Wkd4+RhTobmarhHEgGTnBFj6am/XI/jDwkVsjnnRTDIQQSEPu+jB9fbRY
         x6Rw==
X-Gm-Message-State: AO0yUKWGiHHYA6oyRNbhOOfpD1SRlt9F3xyk8jbla9ieFMDiAbXnD/0n
	tdZ+bYl/gSvIVl8HFR2MQVJfXkcz/GtIfNYeu/s=
X-Google-Smtp-Source: AK7set8e9MccrvZW+aaRK7/WrRIBNYJTS+G6B6M6tKoilzrjOqnBLoRcufDGEQHgMyiN2LYC1iaq+g2jGO8u1yXzx0k=
X-Received: by 2002:a2e:9113:0:b0:298:b3c7:293d with SMTP id
 m19-20020a2e9113000000b00298b3c7293dmr1049817ljg.7.1678954331215; Thu, 16 Mar
 2023 01:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230315070909.422721-1-f_l_k@t-online.de> <CANNYZj-k2EG4giH=zhXQywFhnVnpuaFtc4ngHgn8SV3w2kQhrw@mail.gmail.com>
 <LZHKRR.FOHLRDXQDV053@t-online.de> <CANNYZj_tKEA=CgQJ8QL2660VbvkXizX7+yrZ4EgaPdPnc33Siw@mail.gmail.com>
 <E8OKRR.MV94C2TWISKQ@t-online.de> <CANNYZj8QzLCeKESZxbHaaGFP0Xhd0oG00hcNz2Vru4S_m09Cng@mail.gmail.com>
 <08QKRR.0S9N8GIU94L5@t-online.de>
In-Reply-To: <08QKRR.0S9N8GIU94L5@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 Mar 2023 09:11:59 +0100
Message-ID: <CANNYZj_fMLFi=dWVzqThAVo_CwFDHnpCeZKLyGceGCiwpLvNqA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] glib: update 2.74.6 -> 2.76.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 08:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178676

On Wed, 15 Mar 2023 at 19:04, Markus Volk <f_l_k@t-online.de> wrote:
>
> Am Mi, 15. M=C3=A4r 2023 um 18:46:29 +0100 schrieb Alexander Kanavin <ale=
x.kanavin@gmail.com>:
>
> I was hoping setting VOLATILE_TMP_DIR correctly would be enough.
>
>
> I guess it will be enough to pass the test, but it won't resolve the logi=
c gap between systemd and sysvinit. Unfortunately I am quite busy for the n=
ext week but if it is planned to include glib-2.0-2.76.0 in mickledore, I c=
an check that route as it seems to be the less invasive one for now.

You can check that regardless. Patches not eligible for mickledore
will be stashed by integrators until master merge window reopens.

Alex

