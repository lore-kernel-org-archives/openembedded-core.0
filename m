Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBF7D3B7F3
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 12:19:32 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6416.1765282765779769453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 04:19:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=St7/TLpS;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b2d56eaaceso529204585a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 04:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765282765; x=1765887565; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BCs34qLK09XWL0BxFIG72AhnxUNovrd1ytZeAGVvrws=;
        b=St7/TLpS2RHCv9l9gJaAspSAQNQM2w8iW1f8seb7WwVgGbqVFiBhwb/TCYShHElyMG
         ewbr7xqOrdOvN59bX5oEnzrig6zzw1fVxVxen+0C266ldUo47xZjZDvtoPeMK/SjDDLU
         XC4/KI0/w/pTnJn+hET3ORDA6PKzNrO21zDhrSMyMY8BtdZiY8Vo/XgpJW5Q+Ghyryd/
         mLj0qTS1EE4l6PJKpVpGpfCMDiDW/LVNgrOZ62sET5U1SZsYjW3/A3Qsomzvp1yCn34F
         HFACtha1zkbcgS1IKpffuCNqs3eNtvAQIZibCdNCHP+K3mN79cyRkLlZSCai+OhNRUDt
         0hUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765282765; x=1765887565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCs34qLK09XWL0BxFIG72AhnxUNovrd1ytZeAGVvrws=;
        b=EwW6CUvp3ESpKI+AZQzY5uWsXIBxBS3YiF4F98hhjmrcrZOYpNQOBNGsZChbp2GRAJ
         wNH4bLGDeoFZUVw0sDEeS1gllUKW2ux1ORF8+l2JgGCUHpmVcE+r7CXhDosViW7vc9v3
         EmQhTea5RcF6EfNmnpLv3XiOxl0JIfDfH4zZdyDVeXMqn77ZowrYi/bBFsr6Ek3lBVU5
         wSOczwsRIhJT39o73U/SgMflnn0aNs0tGdqChA9aIEwd00KM9PtutMJviSpXik0A+BZq
         3wL4pRrdmwzsCF49NmHxsRDcgaYOd3Z2zg07nP8iOO2p/GtebqPrEY3KMTyVSYuQJIma
         ZhMA==
X-Forwarded-Encrypted: i=1; AJvYcCXtM3AMS01Bkh2+pS4cDr0B4chwHhcAQYpDyZZqc+/ueVMw9Zq2p4cbpMcnuzU2nPcnJQ6m2CLya/6ge1VCKUsSCg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyHyZEt97UyXyVp1QpK9erUO/2rvMJVECLIyjigYjHyEA/DC07M
	xsFCjKX5DifD4qRhus7wyQ9uyZ3iSE8ZMCn6E7K7EnCVNCluCnEnVWfRMaVe/wJxHGZpS/J7pbU
	vx36c0cFRlotZzhgO7zA6nYWBaSabuRA=
X-Gm-Gg: ASbGnct2z2two+4lo7ak0D5Gz6XGacO/PMV3T9UwEcYNygZ5OviEy4WmdVttsX/iBzH
	pTqlfnZnIKf12EzvIEGet06w++Om/MFT6AxPSYFKDhxPIA345aNtvIk1NFDms8f3kOtuYDYtUO6
	hKhY9qBTav3RmJuG61DrPM53ICVx8G8HMKSXcpSWi4qN4qeOFqOrnja9VHOos2yWpccb5bb+qod
	c0ceXaCdBhp/1Jvlvbdul0vMfSDj0eVCAZX9lx9rdIhkwZ2uF3EQlMT5cSRCsDjERtMPsHjwup7
	1OiyMfbrFS7jOxdTB6TlwMc4s5ys8w==
X-Google-Smtp-Source: AGHT+IEgRk1/+cBui5hZOHRjrdaC0dthzQhi8vwcfGhhDNfguaYoeZwO9LC1b+9kVPZkcaTr42vFE4/qT9DYAlc6Qvk=
X-Received: by 2002:a05:620a:1709:b0:8b2:1568:82db with SMTP id
 af79cd13be357-8b6a25369e0mr1444805585a.29.1765282764749; Tue, 09 Dec 2025
 04:19:24 -0800 (PST)
MIME-Version: 1.0
References: <f5199a88-ed0b-0423-3aae-61f882f8e6ca@crashcourse.ca> <e6e064db5ac30f5e711d45b657dfa89f1ad9e2b3.camel@linuxfoundation.org>
In-Reply-To: <e6e064db5ac30f5e711d45b657dfa89f1ad9e2b3.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Dec 2025 13:19:12 +0100
X-Gm-Features: AQt7F2rfDO43fnR989Fnljrfv-9LU9SjU1jghqrplDwMzfwzD_Onw81g0IqJ5b8
Message-ID: <CANNYZj9+ms2uySPOy96hgMgy07rF2eUTLMNfKyQaB=zyXOwzSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cpio_2.15.bb: delete superfluous ptest RDEPENDS
 on "ptest-runner"
To: richard.purdie@linuxfoundation.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 12:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227434

On Tue, 9 Dec 2025 at 13:06, Richard Purdie via lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
> >  DEPENDS:append:class-target = " ${@bb.utils.contains('PTEST_ENABLED', '1', 'ptest-runner', '', d)}"
> >  PACKAGE_WRITE_DEPS:append:class-target = " ${@bb.utils.contains('PTEST_ENABLED', '1', 'ptest-runner', '', d)}"
> >
> > -RDEPENDS:${PN}-ptest += "ptest-runner coreutils"
> > +RDEPENDS:${PN}-ptest += "coreutils"
> The reason is this package requires the user from that dependency, it
> doesn't work without out. That is an RDEPENDS, not a RRECOMMENDS.
>
> So whilst it isn't too obvious, I'd say the recipe is in fact correct?

ptest-runner dependency is set in three different ways as seen above.
Are all three really necessary for ensuring the ptest user requirement
is fulfilled?

Alex

