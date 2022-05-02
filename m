Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D288C433FE
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 19:43:58 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web10.1902.1651520629224731608
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 12:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=p4qqCUjt;
 spf=pass (domain: linaro.org, ip: 209.85.217.53,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f53.google.com with SMTP id z144so14517455vsz.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 12:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/5UAE8l1TIGhv88C7UayPUm1T5OkeQvXUOxKAN/XlgE=;
        b=p4qqCUjtcvL12HcPYtxNKUi4+23PtEMpV72GZEDijgYPzo7CqRzM6T1v9ayveqWts+
         19/FX0fEzVNDhZ2L/LyYDpjUnzYcWASIZB8MkxWjORoHYkVNrDNRV1nE868xxgxtUyRW
         2v6dj+EwluByT7bF+tpOt+H6EzRTZ6uDkMXsuthiUsMr1XuDCrrvLPfVv7tdtg6uOi5L
         IDkkm97z1acHUfh8ucTZVsJgeZ2RpHoS26RV7wvViMVO2ad+kCTOtOw1N3mxTo2uBLax
         HWR+X7jrt0iDG0yAu+pfVjg15zqpinGMZg5D85F3hRPLMnwzF/I6BiIMM//CvPMArsmt
         RHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/5UAE8l1TIGhv88C7UayPUm1T5OkeQvXUOxKAN/XlgE=;
        b=JJdjSrf3MT13yTDm+yOVduCwd6z4E2vEbkHRKgSoF8ZDikxQDdLj9l4NWSsGnsvByW
         HHdeZCiCN9dv5mZPG2N5M/yQnhFpk9o+cFqfBBHQxIejUMGSFkeVzMqfxNc3UGByk2Db
         u01VZhT62WKJBlF+unnWRDp4YMJBLY78/nH2pqwn2MiPRXvwqVGaLcd97mgb09ZnbN9H
         xURh8NrxYvOLBubdkGmIzpCDS44OLlBeUbT1bu9DLNgbTm/crJlYQZ2tvYAxmisFhEXI
         E//ExAB4+qG11uQNp78O8w9+ye/IOS1p65GMD0wT7mA4UTyNAZhfdCdnH0j1RFtY/Ery
         Ut1w==
X-Gm-Message-State: AOAM530AcXx2/N4FTst8U2Ys7yn8ObjMdPy1bcvM5gs3Qg8BZqlskam8
	kKKJ4DavC+nnXHPocSz+fiZ8C8jiztkejb/dCBnWIQ==
X-Google-Smtp-Source: 
 ABdhPJxGq6+ipQut5qSKutOo78wpK+Ok1EMkImfQ+Oq9W3dGKNH9U7v4LM/6FDqApWEHcxKSIAMwvE8B5lzZg0mldCM=
X-Received: by 2002:a05:6102:242e:b0:32c:ec29:43c0 with SMTP id
 l14-20020a056102242e00b0032cec2943c0mr3886819vsi.23.1651520628314; Mon, 02
 May 2022 12:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220429063226.22192-1-rybczynska@gmail.com>
 <20220429063226.22192-2-rybczynska@gmail.com>
 <CANp-EDZJRbjkUwF1368YCr2k2EyHr3-ynDNNArxkVB2kqf9sXw@mail.gmail.com>
 <CAApg2=T7xgAuY=NF7c7v2C17EhDfoEe2nEJBrW-M-N1c5n0X8g@mail.gmail.com>
In-Reply-To: 
 <CAApg2=T7xgAuY=NF7c7v2C17EhDfoEe2nEJBrW-M-N1c5n0X8g@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Mon, 2 May 2022 15:43:37 -0400
Message-ID: 
 <CANp-EDYtH77wc3+EPqryanGS9wU9_=NV4BqS2G94tEx6BhO=Qw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-update-db-native: allow an option to
 force the CVE database update
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ross Burton <ross.burton@arm.com>,
 Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 19:43:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165172

On Mon, May 2, 2022 at 9:23 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> On Fri, Apr 29, 2022 at 5:53 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>>
>> # Interval between CVE database updates, in seconds.
>> # Set to "0" to to force an update of the database.
>> CVE_DATABASE_UPDATE_INTERVAL ?= "24*60*60"
>>
>
> This is a good idea, thank you Ralph, I like it. I'll be sending a v2
> shortly.

Thanks for this. I've tested it locally, on the fist run, the CVE
database was fetched (it took quite a while, for some reason). On
subsequent runs, no fetch occurs, so this seems to be working.

I then set CVE_DB_UPDATE_INTERVAL = "3600" in my local.conf, and ran
the build again. As it had been over an hour since the first build,
the database was downloaded again. The timestamp on nvdcve_1.1.db did
not change (as noted in one of your commit descriptions).

So, it seems to be working correctly. I will re-test tomorrow (eg.
after 24 hours) with the interval set back to default.

One minor point of confusion is that the log still shows "NOTE: recipe
cve-update-db-native-1.0-r0: task do_fetch: Started" even when the
download is skipped. This is of course understandable when looking at
the python code, the check is within the do_fetch function. There is
probably no simple way to avoid this from being displayed. And most
users won't notice anyway. But it initially confused me about what was
happening.

Regards,
Ralph

