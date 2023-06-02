Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A85C7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 11:55:58 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.10594.1685706956376979270
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 04:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=WP5p4i23;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f606912ebaso19924595e9.3
        for <Openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 04:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685706955; x=1688298955;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1f1lNEW1lanj/ec5xR4dezFXk9w7YuXTpKw+5Nce74U=;
        b=WP5p4i23JklP/bYKUKPhdD/UowNP8NtjXc0BkpO8ixynUnkQbOG2l7ENPoSFpVTlII
         sfAdJ8jIJMJylhfyyo7ttWsEYgDXZ5G0QDccmSsH0ZrVMHPOvXoMNPlO4cWenYL8Te2u
         LAXPvtGzESflwJSGtKm69GiYxNgeJXv/5pin0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685706955; x=1688298955;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1f1lNEW1lanj/ec5xR4dezFXk9w7YuXTpKw+5Nce74U=;
        b=D7FsX8yQpCfTWGkTAtZrXn1Ow8CZ5WsZeuOxfuwKH9CFh9kb0EM12MEw0ffMVq2ZYn
         5Oj2E0Lt7e2pfw2M+km8+rQ7Uqi6sM2dUqABUrhaNGRiNrcL60200gDHvpyIfz9ClgDA
         ZD79hYY2grjsDM/W2dqx+K/akGpnhaxjcharjYkZCoeiPXSUwSIlTWXVJX5JZTCt3fwg
         fuBHKrZ7D/HyPUv0b4SB2k72iaQQ6l/wx1MIhdhKSHORH+0UsSYTSkII8+iueJGwjTJi
         8YdZs7p48eg+6yy0h9pMIWOyiWTBejpM7xIZxN5lEd2xqjrBS/9OeSyyFfDzRryjcqVE
         qcVQ==
X-Gm-Message-State: AC+VfDw7zgoKp2TkFHjqPOpzc1fmSuV+q6UiP/Y3gM3NlbBcjSDu2GVe
	9kUcmghu1tSSbBdvkuSqOZRTLA==
X-Google-Smtp-Source: ACHHUZ5KV/LuVxQN52/Td/6zMJ0lejYZHWlEB/cGEGx1LG3qA8FDKjhJBzalbLnm7UT1H/T8VcYIgg==
X-Received: by 2002:a7b:c5d6:0:b0:3f6:a65:6ff3 with SMTP id n22-20020a7bc5d6000000b003f60a656ff3mr1694888wmk.32.1685706954755;
        Fri, 02 Jun 2023 04:55:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:527f:ecab:4831:c523? ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id q13-20020a05600c46cd00b003f1978bbcd6sm12869330wmo.3.2023.06.02.04.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 04:55:54 -0700 (PDT)
Message-ID: <88493a5e4afaa5917192c9d7baa2f5c3357a0185.camel@linuxfoundation.org>
Subject: Re: [OE-Core][RFC][PATCH 2/3] testimage: shut down DUT later
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexis.lothore@bootlin.com, Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Fri, 02 Jun 2023 12:55:53 +0100
In-Reply-To: <20230602095037.97981-3-alexis.lothore@bootlin.com>
References: <20230602095037.97981-1-alexis.lothore@bootlin.com>
	 <20230602095037.97981-3-alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 11:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182308

On Fri, 2023-06-02 at 11:50 +0200, Alexis Lothor=C3=A9 via
lists.openembedded.org wrote:
> Move target stop (for Qemu targets: qemu image stop) later in testimage
> main function, especially _after_ having access to general test results, =
to
> allow executing some other actions (like retrieving some files) on DUT
> depending on test results (e.g. : retrieve some log files)
>=20
> Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> ---
>  meta/classes-recipe/testimage.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
> index 1bf0cb450ce4..6b10c1db09f9 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -393,7 +393,6 @@ def testimage_main(d):
>          results =3D tc.results
>      finally:
>          signal.signal(signal.SIGTERM, orig_sigterm_handler)
> -        tc.target.stop()
> =20
>      # Show results (if we have them)
>      if results:
> @@ -404,6 +403,8 @@ def testimage_main(d):
>                          dump_streams=3Dd.getVar('TESTREPORT_FULLLOGS'))
>          results.logSummary(pn)
> =20
> +    tc.target.stop()
> +

I've not really had a chance to think about this properly, sorry but
there is an issue that jumps out at me in this patch.

The stop is delibverately in a finally: clause so it always runs even
if there is an exception in the code. You've moved it outside of this
so the target would no longer be shut down any more in such an
exception case. This would potentially leave images running in the case
of exceptions and we want to avoid that.

Cheers,

Richard

