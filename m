Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC3AC433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 14:13:49 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.6393.1665065619808113394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 07:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=yRzRVm1v;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.48,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f48.google.com with SMTP id kg6so4836089ejc.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 07:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=75S6Rp5TKtkyYFz0x5gM3PZlWIKkkmUi2cUPRsylvss=;
        b=yRzRVm1vWmpOvqagMhiHBSJqV7JCLck2rsQN9SlitKAtw4qdSokXjYDsUK83DtGek/
         lSWIkT/sG5AQ4kxpFfahU37NYJ65tzO40JDooP753xJi4KL7XR935rOXuNu3k0G+LqFR
         eo/qL2gVPDTs84qGbzzEYqPMQmDbR0Ah73yvwEfr6gYwDMfEXjTATuq/SY1nlaknfekx
         XOC69pHu48Ord//Q1ca2kg3hSuJRaqM4RSaP5v9NXBpgI2LJSfIQwnSCl8Q8LYobex/k
         yvPPC2Ql/MgHVdu9N3DEjcf0DG2jlJMg4OQqPTxFsFi4kjk6eu+rIIwTLB/5qoBYfMYL
         FrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=75S6Rp5TKtkyYFz0x5gM3PZlWIKkkmUi2cUPRsylvss=;
        b=XwEXoY/NZAYPQEdZrgLyIhI0XqSGpvKK1g0vSdvOzcCP3GM7Ncu8acyW1FnbW2b3OU
         qHhvjv0adx5e5UxGnLKaI7zGTyeror3oZBj2tc32ExtY4SE+xDpXo0ePnI96RRaaYZEU
         ucwcscwHknSivlxckZbnuHUGg8sTRzZjWgjAAlQJ4lDyJNixf5ewJi0hbz32MoOKgZrG
         v7Oo7Aq4OVajRGUafpmCflpW/iQJd79LHzzqU7XgH9JEkXYuzyFWy3EkWBBA1spTL0iR
         P8DlpCSmt7jA5ZW1tT9y4v5rfLxELoWlUF2VnIsbX+lXnZEW4UYgsTdXyOH4n/KJagUi
         YGkg==
X-Gm-Message-State: ACrzQf2uDuHHlwjFpX5MVyM1bRb3i4Fpq/H4cjquRkjkrsnF84JtFZX2
	sEcUvL6VPH7RkaZKmZKv2XFa4ba1Hu0YQjtoYjGKEg==
X-Google-Smtp-Source: 
 AMsMyM7zDdziNzMNc022CjET4Z4XEHVAgbZK3b9I0qZfJFC1t93Ac8HyJ0buEQtd4FEFRUyJpRiL3GCwAIOo7B05Qno=
X-Received: by 2002:a17:907:31c9:b0:740:ef93:2ffd with SMTP id
 xf9-20020a17090731c900b00740ef932ffdmr52054ejb.584.1665065618075; Thu, 06 Oct
 2022 07:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <1719DC05CA23710A.18826@lists.openembedded.org>
 <MAXPR01MB43275C9203484CFC733FFA929D599@MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM>
 <e54ff20f-1d75-2e28-e0a9-4ebd5b8f9ffd@bootlin.com>
In-Reply-To: <e54ff20f-1d75-2e28-e0a9-4ebd5b8f9ffd@bootlin.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 6 Oct 2022 04:13:25 -1000
Message-ID: 
 <CAOSpxdY38-w07Rf=N=6h517s9eq-PmVNJwQ2P1givcGzef9YFw@mail.gmail.com>
Subject: Re: [OE-Core][kirkstone][PATCH] qemu: Fix CVE-2021-3750 for qemu
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: virendra.thakur@kpit.com,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 14:13:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171508

On Wed, Oct 5, 2022 at 11:01 PM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Virendra
>
>
> Thanks for the patch!
>
> On 01.10.22 07:52, Virendra Thakur via lists.openembedded.org wrote:
> > Attached patch file also.
> > ------------------------------------------------------------------------
> > *From:* openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> on behalf of Virendra
> > Thakur via lists.openembedded.org
> > <virendra.thakur=kpit.com@lists.openembedded.org>
> > *Sent:* Saturday, October 1, 2022 11:20 AM
> > *To:* openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org>
> > *Cc:* steve@sakoman.com <steve@sakoman.com>
> > *Subject:* [OE-Core][kirkstone][PATCH] qemu: Fix CVE-2021-3750 for qemu
> > Caution: This email originated from outside of the KPIT. Do not click
> > links or open attachments unless you recognize the sender and know the
> > content is safe.
> >
> > Add patch to fix CVE-2021-3750
> >
> > Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc           |   3 +
> >  .../qemu/qemu/CVE-2021-3750-1.patch           |  59 +++++++
> >  .../qemu/qemu/CVE-2021-3750-2.patch           |  65 ++++++++
> >  .../qemu/qemu/CVE-2021-3750-3.patch           | 156 ++++++++++++++++++
> >  4 files changed, 283 insertions(+)
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-1.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-2.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750-3.patch
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc
> > b/meta/recipes-devtools/qemu/qemu.inc
> > index a493ac8add..816f9a7eac 100644
>
>
> Unfortunately, your patch doesn't apply. Would you mind updating it
> according to the current master branch and send it again, please?
> Thanks in advance

Hi Michael,

I don't think this is an issue for master! It was intended for
kirkstone (and I've already taken it in stable/kirkstone-nut)

Steve

