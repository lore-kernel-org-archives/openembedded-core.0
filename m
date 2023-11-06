Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18FBC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 13:07:30 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.53243.1699276050076952073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 05:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TiXIscRU;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50970c2115eso1269090e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 05:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699276048; x=1699880848; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FAAByQERkvuFqMeG1H6KgbgtswWAAnG4ONRuNuIjH9E=;
        b=TiXIscRUHdHPVAbcKoy2SkpxUtrtoLxekoyjUIDIgf0z60Ihx2IlZOxcih8kj5wiI7
         ZBFmj9oLpx7h4SWc8YuMrPpeiWlVGkAScMUdhS6hbb2uoVg8xgPOIdit27A2o/MlhaAc
         2dZHBShER0mlJyJEkiviCngFQtDHlg5vbOhR3KqsfHeoeDusyDBhkwcvWDKTPe4wz/EE
         pMbNTssGu0bjwrYC51RG4ZNp+dFCcHx4/YHL3fqxgJo5INvGl85pO9kPrjgYu+XrkLFF
         gMPRD58l4hQaYeH2niAeNZ35nWEIZx1obJSoq0Mz5UcO4RvRcED05FlJR9y9/jQ4xo5d
         CCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699276048; x=1699880848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAAByQERkvuFqMeG1H6KgbgtswWAAnG4ONRuNuIjH9E=;
        b=q3c6Owd3bba0k26EFiIbreliqT8XYECeXvh88nouhmCh4T38tiZ08pvl1fe0zlOO9W
         uLEmdZVg5nAd/huP1Od6J2dGpqjH/kh0NOJI/FYxGvmIhlZkive2TWOdOl5At8vW5xDd
         KQxVTYYozlSrXo9qsCuZYBdwYHNGcsWpJIRw16xQ4pS/OUWDE6tYcX2kDWr/MNT4NH4S
         fH5+Me6Fyeo2O+QEdggmVhnjjciwbKXeL/ULSUJ6j8V6pNi/WXfqkGlEFE88L7qrTW+F
         Ec1kiKFXjwt4qdLKLfYlpeE0MZxBdld1yuMFvT1kW7B84H+TF2sFOD+ORVvpfX6mR70z
         RbJA==
X-Gm-Message-State: AOJu0YyV4ekdXQLxu5gHSQnXMgYgFr5f9ZSuti1Twhvv4DD2Kvk1N+kb
	vMRiv/qB+JD+IBR4gso1uqAWphw+6tm14ICdhm8=
X-Google-Smtp-Source: AGHT+IHcdXnzIx+xHKDQJiy8QkLkMfHvWV9p6o20OJwPsS9ZwYOUm0QA0Bj7y0wtKbYHQVDoiPxBtzp29QHFOoPbuMo=
X-Received: by 2002:ac2:5e84:0:b0:507:9777:7a7 with SMTP id
 b4-20020ac25e84000000b00507977707a7mr21230092lfq.17.1699276047898; Mon, 06
 Nov 2023 05:07:27 -0800 (PST)
MIME-Version: 1.0
References: <20231026103320.2751277-1-alex@linutronix.de> <984be73de92e191166e9dddf95aa9861f346ddcd.camel@linuxfoundation.org>
In-Reply-To: <984be73de92e191166e9dddf95aa9861f346ddcd.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Nov 2023 14:07:16 +0100
Message-ID: <CANNYZj__C98+yFQ54Fsr8HqNL7xaLri6AukWfL0O4CK0in8t2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 13:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190213

On Mon, 6 Nov 2023 at 13:48, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> This highlights two issues:
>
> a) Why is the single sstate siginfo file gone? The most likely
> explanation is that it wasn't accessed recently and was deleted by the
> cleanup/ageing code. This makes sense since the code in question never
> downloads it, only checks it exists and uses that as a marker. Our
> usage "accesses" are in a different codepath to the parsing check.
>
> b) This means -S printdiff doesn't quite do what you'd expect since it
> doesn't skip "covered" tasks in the same way a normal build would.
>
> To reproduce the test failure you should be able to just delete that
> siginfo file from your local sstate.

It is tempting to then not use the 'live' AB cache, and run the tests
against private synthetic cache like the most of the rest of
sstatetests does. Should we?

Alex

