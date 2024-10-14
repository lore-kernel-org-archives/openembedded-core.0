Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F369AD16268
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 14:02:46 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.55711.1728914562510049966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 07:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HDPr+ikG;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f53973fdso861707e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 07:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728914561; x=1729519361; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9rbDX5GVmsjV8F68WQ0No/29ZEs12xxJphVrHOkwvU=;
        b=HDPr+ikGMiIAm6AkvB+uefNEdUTiDgFGI7Z65QzocnzonumQ2bAckoZl2T4uDBGPYY
         fLmyHcT24w2QFh78YIRgAsGSgsHXyEBjTy6J7yqY24GECpK5OpavYjWhXilPH04nnL9c
         4e6gfHn9ErUIoPUUxdLcD0vgmC1oHW4vtjUoKu5ioUazyeYFFnpwx7L6nUxUqcO0LuPd
         FIVHpR67DagbL/8XdJk+CBe4uw4iGsLBeSvS9H2lZgc6CIjUTCodvRIY/T9f6uPpINBk
         x4c6r53A4R2aoGP8nXZdleTndxRXvS4EBRvLeMDnA4eRCNz/QdqAQ1XBQsLS1wPvz6Pv
         qOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728914561; x=1729519361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9rbDX5GVmsjV8F68WQ0No/29ZEs12xxJphVrHOkwvU=;
        b=KtDf3QPWBXu3UqxZcnAqcL7yOED2h6B7nlVZoxqJMKkRgnjDL/JxcW6ujK2thCyz5q
         oely9exnnnPsELTpCXhyy9nmiCZwDGTt/3E520XSNStna52ifJwexu3TyyxZkq4kYJ0I
         OedhjqurcbZVDJlK/9hmUxFwPCfstpOZIWiSaJGM1Dxbfp+i3IVlMacNkhk2Uxup3nKI
         jZbuskYJT58wdRKexyFvwS4bkO0bYaeGhHeb9LCKn7rmC6HlJAep5tmbuSkSmsf/gSo9
         /jameWqkvVQ7kwJ9BY/ppjNQ7Rxl6gaWNSWrjprMh7XXD7gwN9kNJBFc4p6Oz/aYYvDt
         bQiQ==
X-Gm-Message-State: AOJu0YzIVGj6w+iOWSOtOi7X65l9LP7KggpNMlYpXVpTeVXcZJq5AwPE
	lsRMhQwG9y0Z8fn2qOI02r/g8zoBYOKRN/t4txrAljvHk1j62wpHqalAxMw7QcOZLKHmPFkRFwh
	uWY2lj1UgDRDyixtr1395Dqgv4NDTiw==
X-Google-Smtp-Source: AGHT+IEWMmf5Zg+u3FxXXUp8UNkx+xXnh8EqvXCgS2iEhoRfFVtUCxLf2ekG5XJgAULW7gtNn/lkUsLbH6Lch4cpXtg=
X-Received: by 2002:a05:6512:2344:b0:52c:dc06:d4ad with SMTP id
 2adb3069b0e04-539d6c3d1f3mr3191079e87.6.1728914560120; Mon, 14 Oct 2024
 07:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241014091117.2953622-2-ecordonnier@snap.com>
 <17FE4CD5265CA76E.4702@lists.openembedded.org> <CANNYZj8nd+27=qXYNpsrcZm-5C2RqaTt=cdAoV4tci=tW9PkaQ@mail.gmail.com>
 <CAHUKmYYcf3a3SRhwfsh3ay0jvT8CQ_Oet4YiX_KJY2KhbN6MSw@mail.gmail.com>
In-Reply-To: <CAHUKmYYcf3a3SRhwfsh3ay0jvT8CQ_Oet4YiX_KJY2KhbN6MSw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Oct 2024 16:02:28 +0200
Message-ID: <CANNYZj_=wBJKD=PQFvDEyzDGxE7Xrvv+-ZXms3VPazhPYEpynQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] makedumpfile: import 1.7.5 from meta-openembedded
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 14:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205779

Thanks, I don't have a problem with the patch, just to make it clear.

Alex

On Mon, 14 Oct 2024 at 15:54, Etienne Cordonnier <ecordonnier@snap.com> wro=
te:
>
> @Alexander Kanavin :
> - kexec has been in poky for ages, and then in December 2015 the commit y=
ou mentioned added a hard dependency to makedumpfile in the kdump script, b=
ut did not create a recipe for makedumpfile (which did not have a recipe at=
 that point).
> - A makedumpfile recipe was added in July 2016 to meta-openembedded
>
> Without makedumpfile, the script is quite useless. After a kernel panic, =
the device reboots to the capture kernel, the kdump script fails, the devic=
e reboots to the normal kernel, and /proc/vmcore is not available after the=
 reboot.
>
> =C3=89tienne
>
> On Mon, Oct 14, 2024 at 1:21=E2=80=AFPM Alexander Kanavin <alex.kanavin@g=
mail.com> wrote:
>>
>> On Mon, 14 Oct 2024 at 13:03, Alexander Kanavin via
>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
>> wrote:
>> >
>> > How was this added in the first place without bringing in this require=
d dependency?
>>
>> It was there from the start:
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.=
org_poky_commit_-3Fh-3Dmaster-2Dnext-26id-3Da444eb5951112a4900665677b3bff32=
3a8828e3f&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAh=
kbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D-GKFH-1LTTm97Sf5LaewiisHB28UD=
n40IHPACIZv8Urz1wvHWxzNq4f_v9xQTv_Z&s=3DvkBlYgnxz79yc9tJfWsFBn_Mm4sgtp7EUAb=
Tg-BH53c&e=3D
>>
>> Alex

