Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85968C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 21:51:33 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web08.747.1657057889621687206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 14:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nt95OA+L;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id a39so16181226ljq.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 14:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i0cNGx1A79ot/U+jrt24ql5RtbGqB6Qx4WO3eh4cv74=;
        b=Nt95OA+LkWL/Ta7lrqKYEh5ZZ/UQiLKz686zlegzuYQ64J+b73ONHXmpQj6h6diAe1
         aS6vrDRMBeUECqRZ/HOX6Dcb4GHJuT3zaZe0eWFpQZmJs8HI83W0pBsewnM86TmbXNI1
         5NH/jQkVtNiEJz5EZotH4bKHLwBZA0tEqaffl27QbOFl4Y7fzlQeIx4K8LJQ+bKa0I11
         gBR2TulBqBe8JkXq+0J89QhJQb7usSKX99D1P/iVBXZYprF6y41tu1kqNfAUZY54s8A0
         Q+Gni5flSyovKhpWv0jfpxooYL2MvGLCeW7o3EGiwNjfisSRSvKD+VaE4LeoDhhFAK67
         iuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i0cNGx1A79ot/U+jrt24ql5RtbGqB6Qx4WO3eh4cv74=;
        b=DNwsPGqtC65tpm5lK/Q0Mxto7byOTu/+hvbsw3HWjcNGO+Yp6z2PUMRyT/A8trTY6t
         dXjLHz8hrniZOLuoPHQ9qeWLUGmXuMtG2iUdwT+S7MDTiqPHI4UF7J54TJXb2XGUS6hL
         HjApRn3IzfNJ3e9NFPKY/AjRS65nAHPZIFYAgpw2JovOSOBkgjIwGoJusNtyv5DKa5Nv
         3wIqFP7tlCbmL7BJxIXZbxIM9R/uXkma8/iWP1bUi8tZOc2PwKt9z3lkJiKCaCKdFHB8
         8++e0PbZAKzrMdMltHG/mX4911tnxwhzAjNB/OuPP0hKVt1hHK6jbS30WbTsmTplmnGK
         1TXQ==
X-Gm-Message-State: AJIora/au+b3lqPkgGETiiDS8+FjQ5wqAjPuSQVSsMGb34vdHZKg63in
	0hrm4ncbF3eQj+yntOsHAz52t3hxTInFN8QL/0E=
X-Google-Smtp-Source: 
 AGRyM1tzxKFOXvrRCOyb04SWH3PcqZQ38JHHGU8gdr9hYhpa/4pdhUaOLC/hLs8w8jGiB38EDeb8+JKs9etysVrB80k=
X-Received: by 2002:a2e:9e41:0:b0:25d:4100:b8eb with SMTP id
 g1-20020a2e9e41000000b0025d4100b8ebmr986808ljk.257.1657057887609; Tue, 05 Jul
 2022 14:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220705163949.770641-1-alex@linutronix.de>
 <38e843d999ac2ee830db7d058395704ac2563a84.camel@linuxfoundation.org>
 <CANNYZj8wqKxXRFzykE_rbFeRRvGTysgi=PEtZHLOYM1Exgmcyw@mail.gmail.com>
 <e7027f1165f7725145722e209cb549e3268a60d2.camel@linuxfoundation.org>
In-Reply-To: 
 <e7027f1165f7725145722e209cb549e3268a60d2.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Jul 2022 23:51:16 +0200
Message-ID: 
 <CANNYZj-EKVYunx2uf9nMrmCKEmg+q6D81Ny7YhVdOTVHQ=TjEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] externalsrc: write task locks into ${T}, not
 into ${S}
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 21:51:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167682

On Tue, 5 Jul 2022 at 23:48, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > I considered adding an exclusion for the lock filename to the code
> > that tracebacks, but special casing like that is pretty ugh. Today
> > here, tomorrow elsewhere.
>
> Right, but the lock was also added there for a reason so we're going to
> have to work out some solution :/.

One thing I don't quite understand is why the lock file is appearing
and disappearing while the task itself is executing? Shouldn't it be
happening when the task queue is being processed?

Alex

