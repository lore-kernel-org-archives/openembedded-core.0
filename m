Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30637E83840
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 22:15:05 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5607.1771280095531729366
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 14:14:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BLwP0/Xe;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d4c383f2fcso2300638a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 14:14:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771280095; cv=none;
        d=google.com; s=arc-20240605;
        b=S7MbU73dr23Dxj7SHKs4D376oKH1+Z5v6RQsdtJOnnfbmdfM3Ott4x71eUZ8IvX7in
         vfumEZWepJuHVBXsEYVL//lmK9vktb6UuHcCG6yt4NvNp/wZKp5D+GAEILwDzxUTlfGz
         29WfP9L4kQa6+lTeUDrWqrQDrFuaMcU6VZqBNvG58zxDXO1VlKPgGpScoFo6iJvoR0SX
         Z8IbZ5HlxZ53FZjW8FG+RfC2GO6mSh25Kub3umbZ5Y2903Om7/P8oeanm5INLyN5uK/P
         80JlByQiLb7fXDQ2dTERg/wzS+zl3EHSuxZXJ14aDvJ3e4n3Xzs6Q3TAbcR2PdqDlLLG
         J0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dzEwr6+nljT04KoFrB9xYXaotJem0V2IBTPw4fvEdmI=;
        fh=bSRSj/2LPmGosxnFB9MYDSHkYYYBU8iZ5r/irZwFt1A=;
        b=ilQ/4bRIPbuWd3l+2vPQUwpU16M4AWtdh+WrCMmEwH+B/UXBVicxKDjTmkJ6Rxy6Ng
         9AwJ/VQquNWBd4TWyV0WJtaLoTA0vU7Ofd0Y+qggGSHIst/vYlPsdmERTIVJ6jzSLKlY
         1ceZE4foDY/6DmWvafXOGvz+nlWlssNQqQK7zlRadNPhcOnxBgnqWmidUBgesH19gGwp
         8x+5g+XJOsHzWRV8/vPs7h35T4u5w5irVNpfT9s0q9bnZwjrpWyKhQBbfw7ADJf9zvys
         /p7KqvwQoyrRnRjncuai5nOqSJGNoN7dRKldqXLiIFtcra/YaRGtLzG99tB5rFa3MAEQ
         JpMg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771280095; x=1771884895; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzEwr6+nljT04KoFrB9xYXaotJem0V2IBTPw4fvEdmI=;
        b=BLwP0/XewjbeWAurI9vcSfJRB1uO4SnY38WmQsrZiaZoSpP2UdCmSc5O7jyQ3d0hFn
         I8WxONW6FhVNhs12S4zE2ZPGqVVvTfPbwV7XUm1zO94/x5AG1oNTN8pTAWxyLR6P1uAt
         9FyrvjvmPRXfbQqDTA9X7bjWWsWgomHfAb6pWSokNGR+9TGGOItf73hHDiTerY9POdom
         X5YcatjWI4BNVXAKh03LFvo2FuAiJC2Y+rKlX3QQuk3qtx3O/J7YSnzJEsB8uo0Cm2/4
         NjyS4G/eGlILMDf8mVC2DOj7mEDFOLEjbFysPU5G9+DBoRBIs69TlaA9QRdaMZJIhot4
         7+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771280095; x=1771884895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dzEwr6+nljT04KoFrB9xYXaotJem0V2IBTPw4fvEdmI=;
        b=evAoWZaIowRExi8CBzMtaEeffVAMKmTPDbQ+AZaEekPGQ/UoOGUWn8zrykxWRbdXHq
         D0BfZhfX6O3eo1z6FJh0qETFavI+/s+ZYxSR20/8eMydHFSEO0115nO0SALIidc6/Fhv
         w3G6bec155BD8I9Rxi7KI22M9AGp4orqQJqmGspiiysD2DnrUVEhtn0Yxj83boyLgYDe
         MaXLBXvYOC5lRa+XvT9su28WzD2sciL6pNtsZF3N0noh8y3E9CUEhvSnE/CAmIlEs71y
         /kKNteX9CPKO3HRRuYPa8jFG4XNtXixJy+/qUu5KdcqzNlQL9uVp++Zq67hXIS0WYr3P
         iSoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtCA5csyTQ4cxlfKUR31dgm7VprVDE9sVIwlyiXNiopxScS2nY0U22Z3iw4V6yTibWCLN/yfy9iRIluZrsOyD/4A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxQsgswjXakilvd2EGnqpBXBsXLkCwq95xvg8WqMj8i+9Gt5cza
	iS4W9R1k5OhzmH9TWsgHH5MGtEeQQxK49d6X3nte4EZWMcl5g+kH6QesJW9tvC6knZb1eA7+FqN
	nIRyfuiKtUDoXmAgk8R68l+5rdZFgi+iNZZe0
