Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD47C3527C
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:38 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.162.1649698293049294286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 10:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=b1wzJZpf;
 spf=pass (domain: linaro.org, ip: 209.85.217.45,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f45.google.com with SMTP id e11so13903565vso.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 10:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YYmuLTnshB4FRaUb5/wn4TxM+ZHteAPTS1FUmnbUwxg=;
        b=b1wzJZpf2W+ugc4QT8F84Bu7lyCIdE2opGymcWBh/9q0MzMDbLrDIMfFF04MV2DWJL
         6vmPaa7mprW4REQOMsd5Eku5nC+vjXVc+JeGLuPGSoarg81pvvXEsXVtJV3vJB+MuHKB
         LnEilrIndxxkUreloVD3gstXS6gJEFD+bywb3BkrBFVx9F2hnfvYDsA102IsrmE7UgCA
         UsH+T0ys1TAsMb1rQXSqlmHa9F4SYancoIOGgNnwea1sFZVQ4eTzyAG8IPyrhbIsWinl
         b3geAcdLk4QtZ/gN1YGfvmxj6sj0lLBQ9zC6Etc3tr3dNIgjyc0qeI6pCCUQ0SL/CWol
         xfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YYmuLTnshB4FRaUb5/wn4TxM+ZHteAPTS1FUmnbUwxg=;
        b=cXrXlyBfI4vo3Ifbx7Nz7ytJBz1gg/dTz3a5f741DKy9UNugjuQHaCZQgouz1BPK0A
         lM3MCxRMWEWASDq6RN6BNrINPw9DtxaKMxxuOtdqkyq9j504XfuJCaIIPRd4TvYev5mF
         waZqoQE7P6VBKNjtUZCczbevUdIjDWzP9u85BGLIL5aiCAB+fqqiPA7gEidpQpsavwCR
         MiyhIzpKRs2zSPI1DO/a1b2esy0iWzZ3Ot0Bt6Xit/hr8Ne2/djspg5wyHmRBciVfRdK
         yOQTl1LehUq+FMYVCaMGBEa0Hj9Ht+eMDM1C5DmIu5YWfLsB1kUU7Cn6BzgjOgGFXdfX
         hQ5g==
X-Gm-Message-State: AOAM531daQ645B0q02OsZSIpRNKHkAUNc8ud7rlwQeY6XmlEQ7ftrULL
	Lr7F2dsRTyGlxPWdnP/e3C5mWn8NWchzrLw4HGl7DA==
X-Google-Smtp-Source: 
 ABdhPJyK/PK70MYkerKS57fMGAUld+SaiataMJLVUvvV8WoVnF7gikHapeOyvmZxlc8g6cSOm45hj2ygI1b+Mc1MfxY=
X-Received: by 2002:a67:ce95:0:b0:328:35b3:fe98 with SMTP id
 c21-20020a67ce95000000b0032835b3fe98mr2784062vse.73.1649698292178; Mon, 11
 Apr 2022 10:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220329130741.2430737-1-ross.burton@arm.com>
 <CAOSpxdap6UjLpy9M--b_EMYV+m3oYOQJT002Hqw5qcpCwgTVyw@mail.gmail.com>
 <CAAnfSTuHjbiN2NKVwZOut+MjxLhuFMwn+xAWkFHaqAXmM_8Ypg@mail.gmail.com>
 <CAOSpxdZGOwUs86K6bEX3WTgVu-+fFjonKxiGEe+u1OL=ivqx+w@mail.gmail.com>
 <CAOSpxdb+O=iDpDNr7S62wut=GErTXg8cvpYsj0nn6DM9G1CL-A@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdb+O=iDpDNr7S62wut=GErTXg8cvpYsj0nn6DM9G1CL-A@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Mon, 11 Apr 2022 13:31:21 -0400
Message-ID: 
 <CANp-EDaVN-4Z_iYXJq7OcJ1QEtpAsHTGOQkCHeW+gJ6u2b=0xQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Steve Sakoman <steve@sakoman.com>
Cc: Ross Burton <ross@burtonini.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164235

On Mon, Apr 4, 2022 at 11:22 AM Steve Sakoman <steve@sakoman.com> wrote:

> > Unfortunately this triggers other errors too :-(
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/4987
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/4949

Both of these seem to fail in apt.AptRepoTest.test_apt_install_from_repo.
This test tries to "cd /etc/apt", then append to sources.list, and
then "apt-get update".

However, in a locally built core-image-sato, I do not have "/etc/apt"
directory. I also do not have "apt-get" or "apt" commands.
I'm not sure if this is a recent change, or a mis-configuration on my part.

But it seems the test failure is not due to the zlib CVE fix, as I am
missing '/etc/apt' even without the zilb fix applied.

Regards,
Ralph

