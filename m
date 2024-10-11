Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFF5D2447D
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 05:58:28 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.5193.1728626298565766558
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 22:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=F9Sxabpe;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fad75b46a3so16555201fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 22:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728626296; x=1729231096; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ccwlDgbsANmXHBOg1Cik8IsunL819BHDcvfd96KGp5w=;
        b=F9SxabpecfXryhe/UB162j3nNpQDOJke0avIElhI2vBQ208Dg+z/hZrHECpQIrsnQG
         Ouham68D1yUP4862193a9eJO7Dbh4XlNPPx6CfWy6NVOX5cShm0ipLOVPO9Xt5JeKhAi
         CyNPvd+Ct8YMltvxRIACPyyBdcm69GpvpniMiq7cmBStNjK31BG9eR77DG4U8/5PuoYO
         IXiBsG5D4FgPWqu+eMr3DqHnheid1cQCnQHjUNX6eBKp3w+xL+8Cp0I75s02s4lafjAv
         7TWiia1xpXoUNUgnKHjM9vm82WpEsQl8mE45FbEQ5m5x0klJqHV9FGBlxTwzLzb8ApCu
         DASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728626296; x=1729231096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccwlDgbsANmXHBOg1Cik8IsunL819BHDcvfd96KGp5w=;
        b=eYwnxAJ7KRTPWvmhVKjYF5lV4TB4CV08FRY0qt1rWovM+gSO7KoMv0Z8gquZXV8OO7
         r6Wq2HDCuRRtTTtsMushF5CVU9u+HEiJAhHgD4CVMca3qFbLvBNoSpL9D+GDO7VGBYGT
         +L8ERbRbpnEdxjgF4Ha0NT5FgUuFY65X1fKsFgendTMYzjwv8wDCImX2eh2OJpbUmPr1
         fxo3HuU2Lp2EZKq7oJVOdC0mPwDLOBDltevaJEWxRyR6CA4Z08nNbiqa432pjrl1Fs+o
         5b4klk8tLpwDJC6CN0HncXlqQySpEyI+1Rzw5qm5c4HuNr4hdjp1uvXFxghCgw6mATGM
         zDSw==
X-Gm-Message-State: AOJu0YyLZWU9MjB05N6fEhWmbWdndEvFJOWzaSkmNqfJ7dXEHt6e+XDh
	pSvn5vYWGZqY+Pabl/tDn2w6nDsM1tdW9uoEkCXtANtVqHrsKzzLEnrr7C8Ay+3fH6b7JGUiaGj
	pZUU=
X-Google-Smtp-Source: AGHT+IFQeRN3+D38N3rAWJbomXSMy30L7irGldRuWUdjfD+JZmGYYR7bWDP5Sbyrbtjq9nNiHPJB6A==
X-Received: by 2002:a2e:4e12:0:b0:2f9:c0be:3b14 with SMTP id 38308e7fff4ca-2fb32ae7c3emr3782701fa.42.1728626296418;
        Thu, 10 Oct 2024 22:58:16 -0700 (PDT)
Received: from nuoska (2001-14ba-7452-eb00--183.rev.dnainternet.fi. [2001:14ba:7452:eb00::183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb247064absm4149511fa.93.2024.10.10.22.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 22:58:14 -0700 (PDT)
Date: Fri, 11 Oct 2024 08:58:11 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v7 4/8] oeqa selftest uki.py: add tests for
 uki.bbclass
Message-ID: <Zwi-c1PagFakB46I@nuoska>
References: <20241010085647.439990-1-mikko.rapeli@linaro.org>
 <20241010085647.439990-5-mikko.rapeli@linaro.org>
 <569C7B3F-87BC-4916-BC1B-429DF573CFDD@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <569C7B3F-87BC-4916-BC1B-429DF573CFDD@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 05:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205658

Hi,

On Thu, Oct 10, 2024 at 08:17:38PM +0000, Ross Burton wrote:
> On 10 Oct 2024, at 09:56, Mikko Rapeli via lists.openembedded.org <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> > +# efi, uki and systemd features must be enabled
> > +INIT_MANAGER = "systemd"
> 
> Yes
> 
> > +MACHINE_FEATURES:append = " efi"
> 
> Maybe we should add this to the qemu machines, as they can do EFI.
> 
> > +DISTRO_FEATURES:append = " uki"
> 
> Fine

Leftover, should not be needed so removing.

> > +DISTRO_FEATURES:append = " systemd"
> > +DISTRO_FEATURES_NATIVE:append = " systemd”
> 
> These are not needed as INIT_MANAGER causes more than a variable assignment, it manipulates DISTRO_FEATURES.

Ok trying without.

> > +            # Verify from efivars that firmware was:
> > +            # x86_64, qemux86_64 = edk2
> > +            # arm,  = u-boot
> > +            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderFirmwareInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep 'EDK II'"
> > +            status, output = qemu.run_serial(cmd)
> > +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> 
> Looks like the comments are ahead of the test here - this is assuming the MACHINE is qemux86-64.

Yes, all tests are for now x86 only. I could add aarch64 but
genericarm64 and qemuarm64 are quite different so would need
to figure out the efi boot issues in both. I was not sure
which archs and machines run these tests. Tests should not
set MACHINE related details, or?

Cheers,

-Mikko

