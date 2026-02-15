Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86971E63F1A
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 21:53:57 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7367.1771192428255652106
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 13:53:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bOclfiF7;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d4be94eeacso2361229a34.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 13:53:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771192427; cv=none;
        d=google.com; s=arc-20240605;
        b=Lugzh3cEbE3taRLdnctpzLTAR2O+OBSAy38X3hFmnhTmlSU2+9R2RGa5DzhR8FLJRa
         w5EfIUbcJJbnu99HsD+HEgbpvyeO6FLpRJfiThJtYzJeZtvO+yCo4df2xoBDiBEy/kqa
         qCG3TzSDOdnorpNqYtEQmoxT7y6MEGcwhknFukBjs2lsTFI24Sqswr9PL/Zw9szbtunW
         Xxsh+Xsq94j2gNZEZMnXt4n4vChT7iPHVlbLgzKfEcblz1HSKGQoOQekvf9cmub97xcD
         a1nAbrGyCWX7Z7BfO1IUwqRp75iwTi4aaDMtfgOTWci57F5XnK0H+qdniYMgdZZn3LfW
         K3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3GpTRuYK7ZqTbRVT/iBUcXiLP13Gpla4xRHLLFevaJA=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=CQWdLGc2vM75UGKnlCyM7vwD6YbH0LJaN9hReGNA9G+DnmLhYcTFyg658ppkag/DSq
         cV1nzcBYcy3TvTHk8lWLXJ4lwdmpw7NjEB8LU2gAgOfnAFhsad2OHt6q7bEaOB+0t7yT
         uJKFLIz4Sb8Ehp8BJ4X54qi85trPP2gH5UqZKXkzU1x4GsdkIlhYrX8EuYr32ZEhXmF6
         ID9F5Gf/3zxo/d53CC2SyFusTC2WjEH8lrYM0r0Idb0doK/uzHxqLlhlNJPw0wCpEox9
         4YzfPoPYgEggUgluPu/+TIngBdkm3wSzLj6lZxCBSgLkgzXWNrtCjDIYyExCq5qCKZ7N
         JU1Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771192427; x=1771797227; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GpTRuYK7ZqTbRVT/iBUcXiLP13Gpla4xRHLLFevaJA=;
        b=bOclfiF7rkbnroytiOGAVaEFlkLvzOudy1MvvOfktC9LTt4hIPDD3KYAXWF5AdomGw
         rtm9nZRdOzD9Re+dnsvTDSj6pN9BfyHKIoLcVFbPU3GnOygQk7gSLsS7nHVzww/DFhMW
         Bx08rlByTdKEcsRT3vt3LhT10TElFJwLIpYzQtn9CX1i/TjtMCBMg+qixDkWYfHM2iuQ
         0sFLgZhPJYzdtihFp4B1FqyqjJyvgOaqOegBqhkM6zRV6aflAa8H2jmenEADpm+bVQJJ
         kNMlbVmNFwt0jCJlPwCzVmFI8BpemKiQhO00PHpLcJwHfGbIDp7302loJe2P6a9+rMtS
         vYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771192427; x=1771797227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3GpTRuYK7ZqTbRVT/iBUcXiLP13Gpla4xRHLLFevaJA=;
        b=DB5QOFswDecegHiug8e9+YeiT+JCqBsy7SuF8LQ1StO6iUXWr9HakFxQH54oS81fZB
         5vz6VMMor6jrPhqsAJzTrOOKD+lA2WDpG/vn3eyTB/vZsUb5qeU9pBon8FFkdTipvXPd
         XcHH9OkmdpYLu8dYPk1QfWD/NP4e3GYwfF0fd4i6euBfU60m2x3tyN1NSyl2PAf5f7dQ
         EB/hypDoifT7uYk/5nXArEqixNgaZz8Kb/LnetBpZZGiYr5XffegGDL6yoEB29bATJ12
         Q6qxjFJup5kMsTkQBOZEDYwWARo3fF70yBd3q81srvz2FmEm2lPkxqqemtyamO8YZOAv
         wI5g==
X-Gm-Message-State: AOJu0YxetaWL7mQKb36TWc6goKC63LBfTgVbsb48Q2UtiEQ5PvLqD0rg
	V6uzybqZyXXYhgckUjnKuoHZW2MRnI0yVxzSS2FQjziiGkVCG2dqynUBq9JadRJB7/GV3CDO3Qp
	1vwGAXdik+nlIrEnzZlkTAR1mIGBGp7c=
X-Gm-Gg: AZuq6aIbY6nZGmdGf1dz8xhuD2mePLlnQQKEXVttW0WQ4UQONewwy0ljGcDKgqFGmxA
	fSD7RbsiRb7+ppWPHgM60EWLXFCWEh7uJkmr98RNzQB3QRcj8lKkUUCBpDMVvVo35FPQ1fOeG/5
	b8Rpi7PwGRrkJid2GMWOMcI1V0DtZp9i8w1YtAVqMfLlq1i/3qbhfNyIxRz25Gfp+wnQvYWpviF
	6XWrDz0O/PkjB3rxsOkzHeGKsp345AdcJI/Glg2J3IOXNh+sjmW6TEKO5tIySqGVAUl8NjU0NYf
	WH28bQWAIyY7Dx2+EfE=
X-Received: by 2002:a05:6820:4c15:b0:676:9ba8:e486 with SMTP id
 006d021491bc7-67767198f38mr4899320eaf.21.1771192427164; Sun, 15 Feb 2026
 13:53:47 -0800 (PST)
MIME-Version: 1.0
References: <20260213014119.3451355-1-ankur.tyagi85@gmail.com>
 <20260213014119.3451355-2-ankur.tyagi85@gmail.com> <CADySD0H+H-w5iUUFJcGLjp=q2oEbmBWPY+3usEjDz82RHyWD-A@mail.gmail.com>
 <DGESXA5MRHGZ.2WQP923GQ4SYU@bootlin.com> <DGESYN3NJURK.3GU7PIXW085UT@bootlin.com>
In-Reply-To: <DGESYN3NJURK.3GU7PIXW085UT@bootlin.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 16 Feb 2026 10:53:35 +1300
X-Gm-Features: AaiRm538hk4aWAYJf88Bg7qeTqDHdP0JAqAg6GmUaenPoRK2X7IikerE8cBqtbw
Message-ID: <CADySD0GSVCUQi+2J0nAJiwMCGjMmFMQXb5F3NdNzmcsxGkF9dQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] mdadm: catch sed substitution failure during install
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 21:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231170

On Sun, Feb 15, 2026 at 4:50=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Sat Feb 14, 2026 at 4:48 PM CET, Mathieu Dubois-Briand wrote:
> > On Fri Feb 13, 2026 at 2:44 AM CET, Ankur Tyagi via lists.openembedded.=
org wrote:
> >> Hello,
> >>
> >> Since I am unable to reproduce this error locally, I have sent this
> >> series only to be tested on AB to investigate further.
> >>
> >> cheers
> >> Ankur
> >>
> >
> > Hi Ankur,
> >
> > We had a failure with your patch applied:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3353
> >
> > Do you need me to extract more details?
> >
> > Thanks,
> > Mathieu
>
> Sorry, wrong link. It should be:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3352
>

Hi Mathieu,

Trying to understand how come do_install() succeeded but
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260214-8ytqayuf/=
packages/diff-html/
show sed substitution failure.
Can you please help point me towards the mdadm recipe logs?

cheers
Ankur

>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

