Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FDDCA0ED3
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 10:05:07 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.46561.1725444303553540638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 03:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rVWt/0A4;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53436e04447so560792e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725444302; x=1726049102; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=he+CyZIg7Qb28PrCEMu9X0nNU1A055JfW1yJFDC/QmM=;
        b=rVWt/0A4H2oDujTgXddmUziS9UATMSj5jDHuI+hNmOHQr1Jyq6Y4pL+jKMsfB4R2fj
         ykFKvYkMVZMaaibKDWmuUapVbURfZ1oVS3HLreA9un28BmAeK5oNtAneIohC2Mf5h7xM
         0XPl7XzRlk4mGpaYYQxMoVgL31jbkmjP25PmnKA78pXjnfDB04Hs4T8SCuU3O75IMrkZ
         2gdPQvWr1yX9gFpFu1x7jxn4iuZiJhsE/r+PeeLJ5ae18EQ344aP1hSE2eDEPK+XTQ4a
         PbHIILHucrgfjWFm/YUwIgay3meJ1yKSUCkePhdAsqMmwxL5WD53RLC6jPVy3KZ8yIG+
         Sslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725444302; x=1726049102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=he+CyZIg7Qb28PrCEMu9X0nNU1A055JfW1yJFDC/QmM=;
        b=hFQGFB71adsTBtzIQlqOxJEPydhUzYf//zubdgAv9h0yKtRqFg/vL5zB/Ot1Qbwauc
         eVQDlxICdQaTbVEY8igvzmx7xeya6ANH4rnaSEe4DQcH9jOG0rr8iKa3gcoyPr2zyjgy
         oin9yN0U3eKRrWBW+Aga6ca6+uVE+pDt/nfyxWhd+Gc5dLUrHyzwaIJ+HsSx0Fu57C9D
         G2N9iKYmtk9X31XuPjzXWIpO8fvva4BPi2QH9f+vESkF3C7NAsDpGy3bRQN9O+1hwoWM
         IfEwCAbYGWKRzgxgn7xxzItEvwzirufpzFXvlDK5vlJCpHhc4em7REhFQQBGlmGbPtxK
         QSRA==
X-Gm-Message-State: AOJu0YwYd8ieXoJTx87E3wwtvInuH1qfSsTxhySrkR/IPcE6QR2wa9Th
	96Ta/pS0rVN+oNjWLqpWOebkXUY+0yRFVGKU9+qsp+m7SgU26LjIUqOirgJgdrw=
X-Google-Smtp-Source: AGHT+IEJjJtyBA2efzx0klPVGRFAKxTv6UGZI1/GhVucJFmJSuLJbtJdT4WL0/fAJgCymFOjihUw7w==
X-Received: by 2002:a05:6512:224b:b0:533:456a:cb33 with SMTP id 2adb3069b0e04-535677e8593mr664788e87.20.1725444300915;
        Wed, 04 Sep 2024 03:05:00 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53567464fdesm149635e87.80.2024.09.04.03.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 03:05:00 -0700 (PDT)
Date: Wed, 4 Sep 2024 13:04:58 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kristian Klausen <kristian@klausen.dk>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] uki.bbclass: add class for building
 Unified Kernel Images (UKI)
Message-ID: <Ztgwyte0x2Ufa2E5@nuoska>
References: <CANNYZj-cgTaKagNxx2mxTkPsp4U-JNNGrruUDUSPbn_cFz6+nw@mail.gmail.com>
 <ZtWgPF0JN4uyjU1u@nuoska>
 <CANNYZj9ke4yEQh0hAxk4fUazaEzQMP7JUKv6LYRv16CTwXpqFQ@mail.gmail.com>
 <ZtWuxNNd9KNxT4T3@nuoska>
 <CANNYZj-uXEDm2CuqtorwdZNABaZNPm4UtOFZvw4wMXdjhh+0ig@mail.gmail.com>
 <17F16FAE8869E0F4.11433@lists.openembedded.org>
 <ZtXIY7nwRpNJSVmx@nuoska>
 <CANNYZj8rA+unjecEiofA3Ht94Y2mqBygLnBP-rWEeZPfEEq+Kw@mail.gmail.com>
 <ZtgSunyGsn1gtMfF@nuoska>
 <CANNYZj93pH+571auNTZD+VKKWnP10=4fumhM-f4h_FhG9HWpvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj93pH+571auNTZD+VKKWnP10=4fumhM-f4h_FhG9HWpvA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 10:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204197

Adding Alexandre and Kristian since they contributed the uki support,

On Wed, Sep 04, 2024 at 11:17:29AM +0200, Alexander Kanavin wrote:
> On Wed, 4 Sept 2024 at 09:56, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > > Not rejected per se; I would suggest that the existing wic
> > > implementation is rewritten to use the class (and hopefully becomes
> > > radically simpler and shorter)!
> > >
> > > It's fine to not be entirely backwards compatible; this is master, and
> > > we can break things.
> >
> > Does the implementation have to be a wic plugin?
> >
> > wic is another wrapper over bitbake and I'd need to teach openssl native
> > and python3native things to it which seems a bit too much. uki.bbclass
> > is much simpler and wic can process the produced .efi file when creating
> > the ESP boot partition. I can try to fix the tests to work with uki.bbclass.
> 
> No, implementation can stay in the bbclass. But I don't exactly
> remember how the whole thing fits together, and whether you can keep
> what the bbclass functionality in the bbclass and have wic call into
> it (perhaps indirectly) or vice versa.

Current uki support implementation is in a wic plugin,
scripts/lib/wic/plugins/source/bootimg-efi.py. It can't call into bbclass'es.
It can run binaries from recipe sysroot but re-implements the bitbake recipe
runtime environment via scripts/lib/wic/misc.py function exec_native_cmd().
It doesn't support running python3 or openssl binaries, currently, so it
doesn't work with systemd ukify script. Adding that support is possible
but feels like duplicating the bitbake environment in wic.

I can understand the plugin based design if wic is meant to also run outside of
bitbake build environment, but for non-trivial tools like in ukify, python3,
openssl etc this can't easily be done. ukify tool only runs well in the bitbake
build environment with specific versions of those tools and their dependencies.

I would prefer to keep the uki generation in a bbclass where all runtime
dependencies can be managed with bitbake, and use wic for baking
the uki .efi binaries into partitions and images.

Alexandre and Kristian, do you have preferences about uki generation
via bbclass vs wic plugins? Do you expect to run wic outside of bitbake?
If you've added secure boot signing, how did you add that with wic plugin
based uki generation?

> I just would like to avoid the situation where there are two entirely
> different implementations of the same thing in core, and only one of
> them gets tested. If wic can work together with the bbclass, then the
> existing wic selftests will test the bbclass as well.

Understood. I can convert the existing wic plugin code and tests to work
with uki.bbclass generated .efi file and use wic to generate the partitions
and image files only. There's been some adaptation work in the uki generation
due to systemd/systemd-boot implementation and uki specification changes so I
think using the systemd side implementation would be more future proof, though
of course APIs can change there too.

Cheers,

-Mikko

