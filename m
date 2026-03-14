Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409DB10706F5
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 19:08:27 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15908.1773515304160008710
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 12:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0Kax1HAj;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439c6fc2910so2562285f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 12:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773515302; x=1774120102; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yi16xJkRi2BwiwKVX6TqfmorocFmVDRiZGZ784FfrlQ=;
        b=0Kax1HAj8G7zfULRsw/IgjuxVblWmPlKfk2/mPLGoq9aAl0jDdz090yXhYMK8gv+At
         EOfX7gzEdyk8P3yHr38Kk5TPNOGtWJ4XypjP1n/XCIxuQTvmsP360qT9js59sRcJmJEd
         bwY43xUDyRJC3JR5+sJCtlvhbQu1/uSrUcmYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773515302; x=1774120102;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yi16xJkRi2BwiwKVX6TqfmorocFmVDRiZGZ784FfrlQ=;
        b=bNJyCcXGrTooHjjmJCHviseSyh8DEAcpKpRpvbwLsiztezpDvPy6bjNveWkNQiOF8e
         WkO4yczxwLG9DG5VjbQgl1PJbC69rNNZsqfeHwxcg2vNJEfAdADUJRTHOSrvy32nblDI
         b4T5C1ljcjLWZjxNY4vBdBrpZEczIzYR5zHe79wxJ7hMia+GbYoWt0EeDTsk/JuIdb22
         doN/zi4k/WYFA6ygXSl+y21QFcqk/BVQ2Q4MLjhnNECl4yI6YN+lQL8PQCMklYxa364n
         NsVHUxGaqDLBtInwgz2guhnL3Hfa+wVXxG8gOQ/elKHi/U1QegdLrsfCBN2RTFoFMI0r
         6k7g==
X-Forwarded-Encrypted: i=1; AJvYcCXH+uxgpgsrlgZt3Jaz8J3oo+nZSib87iZMIrEe+tyla8UJEnhSUQAHqEAhkSRi0m07VgxN6fN7JBIcGwAtEfzUmg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyZkO2szCrcoec13QZG0iITWi/S5m03iMVJqvqQGNm1m/QaSvmU
	3wWfRwxuN0bwKLhuiptgrDNdOj97dW+01L+1l48Jki6xDUjJYDBqV6a3iHYeUkKAtgA=
X-Gm-Gg: ATEYQzzgSYjeoddI4dgk5a9sObmif7oa+KyHc1qLDZv7i/bWg4RjUiMjel26ym4BZRp
	HkYCDrmBVMJIn6E4DaquhlwtX4euswqIvZK0MB6AJz+ussjNQnoZMKMoguzBuS8gfn3LSX+9RcF
	yyRyGanYC5M3UrJoEnm0qCgcs3DwaCLZh0JY7gGVbmU7916CXWQaS9EknUWzmnu+TlCvmo+fbEj
	ICjQYUcaStQYgCY8MqbRMmrAj36slRYr9KT47rOYVs6LMxq33DVIJN1sey2r6e1/No8SKDZbhQY
	hUs7kxlUlR2Ft/W+mboRkXADuDx0wWZalBebpKj5fui3U+g9KfmspG8iBy03CuByR+mDusZUJbw
	39PB6fS4CVzukjFAHvb2yROAANjIhD2GjbHsTTixzhXBynpi+9QQ2tkqQdbQsyuoMm1gJVV0+U+
	H8jc+VSR2Ys4IT09Jc7q6lZ6FWnL/vlTYDfYfi+C0nDXjq5USNh2XAsJc9kwFifzmKQtlY1cpRc
	DwWqM6x4eSYtZc=
X-Received: by 2002:a05:600c:6291:b0:485:4f20:1335 with SMTP id 5b1f17b1804b1-485566e1a39mr129117485e9.6.1773515302359;
        Sat, 14 Mar 2026 12:08:22 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557777105sm87672455e9.4.2026.03.14.12.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 12:08:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 20:08:21 +0100
Message-Id: <DH2QPDTPQT3Q.1TJYOVQ7PIU7B@smile.fr>
To: <aleksandar.nikolic010@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Wrong version of buildtools files uploaded for 5.0.16
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <cIvm.1773510929949130964.FoKJ@lists.openembedded.org>
In-Reply-To: <cIvm.1773510929949130964.FoKJ@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 19:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233098

On Sat Mar 14, 2026 at 6:55 PM CET, Aleksandar Nikolic via lists.openembedd=
ed.org wrote:
> Hi all,
>
> It appears that the files uploaded to [1] correspond to version 5.0.15 ra=
ther than 5.0.16.

Nice catch! That is most likely linked to=20
https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/RELEASENOTES=
:
> ---------------
>  Known Issues
> ---------------
> The poky DISTRO_VERSION was incorrectly left at 5.0.15. This is a minor i=
ssue, if a workaround is needed please cherry-pick:
>  - poky commit 06210079b2e10d6d3fb943afe87864267e329821, or
>  - meta-yocto commit 03f93c769ec99e5086e492d8145eb308a718e8d3.

We might have to skip 5.0.16 as the defaut buildtools version... What do
you think?

Thanks!

>
> Cheers,
> Aleksandar
>
> [1] https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/buildt=
ools/


--=20
Yoann Congal
Smile ECS


