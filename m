Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B41EB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 15:25:48 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.15312.1688138743744239678
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 08:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0a1Ys2pv;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.41, mailfrom: steve@sakoman.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fb9ae4cef6so3240140e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688138742; x=1690730742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPVJOwiBOYWadln89LrKnnVEcCUjIg8hOtPNTdhdFmQ=;
        b=0a1Ys2pviVOAAn9WytmY0Xc/XnHYoQPHC6bOvoEeyiIs1+zca2LQANG11i5objkjyV
         qaKTKj7BgbJ1zvdLrT5oRApzw326iq/UHKyQxXSuzM/wc1FL9b/+rM2wVZ+Q7wO2mf9X
         cuKE8BTgDeqHab+McxI/RGMkz4VzLSmI9EuxEkLdUygSISXMloLvd8KIAzSfnyDgXJPY
         +ucQH15ZJbB2dyfA8cD49caADzkgKm6XC7reHOsjWgpg7FEkyCsxODwATugHaFYMH9MN
         OgNMVvajHHyAcCgKKWR5qnE5WHJ76cWAX4E3/Ie42j+/THtOqtsfEq0J6ozLDflXRkoQ
         S4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688138742; x=1690730742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPVJOwiBOYWadln89LrKnnVEcCUjIg8hOtPNTdhdFmQ=;
        b=b/UMgOUqmg2wDXWIwfb0i/Li1Ba0XuF7ogpeQG/yNLwvbZq2kcKeVuWgTBluthXVje
         X10/9CI3EHVNf6uyPF8hXJg3fp8ICa1rbJ+mt1u8C3PCFSaP4GF82XP89fyw/bhejJWd
         ixrgS7+Ww3Hj7pi7a5EzzOmR0NQRUyLY4nww3VXu85T7b5qHvayy1nUIf4IlWZg0dR7k
         ek/HtVZjcKzetEA2picyYEev8DH3fE8PqVaEQME00CzP1i/Yb92f2vIPD3SbVjFE2WHF
         Iwcm+oCoHu3xlqERsis8HiLDjvi0FvucBWrpdJ1XnQJmu95PFcZ7geQ9j6sBLO25FPzH
         +J7w==
X-Gm-Message-State: ABy/qLaeJFFLWjm56AF0fkPdzKdvCgQmDeKbt7vkaZ7A+NN6uFTdigJi
	ODffaBSruIEsKUIlBHMQD/6h1G80Y60e08HWJ/BVVA==
X-Google-Smtp-Source: APBJJlE1sKR4r94dG6zscU60leXBqsf13G/cT9KXpHBzneV6dVThcMDxUnSzL1IKodu94p45T9jSZjBbcz/DixGz5VY=
X-Received: by 2002:a19:ca1b:0:b0:4f8:ff52:93b7 with SMTP id
 a27-20020a19ca1b000000b004f8ff5293b7mr2326043lfg.30.1688138741878; Fri, 30
 Jun 2023 08:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230630083221.3927027-1-changqing.li@windriver.com>
 <20230630083221.3927027-2-changqing.li@windriver.com> <CAOSpxdbsXPB6KSUtSiz7Kxvebz7cnZekhLwdT2WfvgcdoYcSPg@mail.gmail.com>
 <076ea49874345a74ebe103d30ff6a169e341c20b.camel@linuxfoundation.org>
In-Reply-To: <076ea49874345a74ebe103d30ff6a169e341c20b.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 30 Jun 2023 05:25:31 -1000
Message-ID: <CAOSpxdY-AH0=h+Hn4fFMyMjD75q1xwhXsyD8OJMUWFQVoo+upg@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH 2/2] rootfs-postcommands.bbclass:
 add post func remove_unused_dnf_log_lock
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Changqing Li <changqing.li@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 15:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183702

On Fri, Jun 30, 2023 at 4:57=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2023-06-30 at 04:21 -1000, Steve Sakoman wrote:
> > Is this also a problem in master, or is it mickledore specific?
>
> The same patches have been proposed for master with an "instant"
> backport requested. I really don't like this model of development as I
> have my doubts about how extensively they've been tested in one or the
> other.

I typically don't do "instant" backports.  If a patch is proposed for
both master and a stable branch I wait till it is accepted into
master. Then I give it a week or two before backporting to see if any
issues develop in master -- if I remember in the midst of all the
other patch wrangling for multiple stable branches!

I much prefer that people submit to master first, then when it is
accepted send a backport patch for the appropriate stable branches.
Sending all the branches at once just increases the risk that the
backports get forgotten!

Steve


> I'm also not convinced the patches explain the issue properly or why
> things should be fixed as proposed. I think at the very least the
> commit messages need to better explain the issues.
>
> Cheers,
>
> Richard

