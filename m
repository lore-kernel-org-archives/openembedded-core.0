Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.884.1625680097686569151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 10:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jMZc7hUN;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id h2so2620747qtq.13
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 10:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ngbx5cuyFVcuzB5/H0BY7k3Cp81h2sJsTPxvSTfi6ro=;
        b=jMZc7hUNlAPJld57d+MRhRyq+9Q7jlNiqcCuiUkvgxL5pvYF78AF6ZWiIsuliycBQo
         WdyX3Ys9wbXvC5DK1lhQYmHPfwhcUaAEMrv4GIaPaUI8jF7wL8bdPn3KXTwmRnApTflK
         9g6fYbDXUWj/eQPtBtkUjZDKqlGIYmi63hJGufTbnG2trrXYJ4oX2hmItNtwJMA0dRJA
         9uZ8IrJqjZQAKQtAy6Jo7atGAsLX2STXg1beoD4QcuZKD4X1XKt730ej8sAS5k/S/Z7o
         Idp5NeXysfvnf5EZySrSnJ1zH/4jZrkrV0C1rdO8MVu4bdt57ghFdK2rjLHkenFxqWBO
         NxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ngbx5cuyFVcuzB5/H0BY7k3Cp81h2sJsTPxvSTfi6ro=;
        b=RRAPMymu5lW/zLsuEHDxgWdHTjUQXSKC7bNvH2tsy4tWQmSkUY2z68etzZQo7acVT9
         /q6zfLz1f7zNfbMVB0O2SuKG0H7Ri2oQgFRkx1NOPKtMAWzQBYU0GDPPkAUVn781t6kn
         +97MkdCz0N/2TdMVi5IBQJxhrNR51+45QCaeqI0vcQU9Ern4U0cOcYrzAm9KHyTctike
         bpP/Lw97UpjBxqAfJvNyFgqiOT4tW2gjLqC5R26+XJEaUHqTwjJw067qsxU+b5nGTeX1
         Sg0ee/a5Vl5Uw3xkGkzRHJeymYAy1QMiO7GmOdZhwliTDndRIuLNqqmKNxNkFnf/xJzm
         uFlA==
X-Gm-Message-State: AOAM532Nc7wj9fCCWASP+Bh1l0cAAAJrAK6cPdn/Q3EoOtlsZwuY9y+a
	Y4QyY1gGb1oUfi0pcsuPskSsDyif4WbsFCvKI4M=
X-Google-Smtp-Source: ABdhPJzVdTHOKhNmpaFoheDw8+Bpk2dWqCSZAQ1DvJmdG6kZtDF28odhPA+oDDbeQUFh1vQhsMchZ9eN7d7iPGShGrY=
X-Received: by 2002:ac8:4b4b:: with SMTP id e11mr23376298qts.289.1625680096703;
 Wed, 07 Jul 2021 10:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210707085419.2610-1-mingli.yu@windriver.com> <CANNYZj8QTxMG0O5mQs5kRQRedPRRNZMxiwPGZGgBiK8jL=DAOg@mail.gmail.com>
In-Reply-To: <CANNYZj8QTxMG0O5mQs5kRQRedPRRNZMxiwPGZGgBiK8jL=DAOg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 7 Jul 2021 10:47:50 -0700
Message-ID: <CAMKF1so_itQESzrcEM1wnvAdYz-mJepxYSw-8QRFzh4aKdAuAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemuarm64.conf: change the cpu model to max
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 5:21 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> 'max' implies that it's not stable and will change depending on qemu version and build settings. Can you set it to a specific model?
>

I don't see stability an issue here as max is stable, A potential
issue is that it will now depend on host cpu features which can then
have result variance
so perhaps you should be able to add it as cpu feature attribute via
-cpu <cpu>,feature1,feature2 etc. perhaps and also ensure that these
features are
commonly available on ARM build hosts.

> Alex
>
> On Wed, 7 Jul 2021 at 10:55, Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> After rng-tools upgraded to 6.13, the below logic introduced.
>> 9070a04 Add support for ARM v8.5A "rndr" instruction
>>
>> It means there is another entropy source rndr added for arm64,
>> so modify the cpu model to max [1] to make the rndr entropy source
>> function available and also used to silence the below failed message
>> when start rngd service on qemuarm64.
>> "[rndr ]: Initialization Failed"
>>
>> Before the patch:
>>  $ systemctl status rngd
>>  [snip]
>>  Jul 05 07:15:47 qemuarm64 systemd[1]: Started Hardware RNG Entropy Gatherer Daemon.
>>  Jul 05 07:15:48 qemuarm64 rngd[152]: Initializing available sources
>>  Jul 05 07:15:48 qemuarm64 rngd[152]: [hwrng ]: Initialized
>>  Jul 05 07:15:48 qemuarm64 rngd[152]: [rndr ]: No HW SUPPORT
>>  Jul 05 07:15:48 qemuarm64 rngd[152]: [rndr ]: Initialization Failed
>>  Jul 05 07:15:48 qemuarm64 rngd[152]: [jitter]: Initializing AES buffer
>>  Jul 05 07:16:14 qemuarm64 rngd[152]: [jitter]: Enabling JITTER rng support
>>  Jul 05 07:16:14 qemuarm64 rngd[152]: [jitter]: Initialized
>>
>> After the patch:
>>  $ systemctl status rngd
>>  [snip]
>>  Jul 07 08:48:30 qemuarm64 systemd[1]: Started Hardware RNG Entropy Gatherer Daemon.
>>  Jul 07 08:48:34 qemuarm64 rngd[164]: Initializing available sources
>>  Jul 07 08:48:34 qemuarm64 rngd[164]: [hwrng ]: Initialized
>>  Jul 07 08:48:34 qemuarm64 rngd[164]: [rndr  ]: Enabling aarch64 RNDR rng support
>>  Jul 07 08:48:34 qemuarm64 rngd[164]: [rndr  ]: Initialized
>>  Jul 07 08:48:35 qemuarm64 rngd[164]: [jitter]: Initializing AES buffer
>>
>> [1] https://github.com/nhorman/rng-tools/pull/128
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>  meta/conf/machine/qemuarm64.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
>> index 150a0744eb..a792dc32e6 100644
>> --- a/meta/conf/machine/qemuarm64.conf
>> +++ b/meta/conf/machine/qemuarm64.conf
>> @@ -15,7 +15,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>  # For runqemu
>>  QB_SYSTEM_NAME = "qemu-system-aarch64"
>>  QB_MACHINE = "-machine virt"
>> -QB_CPU = "-cpu cortex-a57"
>> +QB_CPU = "-cpu max"
>>  QB_SMP = "-smp 4"
>>  QB_CPU_KVM = "-cpu host -machine gic-version=3"
>>  # For graphics to work we need to define the VGA device as well as the necessary USB devices
>> --
>> 2.17.1
>>
>>
>>
>>
>
> 
>
