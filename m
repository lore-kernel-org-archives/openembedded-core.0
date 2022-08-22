Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67FEC28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 07:45:43 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web09.15549.1661154338127929267
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 00:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IjIbyt0N;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id m5so3431424lfj.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 00:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=EHOEO020t1UmM8ROREXqdFVxlKFKGSb9yN3iggH475U=;
        b=IjIbyt0NH2JQ7h+OMbAtYm6XU807zAIXzs22zzb/w1Ly83JYJky+P/kAaiE3GEgQ7Q
         232QxAgjV3ZDHC1bJDA0wr3kb0/SUlh6JCSHbx4Cjezbwd+AaFGc5Dt6d9IGP1vRVr0t
         +8bLj4RZmEQcOrfMAkaeEuTCdBnLyA7qCbNVOfAFpWo3mS6sTk8ABiTeSeNfgXH2ZiPj
         SkKsLblPT6T9J87w/ba5nhtRKDywkUI/0zf90jdlZF8v/Ft/nQB7DMuvs9OnrpIqqGxO
         yZ+pBikKrHmzlzxPoUUCynBLt7FG01zQ2QfUvFtAD5prYzBLiOs52Egp5cL0o5u0bQ0E
         gMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=EHOEO020t1UmM8ROREXqdFVxlKFKGSb9yN3iggH475U=;
        b=4jUPMtaROXecugoyEwYLuwl4DcKKhN43Pk0seFpA6g1b6wQgZXh1DvMDOZHk0ucngv
         NK8OpVDSMKAbt/Da5Hgn/tL3W9IN6umCVi+O1va2Q4uDu/6mTVaMmF8deKYuskDEtjeB
         sX41i56ScW2TYnY321iiy0A2BU5oFZrAn/VG4kQI9klZepw9eFP5uRRFOLF8a9oznSci
         tCPfXA1fZhVxxcS/9kxQ3hb9xOw5HqBvCKMq2MAvPMqit6q1Gnh1W4f5IZGzooubPzTJ
         7iYhyXHnxztbRB+7CpPL4iacfQN9C2tTTZoejQfESxtolDy4s/e/WN1Vy98H8r/+N2VF
         o59A==
X-Gm-Message-State: ACgBeo2+CPIla/nV0LFqD5m91K7ggLfbCqvILB/M7XxZc/YnQWrPc6Am
	xd0Hzt/1qPCpDm9Mw1NnDCQ8+ahomr/s9+goRzQ=
X-Google-Smtp-Source: 
 AA6agR6aJlv5QEgitQoV8NtJJnlhCwq6LtMnXw3LmiqVIx064oM2tybEoRik/b0ya3hCxe00FlYlFE5SV+DUdiC9bwg=
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr6508577lfa.380.1661154336276; Mon, 22
 Aug 2022 00:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220817131023.4093773-1-alex@linutronix.de>
 <20220817131023.4093773-4-alex@linutronix.de>
 <a77db410-7158-d873-0817-cc158560a1cf@balister.org>
In-Reply-To: <a77db410-7158-d873-0817-cc158560a1cf@balister.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Aug 2022 09:45:24 +0200
Message-ID: 
 <CANNYZj8nL5rMTvk2Krnf7f14aoNYc5CHvSxwTjMFQDwsg0y6jw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] scripts/oe-setup-layers: add a script that
 restores the layer configuration from a json file
To: Philip Balister <philip@balister.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 07:45:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169661

On Mon, 22 Aug 2022 at 00:04, Philip Balister <philip@balister.org> wrote:
>
> On 8/17/22 09:10, Alexander Kanavin wrote:
> > This script can be used directly from poky, or can be copied directly into a
>
> Does this work if you are not using poky?

Yes. It's a case of 'poky chauvinism' on my part. I'll edit the commit
messages to reassure everyone :)
https://en.wikipedia.org/wiki/Carbon_chauvinism

Alex

