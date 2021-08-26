Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.28355.1629970965730253597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 02:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hNv1/eO8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id z4so4025592wrr.6
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 02:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=kIospjk2+ZFWF56NcfrSxqjfN70EJg7aQ3TaUM2U48I=;
        b=hNv1/eO814edj48LiB+9OHCvJXp0vs4DQe2onKlkrvECXEU6wcKOtMSNt5MlLBWnZd
         VyDuRgFp8SMkLTNoU1XvwIWWRZggxoBHm4hf1EUeGG/u9uGWFmKU4rv+lgRiTXFx6xAT
         6T3nINAoXGz0X5TQ2xX05AwJS/B6czudzmbHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kIospjk2+ZFWF56NcfrSxqjfN70EJg7aQ3TaUM2U48I=;
        b=Eww+NxPNHE/Rom8R4864s+AzvCe1DeA2ylVscKPVaKe3YIT1/OcZRoMVSHB7TE1Wu3
         yGkBmYLDIHdcMoMLQWrPh+DxggfupWVvmHBTU5ZvMGyiwEsJJQ7fHu2uj3Qu+s1+5sVm
         6918+6gt5yD1ctANnnol2c0UawdhmCno3alUulvsCe9MzdkxXDKn3rdptNRZb2kpmb7D
         hXti95NWUcme5t2jTHq+aCqL13LK9dDWI2MGSYhbbRKKgNUPVBMxDiy5x+khGaQb96xd
         P7gbgoPTTJdkQzd33E1Fn4fY2ln1XUuZj1QumdpHp//zKydq/pjekI7YYEo8FluPqUej
         qBSg==
X-Gm-Message-State: AOAM5303bZmOF8M8dRqkFG0iWlfqzWCjiIYNrofA3ZJNvec3ePg47Lxi
	CqJf6DD8JCgHK4OMDpRu2OEwqzwNM+nW2g==
X-Google-Smtp-Source: ABdhPJzpbkqXLqX+y8+8nJ6/On+EA2bo9bVVsVuJizPgz907akf7JC7SM1p1fHLP4p80jVlJzA/wNg==
X-Received: by 2002:a5d:658e:: with SMTP id q14mr2825670wru.142.1629970964151;
        Thu, 26 Aug 2021 02:42:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4? ([2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4])
        by smtp.gmail.com with ESMTPSA id f20sm3569758wmb.32.2021.08.26.02.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 02:42:43 -0700 (PDT)
Message-ID: <8a31a69ce20c28685294a1e3c6b289f6f5c38629.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemurunner.py: print output from runqemu/qemu-system in stop()
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Aug 2021 10:42:43 +0100
In-Reply-To: <20210825223552.802130-1-alex.kanavin@gmail.com>
References: <20210825223552.802130-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-08-26 at 00:35 +0200, Alexander Kanavin wrote:
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
> index 5c9d2b24a3..e099c6e2a7 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -535,6 +535,8 @@ class QemuRunner:
>              if self.runqemu.poll() is None:
>                  self.logger.debug("Sending SIGKILL to runqemu")
>                  os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
> +            if not self.runqemu.stdout.closed:
> +                self.logger.warning("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
>              self.runqemu.stdin.close()
>              self.runqemu.stdout.close()
>              self.runqemu_exited = True

I like the idea of this but it is showing warnings on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/3877

So we may need to fix the issue it is exposing?

Cheers,

Richard

