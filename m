Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF75C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 12:18:06 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.21228.1701433080243342245
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 04:18:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j3/NLcPL;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50bd8efb765so917232e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 04:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701433078; x=1702037878; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s1UsonlduB02abmqZJytXmav3fUAYxFyOgBc16igdRY=;
        b=j3/NLcPLILOEAaXX0HOj1ARfvqvjbHqpIjl6NUfQTSgLUtHaTJ7b3hbVEIG6+ndx7/
         PooVj7yzRyfK8hHqwy/dqGcTn2nU7L5Zg1NTr7EcOfWVAVNMKCUrRb8cYD4ttCBUaf2U
         EhTA02gHeuOnR+kNhyYmsE8l8lbDZ6uorjX/HwVHN/WITXGZxvxdN+f3U75tcjli4uHg
         vqn5R0Tjede4xucqPPdidOEABjPWsz/eQ2zuXFjyJiaym9BEGRevYW3zY/qsNvD5buVz
         1t4QP0VUXJyfGgqllUveQIjk/Uv8g5yp5f5tCNh01rrEnSocBLV56Kt8XRN0Eaht5mzd
         oLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701433078; x=1702037878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1UsonlduB02abmqZJytXmav3fUAYxFyOgBc16igdRY=;
        b=ZuUY2K4me9rZexZynA0dtuv1FZwtH3GF5PPWmB8UGuOQe2TDFKrk4z5mhtPPohog9A
         49sMDJwWSpGhckvTeeOkUrU5NqLTzsSwRKi+xEcb8v3OhOxynRsAf9fRTEv+buCCde8y
         eA+1lD4ZgpQhWfBGtrxSwkyI1rMJo5pr9bpSAtp4hihm20eYU/CHIXAxnHgnBApwztw3
         ifHPP9eGPxXXmSjcL+XMDCTWE6yUydsLSdZXN2UYrjrJm2VgMNQU81mMQLyp8mbpp3NK
         JS86wXV/cdm5JG4+M4V6EBYrI/Q+e0HfQQ6hLTC+5Be+LxgK5dhoo3+TRPIgPNY1eNJ6
         PoAg==
X-Gm-Message-State: AOJu0YzPMgbeK13J+5tJU0uPy/ChsONFQjvySqfr2IbFD4TlTMnFHVfF
	T8lblpNSwORUu/3d80X1SxS/NCV1teMGLWDKdJQ=
X-Google-Smtp-Source: AGHT+IGy8bhEoLwC3DYqwmmtaj9Any8PTUlp+cFZi/jZ0+6CcnJPMhNH4iE5573eZ4R5r4P1J9ITLRs07s00O8dTmM0=
X-Received: by 2002:a05:6512:407:b0:50b:c407:88f8 with SMTP id
 u7-20020a056512040700b0050bc40788f8mr716979lfk.31.1701433078133; Fri, 01 Dec
 2023 04:17:58 -0800 (PST)
MIME-Version: 1.0
References: <20231127101751.3187950-1-alex@linutronix.de> <20231127101751.3187950-5-alex@linutronix.de>
 <91187fbd5c1bfeb33b7e1bcd8c2afbf324bb3c90.camel@linuxfoundation.org>
In-Reply-To: <91187fbd5c1bfeb33b7e1bcd8c2afbf324bb3c90.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Dec 2023 13:17:46 +0100
Message-ID: <CANNYZj9cAo2e2bOOtg6t5MH-MiJ4=iCWP+B-uUmANsPsivTDUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/19] usbutils: upgrade 015 -> 017
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 12:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191571

On Fri, 1 Dec 2023 at 12:49, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> This looks like it removes WORKDIR, not CFLAGS so it doesn't quite
> match the commit message?
>
> I think it might be wise to put a comment in the code here saying
> exactly what its doing so we can know in future too.

Yes, it drops WORKDIR from cflags value in the .pc file. The commit
message wasn't accurate.

Alex

