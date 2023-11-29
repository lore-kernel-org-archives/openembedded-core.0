Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D83C46CA0
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 14:11:33 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.33732.1701267092210346921
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 06:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=a+divvzN;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: erik.schilling@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c897ba4057so81043561fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 06:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701267090; x=1701871890; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSVp8m63plYjw3/hgtYsNeyrGg5Jge3jj2L58joEesU=;
        b=a+divvzN98tM8tYL5jAXLmpZgp6t24LC8QoKA0UNWwiWrQiBOLJ53UHKRYHzQdBaX2
         xX6U1b7/wA5qyruNEXTzZBpI0qNZHKTcPHUJsmIRiLtQ//itclgKvIBwXHLGehnOD0RV
         IAbm9I7c+IjF7jJHiOmgu+0sYT7dPR8/gBZIah0lIBc3Vz/gHCXBSyfYsZvhvE4yUD7Z
         3/5LZLoTE2ye8FOmQhc/PDZsJ+6rN+GW9QHZnmDG+wF4WO7FIN22SU/dY7nwYSsJQMuj
         RpCxl+cadSLHGkmrkWz9YL4GFbysXEYUVs6JKfhvHIc37pbSjn9K/aMSxwepLChXe7tS
         SRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701267090; x=1701871890;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wSVp8m63plYjw3/hgtYsNeyrGg5Jge3jj2L58joEesU=;
        b=OSUPZ5qdGwante1/XALqeZoCxWHPcHQDat0zSEXmKIrVVrkHtOj3l6YCSik9ExsFoZ
         YDf5apmwuUJddXNZpClIhjcEuTTOsTGDlChzjx/bDEv3ItpQ6f8TmiC+LHpNrzHICFJU
         TcQAoX7nOHbS07mgoxKJj+EqQJlqDSau6nlsguZggZnX6bFXOrkzGrozAaKS1U+jnUDx
         r83/liHPoh2y8bSbGkfnvQR1VtRmfJKyjeOyWjoCqcarhXN2fndSFmxYKo2JYMrmvfxD
         udSNr0yQVNj8UjL5UgjpAtFdOBFrcuWlsMDWik0UHBZCHEDD7R7QrInvkahd1USCHaY8
         kIKA==
X-Gm-Message-State: AOJu0YwMP2zQT+WlX6ORuxYVc95RHPc1X5sgm+zWFRUkBJK/W81MUujo
	jCbCGsiowPMZ2VW8h2y4BCHXeg==
X-Google-Smtp-Source: AGHT+IGiEOob5faai8JHTUpsA7hX57xS62I7NgT2LwnL7Db0rwlOUDLXvBkUqAhOQEKNy1VvwMQMaw==
X-Received: by 2002:a05:6512:20c2:b0:507:b911:6706 with SMTP id u2-20020a05651220c200b00507b9116706mr9630481lfr.25.1701267090364;
        Wed, 29 Nov 2023 06:11:30 -0800 (PST)
Received: from localhost ([2001:9e8:d5b6:9400::f39])
        by smtp.gmail.com with ESMTPSA id v19-20020a509553000000b0054b3d8e65d7sm4374839eda.47.2023.11.29.06.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 06:11:30 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Nov 2023 15:11:29 +0100
Message-Id: <CXBCUNG34QJ6.2CKPAM8PWBE82@ablu-work>
Cc: <richard.purdie@linuxfoundation.org>, <alexandre.belloni@bootlin.com>,
 "Mikko Rapeli" <mikko.rapeli@linaro.org>
To: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 <openembedded-core@lists.openembedded.org>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [RFC PATCH] qemurunner.py: ensure we drain stdout after boot
 prompt
X-Mailer: aerc 0.15.2
References: <20231129124501.86503-1-alex.bennee@linaro.org>
In-Reply-To: <20231129124501.86503-1-alex.bennee@linaro.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 14:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191452

On Wed Nov 29, 2023 at 1:45 PM CET, Alex Benn=C3=A9e wrote:
> If qemurunner doesn't continuously drain stdout we will eventually
> cause QEMU to block while trying to write to the pipe. This can
> manifest itself if the guest has for example configured its serial
> ports to output via stdio even if the test itself is using a TCP
> console or SSH to run things.
>
> This doesn't address a potential overflow of stderr although generally
> stderr from QEMU will be a lot less likely to block due to the volume
> of data.
>
> Suggested-by: Erik Schilling <erik.schilling@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
>
> ---
> AJB:
>   As a QEMU developer I should note that we've had to solve a lot of
>   similar problems within our own internal testing (e.g.
>   https://gitlab.com/qemu-project/qemu/-/blob/master/python/qemu/machine/=
console_socket.py?ref_type=3Dheads).
>   Perhaps in the longer term it might make sense to consider using
>   QEMU's own python tooling for configuring and launching QEMU?
> ---
>  meta/lib/oeqa/utils/qemurunner.py | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemu=
runner.py
> index 29fe271976..1ec472c49e 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -243,6 +243,7 @@ class QemuRunner:
>          # to be a proper fix but this will suffice for now.
>          self.runqemu =3D subprocess.Popen(launch_cmd, shell=3DTrue, stdo=
ut=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT, stdin=3Dsubprocess.PIPE, =
preexec_fn=3Dos.setpgrp, env=3Denv, cwd=3Dself.tmpdir)
>          output =3D self.runqemu.stdout
> +        output_drain =3D output
>          launch_time =3D time.time()
> =20
>          #
> @@ -539,6 +540,17 @@ class QemuRunner:
>                  self.logger.warning("The output:\n%s" % output)
>          except:
>              self.logger.warning("Serial console failed while trying to l=
ogin")
> +
> +        def drain_log():
> +            while not output_drain.closed:
> +                more_output =3D self.getOutput(output_drain)
> +                if len(more_output) > 0:
> +                    self.logger.debug("Logs since boot: %s", more_output=
)
> +                time.sleep(0.1)
> +
> +        t =3D threading.Thread(target=3Ddrain_log)
> +        t.start()
> +
>          return True
> =20
>      def stop(self):

This is of course just a hack to demonstrate this was the problem. A
better solution would probably be to collect the logs through the
existing supervision process that gets forked off... That then also
solves the problem for the earlier code (and would transition nicely to
also drain stderr).

- Erik


