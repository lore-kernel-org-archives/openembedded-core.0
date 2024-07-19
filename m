Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096AAC3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 13:00:45 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.18071.1721394037529267043
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 06:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qq++RXi7;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.176, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfdb6122992so1706236276.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 06:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721394037; x=1721998837; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlTr7hLNpgZmwK2Uz0O/WtQV3p43cPRhNlC4FU9t3Ro=;
        b=qq++RXi7DnxaBnTLRQiS4l9Cu9meCIsg6mI5R9mT7JxFsqACyj7PPOgaQMfzMiweNd
         RMESbnjXxuNxV7O4QKFvAdoQyOesN3navSK/Ri0CnP+6OTo5B+2OG5RShH1O5ITG1nkF
         ywikYvNHeUlaRri2zMjvQmZEU7vh1TS6btgfe8yIg5z3lzpyvM8r65oEJoUv/71HA8L9
         VcRVeY7A1krn3gCY+QMZS3AVm9omkE6iyGAh4NijjOnxDEHgoIl+lbYep4oGbhTTYkMJ
         Bv2/hX58MIIkU3Fkm7lFNivu/gBPikSGJqwji5l9J33uVcRCftgH8xtWlXBcIMUhf+Sq
         4vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721394037; x=1721998837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlTr7hLNpgZmwK2Uz0O/WtQV3p43cPRhNlC4FU9t3Ro=;
        b=KVASaWYAJVe84FjhjcQGvLpNoSJcuXWK7ZwmeQnfoCebdT9UwIDGjQD5Upxfq3iGMf
         ndLq8T1Bdc1gX300clrw8AaSjSPYl4i7uHXWIuvpUbVHaaVrobDkDafAdfRCNmiOgCPQ
         c3+fE38ugvx/eGcMoZ06/q8CQR77HVDuBc3iZeakUmbM7CjgsHl7gM2XL759bfipElG2
         ezl5Lh4oApImk0jWGm/0GYvm2Eelaxfkwp3doeAvoF2iY4zZSFrn7Qwbwur+hyyoXp5P
         3X9MtNBj+2zBrlGw7VJ/18ZolTkosT7DCMktfia/+0qTHdl4+SBhpfAfLoI0Pq/G9F/j
         ipdg==
X-Gm-Message-State: AOJu0Yyl73u2J+RrUKV2FqTXezKC9rXfw/7xBuqmSKVhFgtY2JplqHNx
	SEQoa0eiyfZq4X29i7K489Gn43xv21k78BMUoFr0xNb/5o0cHBqxzyBUhgHdr5ZQ3T96rYkdONT
	eQYGMkpGdibXbjLFDy008nyUAAAOlyHwP1cxmgb3hivCRpJfm
X-Google-Smtp-Source: AGHT+IHrTFIzZIeydh+N3uYRquRpbKKLkoqcV5WvGvhigumT7n4fkjTCFH3bKW6aT3PqZ2ir4N3KrnVK7mchxPcbwKc=
X-Received: by 2002:a05:6902:2b0e:b0:e05:e2d5:666c with SMTP id
 3f1490d57ef6-e0640dbdad7mr6371273276.24.1721394033082; Fri, 19 Jul 2024
 06:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240719062101.373909-1-w.egorov@phytec.de>
In-Reply-To: <20240719062101.373909-1-w.egorov@phytec.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 19 Jul 2024 06:00:22 -0700
Message-ID: <CAOSpxda3332UEOtH2ypoeJnpt4ehZpjFbaq4er_25PdT_caV7w@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap+][PATCH] watchdog: Set watchdog_module in
 default config
To: w.egorov@phytec.de
Cc: openembedded-core@lists.openembedded.org, upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 13:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202258

Is this also an issue in master? If so, then this will need to be
submitted first for master and then I can backport.

Steve

On Thu, Jul 18, 2024 at 11:21=E2=80=AFPM Wadim Egorov via
lists.openembedded.org <w.egorov=3Dphytec.de@lists.openembedded.org>
wrote:
>
> systemd started to warn about used but unset environment variables.
> Let us set watchdog_module=3Dnone which is used by the watchdog.service t=
o get
> rid of the following warning:
>
>   watchdog.service: Referenced but unset environment variable evaluates t=
o an empty string: watchdog_module
>
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
>  meta/recipes-extended/watchdog/watchdog-config/watchdog.default | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-extended/watchdog/watchdog-config/watchdog.defa=
ult b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
> index 647d5abca5bd..cee5fdc2b6f7 100644
> --- a/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
> +++ b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
> @@ -1,2 +1,3 @@
>  # Start watchdog at boot time? 0 or 1
>  run_watchdog=3D1
> +watchdog_module=3Dnone
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202250): https://lists.openembedded.org/g/openembedde=
d-core/message/202250
> Mute This Topic: https://lists.openembedded.org/mt/107430686/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

