Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4363C48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 15:23:10 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.25896.1709824989931857858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 07:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rTVMfyk0;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.182, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-609f24f447cso7471287b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 07:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709824989; x=1710429789; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ce6eBvC6Ya5zMva8nDChpbyfcxLj9jPuTIC03MwwQgc=;
        b=rTVMfyk0uAytxdSKc98E1L8kisWolVBOPaiRIWvTQMKpSFwJonsioXLvpQlvXaNQnn
         /WJb/raX2LAnZnIp7gGfKcmuasNoW7NvEz4gAkV2h0USax7ZOR9GWgtI71rDjs5xwzqV
         /H9XLMlXfzZ8UXjaxZhCPCPwGIHLCRPG/KXvmyHoA08sR2WxiH3Vyq6anYdcER1WFsx4
         rwwS5Uf+TbKs5XwPRKmcHv1GBf3x5po7GGS4Ya2TQ8v5PmDDS5ys8dVjx5wDG41hIYI8
         6d83uw0wsssDQkVkGAkR4J8WP9EuxHMkpM5yEMDApCpU/q/ZWzABChAImyrI0x63t2DV
         khhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709824989; x=1710429789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ce6eBvC6Ya5zMva8nDChpbyfcxLj9jPuTIC03MwwQgc=;
        b=DOjGI0nuzcJB5DVgPO6Pj+njujuPPJUMG0W/nVgv+/Ln5Gq/lBbcyjmETVAwIre2ze
         JP1xQ5lNoqGvjngLvrgHU0mYZ3G1DpHGGqNUhahCe7WA1I1G4Xp5N1tNS16v0eqrSgdR
         jNdr0Ui6AiGO5r020A2Afyi24DTtczh6TAfzyEk6ZC3q+9LlhgDq+bFI0BbpdBxZ7ofM
         awlfjgdhv+B3QIf1alcQd2YS9KUDSRdazHasPs3M3xkQ+3kxWHe3IYP+tyIN53iChj44
         BdVd62JPCC8KgFgWWIIcuP5zdsOPlN5yRrXzAcE2oYiDPOunliCKiNh0c1p2FdDTZYAW
         OHhg==
X-Gm-Message-State: AOJu0YywzGdM6dT10D1H4jRp/aWHoFzTUfNywvpmFV2YY/CVMAE0jF+2
	L2UJVI3KS7sZaajxZHO1k3m2OOa3kI8l/n0UQHtjhTo5xdORr2uESsnEHW4lFSw3duFQ36wiAGs
	d14WGwNYf7/KIaprBGOqiRwcCcmrLRt9JieWotp7GoAUaYu9MgBQ=
X-Google-Smtp-Source: AGHT+IGbIYcc25ZKLl2OOIT7DAVXhL1WC56Xg+Q+JM+kiNORTfqXRNmTQso9GP9RWO4wGsldqoirWfrbVgTEYTSLCac=
X-Received: by 2002:a5b:650:0:b0:dcc:a61b:1a72 with SMTP id
 o16-20020a5b0650000000b00dcca61b1a72mr15357593ybq.47.1709824989134; Thu, 07
 Mar 2024 07:23:09 -0800 (PST)
MIME-Version: 1.0
References: <20240302232309.3801864-1-kamatam@amazon.com>
In-Reply-To: <20240302232309.3801864-1-kamatam@amazon.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 7 Mar 2024 05:22:58 -1000
Message-ID: <CAOSpxdbyyCMKjsDgWZ38_ED8qSb7DU--VYZPt9A-LfBMRbiY9A@mail.gmail.com>
Subject: Re: [OE-core][nanbield] cherry-pick request
To: Munehisa Kamata <kamatam@amazon.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196799

On Sat, Mar 2, 2024 at 1:23=E2=80=AFPM Munehisa Kamata <kamatam@amazon.com>=
 wrote:
>
> Hi Steve,
>
> Could you please cherry-pick the commit cd2072e5d953 ("kernel.bbclass: Se=
t
> pkg-config variables for building modules") from the master for nanbield =
to
> avoid the unexpected rebuild at do_compile_kernelmodules()?

OK, will do so.

Steve

