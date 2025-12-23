Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA17E6F082
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 10:21:33 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98417.1766485292130808780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 02:21:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YNYQ60HZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88a34450f19so55344976d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 02:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766485291; x=1767090091; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I928BDYOgF+h17cp+kE/Y7xBhpY7K14MQs4vrvURkOg=;
        b=YNYQ60HZAI+4llYxeSaMOfppP7+JSPqsSJGssSunAjMuE4vyqTqnrNYgmPweH/XzY5
         vQGVHUQrJ/i9Nls4fdAnGTXop7+MycXhb3IqbPTibww8o4PzZLy23cjcuYMP4dwToDPb
         lWGt8MGDiXaNbN5FWzkk6G+8K8YkujOGMQFrvq1g1VvZsQKiHC4phlILbEzmVkBIoKu5
         XSJo+PM7JLrivBVjOqSwzaObMBZwb1oQ0iCsihO1TOy8xrQHpqY8FbSgOGR+VXurwaHO
         sFQsH8eFyMOiAdKSNcusSAQacE6w0MbAp2bXdPvV3B/AGsHMES4ytnLx+KdlU78nN5FY
         LrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766485291; x=1767090091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I928BDYOgF+h17cp+kE/Y7xBhpY7K14MQs4vrvURkOg=;
        b=VHybSB7nWl6gL1Oc9H+N5vnJBERokgCWnNNionT6jBhO82RR4Ou/B7evHFqHiCmMWk
         ehUXdTVcN3ab1A1Tw0Mgfikt8Tk1z0AoB3+dq09ESABtfsjr0JEC0uaLTlY7mfJKIuc/
         iyXqCphxzRWSCwahmZKansdhvOsu5e6L244KQmuEc2/mGB8C1/E7bPwg26nJWPLGgM/L
         TO1yHGR5htby5ONaZECrfZSENHZWh5pP8q5bgz2C//f98BuLRde9ltwrLWOqs+xjgHYx
         8/4s3wZtybKYCNoj+iqMmpgqVo6a/mfdXkYsocp2KiT59Xyi95JkXTFPXSI5RbhYZ1k6
         rnQQ==
X-Gm-Message-State: AOJu0YxMgHYBq4k5hw11HOVncPhXRL122S2g4Sbuh3tIt5hEztDHBnhK
	aRUPSVa9r8Swz47qT23mcH3e2fQBdj/ta37VpWWxS93c0/Qm6Z3NYNAg9LD+lJC40/LixR/4tZz
	dvK2SxOWTaqTf8VMASi6kbdivZF9BCshRTHq6
X-Gm-Gg: AY/fxX6sK2y/8TIc/S5ubflAh3OHa5VtkzaI/JLBHYMwOTpYtuJ4hUmKxTG+80UXxN8
	ziZLKw4hbR2dbTDAzYu4uWeZR342j//hFhHM3jvdmw5PKEdqT1VW+roPBlaJcLgPicZNpsHcQ9F
	IzGLZqeJzbPsG+fO8VgJNtfmlpMRmIKwBu1N7WKx0j78FK51NNT1d3EaDkoMk3afmwQI+c7+c0u
	K9eyrdICvVscWTkcOAseA1Iy/pGkkl8lsdUDxJcfamB+omkndMTzUXNswUNozer2C/kiHxjTkVG
	7mLX
X-Google-Smtp-Source: AGHT+IEXSPvh/bsUcD2Jliq4pu9teSDrk5P8fT7SVwiezmYDQH/+fNIOIB/sp1U0YOHMJdbrMHqk5kD4QXDjQzEnHb4=
X-Received: by 2002:a0c:f7cc:0:b0:88a:529a:a53a with SMTP id
 6a1803df08f44-88d83d66f52mr142993946d6.51.1766485291016; Tue, 23 Dec 2025
 02:21:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765878985.git.liezhi.yang@windriver.com>
 <1fc8161d254e37709e63cf9d07ebd32a2f1023cc.1765878985.git.liezhi.yang@windriver.com>
 <CANNYZj8=3egJPC3dT1bc-9n=38-OAyAKfwb81mJjuiSiqVcaQw@mail.gmail.com>
 <b127705e-0b9a-4a5b-9fcc-c3014e4c680c@windriver.com> <CANNYZj8c1DRLJfxZMVVT3fx2Db8fnUc8A73_pE3AasKRMQ6U1A@mail.gmail.com>
 <473904dd-5f19-4331-91a3-4ccdab694c1c@windriver.com>
In-Reply-To: <473904dd-5f19-4331-91a3-4ccdab694c1c@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Dec 2025 11:21:20 +0100
X-Gm-Features: AQt7F2pClitnzI4NPVJWQP14g_ZK7bryBjh5-NNuvouEuIbavkxNbBMA_XFXnRI
Message-ID: <CANNYZj9sUP6xxkOLauwXuGAZH17HM3zkmAzQHSp5vx7b5Gy2VA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] strace: 6.17 -> 6.18
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 10:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228463

On Tue, 23 Dec 2025 at 08:36, Robert Yang <liezhi.yang@windriver.com> wrote:

> > But we do run strace ptests, and they do not fail, e.g. with latest
> > nightly master:
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2761/steps/14/logs/stdio
> >
> > Does bitbake -c testimage core-image-ptest-strace fail for you? How
> > did you set up and ran the tests to see them fail?
>
> You didn't see the failure is because core-image-ptest has PTEST_EXPECT_FAILURE
> as reported by Qi:
>
> https://lists.openembedded.org/g/openembedded-core/message/227411
>
> I can see the failure after applied Qi's patches. Or we can manually see the
> failures via:
> # pest-runner strace

Even without Qi's patches, if a ptest failure happens, autobuilder
will report it as a warning, and for 6.17 those were not happening
either in autobuilder or for me locally. But 6.18 did indeed start to
fail in the two bpf tests, so we had to patch them out:

https://git.openembedded.org/openembedded-core/log/?h=master-next

So there's probably something in your configuration that triggers
those fails in 6.17 that doesn't happen in standard poky.

Alex

