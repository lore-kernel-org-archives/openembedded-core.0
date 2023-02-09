Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254B9C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 09:57:01 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.10768.1675936619061116528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 01:56:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SqfoO1UG;
 spf=pass (domain: linaro.org, ip: 209.85.218.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ej1-f53.google.com with SMTP id lu11so4723758ejb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 01:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q02ItnkHx2YIzo2Y8OrjTSHSKsorlR6dr86lGDw3fuI=;
        b=SqfoO1UGwfTT2HashwDxEvNZkwMRbPfSkIkmK6c4gD3vH/OBhUZYPLX7mWC7mexfbB
         G7jGFqt2mYcfnSEhs3dx3GPX4v9TlCRQrJN4KxxV3+2WEMd6gY5/wTdrGf9MwGwX7ed0
         oVLvFPfGFaCifovIfnV7FB8WofxR92lyciDVH0xdbQ3Kb19oMIXNll6cPcwLjka+aicW
         VhvJIkRVjt6m8CYD1JPV0O1SsQ5dqVqQAjr1D8dCyvkRtAqwFGZDLNmdk/Fcc16EaIuA
         f15xBr63UM6VkP7PzmwPXFzJFTOpFZnt6dj7Tf7VIR+qy95iOtAKL/Y9CBCGVDKqtQwm
         PoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q02ItnkHx2YIzo2Y8OrjTSHSKsorlR6dr86lGDw3fuI=;
        b=npCw++n0dTbRSf/nLxwzzuyncHaRdz1UTRFTNmRYFHsd3xE7plLFSWYMaAHrUgpii7
         q7yPAyCopbYeOPsv0ZHdOMCZPf8elSqP+2jqc1/CN5cdvq7Ql3ZIGnSpghgA/xwcuzkT
         OJ1tRdsACLpU+8P4ow6u5xpuejeta0RM125ubtQe5B3wJ5kBLW2/23tzcvlvmB9EXsBx
         5RIut+5BaRDYpKLnRMmv+7q2smnuvhhObmAT1e8dSFp7ah672OCx59hLGNbc64HsRFHx
         ERsSfxJvUw2UmJzg8U9raccbFeDH+6rED9LNO3m58RTSyS/WUQZcMcz9GaGNmjfr/lEb
         DQqA==
X-Gm-Message-State: AO0yUKU3WDDWI5zyka8lGz6BCVPFvvYkQW9bdEpHpkNhnSwc+U17wbv4
	5XfO06KXZ9ancivcooEOeXXDOg==
X-Google-Smtp-Source: AK7set+Gusx/e97SMSjFstvOrOjP5p8cohDTyraHp5dbIW9sh+DruwPu0YQNb7GMkFU2g7fHiXckRA==
X-Received: by 2002:a17:906:4e96:b0:88d:3c85:4ccf with SMTP id v22-20020a1709064e9600b0088d3c854ccfmr12238337eju.25.1675936617509;
        Thu, 09 Feb 2023 01:56:57 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id f26-20020a170906825a00b0084c4b87aa18sm663445ejx.37.2023.02.09.01.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 01:56:57 -0800 (PST)
Date: Thu, 9 Feb 2023 11:56:55 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 7/8] oeqa qemurunner.py: kill qemu if it
 hangs
Message-ID: <Y+TDZ95lZZKLqsTj@nuoska>
References: <20230209080936.148489-1-mikko.rapeli@linaro.org>
 <20230209080936.148489-8-mikko.rapeli@linaro.org>
 <CANNYZj9KXz8-d-LV+z1Pp7dLkt64C4VGM+CJmTii7Fsnsif2mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj9KXz8-d-LV+z1Pp7dLkt64C4VGM+CJmTii7Fsnsif2mw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 09:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176936

Hi,

On Thu, Feb 09, 2023 at 10:45:36AM +0100, Alexander Kanavin wrote:
> Isn't the code waiting 5 seconds and then sending SIGKILL, regardless
> of whether SIGTERM was successful or not here?

Yes. Not nice but better than leaking the process completely.

> I would actually remove this function altogether. qemu process is
> started by runqemu and it's the job of that to clean up the actual
> qemu process properly.

It doesn't currently. Should the sigterm_handler() also use SIGKILL if
it has to?

Cheers,

-Mikko

> Alex
> 
> On Thu, 9 Feb 2023 at 09:10, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> >
> > qemu doesn't always behave well and can hang too.
> > kill it with force if was still alive.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/lib/oeqa/utils/qemurunner.py | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> > index bce00c696a..8e3484385d 100644
> > --- a/meta/lib/oeqa/utils/qemurunner.py
> > +++ b/meta/lib/oeqa/utils/qemurunner.py
> > @@ -589,6 +589,13 @@ class QemuRunner:
> >                  os.kill(self.qemupid, signal.SIGTERM)
> >              except ProcessLookupError as e:
> >                  self.logger.warning('qemu-system ended unexpectedly')
> > +            time.sleep(5)
> > +            try:
> > +                # qemu-system did not behave well
> > +                os.kill(self.qemupid, signal.SIGKILL)
> > +            except ProcessLookupError as e:
> > +                # already dead
> > +                pass
> >
> >      def stop_thread(self):
> >          if self.thread and self.thread.is_alive():
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#176926): https://lists.openembedded.org/g/openembedded-core/message/176926
> > Mute This Topic: https://lists.openembedded.org/mt/96849162/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

