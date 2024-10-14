Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF73D16250
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 12:13:56 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.53533.1728908035283318741
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 05:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wwttDiph;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb587d0436so2799431fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 05:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728908033; x=1729512833; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GCiH25yygcJoM+dU6Yw1kGnGsrc7jJsGCAlx+4/XqB4=;
        b=wwttDiphYwQl5nbwzZKTQ7gJxH4CGdARRB+8bYVlnDWvCRlLinQFrw1vkDMTeLz0/6
         sVLM8QlEsz4WWbYHqD8sWms97UKOIVB6fins7RGS79K983jaliGUDnb6x3HqZKghqThq
         DLbkoPxaNm0K57QGzUW9b377KOnR6E9JVDs+ov5KvonyQuLekDRHZseuRtTshSukmdxR
         gbGVWp4QjHuJFX+M9aHzN/Xvh3eskYvqLnlK7Dy1zawWgrhiulWGjuq0rKFttr2Z3MAn
         VTZj25XmQSvL1Mo5eMgi6JaT//SR8v6KLI8DOiPKXzu9T7RA4ve6X4dyGlrdTJG/ePar
         3WpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728908033; x=1729512833;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCiH25yygcJoM+dU6Yw1kGnGsrc7jJsGCAlx+4/XqB4=;
        b=uG+a4MNno81+7pAS8fP172sCx6Ili9B8W+1/vYMjE3FXOhX+F62umYTTOerjfA5crA
         xF2EvoTTfloe3gFJsSzAY/ABp0sa0CU7IyAa142dZDOZHP0r1POkV/rSh5c1IWQJKcUp
         dki52HYn2x0seyqazYupXXkBtfKhxtHU9bLh/QA88j8waJwmYOBECslVcjBlj0Qnj9hg
         bpBEqbA5uNeL15p4o1r0WLnCBRlo+TrqDtMy1uDm2pAYJ5MD22w3UqUh0FjvBnPmKygV
         +duPNAeyNLwG0h/haPPO8tHoQOeJ9EkPs6sihNbBsXL9jER77Zdai0mEsbpu35tEOvHA
         rLGg==
X-Gm-Message-State: AOJu0YzG0kdxCLmDHHxykNpHWN/nlC+lyonczg/Ju3Ww+jIpJCwilrLb
	aV+rbg6qTog+/g1jz/f7BLvkgue0a+IQpo86KUbMw8sYofTB7AyFLfAEELE8yI4=
X-Google-Smtp-Source: AGHT+IHqZZUK9yEh8XM6+GrKEqkc1BUx/SRJCRxgxb8HcEZfvKLe0GIJxO+D5WrEJ2kq20Sc9xSWlg==
X-Received: by 2002:a2e:702:0:b0:2fa:d67a:ada7 with SMTP id 38308e7fff4ca-2fb3f1b764amr27275411fa.23.1728908033284;
        Mon, 14 Oct 2024 05:13:53 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb4f83b7b3sm3999701fa.87.2024.10.14.05.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 05:13:51 -0700 (PDT)
Date: Mon, 14 Oct 2024 15:13:48 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v8 0/8] systemd uki support
Message-ID: <Zw0K_OPE5NanphKj@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-Ehb-nQfeJ0sKX0rACDbWPT5820weVNtQ9psd800d6yA@mail.gmail.com>
 <ebd022b240f4bb6b8e2e2fb8d93a4c9f2ba9492f.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 12:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205761

Hi,

On Mon, Oct 14, 2024 at 01:42:46PM +0200, Alexander Kanavin wrote:
> On Mon, 14 Oct 2024 at 13:39, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > No, I'm not able to reproduce the problem. Maybe I'd need to share the sstate
> > to another machine or user to trigger this. Just changing build paths
> > doesn't trigger the problem on my build machine.
> 
> Can I see the link to the autobuilder failure where this was observed?

Yes:

On Sun, Oct 13, 2024 at 08:43:15AM +0100, Richard Purdie wrote:
> I'm still seeing failures in CI:
> 
> https://valkyrie.yoctoproject.org//#/builders/23/builds/249/steps/14/logs/stdio
> 
> which is despite setting:
> 
> https://git.yoctoproject.org/poky/commit/?h=master-next&id=6211ad9210e82a5a8dd157c63752ad332c2f5de6
> 
> QEMU_USE_KVM = "False"
> 
> into the test to ensure it doesn't have the issue the barebox testing
> was seeing.
> 
> I've sent a patch to try and clean up the lock error.
> 
> There is also this:
> 
> https://valkyrie.yoctoproject.org//#/builders/76/builds/235
> https://valkyrie.yoctoproject.org//#/builders/48/builds/181
> https://valkyrie.yoctoproject.org//#/builders/54/builds/230
> 
> which is due to the binaries being run "in tree" within the edk2 build
> as well as from the sysroot. This generates two sets of pyc files which
> then conflict (or not) depending on which host the build ran on and
> which pyc files are in sstate.
> 
> We're going to have to get this fixed before it can merge, probably by
> deleting the pyc files at install unless we can find anything more
> elegant.

After few experiments failed, I went with this.

Cheers,

-Mikko

