Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web08.1644.1619808250080287289
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 11:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AzUwGX/d;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id t94so31135137ybi.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 11:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XV2bgXeeRqUX8DZlFumyek8xOPvd/7GaCCOocW9ATxc=;
        b=AzUwGX/dc1QIck+qP3T2os9m5/KHKMg+3QMe8BIBXhfe1J8R+TxjigSt/+jHoaH63Q
         T3d5oDdFs05ZrEQViKpylr6J1jpe48v7f+RuA5CnQ6Duz+g3X5asq7zvihVIH33bdSAc
         GMLCPnUqHUGOmvxBUg8GLvlM72htg4Pe5p6panA+Ex/7VFHdHgN9fsZuhXhkP89RhT5C
         odj4x7eN/L9RL1binm7i32QsxZjHElNHEHCsAcdCUGA6p5n0ZYjZg9yKOWsDYRqPVgnT
         MBSyT3JPAZ+rbW36m1DLZhnFne0aTlEvqcbYBICM1DU3icCY8ms/P5FqABEYMENYf4EY
         r7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XV2bgXeeRqUX8DZlFumyek8xOPvd/7GaCCOocW9ATxc=;
        b=tg9EX6KPz9sJLe6KoCnRKy2rFr0BZuzeuIrF2ubGbxPaA0LkIa1WpoTHQ8Ub3QugTP
         nP2N0x68oQkvCR/K57Slg14HrehD+QpuIvRzkCcPTqng1EdAhX1JOZklqLCTsVDa2Yb1
         zwGCv11rC8mMBt3u3lepCCDl+PGZ1ulXrfpvxARHRXAKo3J4J4SbahWt/bTYfyUKdUTy
         /daARJYhlZFqtouY57MrRqWtIpZN88FtTikxB0K9bKQH1fzR4G9+ZSGmE72NLUNLHRsS
         0tE50rG0N/H1khv0wPhO5DgMJ7M+8Ck0q2xQ/qH4LWGPJwfrtBRJ2a+zXdLYsHXTm6/8
         Q0/Q==
X-Gm-Message-State: AOAM531e/sq7WQleEJOuATOaPoTXBJ5VBsyw2Phk4gKG9PKsA/xDmHFP
	q1n632ojA2tZG7nl6GqGrlertLltH/I6TOnqNts=
X-Google-Smtp-Source: ABdhPJyUA+78dKuc69L43hinhJkQVHxt99tZZliLVcBslbP/wi42MFfY92hN4alh30AvJ8viKIR1q5en9IhbeWgUNh8=
X-Received: by 2002:a25:bc89:: with SMTP id e9mr8837563ybk.97.1619808249328;
 Fri, 30 Apr 2021 11:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <DB6PR0102MB26302BA4C54F13FC351F8C0A885E9@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
In-Reply-To: <DB6PR0102MB26302BA4C54F13FC351F8C0A885E9@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Fri, 30 Apr 2021 08:43:57 -1000
Message-ID: <CAGDS+nk51u31+-NR2k1u-y375RL0TyCEkm9L=7Va7eQcuRQwCA@mail.gmail.com>
Subject: Re: [OE-core] Unihash warning building kernels in Yocto 3.1.7
To: diego.santacruz@spinetix.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Mark Hatle <mark.hatle@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 7:00 AM Diego Santa Cruz via
lists.openembedded.org
<diego.santacruz=3Dspinetix.com@lists.openembedded.org> wrote:
>
> Hello,
>
>
>
> I just updated to Yocto 3.1.7 (from 3.1.5) and I got the following warni=
ng while building a kernel recipe.
>
>
>
>   do_install: Task do_install requested do_package unihash, but it was n=
ot available
>
>
>
> I tracked this down to OE-Core commit 0c28edf4bf0d2f92bf3a47406041c63acd=
90bacf (=E2=80=9Cpackage.bbclass: hash equivalency and pr service=E2=80=9D)=
 and it makes sense since do_package runs after do_install and in dunfell w=
e can find the following in kernel.bbclass
>
>
>
>   do_install[prefuncs] +=3D "package_get_auto_pr"
>
>
>
> Merging OE-Core commit 36fe4db8ae827a93abe9fce6740459d215411965 (=E2=80=
=9Ckernel.bbclass: Remove do_install[prefunc] no longer needed=E2=80=9D) s=
hould normally solve this warning by removing the above line, but I do not =
know if that change is safe in dunfell.
>
>
>
> Could that be merged in? Or is there something else that could be done t=
o avoid the warning?

I can do some testing with that patch.  cc-ing Mark to see if he has
any comments since he is the patch author.

Steve


> Our build system flags a production build as bad if there is a warning, =
so this is kind of annoying.
>
>
>
> Best,
>
>
>
> Diego
>
> --
> Diego Santa Cruz, PhD
> Technology Architect
> spinetix.com
>
>
>
>
>=20
>
