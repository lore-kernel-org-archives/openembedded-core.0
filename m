Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DE7CD6E79
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 14:22:13 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6297.1780660229369580332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 04:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TG1bRcoF;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: adityags2004@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa68cf9123so1899287e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 04:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780660227; cv=none;
        d=google.com; s=arc-20240605;
        b=bMzMrg8LLcXooLoUZkvyXx4bP/ULXF6t6DAcE58+nTT5pi45u0lo0tk5P9EX1BaZOt
         NU2ZbTs0Y/OPGg/etTxVzfR9dWt/5q0mBuuvZQqAAVoDi5oqxzuY9ximp+3maYmXBMbI
         Rp68JTXY5Psct1x6i0CtvAfqJjD17075HZXgMutxVvCy6fL55rN3IOvAzyEFzuq05aWQ
         3z1b6vJKTZROB3+fwgDHkjX3byBlJSNJ3lAIomNhJcJw022LicMBgw/KL8/5m6WFV4Ur
         YWd5+FpEX1HO7pdn7fDaaEBETzAyYztPPFIvecVol5ykhrffpjHirDig9SDB6DDkYJf4
         naSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JzOQp7wMqqH58fTOdHZpUkGeQAPjFuheDprnzA/GkxM=;
        fh=7T5fgh5iWnve6c6Qn2vGdyJAqFFyjwQqYCBWNb2ZoRc=;
        b=E29HkOjto9YFI6d1pHf0Ca5sFv5u/rhfibhNBNyLDB9ORbQKnDHLPjvVjt3A/6PcBo
         zYe0Vga5yd0leHtW158tIZvR3djVtFtOHbYrJYN26HnlCQBjVaSflRH1945AuE/2JaVk
         D1Hp5fjPzCY0/5Xobsbat1Y26dDjLgdbN/yCTACpw5mKDYujn+IKVfEHzIzpGObqpuEC
         /xFlsYbcVICT/eEk3PHlWWypX7IfO3EALalM1Y3hmya3apVbE9Bagl0j4Oeo+YPwq3YO
         yXtnyKXAdoTRt7Z6HpozcLbpfZk/sSgcYGI2jXt7R4OUqg8eh7NbGh1Tf7zJvKSCCc6k
         ZpDA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780660227; x=1781265027; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JzOQp7wMqqH58fTOdHZpUkGeQAPjFuheDprnzA/GkxM=;
        b=TG1bRcoFRgMFhxJQl3joQyA3Z16TWlU3hXfoMWSZNIR0tsPBCoHXH8rZkcUNayfrBb
         RdXvACXi/P6K5lii2VrZ7QfCdqqxxLakAK1FaOrC/2tD6SgvXkN8qqt+kQskVc3PrH1h
         1XXwTNG1OABRnE+eNXPe+bHouBc9aMLfBqpwmZi9/iU0RuBAIH9tmgnRVwzeySg48wcb
         WagbcqD758K3YQEIe5ULzRw+SBU8osC6lHS6b2poaebIeozmxGqYBlfo6HI3AlDoNvCt
         XGp3Q0v07vuMau37UQ28z2IDCs3U0DDs7jXY4+Kx0iZUJLOist5iQ+jwzSMtf2eCnhVZ
         /jSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780660227; x=1781265027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzOQp7wMqqH58fTOdHZpUkGeQAPjFuheDprnzA/GkxM=;
        b=GROBlgBGCLivzEIkipQcLERvTOzDnp6lgryKn63+io2U8hPzgsyNl4Q7fqGbdIfNsS
         Zzz/eZO2aJgsWxE88KElrvP9994kzEABoTRQH6JvoXEckPhaZknXX+YT2Gg+v+37vETu
         wCA0yfJL2XKM86OS3f3nEKtOgHF3l4W6la4fvbO6NptTqZTzgt2XmyWAXlWtsrF2LrOV
         CN/AzEOvIUJoQWioqjmgZ7FUI7842RABlYxEgzJmNgh70WO93OfLQjt27F5mmBlQcs7H
         GnGyvpYQ1HKQFq+h5F6lnwCAlZd0bjejdmU+3WiPCj9x5wLUt3ymZwH8blPUZmF6Tmwi
         3cCA==
X-Gm-Message-State: AOJu0YyszUkW6TUp0qdAYbrPKyDLlIkxgeV2306utBXrAkeMbN1iBtVa
	geZPpp2jpKzxPIC9hbr0LTXD4/EZrxpqPUnPg+x3FyyKaADEx2KaTvA3kAhpr7mhmZXoebazNY7
	JPgnEcAN9P05ZuMK1kRkUHA3/01ZWOyA=
