Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web08.1193.1603391849099222655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 11:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aSpJ/sem;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id s15so1465341vsm.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 11:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QsPLPQJZPodZ6epHJp6jyse8WEfwVwhOm6HZUfhLS5U=;
        b=aSpJ/semCWKOjTuzDnww3wqPu9ZI4XLx/bec+vbhLq3bFJ4yG4kV9Ssxd94ZppvenG
         67iic6WJxttTuFDDsLbfMEC/PlO3psxF6peyewLO3F2IeEsz7S+Uydy1v0bBSnGzYkbX
         VmyM5bdWVBrKiCzeRCHISmEc5KVUjMYtfj1cv7nmFzfa008Be3r0O+dGMJ95IcT/xFiy
         jVOeYX/ANQpLui2YTAeZ/GbL+3FrcEkrcBqqyTe9Sf5bbRd3B4xefU8i3TZe5YWHQcm1
         S/NpxkGxdOX4RpNi19Iso09gE3fNue/LSI1ASI75X6XUDB+9rU6VbAL4J7FevrRZSMha
         DRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QsPLPQJZPodZ6epHJp6jyse8WEfwVwhOm6HZUfhLS5U=;
        b=Y0mSkzIvK3OC2fYob6YblNqT8HhQrfhfRP3fpglv6wZBVa7b+2xTdvbgsViMlEbKWE
         sfohMQ7q5UYX7H6eS1ERtT3X0Z3uPuIsw0nWTYcsS791ywj1n5MND9uKlFKYbvlgxxTN
         wuInzWXZfOxeQ1RuZqpZvOazXaFT4n3VdUfVH9HX2xt0SmcdfcTrtt1MRTzhJmQihxsQ
         zBOyvBAX7a4pnERvC/rBuK6PK0FCTKpYuOdlDdgyfKYf0IC2WsBBm9YKfqASfOomHEa9
         C4MJ3DYQIG7wT4fKlLOGb8PHl7T3Z2WuN4r3ay+7b6w1llPIOTp8giUIHBDAf69zPOLN
         UmyA==
X-Gm-Message-State: AOAM533bkNHRWEtgbHPyTCNJSvXb112j4GWalcyiDZwfBC0WHPzG4ABo
	deoQlEv/t7NjHTBO102M3SFRBPh4Oxk9axSy2W0=
X-Google-Smtp-Source: ABdhPJym3eG8yxG8uEKANshdVbmmpLtciz9ImzkP6Uq7nvgjiNVzTxaMuk10FQyLo5sGApCBiZma+uaq8eZzL942atk=
X-Received: by 2002:a67:774c:: with SMTP id s73mr3347518vsc.1.1603391848070;
 Thu, 22 Oct 2020 11:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201022083222.1506844-1-alejandro@enedino.org>
In-Reply-To: <20201022083222.1506844-1-alejandro@enedino.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 22 Oct 2020 11:37:16 -0700
Message-ID: <CAJ86T=VB=9ohqZFzquAnZN8EiVBgZatGgWo5MRb3g7mZHy08vA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] baremetal-helloworld: Fix install path since S doesnt have a trailing slash
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 22, 2020 at 1:32 AM Alejandro Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> ---
>  .../baremetal-examples/baremetal-helloworld_git.bb            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> index 7a580bd885..946a12d0a5 100644
> --- a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> +++ b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> @@ -40,8 +40,8 @@ EXTRA_OEMAKE_append = " QEMUARCH=${BAREMETAL_QEMUARCH} V=1"
>  # Install binaries on the proper location for baremetal-image to fetch and deploy
>  do_install(){
>      install -d ${D}/${base_libdir}/firmware
> -    install -m 755 ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.bin ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin
> -    install -m 755 ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.elf ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf
> +    install -m 755 ${B}/build/hello_baremetal_${BAREMETAL_QEMUARCH}.bin ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin
> +    install -m 755 ${B}/build/hello_baremetal_${BAREMETAL_QEMUARCH}.elf ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf

The slashes between ${D} and ${base_libdir} could also be removed.

>  }
>
>  FILES_${PN} += " \
> --
> 2.25.1
>
>
> 
>
