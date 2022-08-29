Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7819CECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 19:20:09 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.2503.1661800805715679934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 12:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XXXBWrXR;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id p18so5710852ljc.9;
        Mon, 29 Aug 2022 12:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=cG51+Msi9m3fxHLus6Ctu/yLGsP5Ya7iXXiCpbPATiQ=;
        b=XXXBWrXRwXWyMtuSgI2GedbtMXM925nDaekLTxXT5IcMIsPThjA+wXQlx18OxbcVkC
         9YNpbY6QSepquzlJC/8/bL4Is1HzLkMUSYpV2sgGk9BTIx6qhQUKAYEhh4GrcVGalhww
         JOs6/taEfc0g/U8IcEcOcgt+Up2c6KD5CwhbyKYU6dqAWIOaOM7jXbjXCMIcU7At+MuC
         FgU54O6xAPd5FA39gkSdNesra9vEGfrAVY3xMrZKcklavhnHjBSIJe8bMj8bCIir0gDl
         /DFfbVhWwehjtf4fSkk9JyO0QukWct3e2RrwsZqtyhdKOuI/h+jnNS6E9nMObycbXcA1
         p4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=cG51+Msi9m3fxHLus6Ctu/yLGsP5Ya7iXXiCpbPATiQ=;
        b=xRe2p6lYDRYhUJbL7JEq2zorguHYpwi2j28pA9lC+AjW3v31JDyghsTMOjFcnAQUNU
         /v9R6iu62+ySD9DDH0/xz+zh+B8hgSAnNhl82wJ6n09riEDOizvXlPpzu/feC3nSDOLp
         /IaBq/Cj3inf1F1ySd5TodOHGh3F9RTkLF1kaHhQwwfQeA+krQrbdVlTfAkqOKrkKBcG
         aYSN/l4KS49x0TSv0xUsd0vR0GJ1Plvo3DPMuBhGHyPh7SgzIJdo5Lqq9KCoC1wYOwFT
         J3707eAA82OyfvIlM1Euxba/VyFHykngRrlS7Y8IByqSJ2pVQSUAwp+oepTgGcBVOHN0
         XxrQ==
X-Gm-Message-State: ACgBeo0Kar8AB2fsktIa3Y2KuoZmHPxg6ccYWU3g+5RASmhrPUfptSb/
	seO6MZ5JfQkN+Suziff/oqKnUCVS+L9iomAneE8=
X-Google-Smtp-Source: 
 AA6agR5doYeEuczoD1YR9i2QyEzehTCdGBmnPol1iBTOQVZBFYAYMDmH0+8ZyfO7c806N1Be0zh4RPvSN60FU45vYT8=
X-Received: by 2002:a2e:9e50:0:b0:261:e3fd:cdc5 with SMTP id
 g16-20020a2e9e50000000b00261e3fdcdc5mr5983681ljk.56.1661800803900; Mon, 29
 Aug 2022 12:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220825203451.2074080-1-alex@linutronix.de>
 <170EEE7825BF9D73.11791@lists.openembedded.org>
 <20220827213209.02c7bba4@booty>
 <170F511AB039C9FD.22386@lists.openembedded.org>
 <CANNYZj-bDq3VaZTu68SS7VgZ_31680f+mxcC-gGYXox42+jXqQ@mail.gmail.com>
 <20220829163806.1be6d653@booty>
In-Reply-To: <20220829163806.1be6d653@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Aug 2022 21:19:52 +0200
Message-ID: 
 <CANNYZj-XsCgdaLwmZmtdvzzCjO8EmJffz+Zqr8qubNZzCpSi=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] bitbake-layers: add a command to save the
 active build configuration as a template into a layer
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Ross Burton <ross.burton@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 19:20:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170021

On Mon, 29 Aug 2022 at 16:38, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> Thanks for cleaning up things. I think having a unique, properly
> versioned patch series (v2/V3...) in the mailing list would help.

I'm afraid it would replace one confusion with another. There's:

- one bitbake patch
- several oe-core patches, one of which does not apply to poky and
needs to be replaced with...
- one poky patch

There's no way to version patch series across several mailing lists.

Alex