X-Gm-Gg: Acq92OEAQOhDRrNRsZm8dbGjOzVB2hcWVEX8IdBIv08A4IApo3do619bRf5H5nmRczy
	cwrZDgE2ww4Wm075EB8wZPMZsvVFUB9qevYi5BYIEUb3zOMmC9mhTPVtNxDnnXP7ENWXz6n6cyo
	IERuYenaQLfiWxAvc7RaBICOpCbVzMeqr4H1QRqv/i+EPnjAjRm8VgLJUGtq0JSAHCT4qErC/Ax
	cmM0L1FgTItCzkkid9GKkCkjSCv3uM5pCd2+MOFdJdTeFwr1S7N3FNeslJkvnXY7molwnwmRP8o
	YZSodvbL7zWolyyzcz8EJAJWgTeue5xoabPWbdI0c9+wUyU5sYueElZ2AwBf+p6YqI7nlvqLGph
	qlpiZyoP5
X-Received: by 2002:a05:6512:3194:b0:5aa:8822:b874 with SMTP id
 2adb3069b0e04-5aa8822b88amr819030e87.46.1780660226930; Fri, 05 Jun 2026
 04:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260605081737.1568-1-adityags2004@gmail.com> <CANNYZj9thZKkUceNJpbbaMyCHzjy=HdJYjjtCcCkzy=UToOfxw@mail.gmail.com>
 <CAHaUZZAUoOqO8ODDLCvip2QJksnDATEwpKyVgPh46hDYv9vk4Q@mail.gmail.com> <CANNYZj9cRgFEp5=9-ejDMd+WyxS7r-goq75KHFGzesqV96LaOw@mail.gmail.com>
In-Reply-To: <CANNYZj9cRgFEp5=9-ejDMd+WyxS7r-goq75KHFGzesqV96LaOw@mail.gmail.com>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Fri, 5 Jun 2026 17:20:15 +0530
X-Gm-Features: AVHnY4LNlLKeIBXsUjYTT7HNZb4IHaFbD3-NC0aRpqioT5nS2Mk6vj7mv5ZZX7w
Message-ID: <CAHaUZZDu+nWJ0uzG5mqAdgdxn9tHa3Y7Wb-KH1hvbqAd2vehiQ@mail.gmail.com>
Subject: Re: [PATCH] gawk: improve randtest stability
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="0000000000004aba8006538044df"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 14:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238172

--0000000000004aba8006538044df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for the clarification.

I've rebased on top of master and submitted a follow-up patch that adds the
missing Signed-off-by to the previously merged change.

Thanks,
Aditya

On Fri, Jun 5, 2026, 4:04=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmail.=
com>
wrote:

> On Fri, 5 Jun 2026 at 12:28, Aditya G.S <adityags2004@gmail.com> wrote:
> > I've reviewed the merged commit and verified that the fix is already
> present and complete, including the required metadata.
> >
> > My latest submission (v11) also included the missing Signed-off-by, so =
I
> believe there are no remaining differences to address.
>
> Your latest submission has the signed-off-by, but the version that got
> merged in master does not. So you can rebase your latest submission on
> top of master branch (use 'git rebase'), and it would reduce it to
> just adding the signed-off-by, and then you can re-submit just that
> change.
>
> Alex
>

--0000000000004aba8006538044df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex,<div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks for the clarification.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I&#39;ve rebased on top of master and submitted a follow-up patch that a=
dds the missing Signed-off-by to the previously merged change.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Thanks,=C2=A0</div><div dir=3D"auto"=
>Aditya</div></div><br><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 5, 2026, 4:04=E2=80=AFPM Ale=
xander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 5 J=
un 2026 at 12:28, Aditya G.S &lt;<a href=3D"mailto:adityags2004@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">adityags2004@gmail.com</a>&gt; wrote:<=
br>
&gt; I&#39;ve reviewed the merged commit and verified that the fix is alrea=
dy present and complete, including the required metadata.<br>
&gt;<br>
&gt; My latest submission (v11) also included the missing Signed-off-by, so=
 I believe there are no remaining differences to address.<br>
<br>
Your latest submission has the signed-off-by, but the version that got<br>
merged in master does not. So you can rebase your latest submission on<br>
top of master branch (use &#39;git rebase&#39;), and it would reduce it to<=
br>
just adding the signed-off-by, and then you can re-submit just that<br>
change.<br>
<br>
Alex<br>
</blockquote></div>

--0000000000004aba8006538044df--

