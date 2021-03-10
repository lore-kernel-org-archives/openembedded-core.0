Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web12.577.1615419024370200788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 15:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uvu825NX;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id e2so27895295ljo.7
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 15:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yk1V4UBHTlruqSBb/LtAovfXo1uo0yPJsgj4Oh1PwZk=;
        b=uvu825NXrRiGwPUoW3MCmW9WOxW7UyOkgzzLp6ZeJOgnCpweHDVe+9hQTetU3coI0y
         p3gy6M0hOBVcQ1LAXUqwTvO5jUgETrwFT5e413beUrZlKBDuoGDT7yLB+9ly1h4ei487
         woiFlweHm8pko0XmnxgYceksdzeeqWTqGpE3uvTqM0F1xMoMtKHMvkEydo9Mtp2P7GVj
         9nK8n0l5mEgweIsrLuy2fSIbJ7E/aVdehdonTH/PlTwVH3rNfE/wZhsJEESsT6kha7d2
         qsKnwcLAclZVyggUVzNmoDu0EDBhjrptuWsV3UHlHHIhULuhMowO42inylmB26VmqjgX
         vOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yk1V4UBHTlruqSBb/LtAovfXo1uo0yPJsgj4Oh1PwZk=;
        b=jZ9mw97E8hAoPjwfsWvTmkgbDdpgB/ypJEfPewobaICxJaLGwBm1/nFiSoGjOfABPX
         bHGWixiIsBPd/hm2nC/9U6zykEmXvfPWepsV6n9yGia9Z3MItxVjtXnBcDTzAufaP2V7
         zOVDV+gyAkPYSAXj+SD8JSTaSBcI6LHGvltP+hXHYYgiNQplTFfzg1WZcCAMzVetsLGC
         XEQHFc9EfZsATPPUVRkVZSAM6q/XZOMiBZ6GceViZ+Xi49kUY5RvoZkzQ6DPUz4qpO0p
         t1TvWYN/6i2XAaDGWpkS0KSnQ9WhEhdr4rCcqYiK6devSqp3u3U3B5Ys0kp1PW/ZplnB
         IuTQ==
X-Gm-Message-State: AOAM530Djn/4kL6bodTTiDcQh6U+N8ruviAOVUX0vZg7MhP6kRIjl8/c
	TDe0wHFdOqLtQyI04B5X/6I4KqsWIyhqPHRwyl+74CFOfT0=
X-Google-Smtp-Source: ABdhPJzSrfkxEHVkscOyBgnz/ONx8IpfvN/VSOhl2lt1N+Y1tFNy29BWCHtWvEMR0rEgHGE7XuC2SuSW1hHOwKKEn/k=
X-Received: by 2002:a2e:9a0a:: with SMTP id o10mr3105893lji.432.1615419022595;
 Wed, 10 Mar 2021 15:30:22 -0800 (PST)
MIME-Version: 1.0
References: <20210310230433.29983-1-jdmason@kudzu.us> <20210310230433.29983-2-jdmason@kudzu.us>
In-Reply-To: <20210310230433.29983-2-jdmason@kudzu.us>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 10 Mar 2021 15:30:11 -0800
Message-ID: <CAJ86T=VPLEr=u5O=D1bo6du0nBw3fOnN5O1i_tja0hoJxca-sg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] core-image-sato: qemuarmv5 doesn't work with >256M RAM
To: Jon Mason <jdmason@kudzu.us>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, Jon Mason <jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 10, 2021 at 3:04 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> Currently seeing the following error when running runqemu on qemuarmv5:
> runqemu - ERROR - Failed to run qemu: qemu-system-arm: versatilepb: memory size must not exceed 256MB
>
> This is due to the memory size being set to 512 instead of the max
> allowable of 256.  Limit to this and everything is happy.
>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> Change-Id: I3339e50a53464b95f52a987ed37868ebf0935b07
> ---
>  meta/recipes-sato/images/core-image-sato.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
> index e50b24a47691..8ed8f75e9f92 100644
> --- a/meta/recipes-sato/images/core-image-sato.bb
> +++ b/meta/recipes-sato/images/core-image-sato.bb
> @@ -14,3 +14,4 @@ TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-intltool nativesd
>
>  QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
>  QB_MEM_qemumips = "-m 256"
> +QB_MEM_qemuarmv5 = "-m 256"

Grepping for QB_MEM suggests there are other images which need the
same fix. Maybe good to fix all of them at once rather than one at a
time.

> 2.20.1
>
>
> 
>
