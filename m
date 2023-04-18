Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F58C77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 13:58:53 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.9671.1681826326966717531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 06:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=D7b97aDU;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2a7ac89b82dso21216851fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681826325; x=1684418325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oVHZCKKvb910oO0UjA4jcHmAeflse/pw6zWQfusFP9s=;
        b=D7b97aDUjdVHlmuPGCvqCHEuRUQi5fyD9BdQqacmCR1g3SXptATgOOuUks4ZG4MQNe
         k875CDGpjHlh4JffGLeZLsZvCzuEvsfCU/RqbqDpKiEqKmhiqPEtyhF3ADKANxWpPG7t
         Z6BoOvOffGwl39p8fI7TjjQvD/lcIgJ/kOeLE6GKu9q9zp7cre4dUD1Cg2ih4TN9BZVP
         JGqebUpPvgWdjP0/6Kg169CTrd0oxYTbBwwwwHO+uPKCZBXsf6ELLqtnmMahu41F8ycC
         w32XoN/BzBb/dYXe7raS6469t5PeRZlxqdEQMAPV+hOQXCHMSI/ZWg20h+3DFiAkwMLw
         ym4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681826325; x=1684418325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVHZCKKvb910oO0UjA4jcHmAeflse/pw6zWQfusFP9s=;
        b=ag6EMq1faYbBdYgCJK8fy2Zdp3xu/eXI1NeCPuUXeJJQpXi8OoOVCCueSznXj5qQOO
         CM2xNQZP2ADLaHHTD9xGxFBrEQ+XEx04StejaXgN2/w+8QmSMEATBUzqAsCtmwagH+yl
         ouX8OEgCeFER1hzzpJZQoRE379vFArZUzr6FCo/3tmZGvolXrGbtWf0N2a03E1jcdpzB
         FYIFoTrCA+8PpzFZhimz6ajnJXA+IKAaliociNI2XGe4TsoBYP5PPZ1Evib3B9o5V7Cd
         FQ2otXMYr/3aUH7R8psB66C68jiT80o9pnZU7jqVSKjz93qXSthmY1n1xNVSAIPhr8tQ
         7gkg==
X-Gm-Message-State: AAQBX9cMSgToOBXNbmkf51eZvX9gIUAoasZ+RduKKwR1WCGLme6qEfJX
	Sy9rQBvB8cTK5iHC2PWYQdj9hg==
X-Google-Smtp-Source: AKy350aRlfuHFQVc/rJmVi3poBi1pz4Egfe3pKLJ3KjYAgoaadqJr1eH0PCpgmr46xxKeCc5lj471A==
X-Received: by 2002:a05:6512:3c4:b0:4dc:82b0:4c68 with SMTP id w4-20020a05651203c400b004dc82b04c68mr3163540lfp.50.1681826324638;
        Tue, 18 Apr 2023 06:58:44 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id u3-20020ac25183000000b004db513b017esm2386417lfi.45.2023.04.18.06.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 06:58:44 -0700 (PDT)
Date: Tue, 18 Apr 2023 16:58:42 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Pavel Zhukov <pazhukov@suse.de>
Cc: openembedded-core@lists.openembedded.org, pavel@zhukoff.net
Subject: Re: [OE-core] [PATCH v2] scripts/runqemu: Add possibility to disable
 network
Message-ID: <ZD6iEnk+NNrrFoF8@nuoska>
References: <20230418133325.3860559-1-pazhukov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418133325.3860559-1-pazhukov@suse.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 13:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180190

Hi,

On Tue, Apr 18, 2023 at 03:33:25PM +0200, Pavel Zhukov wrote:
> Default network configuration requires tun/tap module and while being
> usable it conflicts with tap devices created by VPN clients sometimes
> and requires root permissions to use . While it's possible to work
> this around it's not always feasible if network is not required
> Add nonetwork option which can be specified if the network connectivity is
> not needed and SDL/serial is enough to communicate with the image.

Using slirp networking is also handy. Only needs localhost to be up.

But having option for no networking at all is useful too.

Cheers,

-Mikko

> Signed-off-by: Pavel Zhukov <pazhukov@suse.de>
> ---
>  scripts/runqemu | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 4c06cefbff..56715c3e1e 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -66,6 +66,7 @@ of the following environment variables (in any order):
>    MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
>    Simplified QEMU command-line options can be passed with:
>      nographic - disable video console
> +    nonetwork - disable network connectivity
>      novga - Disable VGA emulation completely
>      sdl - choose the SDL UI frontend
>      gtk - choose the Gtk UI frontend
> @@ -178,6 +179,7 @@ class BaseConfig(object):
>          self.serialconsole = False
>          self.serialstdio = False
>          self.nographic = False
> +        self.nonetwork = False
>          self.sdl = False
>          self.gtk = False
>          self.gl = False
> @@ -495,6 +497,8 @@ to your build configuration.
>                  self.check_arg_fstype(arg)
>              elif arg == 'nographic':
>                  self.nographic = True
> +            elif arg == "nonetwork":
> +                self.nonetwork = True
>              elif arg == 'sdl':
>                  self.sdl = True
>              elif arg == 'gtk':
> @@ -1224,7 +1228,8 @@ to your build configuration.
>          self.set('NETWORK_CMD', '%s %s' % (self.network_device.replace('@MAC@', mac), qemu_tap_opt))
>  
>      def setup_network(self):
> -        if self.get('QB_NET') == 'none':
> +        if self.nonetwork or self.get('QB_NET') == 'none':
> +            self.set('NETWORK_CMD', '-nic none')
>              return
>          if sys.stdin.isatty():
>              self.saved_stty = subprocess.check_output(("stty", "-g")).decode('utf-8').strip()
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180189): https://lists.openembedded.org/g/openembedded-core/message/180189
> Mute This Topic: https://lists.openembedded.org/mt/98343907/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