X-Gm-Gg: AZuq6aJJCv1/arTZ0M0/F4+eNl7+Y8fH+iGYuKmG/OF3OdaSz7ZXq+4P/fmJ0Q1tdch
	TJTTl4vA6FmhQofR5kxoUy+jeXU0OOIta8js3SKg8QjR1GT3txkm+hmshNgH4GYmQ3y4yDT4QD2
	oSLF6PtGPUe2zgcJMOr4Frf3EiKcFv8UIYS5/osD5Z4XxPnmYmMryi4YNN/CgmLr5AuMSczuKKl
	HsQM76JS3PGMhAyKgo2VxNSCInZA0mhmy0WOVwN5huCHzSjTqQWB2vF7yZm5R8UumhPnTGnEgOD
	RdMfrCvt
X-Received: by 2002:a05:6820:4687:b0:677:5e0a:a92d with SMTP id
 006d021491bc7-67769b733f9mr4943574eaf.73.1771280094741; Mon, 16 Feb 2026
 14:14:54 -0800 (PST)
MIME-Version: 1.0
References: <20260213014119.3451355-1-ankur.tyagi85@gmail.com>
 <20260213014119.3451355-2-ankur.tyagi85@gmail.com> <CADySD0H+H-w5iUUFJcGLjp=q2oEbmBWPY+3usEjDz82RHyWD-A@mail.gmail.com>
 <DGESXA5MRHGZ.2WQP923GQ4SYU@bootlin.com> <DGESYN3NJURK.3GU7PIXW085UT@bootlin.com>
 <CADySD0GSVCUQi+2J0nAJiwMCGjMmFMQXb5F3NdNzmcsxGkF9dQ@mail.gmail.com>
 <DGGAE8BP2YIH.1IIWA09KDYRV2@bootlin.com> <CADySD0GGZ4azL47+L9OcK9N1DeVLpiDVVg9QN5HK6BV-LiXiqQ@mail.gmail.com>
 <CANNYZj_MEE5fhBA+uvnGLivX_Bf8dB5DGX3Ff3+2MU2L1S_3vA@mail.gmail.com>
In-Reply-To: <CANNYZj_MEE5fhBA+uvnGLivX_Bf8dB5DGX3Ff3+2MU2L1S_3vA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 17 Feb 2026 11:14:43 +1300
X-Gm-Features: AaiRm53NHokCSojKnmiSQNw1el-m-7mUsSWaBwisuuhGhIja4RrXqDagbtwQt-o
Message-ID: <CADySD0GSA9SsXR6tu+h_KmzXc_M_D6D8ZnW-d3USLNQEebmVpg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] mdadm: catch sed substitution failure during install
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 22:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231227

On Tue, Feb 17, 2026 at 9:53=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 16 Feb 2026 at 20:48, Ankur Tyagi via lists.openembedded.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> > > > Trying to understand how come do_install() succeeded but
> > > > https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260214-8=
ytqayuf/packages/diff-html/
> > > > show sed substitution failure.
> > > > Can you please help point me towards the mdadm recipe logs?
> > > The problem is I probably won't have the log that you are really
> > > interested in: left side (A) is built using sstate-cache, only the ri=
ght
> > > side (B) is built locally.
> > >
> > > So we do not have the log of the build where the sed failed, as it co=
mes
> > > from the cache. We only have the log for the build where it succeed. =
I'm
> > > still joining do_install logs to the mail.
> > >
> > > What I can do is run a few other builds, hopping that at some point t=
he
> > > sed error will happen during B build.
> > I have made some improvements in the Makefile install rule and will
> > soon send v2 for the test.
>
> I have this horrible suspicion that the BINDIR item still comes from
> sstate produced by a previous build via a bogus hash equivalence
> entry, which is why the error never triggered. Which means, when you
> send a new patch, make sure to also install something harmless into
> ${D} from do_install, so that the recipe output is different from any
> previous build.
>

good point, included this suggestion in v2 as well
https://lists.openembedded.org/g/openembedded-core/message/231226

> Alex

