Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF221C04A68
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 17:31:45 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.5227.1659202299988004932
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jul 2022 10:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d/4SBVSa;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id bq11so6352748lfb.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jul 2022 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SFZpR/Tw6wc4PivYuZiAz6fvx68iq8SbFLowYORAWzQ=;
        b=d/4SBVSazoF5BGucgxcR7IIpbxaSob4KgbFfuBHVcBGIx8gkSvBv3L6Tdh3Wd409fn
         Cvk8S88dytFfG4r29mIrygmeTG/paKjj5kj0gCNQIU1sFQLHQkaaKtjxhuWm5HuCFC3Z
         coNNcp8xUP438cDbGXjCsve+1J/NK3w5/nKzouvpM1He6uewHivs43HGvT14Hw0g/O+q
         6IOK38gaf90f7vw8DdAEpTK6Y2RpOURwyH1Qk2t7DcvgTEY8eTU08q87kwnsobuMtdCW
         N4Fv9ATV5kpmD4KRixcfuk1tzZ1WnuYbYlAnXbvhplXflN9gCq2THAEhkO/YWRXcQ8D+
         n4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SFZpR/Tw6wc4PivYuZiAz6fvx68iq8SbFLowYORAWzQ=;
        b=f3c5tGn/IoTilxebWz4hi8aDlYuYQA/krEAdwWKpinFyME22JLQUoUUmL0kNqRgKWj
         FNHg1pRVh22wH4K1XZjYUwSFmQyxL9FL4qkkurq5p6/yWKo1SVqT+6+A39SzE31Ev0se
         uIVnEjSaaArvl0RMm4+C6vE+d4dr9Pv6Rh1CQwbqQsGliwJF2yazR08L4fsvG62rEgkA
         jHBRAPXioDmfevZoriSyHmIG7b2uelhRdQIqE/+doOycIK0mbvXvlzkcw3MgKmoQVcSo
         eqC47OhZHMrlQNiSy3O7qbHLZNTleybhUhm4roiPGxRYtQwOQ3cFpazrF68nIm74R1jy
         hoJA==
X-Gm-Message-State: ACgBeo2BnpQV3cm4I7oo9zq78TrIfg9A2lzI6SRY9dj8RXgnlIiINmKX
	IlrFBRuKgJqcI233MxFNm1/sIuWMnnLTgsMH464=
X-Google-Smtp-Source: 
 AGRyM1sFytKs4EvU4RTC851366ubYJAPmkWfXjgkMI870Gjnd/mOCYBfzYnAQ2Jlcnd8bAlsUO1IYp+FNzSLdJ1GVyc=
X-Received: by 2002:a05:6512:3403:b0:481:60ae:7ebc with SMTP id
 i3-20020a056512340300b0048160ae7ebcmr3248309lfr.358.1659202298079; Sat, 30
 Jul 2022 10:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220729141049.835733-1-alex@linutronix.de>
 <57a6142f5c2f444288e16632839dc647@axis.com>
 <CANNYZj9xE8EUR385HAy5BPcsiL8G_LPwaY9Q3GAXBp7sv45t4g@mail.gmail.com>
 <33ed623c9f5147fea346548754ec498c@axis.com>
In-Reply-To: <33ed623c9f5147fea346548754ec498c@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 30 Jul 2022 19:31:26 +0200
Message-ID: 
 <CANNYZj_v_EdD4tB_aOvEy9vneN0sgDk73Vj4uYbhiC70yQpiyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] scripts/oe-setup-builddir: make it known
 where configurations come from
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Jul 2022 17:31:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168681

On Sat, 30 Jul 2022 at 11:55, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Well, I care since all my windows happen to be 80 characters wide (and I have
> a lot of them on my 4K monitor). And since I care and most don't, keeping the
> 80 character width should hopefully not be too much of a problem. ;)

On the other hand, I have a single fullscreen terminal window (with
tabs) which offers 212 char x 53 lines of text. So that I don't need
to be irritated by other people's indentation and line breaking
preferences (or lack of care for them), and everything just fits and
is perfectly readable, always :)

Alex

