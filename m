Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C7CC3527D
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:38 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.479.1649699533011601780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 10:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pHGUgksH;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.46,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f46.google.com with SMTP id bh17so32436621ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 10:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YF93BYQKEgncW9heWO8bPiwxU/iXkcOY/gYtiqNOKo4=;
        b=pHGUgksHngIYwq7vbh2wLS/8fH4ijdoc8/WQ8Jz4qn0LasdDAVXS9J/1Ga/41QPGKl
         5HZX8zHvdsG4bFVHtqSHGDzkHNMISnYAqRXypnE3f7tkZhpb2fiP/F3YUCa+5fWolRls
         8uCDPQUSjnGyHdEIgaLNlpHUro/g35OsngmdttM4zQeVHitYyvI1SwoerGMfzZfjbKcc
         Fyiq1BxDy02hELASGDgKvqi/X7MeGuIH5zMHgemUm+UeIeYdxyqtc3T3QUnCm/JlI2hJ
         tpcXZWDa94Q0bGJiPj6FMLBUfuAadWGN1CB8+D3cM4Nev237Nuvu2xr2eaEgrIl5GWDP
         l/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YF93BYQKEgncW9heWO8bPiwxU/iXkcOY/gYtiqNOKo4=;
        b=picWLOovbfc5B+0OQVlnsmDVjsam1Jt+zQBo4qKQoEq5koVl5wp5sodJmpsNl+2qbV
         PdkXxjh3u2DBjFDHv3ed10VPQfzZSR1kC3N9XAxUy00SuS59t1pKNESsR/+7Sk51nCcW
         RnYju6cRLv6fE3XQDs5pdlXJwz3JTu1I6xTJ+st2eXpvBrMbO/W4Tb9NW+MUTtWAuwrX
         JPsgr/Kh4pOPqTpE0PP5NGzjExk/WQDF+jchzLjFosNNZSAFEynhm0XHcRRfGacEO4Ir
         SRZ/AmPNEboBCn657Dhbi6MLOQl0L/luH5ZGjnMp3cB0LW59tRUmBdTG0hnDNVbLuenI
         VvtA==
X-Gm-Message-State: AOAM531BjS02UA9vgoKi9PnRX5WPgyH4mrv5xnGYqrdWS8eeDoQCI/0U
	+yocQjttXHm1x+krPNUcHDMB5nM6CkfSnGM/7vBN2A==
X-Google-Smtp-Source: 
 ABdhPJyL0pUi3LyDZtH8G8FjOQQbQkreHcFwSDmq/mzZY9lZOIexZu5FyDR27fXitWDPYG3NYfmMXy/P3DUIFPXopkw=
X-Received: by 2002:a17:906:9c83:b0:6df:839a:a6d0 with SMTP id
 fj3-20020a1709069c8300b006df839aa6d0mr30991642ejc.419.1649699531298; Mon, 11
 Apr 2022 10:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220329130741.2430737-1-ross.burton@arm.com>
 <CAOSpxdap6UjLpy9M--b_EMYV+m3oYOQJT002Hqw5qcpCwgTVyw@mail.gmail.com>
 <CAAnfSTuHjbiN2NKVwZOut+MjxLhuFMwn+xAWkFHaqAXmM_8Ypg@mail.gmail.com>
 <CAOSpxdZGOwUs86K6bEX3WTgVu-+fFjonKxiGEe+u1OL=ivqx+w@mail.gmail.com>
 <CAOSpxdb+O=iDpDNr7S62wut=GErTXg8cvpYsj0nn6DM9G1CL-A@mail.gmail.com>
 <CANp-EDaVN-4Z_iYXJq7OcJ1QEtpAsHTGOQkCHeW+gJ6u2b=0xQ@mail.gmail.com>
In-Reply-To: 
 <CANp-EDaVN-4Z_iYXJq7OcJ1QEtpAsHTGOQkCHeW+gJ6u2b=0xQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 11 Apr 2022 07:52:00 -1000
Message-ID: 
 <CAOSpxdZdi+xiJcFeyOgrLTATOaaD0hf9k-+yQmsH2+GJm8xcQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Ross Burton <ross@burtonini.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164236

On Mon, Apr 11, 2022 at 7:31 AM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> On Mon, Apr 4, 2022 at 11:22 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> > > Unfortunately this triggers other errors too :-(
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/4987
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/4949
>
> Both of these seem to fail in apt.AptRepoTest.test_apt_install_from_repo.
> This test tries to "cd /etc/apt", then append to sources.list, and
> then "apt-get update".
>
> However, in a locally built core-image-sato, I do not have "/etc/apt"
> directory. I also do not have "apt-get" or "apt" commands.
> I'm not sure if this is a recent change, or a mis-configuration on my part.

I see from irc that you've discovered INHERIT += "testimage".  I think
that might help with the above issue.

> But it seems the test failure is not due to the zlib CVE fix, as I am
> missing '/etc/apt' even without the zilb fix applied.

FWIW, I'm seeing the same error with the xz CVE fix patch too.

Steve

