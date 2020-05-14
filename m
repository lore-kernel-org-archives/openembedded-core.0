Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web12.139.1589472989689600833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 09:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=aHH5wbUa;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.196, mailfrom: brgl@bgdev.pl)
Received: by mail-il1-f196.google.com with SMTP id j3so3841388ilk.11
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 09:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VO/zxt/0sqxq6bhZCXDRb/tTEUQcH3AQmyMI5F6syeg=;
        b=aHH5wbUaDgWbIMen/CV/XBerE3faM3/aEqa16tmkFHU2qN5W+NjxasEuN85+0lijS1
         fltzWOQ8oQ97+x+zDAA30g/pgf44qlBBXfzpBaLbAHhP6RwVizt1Qkc0p9yvDUaRUbUX
         73h1PCFFRrIvqMP2DV/eeW/F2wM1YcoEjiOWW5ENbQ8S2BJvXQxxwg85s1nAJZ3S8JWA
         Qvbg3DKxd8eKzW9WXQ6SK90kSdDNjqmaKbAUB/kmRuprPBOgQ+j/xtnQa6gswY32lpgi
         MCdKiNLcqHmN+pQYs7ewpbYt3s5H+sjZKvmCC4TLnka8vgl/VLfbP1X/Z/lJChGaElk6
         g3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VO/zxt/0sqxq6bhZCXDRb/tTEUQcH3AQmyMI5F6syeg=;
        b=Ku6ISHG+wodHYiqvHp4D+70C1/LyrdV6fkphnjVGUKos/5J0aKDj/XJ69wH87EazGm
         hP5BMOcOj/pI5iGcgMPA6JX7E6Lgw21KntR3/rgsYLvxxXek9saTtXVCFAauCkHqz5Au
         CHwPs2AMJ3ID1GHXiizp0fKN5SKeNen68HzqKONlzBgdruWj1tviurjJ8TzUDp3YqoAt
         6LHph/pQbpMvYkPLd8+Qm3vFFytc890MhZWwOV2QYYyRcG3+C3cGU7w0o0xLn5J+1d6Z
         y/Y4cPtjPx6NIJbnkhhwGBX0dWlsiY3V+ylro6pLJ6Rek98ALtKcM27U2x7GPyDot97i
         fcIg==
X-Gm-Message-State: AOAM5314pwgpjk8ylCg5PIPVDbHMOdwAPzkfRtKdD9XfeLzXk7UCtSdX
	3Cajm3R5URm+cWFpgzz8eVSHMW4bxmDJ8nd0+Qixjw==
X-Google-Smtp-Source: ABdhPJyvVoRIMcKlaSuTFzieBF2jrThCCYPOp9TPgvquWxtVKyUjefHeS7GOOrB8Df+3u2K8tlcxJ1npeZqxipdf3LU=
X-Received: by 2002:a92:d946:: with SMTP id l6mr5800184ilq.6.1589472989151;
 Thu, 14 May 2020 09:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200512140529.27606-1-brgl@bgdev.pl>
In-Reply-To: <20200512140529.27606-1-brgl@bgdev.pl>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Thu, 14 May 2020 18:16:18 +0200
Message-ID: <CAMRc=Me-Ek8d181vzfhi44cMmRsu=Qw1HiErCpjiWZGxkc5LCw@mail.gmail.com>
Subject: Re: [meta-OE][PATCH v3] image.bbclass: deploy image artifacts in stages
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Armin Kuster <akuster808@gmail.com>, Jerome Neanne <jneanne@baylibre.com>, 
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wt., 12 maj 2020 o 16:05 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Make each IMAGE_CMD task an sstate task with its own IMGDEPLOYDIR
> override. This way each generated set of artifacts is deployed as soon
> as it's ready instead of the do_image_complete task handling the entire
> deployement. This allows us to better fine-tune dependencies e.g. we
> can make do_image_wic depend on fitImage task which can in turn depend
> on do_image_ext4.
>
> We need delete the IMGDEPLOYDIR variable from the data object passed
> to each image task so that it gets expanded with the correct override.
>
> In order to make sure that tasks added to SSTATETASKS in anonymous python
> functions are correctly setup, move the code that assigns pre- and
> postfuncs to an event handler invoked on bb.event.RecipeTaskPreProcess
> in sstate.bbclass. This event is fired right after the anonymous
> functions.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

Hi all!

I just noticed I tagged this patch as [meta-OE] instead of [OE-core] -
hope it's not an issue? Should I resend it with a correct tag?

Bartosz
