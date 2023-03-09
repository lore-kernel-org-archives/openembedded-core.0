Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E6BC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 13:04:21 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.12588.1678367053821987020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 05:04:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n7DAt6ss;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id d36so2171854lfv.8
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 05:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678367052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o32q4ncVTiHunSqR54hwLUb4aA5kEzX/LTFNpqTpNss=;
        b=n7DAt6ssY3WpGzZTC9TX/EUdODEyuuLdm+0n5TBTFnikECmU1bWcplUBwUyfDdzEAE
         2tf5gjoEz0aqvcoJ3XyyAIah7k+5oeOIRQU/P+ZmB+1j/nEPDLfWGB4VWCnYaNMEMM8r
         9wPg58X0i/QT45cgJClbT59ppaKzg4QLHgzWZkQjnB1EAIkZLcdNdMdBY/x5bIRSPUOh
         FBAkGg5k7vW/eCsRqWiUc6queapZryzkwWRZbvn9KYbwd5zwZpFjKhH5A1N7hJ+uf9rt
         4rY0YASP+icIuabPgcCC3vjKr02GuqGBozoh6+yENsdy/cA/HZ3YipFjwJswyINVjJzK
         kf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678367052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o32q4ncVTiHunSqR54hwLUb4aA5kEzX/LTFNpqTpNss=;
        b=WP/NTa1W1dB6afb67lzmHBzUKBjAwATx8hMjvrEq12aGZKoAxK5nk1mag3MLb/VJN9
         FuqUgJWlQxJVDjMn4PqIjwkcYbL8S4LxRkScZ9dA9Z+V1UhR10dl62D0kp4bmJWPsMIO
         y7SL68OFJ8w584Td8j+T+AH4qAIDxU6GWTBMUMaMC1pT9fkKvcbrqtAUA2EcYzejJRcF
         WBjjYgP7muhBViKTBs3L6mcTH0Yux7QvmfFrm+JO61JBECll17HoBKUdyTII1qU0cven
         bynUpsGu/AZkjf1uR6wlpVjBO6JDKKlWUMQPENQDachP+HxZ70GSVHXG3lKx27vgKstN
         JjQQ==
X-Gm-Message-State: AO0yUKUo2IjLHp8rkF5Tm0HmNI8E3MROGA/RDTlU1TeOJJV4wuqhY2IA
	dJBisIrVTWqyhf62bd0cag3QV7sTIr7qg8r2sB8=
X-Google-Smtp-Source: AK7set9dm4mySyFiSekAMgpE0ZC3w9HoXCnA1RAfrur4Sdokd/qQodCRQDXRvnUgtOqA434mW2qwre7uW7fHjJ8OIyg=
X-Received: by 2002:a05:6512:24f:b0:4dd:fd4e:5a21 with SMTP id
 b15-20020a056512024f00b004ddfd4e5a21mr6749143lfo.11.1678367051919; Thu, 09
 Mar 2023 05:04:11 -0800 (PST)
MIME-Version: 1.0
References: <20230309103225.3110783-1-alex@linutronix.de> <39fcdfbf705f2d2f58bbf317171f0872df2aa2e1.camel@linuxfoundation.org>
 <CANNYZj85v8Mt97qCNvTf8GdOUAXsfTFPGJfN-1_UxK1io1TrsQ@mail.gmail.com> <69e29ea4c4b9a0cf71578b55e0e2eeda137d4679.camel@linuxfoundation.org>
In-Reply-To: <69e29ea4c4b9a0cf71578b55e0e2eeda137d4679.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Mar 2023 14:04:00 +0100
Message-ID: <CANNYZj_hPDwjMFr33JvqeFuS=GWUT1ze0Z-eyVTpFCfndQYx1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] staging.bbclass: run prepare_recipe_sysroot
 after unpack, not fetch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 13:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178222

On Thu, 9 Mar 2023 at 13:03, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> This is a wider problem, the sysroots are often modified when things
> are running against it as we don't require task serialisation. Instead
> the code tries to be careful about it's manipulations. Things aren't
> always installed/removed just from that task either, it can happen with
> *any* task that tries to extend the sysroot (which fetch, unpack and
> patch do as well).

Right, then I'm not sure what to do here (short of 'task-specific sysroots' :-D

We can lessen the chances by serializing prepare_recipe_sysroot into
fetch/unpack/patch/configure sequence. But it would not eliminate the
possibility of other tasks stepping on those or each other.
We can also make sysroot (de)population code more careful. But it
won't solve the non-determinism.
Making git wrapper run with python from hosttools/ solves a specific
issue I saw, but not the broader problem.

It happened just once, so it does seem exceedingly rare.

Alex

