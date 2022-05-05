Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B66CC433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:01:13 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.7315.1651726862710670501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MDdHvS79;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id h29so5638719lfj.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aK4gzNbC4jE+vqUFMYZmybI0sN4dmI+7FQUy7sSMlEs=;
        b=MDdHvS79Gt0VqWs0MAGbNC9HSI4b7W5vtfNF2zzQ5Bp5grX2gu5fYff2GMXz/+md9c
         gZde7bY6DoTA4Z7CMeKFWk2vla8pzBv5ISlgLnlaOA88aahs5fVy85XeIkSauKGohm4B
         H2Wbtmq1ykyHqpblF3QraP0q+vLC5b/6iPkDPwnGoD8bLBd/MWpsoz9LtPFnt9eaDHR2
         LdbpJzbFFlXO+TQZGfkCPMyjXnxZB6O/jDTPCMoaBUngvG/v9eru/GbsilGDd2nAmqNh
         WCeykVdSrjD5Kje3i426W9apZZfcyW8hHx19YbQ9Z+b1hBm6vNs0pC8IChCTwRqxwusd
         +sSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aK4gzNbC4jE+vqUFMYZmybI0sN4dmI+7FQUy7sSMlEs=;
        b=1tnYfKNI7vTiZ3ORiXYdscobZweimPU+rovVvefBo+PIFij7IKrX+VOpEA+z3q8R7V
         0ETwLI0p0v8lWIDav73gGkKBUTpYKWXAhUDqYGFvDLyfRaqh0UwkHjhatkym90rgptyB
         XZkoyzVjBcYXyXFGPptcP+sK4rrj7l8TmtjtXK3b0m+AhYjPbSlSRoAS7mW7u+hTLJqz
         VrlNao1bhF9RDRKelnKPcvTt2rxtnSpr7WJL2z1FPCvzr2r/9KwCAv7l6KSJqv7DQpWo
         pRii5IYa0ujB4/yyZ1BJTfXH5C20eAWP45nXwWrlVRGilSaMhjW/wb+elQ3/wl6GPIIy
         virQ==
X-Gm-Message-State: AOAM531SegdWmtU4HlR2Z8O66o+Am3hXsPufDGHVFmrvFzeRfWuSn/aO
	6BMEsz1VWmormMjyYrJxmBQwOgEkgKxQo4PY5Vw=
X-Google-Smtp-Source: 
 ABdhPJx8zvMGKCmMqZQJF1sZQPyO5cr9Odag317euB4EN+BrZSHM6ktpU+LWsSOtqUV1aFzkoaHAFQvQdGbJfJJDpjk=
X-Received: by 2002:a05:6512:3390:b0:472:1a4d:ad14 with SMTP id
 h16-20020a056512339000b004721a4dad14mr16635265lfg.521.1651726860649; Wed, 04
 May 2022 22:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <1651131215-4196-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj_5zAZvg_rbPw4C-YNA6ptohpxvDOXbCdNvj3Bom08b3g@mail.gmail.com>
 <OS0PR01MB6178D7CB066B54B254C078E0A0FC9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj_qUUccE2Bntys3vQiPF=+u6UpFMXwhTmT9Ey1S=0XCuQ@mail.gmail.com>
 <OS0PR01MB6178BDE0810BABB5034104C0A0C29@OS0PR01MB6178.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OS0PR01MB6178BDE0810BABB5034104C0A0C29@OS0PR01MB6178.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 May 2022 07:00:49 +0200
Message-ID: 
 <CANNYZj9ZCA8pzHhXW2vn3GnQwuGP8_m8hn0Aup7_f89FRQMPcA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gnutls: Added fips support option.
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:01:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165229

On Thu, 5 May 2022 at 06:19, leimaohui@fujitsu.com
<leimaohui@fujitsu.com> wrote:
> .libs/.$(gnutls_so).hmac: libgnutls.la fipshmac
>         $(AM_V_GEN) $(builddir)/fipshmac .libs/$(gnutls_so) > $@-t && mv $@-t $@

If fipshmac from -native  is installed into the sysroot-native, then
it will be in PATH, and then you can simply drop $(builddir)/ prefix
with a simple patch.

Alex

