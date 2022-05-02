Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8A5C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 13:23:49 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.10343.1651497826550942960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 06:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JsqnILMQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id x23so6995701pff.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GwTfFbmv86/D/nZFKiOv4UGKvLw8CX6Re2ZaMOnETwI=;
        b=JsqnILMQzQAUHWpXldOxT5CAb3KTnNfP10ha9YVCgUxZmElhxzgPGaYxrAkN6L8ju8
         jx5HckkMjtKhS/MZZlxaQqr4f4vN0yu7TTjIhhYUTJK7gA8WDhKFBtQOi+Vy0gPj9Obw
         uQb4+JLb3hfzycqVUvpDdLXvAiBztpaLwt17hrw39mgJvDvvHxDm9FX1W9YEFYdQm4gr
         Tmo/UvuPeO/hO9SPCR9L74+aKtgrIxDNRSKL0kTqjerkduSd7tx38zuuRBeu9ZkKwDbz
         kk3GA/A2XYJW+tOSmtabadGCfoe0DTKl/lulImqABbv2eQvOOXuO0vp7pOoz6/jp1Mgb
         3hCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GwTfFbmv86/D/nZFKiOv4UGKvLw8CX6Re2ZaMOnETwI=;
        b=6rMQ7GXPdC1hb1PtCui9JSPTYZRWQ1KhokT9IGim09EoMpU7SgNszIfnSds5KsSP1Y
         gjvGp7vK4G1ULq2Ol4kMg1I/NLB+rBGghvHUzzMG5q4ZCRfQsin7PD8B+BgKJac5RCLh
         EvgJZgq3+USo/8HGNs5PVZNfBo+0por0abbzykfc5GsNYbRKHQGqjo/VzEEH4XlzYIGe
         THLBzxfSgbOz3FkP1ff9iLPOqRTBkizvx4ml1fsUTICAjaXRf2PYN2Zid3ytYLFsMAKR
         V8CGPYYWSSNJVpt+XJIMkKRF25Tc71ghyQROvyMzgJQQXgTJyz0U7Pz28ugVvrDNsSn5
         uoTA==
X-Gm-Message-State: AOAM5333G/e/0eedYs0BLm1Xe1xPIpJRnw8nD7kPNSPHYPVEu5go3pcw
	VITYvf6/kKJ/XQ6uXuY6K3b/q2F/H02iaIHjock=
X-Google-Smtp-Source: 
 ABdhPJwfLWdpIOZ7/kGyX8+R6KJvCYRgP1W90sfgG7kOHFVTG/3F5IXlJDhB8HyfUrfjLAHiC66EgJXf/JilE+NR7Tc=
X-Received: by 2002:a63:45:0:b0:3c2:3ed2:43c with SMTP id
 66-20020a630045000000b003c23ed2043cmr2356520pga.276.1651497825977;
 Mon, 02 May 2022 06:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220429063226.22192-1-rybczynska@gmail.com>
 <20220429063226.22192-2-rybczynska@gmail.com>
 <CANp-EDZJRbjkUwF1368YCr2k2EyHr3-ynDNNArxkVB2kqf9sXw@mail.gmail.com>
In-Reply-To: 
 <CANp-EDZJRbjkUwF1368YCr2k2EyHr3-ynDNNArxkVB2kqf9sXw@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 2 May 2022 15:23:34 +0200
Message-ID: 
 <CAApg2=T7xgAuY=NF7c7v2C17EhDfoEe2nEJBrW-M-N1c5n0X8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-update-db-native: allow an option to
 force the CVE database update
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ross Burton <ross.burton@arm.com>,
 Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: multipart/alternative; boundary="00000000000043cadc05de074db9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 13:23:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165167

--00000000000043cadc05de074db9
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 29, 2022 at 5:53 PM Ralph Siemsen <ralph.siemsen@linaro.org>
wrote:

> Hi Marta,
>
> This explains why the CVE database update seemed to happen far more
> frequently than it should. Thanks for digging into it.
>
> On Fri, Apr 29, 2022 at 2:32 AM Marta Rybczynska <rybczynska@gmail.com>
> wrote:
> >
> > Add a new variable FORCE_CVE_DB_UPDATE allowing the user to force
> > the database update, if the default update frequency is too low.
>
> Just an idea, maybe instead of a boolean, the variable could specify
> the interval, eg:
>
> # Interval between CVE database updates, in seconds.
> # Set to "0" to to force an update of the database.
> CVE_DATABASE_UPDATE_INTERVAL ?= "24*60*60"
>
>
This is a good idea, thank you Ralph, I like it. I'll be sending a v2
shortly.

Regards,
Marta

--00000000000043cadc05de074db9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 29, 2022 at 5:53 PM Ralph=
 Siemsen &lt;<a href=3D"mailto:ralph.siemsen@linaro.org">ralph.siemsen@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi Marta,<br>
<br>
This explains why the CVE database update seemed to happen far more<br>
frequently than it should. Thanks for digging into it.<br>
<br>
On Fri, Apr 29, 2022 at 2:32 AM Marta Rybczynska &lt;<a href=3D"mailto:rybc=
zynska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add a new variable FORCE_CVE_DB_UPDATE allowing the user to force<br>
&gt; the database update, if the default update frequency is too low.<br>
<br>
Just an idea, maybe instead of a boolean, the variable could specify<br>
the interval, eg:<br>
<br>
# Interval between CVE database updates, in seconds.<br>
# Set to &quot;0&quot; to to force an update of the database.<br>
CVE_DATABASE_UPDATE_INTERVAL ?=3D &quot;24*60*60&quot;<br>
<br></blockquote><div><br></div><div>This is a good idea, thank you Ralph, =
I like it. I&#39;ll be sending a v2</div><div>shortly.</div><div><br></div>=
<div>Regards,</div><div>Marta<br></div></div></div>

--00000000000043cadc05de074db9--

