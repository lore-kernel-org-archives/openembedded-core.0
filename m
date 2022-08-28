Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8C2ECAAA2
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 19:16:21 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web09.62323.1661714172068289294
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 12:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DAprB7CT;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id x10so6195835ljq.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 12:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=d/Brh3jojKtaz0rVhaudn4Bz2Dtqx5hKHPGwCDFN5E8=;
        b=DAprB7CTn5FN5g1rNrjpiPUd5uqCjDFVBqqmgTpOtQxYD731NLPDj3IIWckV6GWcaC
         JjX7xFoYGnDS62uN44h/EDATHry9bVnMiaMZsFndrR6H8U2x8//TEE3r5BWktSvWuvA9
         eatjsvQ+1uTDxIL2/hMeqVQX0Ub997Uo1DHwmodv2+lNtWjd5MMjfUQNt1Y1DWwwtAub
         RLaTEKmIm1qOoRLh4kYd08jZkhkvW2wkaOqHgXUG6tb3mOCo2n3IJT/R49AWE5I0AObP
         KNVSgYs5OZoDOFClpo4F4UoV0zfNe2py8RhEo06zT8ol1RYnwlM1gWnim5mjUPZci5Qc
         XHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=d/Brh3jojKtaz0rVhaudn4Bz2Dtqx5hKHPGwCDFN5E8=;
        b=U8KcjGi5Qi9XB1HzF2jE5Mji/YPVRyzjdb838YefdSQXyX8PdPfaJ9YugYNVvQ9uFl
         Z3eM22zCThGfBusgKebwSpHqAKAAdztt8mcxDt/yr01SRv0FzgXtd018posTmZrXIQfm
         v1d0EyZUgk4brlMD/3UsUQe0vUvePEraPpLdwIY6r+JR3zNVC0aQBVRPcBU3sNoMwEob
         a5t6p+h8Fc0ngCVm6J2eRd+ajVHe1FmtAl9mvswF8bi3sNX4KOxKd/rtOGdE+pTt5JPd
         hPrAaGhpjkJT7oD8zurzMLQolsMQSsKi4By5HJXy/HaTstMQcTXY9y1MUXvRsj1vNBZ8
         MhWQ==
X-Gm-Message-State: ACgBeo22rjQUMYLPtsqHCRZhFAbK4Xeuw2lW35rdfVCGNIPtBzu9ickq
	1cviWtg91VA7EVHCHmmmDSgEq8TqZgVOTEY6tbE=
X-Google-Smtp-Source: 
 AA6agR4KsiwZ/MOG3GcRiQ4/Zczf4wFbEd/amL0WRYQGcFVWZyhUZz+gJXBLz8xEGwVmTPEsftUWBoqv+/nwBWy7uIQ=
X-Received: by 2002:a2e:9e50:0:b0:261:e3fd:cdc5 with SMTP id
 g16-20020a2e9e50000000b00261e3fdcdc5mr4748176ljk.56.1661714170305; Sun, 28
 Aug 2022 12:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220828174356.3074391-1-ptsneves@gmail.com>
 <20220828174356.3074391-2-ptsneves@gmail.com>
 <170F981B9326E578.11791@lists.openembedded.org>
In-Reply-To: <170F981B9326E578.11791@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 Aug 2022 21:15:58 +0200
Message-ID: 
 <CANNYZj-1cgL9+5AwSLcKztQt_Cm5tHLg6MFxip7t=ww5qVJHYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] nfs-ganesha: Replace unfs3 with
 nfs-ganesha
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Paulo Neves <ptsneves@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 19:16:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169997

On Sun, 28 Aug 2022 at 21:13, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> All newly added or removed patches need an adjustment to
> maintainers.inc in conf/distro/include.

*recipes* :)

