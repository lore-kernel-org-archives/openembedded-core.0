Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C9FC021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 09:09:38 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.6943.1740647371283111761
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 01:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xrxREXMV;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30b823cc44aso6370181fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 01:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740647369; x=1741252169; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vmKqHWdVo5vNVejnz+BJ2fyqJVC/ZDDWD3OQ/qmwC9Y=;
        b=xrxREXMVBk/4LvWDI6h0GK0pOD5nYBYT0Gip8Q12WcAxMW6NyLp+MiCi4o6jW3ln4E
         70Lltk69w0WokrEJFB7kRG9lE2tfHhNFSjuZqTgo6rlejL7jZasPI4OOs6gRxYKANrxz
         ePz0VEk6MMsVRvbFLXYZmVYfdAdzEZZrblf2GDwhrht0l+nB8s9NLbNvOmzMjhQAuOSe
         DiOwg+FrSMOsGvjc5+fJ3XB0HcL1zIkBCgGDdR80+SzLLI90FLdp4VcfJpGP6H9LFgk5
         X0uxbvKqUVWdTVELJbkEcBY97SMlIb9BjSAGnBTY9j53Rv20mslXlMIFHW6ubmP+oXJe
         kWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740647369; x=1741252169;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vmKqHWdVo5vNVejnz+BJ2fyqJVC/ZDDWD3OQ/qmwC9Y=;
        b=uiT4TfGcb8cr4EQ1LXy3m+o9P9cZ5NkAhR+t9c6WUckebh4UOduruwRDQTKg+GDhEQ
         C44cT51ekGIFJbHXATh1Zk3oaJGQhaxORW6qnCqDk8zJjJwglAyNVG+851Zn35ZHy/A9
         JCq1EhtNpXEFqKHR/+zosk68fHJC+aBuXi3xL3g2z86kmjlVpHyC88M0bg+RLMdCDA1F
         ruaHf100ti+zpCk9Y0PRhaysxu+gtm5d1TebhlGCN6Jzys5M7q97z5wktnx9xQtUsrXM
         QOiUi35fRAkTDn7Al7tgY7a3jdpfW6GxyEBOMyXbTxmga2hspzb53YoZrav+mHYOEhqk
         TinQ==
X-Gm-Message-State: AOJu0YwjFAlefALzDNwxuXnoX3gOUlLjXMm0QDbRDKF0/xWbMFvepZgZ
	gEEarEQ7O84x6BtNlETMUFpO9KnnEH4jqtwksFVKxw28PnNq5ZMDEEbvCPmfwho=
X-Gm-Gg: ASbGncvvYuO45i9VSrBI/6ogXOWeuc3TRcUgGFlrfQv1qyiuMf//MRwst+qUsUy/2Cd
	/M+P3Cb06bizvqNzINELA04FJePmEKDZtiKb30YELb82jR+JQQnirXNbkpKnMmzIvCL6UaP546u
	+3Vf1k9o5ClfmRfvPKAvqZ/LMmD3FT7hdqj4u+pANO7Aa4f+7P6gD3NJdwo0C1wxzSfbYCsoR5w
	CYO997HGKEBVbNHZWoMyHTlfwemm7X9LD+LM8StFN1y3m4MbTHthY7QqP8ObpJAWwfBrbbSc8uK
	UwjrG/xu7rfkJKqA4Qox5pUsI1hBwYXtE1MlgQ4H4ID096NQu/5bqAk=
X-Google-Smtp-Source: AGHT+IHgs3tEVhiwk/FDQIJcerPzp7Kw9prelzPnhK7PHEmVe3EwtuYJ6P9XSWmMrs9I+e5jAlD3Og==
X-Received: by 2002:a2e:904e:0:b0:308:e8d3:7564 with SMTP id 38308e7fff4ca-30b7915f5ccmr38384231fa.10.1740647369013;
        Thu, 27 Feb 2025 01:09:29 -0800 (PST)
Received: from nuoska (2001-14ba-466-1f00--133.rev.dnainternet.fi. [2001:14ba:466:1f00::133])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b86878855sm1119901fa.95.2025.02.27.01.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:09:27 -0800 (PST)
Date: Thu, 27 Feb 2025 11:09:24 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Jon Mason <Jon.Mason@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCH] psplash: fix typo in psplash-systemd.service
Message-ID: <Z8ArxMPj19hAs3dZ@nuoska>
References: <20250220082517.2065822-1-mikko.rapeli@linaro.org>
 <11af77e0e16064cb97ab14593d5a931e38694275.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11af77e0e16064cb97ab14593d5a931e38694275.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211983

Hi,

