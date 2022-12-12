Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7865C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 15:00:20 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.45203.1670857216812056488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 07:00:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zfr9u3op;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id z26so1159201lfu.8
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=szUbJIqy/ByHE99/0v0632gaTA6HWfNv6gfkEhbHLe0=;
        b=Zfr9u3op3bVITGwxsguw6TMZHszHDGtXt6ECKflt8cg4mqAgcojsrvSZyUujSv6RGy
         CBTsnKrsaYde7ICUEPKeu3GTKTxybMgEygtX6iqMaMQMca9E3DksXz86ceoiqai6q7+4
         2KOVoNQ2RWyoxdbqIICYEtjDsfDhmY8V2nvqjb3xxl2DAhSgCwKbX6+O5odJbhTlkQnA
         h5sm3iHSSS+JReuhLwZy11CMzV5ZKTPVaxX+Oxk+bbt/XO7sBEInab4jc2EpzcfE9f+L
         pAEt5e8cFZN70DlJClEIz0eVKbc6CPhYP23QJ500ToV1Ozp8NVySI+axYr3q1oPFM+IZ
         1msw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szUbJIqy/ByHE99/0v0632gaTA6HWfNv6gfkEhbHLe0=;
        b=NxEbcddIvrBm1829RKX3Wt6sr6wR4vk+/7bQzIfQr87zyaesx1uADlR6wbV0TVSj33
         w2bNqzHPPr771ormd/gHpOxf40BuVMMHbOt+wbyhEGl/NxCrsBd/Koa0mrVvN9IZAUtw
         AcP8zOkAzST/yq8UPu0tsVYrSVxqUYbxjAGO4o2/fb4qJvqCufk9cOCVOpqnZTFpdR4r
         72xsgwli4tUE+L5sSC4xiv7yxXTc/0QG1sgqxLao/oogAiPi7c4W2JX1eYTl99Kk69KR
         8KUySZoR8sNjaQn6IIFDhZ7kIy8HqFsP2Jgxu2cO5uDL4DG+lJI/q9FoaLK2w0+p+5IP
         BcEA==
X-Gm-Message-State: ANoB5pnZzoRsKTAcT5agv5pdyw44ukfOH01XsRUY0abk9GedaH7n/L1v
	dT2JtJLMuFJ9ei0AkvSBnKi+gULk/knDbNmmY04=
X-Google-Smtp-Source: AA0mqf6QUWBOT0V0UByYA29jYtRJTMlD6/nqZGZUDyJeBoCapjDeaDxnJpQI74sEtDk88wRA67QebC17L7utrRbwkQI=
X-Received: by 2002:a05:6512:6d3:b0:4b5:62e4:bff2 with SMTP id
 u19-20020a05651206d300b004b562e4bff2mr7613601lff.492.1670857214895; Mon, 12
 Dec 2022 07:00:14 -0800 (PST)
MIME-Version: 1.0
References: <20221031114719.2725967-1-alex@linutronix.de> <167d8dfa-fe50-24ff-d2d2-249df3445ae8@windriver.com>
 <20221207002040.GB1080@xn--80adja5bqm.su> <CANNYZj9_46SdQdVuwFQ-HosVB7X2QpG0PDYNybV+ZL2Xt1FS3Q@mail.gmail.com>
 <96c54599-b4b0-5235-28fd-41c71272c213@weidmueller.com> <CANNYZj8gX4ab+zOVN974vwL8UkJqO-gqkshxsdYVtPsHZfExfg@mail.gmail.com>
 <1de0c6c3-cd27-1c86-f515-f4510ddd36f2@weidmueller.com> <CANNYZj9uXz1PV40B4zBReLzVimYaXoBjVr3Kbn5KnV9qxG=Yrw@mail.gmail.com>
 <9c58f13f-b7b6-aed9-1718-766d0537e356@weidmueller.com>
In-Reply-To: <9c58f13f-b7b6-aed9-1718-766d0537e356@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Dec 2022 16:00:02 +0100
Message-ID: <CANNYZj8Vt+db38wHuepOUphiGPemHgxQ8PF+_aOCCo1vQgpMtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/13] cargo-update-recipe-crates.bbclass: add a
 class to generate SRC_URI crate lists from Cargo.lock
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: Alexander Kanavin <alex@linutronix.de>, Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	Randy MacLeod <randy.macleod@windriver.com>, Sergey Bostandzhyan <jin@mediatomb.cc>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 15:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174493

On Mon, 12 Dec 2022 at 15:18, Stefan Herbrechtsmeier
<stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
> >> Sorry for the harsh tone but you ignore existing tools and add just another tool to oe-core without mention any reason or document it.
> > The reason to add the class was to be able to update existing
> > rust-based recipes without having to manually update long lists of
> > crates in those recipes, which is a rather urgent issue, more urgent
> > than having rust support in recipetool. The class does not replace
> > recipetool, in fact it can, and should be used by devtool/recipetool
> > once someone finds time and motivation to sit down and add (currently
> > missing) rust support to it (class functionality can be executed from
> > those tools via tinfoil.build_targets()). I do not have that time, and
> > I am not getting paid for doing that either. Oh, and we do not have a
> > maintainer for those tools. Would you like to volunteer for that?
>
> Yes, I'm happy to maintain recipetool. We need to go on with our npm und
> go support anyway.

Thank you, that would be very much appreciated.

We're all stretched thin, and need to continuously advocate the
importance of OSS maintenance as a job, as it's still not seen as
such. The problem is endemic across the software industry.

Alex

