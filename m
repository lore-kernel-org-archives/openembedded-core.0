Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57F7EB26EA
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 16:52:45 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24443.1770742356417660397
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 08:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Fu6ZbRG0;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48069a48629so53584165e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 08:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770742355; x=1771347155; darn=lists.openembedded.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to:cc
         :from:subject:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ey7vgRSKsVfH6h8ChZI7OMENXUi5dPgROurorEMr6F0=;
        b=Fu6ZbRG0Zv1WntBFH6Pe65mkCJP5kmfXI3rzdI7dqp6pZsqtP+3V/VuppsbevHAZ7r
         8t/sgpBWaM0iKrTnFwCBzpuzOglWDTKgT6W1iYBpj46LNWML7/hqC5R4LGgDW0P3v1hd
         BmnRLsQ7Xqvgr490ppDKxOy/CL5IZCwaY+hWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770742355; x=1771347155;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to:cc
         :from:subject:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ey7vgRSKsVfH6h8ChZI7OMENXUi5dPgROurorEMr6F0=;
        b=nx4im2DIrJiciSOac2klL9uqg0VfFe9N6GMNg2HGxyTJ9OJ6NZTxNW5YScm9b95px9
         8Ms+xOTu+TBldFiHA/1GstEUC45tpxJaFHRIVbkRFEhEgm8fM/jLIwz5hnFEu9wOMakT
         ApOAg+r1djKXeXcSEgw0j8NfMpXiNUwErwoGxnPX3BER9GrRroCtxwkZbkpme7dctEVU
         DVsP8tNLPjSToJqGV1LOxfGY2oZbZ/Wu7ere9VgciHXHdtYHNj76J+o+2GO98Ogt0xjz
         UzQngw+NNkSw1mpUdDNSdtS05GCxyNysTWiP50ykKXFZjBUiPEEla0xyme0SxLVpm8Ks
         eUnw==
X-Gm-Message-State: AOJu0Yx2yAgnC7jj4WYfY88r/NaZQyx2voX/SXX6TCCizUdR3d+pXGIG
	d9E9oVvoginqvPc7jG8YK+aQ4BDDJFRgz24gowFPTwmgSUsNKUnRrcK6SfGzntwy1m4=
X-Gm-Gg: AZuq6aIgnXlJcsKSKd9AFaQAEDcrOOlc4/BuMXkGQxmebotJ81udAFb1OLRsnIygP/e
	tGX3qRWH+Btp4Q3U8ELXk3z6Y4wokGk1FU0kwrkKz0XB2va6v5y6WksK8X1FSgUqOJYToB9upyT
	6486D7cSPsxAv5GvuOmyRnWpRnHhgewGX1cW2OzNcdePkDU0tlY6n6qVKGN35Gr0Hy1AEQFJZCh
	Dyflanxtf60+5dPuV5dqY7ufwbVfUU/6h5dKZ+uq+MHoH2KdSO7F4VFNNWp54WAcplGujKYoJme
	75GTKjFKyeFIgSf4ETfWPUi6+1GUeNN+fAVNS4nJntqxlh+IGO8RIcaqUt6WZA0c6ZwkJIkplOw
	GiWW8f+Vx7IQel8lx7StiaQOGYDGe9Hgk/im6XXubXFDzCwvWps/3BMISjH5Id/vVXOIY02MiHt
	ZP2EcFgptotGPnBP1QAeMk0Sdofab+JNURes2n7u/L82GYFSRzn1vpRxG1YI/4hHLGAQ/8Lf4Zr
	1+xXM0bwpJPJUHv
X-Received: by 2002:a05:600c:83c6:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-483507d0163mr43031705e9.4.1770742354745;
        Tue, 10 Feb 2026 08:52:34 -0800 (PST)
Received: from localhost (2a01cb001331aa00c483744cb4924df7.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:c483:744c:b492:4df7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d8df8sm77857065e9.3.2026.02.10.08.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 08:52:34 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 17:52:34 +0100
Message-Id: <DGBFRZG5PPVJ.233ED51AR1IXD@smile.fr>
Subject: Re: [OE-core] [meta][whinlatter][PATCH 02/02] linux-yocto/6.12:
 update CVE exclusions (6.12.69)
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.0
References: <20260210031722.1347242-1-bruce.ashfield@gmail.com>
 <20260210031722.1347242-2-bruce.ashfield@gmail.com>
 <DGBF2GNFHVXG.3KR6P4IC62SJI@smile.fr>
 <CADkTA4NHCS2jw=b-2LjNvdipC_O7eDX_hOA6DGcjwhx09DkOGQ@mail.gmail.com>
In-Reply-To: <CADkTA4NHCS2jw=b-2LjNvdipC_O7eDX_hOA6DGcjwhx09DkOGQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 16:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230920

On Tue Feb 10, 2026 at 5:44 PM CET, Bruce Ashfield wrote:
> On Tue, Feb 10, 2026 at 11:19=E2=80=AFAM Yoann Congal <yoann.congal@smile=
.fr> wrote:
>
>> On Tue Feb 10, 2026 at 4:17 AM CET, Bruce Ashfield via
>> lists.openembedded.org wrote:
>> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >
>> > Data pulled from: https://github.com/CVEProject/cvelistV5
>> >
>> >     1/1 [
>> >         Author: cvelistV5 Github Action
>> >         Email: github_action@example.com
>> >         Subject: 5 changes (0 new | 5 updated): - 0 new CVEs: - 5
>> updated CVEs: CVE-2025-13881, CVE-2025-14559, CVE-2025-14778,
>> CVE-2026-1486, CVE-2026-1529
>> >         Date: Tue, 10 Feb 2026 01:34:41 +0000
>> >
>> >     ]
>> >
>> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> > ---
>> >  .../linux/cve-exclusion_6.12.inc              | 13004 ++++++++++-----=
-
>> >  1 file changed, 7873 insertions(+), 5131 deletions(-)
>>
>> Hello,
>>
>> Interestingly, this patch does not show up in patchwork:
>> https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D43181
>> (this link should display the 2 patches of this series by only display
>> 01/02)
>>
>> I'll note to manually import the patch.
>>
>
>
> I stripped the cover letter from the -stable sends that I did, as it didn=
't
> add any value.
>
> Would including the 0/N cover letter help it be picked up ?

My gut feeling is that this 02/02 triggers some length/size limit. The
mail is >18k lines and >800kB.

I don't think a 0/N would change that.

I opened https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16167 to
track that.

Thanks!
--=20
Yoann Congal
Smile ECS