On Tue, Feb 25, 2025 at 11:42:10PM +0000, Richard Purdie wrote:
> Hi Mikko,
> 
> On Thu, 2025-02-20 at 10:25 +0200, Mikko Rapeli via lists.openembedded.org wrote:
> > systemd ignores the typo and continues but startup fails later due to
> > missing fifo file. Fixes:
> > 
> > systemd[1]: /usr/lib/systemd/system/psplash-systemd.service:8: Unknown key 'ConditionFileExists' in section [Unit], ignoring.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/recipes-core/psplash/files/psplash-systemd.service | 2 +-
> > �1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/psplash/files/psplash-systemd.service b/meta/recipes-core/psplash/files/psplash-systemd.service
> > index f9aaa2db3d..b618be1ba6 100644
> > --- a/meta/recipes-core/psplash/files/psplash-systemd.service
> > +++ b/meta/recipes-core/psplash/files/psplash-systemd.service
> > @@ -5,7 +5,7 @@ After=psplash-start@fb0.service
> > �Requires=psplash-start@fb0.service
> > �RequiresMountsFor=/run
> > �ConditionFileIsExecutable=/usr/bin/psplash
> > -ConditionFileExists=/run/psplash_fifo
> > +ConditionPathExists=/run/psplash_fifo
> > �
> > �[Service]
> > �ExecStart=/usr/bin/psplash-systemd
> 
> With the systemctl patch dropped, it exposed another psplash failure in
> meta-arm again in my last master-next build:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1036
> 
> So I'm not sure the previous issues were fully resolved :/

  File "/srv/pokybuild/yocto-worker/meta-arm/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/meta-arm/build/meta/lib/oeqa/runtime/cases/systemd.py", line 100, in test_systemd_failed
    output += self.systemctl('status --full --failed')
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/meta-arm/build/meta/lib/oeqa/runtime/cases/systemd.py", line 26, in systemctl
    self.assertEqual(status, expected, message)
AssertionError: 3 != 0 : SYSTEMD_BUS_TIMEOUT=240s systemctl status --full --failed 
x psplash-systemd.service - Start psplash-systemd progress communication helper
     Loaded: loaded (/usr/lib/systemd/system/psplash-systemd.service; static)
     Active: failed (Result: exit-code) since Tue 2025-02-25 17:25:22 UTC; 12min ago
   Duration: 528ms
 Invocation: aa5767bf98e343ad9747b82b323d1ddb
   Main PID: 265 (code=exited, status=1/FAILURE)
   Mem peak: 1.1M
        CPU: 163ms

Feb 25 17:25:21 sbsa-ref systemd[1]: Started Start psplash-systemd progress communication helper.
Feb 25 17:25:22 sbsa-ref psplash-systemd[265]: Error unable to open fifo
Feb 25 17:25:22 sbsa-ref systemd[1]: psplash-systemd.service: Main process exited, code=exited, status=1/FAILURE
Feb 25 17:25:22 sbsa-ref systemd[1]: psplash-systemd.service: Failed with result 'exit-code'.

I tried to reproduce this in 10's of test runs looping over the test.
I started a VNC server like in the autobuilder

$ vncserver -kill :1
$ vncserver

and looped over the tests with

$ DISPLAY=:1 bitbake -c testimage core-image-minimal core-image-weston core-image-sato

psplash has two services: psplash-start@fb0.service and psplash-systemd.service.
Both get started by udev when /dev/fb0 is detected. psplash-systemd.service is always
started after psplash-start@fb0.service which creates the fifo in /run. Both services should
be started after /run has been mounted. psplash-start@fb0.service uses sd-notify to tell
systemd that it has started after the fifo file has been created. The missing
fifo error from psplash-systemd.service means that psplash-start@fb0.service failed but it did
not, or exited without reporting errors. Or the /dev/fb0 disappeared or stopped working, which could
possibly be the vncserver failing. If the vncserver fails, basically disconnecting
a "display" from the qemu machine, then I think this is test setup problem. The vncserver
is used from build host, not yocto build.

If vncserver is not running when qemu is started with graphics, the startup does
not boot target to working SSH. If qemu was booted with graphics to the vncserver,
then stopping the vncserver hangs the full qemu machine. So I think fatal issues
with vncserver should be visible as different kind of errors.

The psplash-systemd.c startup is really simple:

int main()
{
        sd_event *event;
        sd_event_source *event_source = NULL;
        int r;
        sigset_t ss;
        usec_t time_now;
        char *rundir;

        /* Open pipe for psplash */
        rundir = getenv("PSPLASH_FIFO_DIR");

        if (!rundir)
                rundir = "/run";

        chdir(rundir);

        if ((pipe_fd = open (PSPLASH_FIFO,O_WRONLY|O_NONBLOCK)) == -1) {
                fprintf(stderr, "Error unable to open fifo");
                exit(EXIT_FAILURE);
        }

But this does not get started if psplash-start@fb0.service did not start correctly
so it must have, and also psplash-systemd.service only starts if the fifo file is
in /run:

After=psplash-start@fb0.service
Requires=psplash-start@fb0.service
RequiresMountsFor=/run
ConditionFileIsExecutable=/usr/bin/psplash
ConditionPathExists=/run/psplash_fifo

Now psplash-start@fb0.service can fail or exit and thus unlink() the fifo file
if there are errors and its main loop exits. This can happen at any time
due to /dev/fb0 errors, signals or when something wrote "QUIT" to the fifo.
These errors are not captured and return value is zero.

I propose ignoring these errors in psplash-systemd.service. It tries
really hard to start only when /dev/fb0 and fifo is there but can't handle all errors
from /dev/fb0 going missing or signals being thrown at psplash-start@fb0.service.

The progress bar is effectively "best effort".

Cheers,

-Mikko

