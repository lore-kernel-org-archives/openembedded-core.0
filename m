Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75F1C6FA8E
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 12:45:07 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.42885.1677329098015003173
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Feb 2023 04:44:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hxDGh2GQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id az36so1477814wmb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 04:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2aoYO9UPg1uyjTakTpgQZ2zRJdX6JhzeXYPUiWCqZk4=;
        b=hxDGh2GQosnbzE/DNqmhBYnjIxPCZa7Hb2Tfc1U7bJhCKJd4tbK3NOSrQRM2M+fibM
         BhviqbuAZFzCOUM/IGwK7SWjKWbCP+MLq9y9PlCelQtFdsMGWP72iZ8kvJrcTybPL+CK
         wQbcm9hAxTQOxjljQibTO9mjat0+DSsFHV078=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2aoYO9UPg1uyjTakTpgQZ2zRJdX6JhzeXYPUiWCqZk4=;
        b=ymrFnHSIUiEQP6n6zXDOWGjhjnCNg5M3j9m/XKSBEzyj2Iohv9q+4XcAwMwDQFjJpF
         Tfms5tuNsxaGCbtqn+WQpd5R1ANSCgCagBj0dr6G9y2DlzFYd1QoldhEHU+DMegbrRac
         e5PlryAmjNsVP5hy+QHaQA/I4LNgcLkdy3S6/3KHKtq/jvbQStgnRhQeAzbiYYs9ky/K
         L8PLYyXFzASYQ/1TawMVfhgZFn+mWMyhpoc17XwUOM1nRGrVC0fAm6k6wFkGPJ/v58mQ
         3fJ/Hb5lzh59ErgVGn0KHmYVoLoRLAf2cOFWaB4H1sa8MnpYSy6hrgL0oskoce4UGmKv
         t4eA==
X-Gm-Message-State: AO0yUKWkZBS65JJlWr+8xYQFQXqif//pwjevZKgTwUWgIUGWaaN8KvMu
	LBJNCgtJcwnJDwItFyRdmBJh3Q==
X-Google-Smtp-Source: AK7set969Wv+NSSZiizauhplO3yQ8xrTP5eybB9RLQfzmhXvqX0wc8BQWS2DMWvXMh1jXj1oUUXaZA==
X-Received: by 2002:a05:600c:3093:b0:3dc:5c86:12f3 with SMTP id g19-20020a05600c309300b003dc5c8612f3mr9746060wmn.1.1677329096161;
        Sat, 25 Feb 2023 04:44:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e7ea:a56:22dd:5e1f? ([2001:8b0:aba:5f3c:e7ea:a56:22dd:5e1f])
        by smtp.gmail.com with ESMTPSA id r1-20020a1c2b01000000b003e9ae2a8cbfsm2599755wmr.2.2023.02.25.04.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 04:44:55 -0800 (PST)
Message-ID: <31f5a99874297904353a2942f119a3e943823c18.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 0/6] scripts/resulttool/regression: add
 metadata filtering
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexis.lothore@bootlin.com, openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com, Ross Burton
	 <ross@burtonini.com>
Date: Sat, 25 Feb 2023 12:44:55 +0000
In-Reply-To: <1747113C8A4DBAD6.29542@lists.openembedded.org>
References: <20230224164555.67634-1-alexis.lothore@bootlin.com>
	 <1746D4E8592324E9.29542@lists.openembedded.org>
	 <1747067DAE80068A.29542@lists.openembedded.org>
	 <1747113C8A4DBAD6.29542@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 12:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177717

I'll try and stop poking at this but it is all rather interesting and I
think we have spotted our first nasty regression. The quilt ptests did
really stop running properly and reporting test results!

Looking at a recent master report:

https://autobuilder.yocto.io/pub/non-release/20230224-14/testresults/testre=
sult-report.txt

you can see the quilt ptest count is still zero as it was in M2 but not
in M1.

I'm thinking Ross might have been responsible with:

https://git.yoctoproject.org/poky/commit/?id=3D61bb4d8e75dfaaf980c32fbe992d=
34f794b7c537

!

The reason there are python3 and python3-cryptography changes are that
there are 35,000 python3 ptests and about 250 changes so that isn't
really unexpected for what was probably a version change. I'd guess
python3-cryptography made changes to their test suite. Overall the
counts of pass rates increased and no failures so those overall counts
may be good to have in the report too.

We might want to log the version of the recipe in the data somewhere so
we can show if this was a python3 version change.

Cheers,

Richard

