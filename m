Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FB7C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 12:47:17 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web12.10129.1664887635554840907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 05:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z0GTo2al;
 spf=pass (domain: gmail.com, ip: 209.85.166.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id g8so10417041iob.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 05:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=zOvMZ+PZ1JyOwCTthXrEuNg/09ifXZqF8R9DdDhkg5c=;
        b=Z0GTo2alVLtI1sI+pu/LoPboe+k9Poa9iSizYlQ1mrI9hvLH4FnjhZH3/plxKBHeTi
         ycAkcM4U8UgheH9BZibLAUMqmFEu1fHFy579JMtS4jPQqZqqd28MZ71OfDaI98CGXK6S
         icPmNxyvoUKoZ0G15AFOMnRi23VD9tW8xaQTU0wgYEZIOVu5hG1luNpQFOQXUyvK2fDG
         B/BZZ/LlzWcCGAUs3JD+CI6lWUETRGnb/cOhnL9Ci/RB/buOBzj6F/YHbmjVTmuatVL1
         X8q/iC20oTI4boXmmG6iheDZTRkeFh5MFMY2XpZ6wmVE1pXcakz3XHarWX3PAzjiwiEm
         apmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zOvMZ+PZ1JyOwCTthXrEuNg/09ifXZqF8R9DdDhkg5c=;
        b=rVqatkp7p2CvoF0Guofp7a1T8goROpPbTvRZwwEt+OVVprELSCSBbRIHAlXN2ZsKQn
         Q7UqqPqps33Luk2Ai4+a/EYEBOvA4/KTKcVhBWwi6iI3qVnC9YhBIYKYXA7VwFUNReDc
         5EcTln+5hNP6L6L5Qbmzs2iDbau5iWBbAYDmVN5c145ifgvzulWOYiU9mqVB2ANNkzbS
         aki/cBQiOvQbG6HdrZNzGzxe7pUWFUA7CMhChPCcVKVcHRctLbVHhAjKVhPgt/kTJuhn
         zXPrcMweNtipfHcmCOdTNQfEUfHaVMB5hrSMDgD5rn56lYqFL6B3nWOwFZPk7g8p+wEd
         0gyA==
X-Gm-Message-State: ACrzQf2Ybu/0vb4N49JR9Qh9I4x8cRgsOpPI1FbW34CSBkBlTljBx5BY
	5KNai9IGIu0f5E4WGx4znG6ho2N2+MMH/4iVle4=
X-Google-Smtp-Source: 
 AMsMyM5ntEG2RqRXrr5rcVoxUvJyIE+OFfALE9neyBXAphoaqtWmX2pUOU0SprxUa4J8S+qpXCPRxNa0shBVFHRrZrc=
X-Received: by 2002:a05:6638:d0b:b0:35a:9936:a922 with SMTP id
 q11-20020a0566380d0b00b0035a9936a922mr12476386jaj.169.1664887634690; Tue, 04
 Oct 2022 05:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220930175520.2850089-1-alex@linutronix.de>
 <683fa2c8-3f04-c498-6cce-530da13b3383@theobroma-systems.com>
In-Reply-To: <683fa2c8-3f04-c498-6cce-530da13b3383@theobroma-systems.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Oct 2022 14:47:03 +0200
Message-ID: 
 <CANNYZj-=YeQPK8hCX05wG=QV+969HbNrEKjzx5oDdUKAiwt1EQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/2] cargo-update-recipe-crates.bbclass: add
 a class to generate SRC_URI crate lists from Cargo.lock
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 12:47:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171390

On Mon, 3 Oct 2022 at 10:09, Quentin Schulz
<quentin.schulz@theobroma-systems.com> wrote:
> > +def get_crates(f):
> > +    import tomllib
> > +    c_list = 'SRC_URI += " \\ \n'
> > +    crates = tomllib.load(open(f, 'rb'))
>
> Aren't we supposed to use context for this or close the file descriptor
> after opening it manually?
>
> e.g.
> with open(f, 'rb') as file:
>      crates = tommlib.load(file)
>
> ?

python3.11 no longer prints warnings about this, so I assume it is now ok.

For the other two suggested changes please explain why.


Alex

