Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BE1C001DB
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 16:36:24 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.112336.1692030978833890014
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 09:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=wy8uVeWz;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.173, mailfrom: steve@sakoman.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b962535808so68648641fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 09:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692030977; x=1692635777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whpc24H6XqQlYcK5yBhJotjB0pi95KQE1Hlb/sxgRFM=;
        b=wy8uVeWz7dBLJZizfZBK9JmoXNjfduauwUygx+2BbHYaMQVItst1EPb0G9F45p3dOX
         kg9YfH24OKYxXRr1TjK6XEVtPidkoe4PsOSp3xnFAF+ybON654FCgEpYCFjE1H8IagRj
         8PCoOpFWF+HVN7Wzkw/KOnW0nSIbk0VJQbl2CWpVXyyvmlDVmvMqZc1ZmXkHOEev9BA1
         d3ZnIOBKv+6wr59nbdL6k3qqBxqedmAp1LvzW2kZ4KJA8PYhbKnln8Kn+TGygQXBvvej
         v0FITMpeKlMriKfdkzgCyC+QzzYaGeONDLyKYdowIgVRrGtHJLoFmFt2d33e3E6zsS46
         T/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692030977; x=1692635777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whpc24H6XqQlYcK5yBhJotjB0pi95KQE1Hlb/sxgRFM=;
        b=A6HsuVkRnJee1Fc6KAOPJShzamMOKre3SiuE30nV0Ah9tTrBgLbXTwMK9Ru1e1gPpd
         CVlpmassDacqQqMV64Zfo5f7aTo7TGBT6JZOTF4v+SEE+AnaBkoJWZbw4YpEbGfOGlzh
         A6AVLWgAmegapFbrdL4RhKs2EB5T0uC9AHEXTeVlCn1nvwW7DliktiK7IQJvpg4QP62N
         wBIHz7SwK/k73qF9F7IreF/kCANAA14hGqhP7jnVrnhpJFuq8iJbZQd8mhapc376I7Mx
         CC0kNsFpB8tL+uOXWPwvoiBAJ/FhBJkx0lrGPMeHUpyObhRrbDqOz31X3kXd/LEbeb7j
         tmcQ==
X-Gm-Message-State: AOJu0Yy1h2PCT+eF6NcLKgCtq67Skofn/7zT5Hit3GvPHEdudZs5szGw
	d+pAxxMxgVRXr/m38lp2C+EP85GV8JXU18ra/jEwpA==
X-Google-Smtp-Source: AGHT+IF8iErvVTdqxFVp7bcEl7KZnjyHvakEWR6EF/BtPJRyH9VVqR5BRydfratH6XWztsEjMPDcIibPqWaOXD+J8qs=
X-Received: by 2002:a05:651c:1056:b0:2b9:3274:dbef with SMTP id
 x22-20020a05651c105600b002b93274dbefmr6726170ljm.45.1692030976788; Mon, 14
 Aug 2023 09:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230813122807.DCBD7106C78@builder.sakoman.com> <227c69b15bc3e2060c35b5a4e941b34e7c3907d4.camel@linuxfoundation.org>
In-Reply-To: <227c69b15bc3e2060c35b5a4e941b34e7c3907d4.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 14 Aug 2023 06:36:05 -1000
Message-ID: <CAOSpxdYnvqeS93k4HEEJ7ew5dzixoBJZkcf6xUM7fWk0uMxuHg@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for dunfell on Sun 13 Aug
 2023 02:00:01 AM HST
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 16:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185939

On Sun, Aug 13, 2023 at 3:02=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2023-08-13 at 02:28 -1000, Steve Sakoman wrote:
> > Branch: dunfell
> >
> > New this week: 5 CVEs
> > CVE-2023-29409 (CVSS3: 5.3 MEDIUM): go:go-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2023-29409 *
> > CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3180 *
> > CVE-2023-3817 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3817 *
> > CVE-2023-4016 (CVSS3: 5.5 MEDIUM): procps https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2023-4016 *
> > CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4135 *
> >
> > Removed this week: 0 CVEs
> >
> > Full list:  Found 110 unpatched CVEs
>
> Something doesn't add up since:
>
> https://autobuilder.yocto.io/pub/non-release/patchmetrics/
>
> shows a fall?

I see a fall for master, but not for dunfell.  Am I missing something?

Steve

