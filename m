Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E92BC47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 09:13:27 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.8030.1706001200587349099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 01:13:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e5tD14M+;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5100c3f7df1so1482e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 01:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706001198; x=1706605998; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tb4O6QcOu9v21jmyxnMk8p1G1Vi4nPg/KzutBWG0ld0=;
        b=e5tD14M+omaM57yHpc6V6m/GJgYLedJwFMYEQVQQOwEwV1nNQrjiqnKxtOVpw0rkQJ
         Q2XeaSa8DveXTKk2V8URdcJaSgOyd7ql62HdqhBE9mC0Zg9UPpki88NX0S3ydMWTHDrT
         c+kZ8tqY8XQb3Bt0TJGe1zYyRaeZkfrhcmh746uV9OwxQWVXQqDFGnu+Dow4w5+D2Jcx
         3u0TlGnBwJOghel/uWLH/reiwrcw4rr+D4K0C31OlMdSBdZr41YiA1O3QE+7ijoyu0Ht
         kdASkNuPTEpKI5vGfxH6UAvcuhMDZkLYozM1MzRMHS4ACPKA2eGdQ2iHVEcaEEaAFbzB
         KfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706001198; x=1706605998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tb4O6QcOu9v21jmyxnMk8p1G1Vi4nPg/KzutBWG0ld0=;
        b=ap9lAN2Z36aY4nUABe4WugUnMM0nwVEhF0CD8peWu+NiSD4/zkvXmV/GNX/h/8ZpEl
         wwvXcRm+x3Y+ibRl+Fg3DKq2xrDFnmswUaTK3C81r+n9Hkrndi2Nlb9msDqRrzA3pIT3
         P6hz+HsBp8LvnzYMTpeaplSphf+emAJd2T4JFNMMIRxdsNBbd2iCfM3Px0FsHwgjqr1K
         DPyiz1NDDaD4o3DkHQ6FgRwgMv2cygbstzViFl6fLfoIyoU2ChMUVY08ZrDpE1d8g7eF
         xxmZHvByWLB168YYXnQnZ13h0wxqoQXaeA2vHDDbJMXN1vWFHEIIE0eJFER+xp2Y9Wzc
         /n8A==
X-Gm-Message-State: AOJu0Ywp1n3Ld0UGC9U5ucEARjWWR3ZwMZMkDq4B0HOZOGA7y2TNrAV8
	WOdCRbwzcO9dOCqtvVdHMu7sKJ1s3PS1gY6xhRVnYGLkxnfD3DMLDrlCSDoHe/6g27dbuKTKU7f
	pFDMxI4eih8W5D1v9LWf4V8BWKCE=
X-Google-Smtp-Source: AGHT+IFlytZTpbpQrSXShsc+o6vbURv5/ooFaMRTtDoTzkuGk4OkgSzQ58pj3VSmqPd2iJboycgLx8olZjP8T4UMyDk=
X-Received: by 2002:a05:6512:3e25:b0:50e:7c9b:85da with SMTP id
 i37-20020a0565123e2500b0050e7c9b85damr2973781lfv.76.1706001198224; Tue, 23
 Jan 2024 01:13:18 -0800 (PST)
MIME-Version: 1.0
References: <20240119124323.3823059-1-alex@linutronix.de> <CALT56yOPW6akXrH_xyJbgoH_s5nYoMDYLX55H1betVZ+8T_uEg@mail.gmail.com>
In-Reply-To: <CALT56yOPW6akXrH_xyJbgoH_s5nYoMDYLX55H1betVZ+8T_uEg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Jan 2024 10:13:06 +0100
Message-ID: <CANNYZj_qrCvwjeGFjZcaoHJPtPJk1FyU9Rm28kZxMBM8aE37Dg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shadow: replace static linking with dynamic
 libraries in a custom location and bundled with shadow
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 09:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194221

On Tue, 23 Jan 2024 at 02:13, Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
>
> On Fri, 19 Jan 2024 at 14:43, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > Despite our efforts to make static linking work, there have
> > been new reports of bizarre build failures:
> > https://lists.openembedded.org/g/openembedded-core/message/194006
> > https://lists.openembedded.org/g/openembedded-core/message/193907
> >
> > This commit changes back to dynamic linking, but places
> > the libraries in a custom location, per RP's suggestion.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>
> Alexander, please excuse my ignorance. What was the original issue
> that you observed on your build system? I tried simply reverting the
> offending commit and performing the build. I see libbsd, libattr and
> libmd populated in recipe-sysroot-native for both target and native
> builds that depend on shadow-native (added manual dependency of test
> -native recipe on shadow-native).

shadow contains executables for user/group management such as useradd.
These executables are used both in regular tasks and in setscene tasks
to create users that a recipe provides (in addition to simply
unpacking the sstate archive). It is those setscene tasks where
providing library dependencies of shadow is problematic. If you delete
tmp/ and run the build again from sstate, you'll see that for those
recipes which add users, shadow-native will be installed but those
three libraries will not. On some systems executing useradd will fall
through to using the build host libraries (which is a ticking time
bomb and can fail later), on others it will fail outright because e.g.
libbsd is not installed on the host.

Alex

