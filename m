Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.29595.1629979428491607689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 05:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ll+hbPEJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id o39-20020a05600c512700b002e74638b567so2075048wms.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 05:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=UUJADyBKqT7edyUpU72xDf7y3Z4+t4yTQVvwz/7j+vk=;
        b=Ll+hbPEJU03P4E48+LWjyM7TwXXtEYoNe5pNet+KiWiDsQGcf1E30f5TKdPpdH/UJK
         3T6SFkfQbLrrflt/4SGm2co/aPTKR3Zvb7YL7Z1POlBdUMT672xhraGs8qI0yJjDjCBI
         WPD2P9sPQ1BfHWCI5cuGv6La6oQj3gds0iSHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UUJADyBKqT7edyUpU72xDf7y3Z4+t4yTQVvwz/7j+vk=;
        b=gDV7M43plx8O8keBOxUJVN57Ys21WWLJv2lhnbWSWO8OqgvIvzGNH8q8nfm/Be1eMp
         OzOnsvsINmGaflixNeCmqncZ+4dMVGDvh7nSXfrFiUdsMwxUOibJzsBZ2s9iY31Wdk3M
         SawhHny5vXrqtIZBuICxZjxViu72C5sikKayUZ+vxL67eELA0PjadPLuJmW2i8NeL9yg
         mm2wrGf++N0BAinu+j+bTPZue0ekErIqvkBG4AF2qLuX/s9iQUP6XjcEYJvmIAUoWK94
         yAAiGS23KU5KcF93P+UItmUOzKYaZBR1skUlaB2pR6PlERl6Ynw1K2JgeN1Af3o5HMTU
         Btpw==
X-Gm-Message-State: AOAM531nZZ4qdn9GZi2IKB5UBaNU9uqOqQfEWz6sNbfdxmGa9W/LfgFq
	wfRvMRZil7ehleJQ3CBDbmiudg==
X-Google-Smtp-Source: ABdhPJzHpywoC8v3H1boFQ36q1FcOB1FSdD8JUrNUyDKlBmks8rxTFcJAiq6U8mA2THn8ZU2PACWZQ==
X-Received: by 2002:a1c:44c5:: with SMTP id r188mr3361379wma.9.1629979426999;
        Thu, 26 Aug 2021 05:03:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4? ([2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4])
        by smtp.gmail.com with ESMTPSA id g35sm9230867wmp.9.2021.08.26.05.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 05:03:46 -0700 (PDT)
Message-ID: <fc5b311848218b5825de269d31fb08dd2e74d989.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemurunner.py: print output from runqemu/qemu-system in stop()
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Aug 2021 13:03:45 +0100
In-Reply-To: <20210826114517.817267-1-alex.kanavin@gmail.com>
References: <20210826114517.817267-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-08-26 at 13:45 +0200, Alexander Kanavin wrote:
> This is done when starting up qemu has failed, but is not done
> when qemu started ok, but fails later in QMP communication.
> 
> Output from runqemu does contain valuable information to find out
> why, so rather than fix all the QMP fails to include it, let's just
> print it in stop().
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/lib/oeqa/utils/qemurunner.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> index 5c9d2b24a3..204ad8b918 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -535,6 +535,8 @@ class QemuRunner:
>              if self.runqemu.poll() is None:
>                  self.logger.debug("Sending SIGKILL to runqemu")
>                  os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
> +            if not self.runqemu.stdout.closed:
> +                self.logger.info("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
>              self.runqemu.stdin.close()
>              self.runqemu.stdout.close()
>              self.runqemu_exited = True

This isn't quite so simple I'm afraid:

https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/3210/steps/16/logs/stdio

Cheers,

Richard

