Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2D5C6FD1F
	for <webhook@archiver.kernel.org>; Sun, 31 Mar 2024 00:25:01 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.9006.1711844694803394957
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Mar 2024 17:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hS/ffM/V;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: rwmacleod@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c3e2e0e407so2279812b6e.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Mar 2024 17:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711844694; x=1712449494; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w5ArKOWJZhNeFl/3RBUSfRLJXpryf4h+aQ2gnAdneyA=;
        b=hS/ffM/VcocGT6u0aGHImPei3Z4vYj+1hXV3oTCgbcZp0ECl4nxIQyxG4PTDmR6PEF
         wHqkzqLlhHnB9xRImUfZr0Qo3ysz3oTioJr1LiJbph8zJudeI/SasFZGmRk089ijuVPu
         WLMhTV1r7unECgLeCzz+/nRoMOXC7WBWh8tP8ed6Qw7y6yAInKB/gGgutlx7wtBVFMWu
         w1PFrl9F4Xzk7vjDZ/j1jD+4VevC/7MHXfwhgR4mZZkvqwvMyUz0rSKrNuHJl/oTv+SJ
         eT/Hu3Zx3XOqsC8yYBRhjbrzBxw7ZABGZpLegszp3BsU6FmS/CzM0dWi3/x1wjTbVsCO
         zGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711844694; x=1712449494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5ArKOWJZhNeFl/3RBUSfRLJXpryf4h+aQ2gnAdneyA=;
        b=Rc/0BboMsqb2AJaPXvHP2K9Rre73cOToxtc4aAXYy5y01bIIdlsL1a1XTzrVYXllAz
         tKuVFHLc4jlU9juOB48bp2qYAEXKUzWPIe15U7pZrP88AbsdqV0ZUg1NnZoGyzDS4W6G
         qK24XcMTCukhFDtU42UgDeWaDA47KFBYtZk9+cb/3luCAlJhICp0m61N5U4wJARnof8q
         WHrJZ0s0kZrhYlN2JciObDiju7VsEl3GpARfGBX0MQKUKlpL7RMFc/8WDz7xyEH5ASLa
         VsaY+PoZNHWS20hSYsThxHHsgk+TY5qLoIJw7vgbPIB5N1+vCY2IgqBUpHJGQ+XdPVwK
         8rXA==
X-Gm-Message-State: AOJu0YyJsTs7wu5adUVczaKlmamSHWiONf1jr0fCtibolrlpb0iebZ2M
	ZmGY3n5wAbiQdhK2GI6ocDi32EvEcTPxniqrxA2hN2X7veLntNlgvdlLJj4tFyAN5hXHgJDgfR5
	HJ8TYaZMrpF8M19c577jwzJyLRzc=
X-Google-Smtp-Source: AGHT+IGa1WMEVaLiA/UAJe+hWWTsTu6DlBn7khcv62knXauO+jQxszr9Tp7S5EaCnlvNDsVHZ6w2Fq/IHfOzeBdKrOg=
X-Received: by 2002:a05:6808:d50:b0:3c4:dac7:8795 with SMTP id
 w16-20020a0568080d5000b003c4dac78795mr3945506oik.26.1711844694055; Sat, 30
 Mar 2024 17:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <17C137F27040B581.32709@lists.openembedded.org> <CANQUz1_hPjw4kCpAG90Xc2O61p2EQgzWQH_DZ_DA2jq=UWpuOg@mail.gmail.com>
In-Reply-To: <CANQUz1_hPjw4kCpAG90Xc2O61p2EQgzWQH_DZ_DA2jq=UWpuOg@mail.gmail.com>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Sat, 30 Mar 2024 20:24:43 -0400
Message-ID: <CAK6=ix7ifFeR+RXdR1mAzLQHoZL8ze84=QBn3-n8NWN3hDtHwQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] util-linux: Fix for CVE-2024-28085
To: vanusuri@mvista.com, Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e68e440614e9e61e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 00:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197654

--000000000000e68e440614e9e61e
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 29, 2024, 11:52 Vijay Anusuri via lists.openembedded.org
<vanusuri=mvista.com@lists.openembedded.org> wrote:

> Hi Steve,
>
> Please ignore this patch.
>
> Thanks & Regards,
> Vijay
>


Hi Vijay,

I expect that's fine with Steve but in the future, it would be good if,
when you ask for a patch to be ignored, you briefly explain why you'd like
it to be ignored.

Randy

--000000000000e68e440614e9e61e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Mar 29, 2024, 11:52 Vijay Anusuri via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;vanusuri=
=3D<a href=3D"mailto:mvista.com@lists.openembedded.org">mvista.com@lists.op=
enembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
dir=3D"ltr"><div>Hi Steve,</div><div><br></div><div>Please ignore this patc=
h.</div><div><br></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div>=
</div></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Hi Vijay,=C2=A0</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">I expect that&#39;s fine with Steve but in the future=
, it would be good if, when you ask for a patch to be ignored, you briefly =
explain why you&#39;d like it to be ignored.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Randy</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><br></div></div>

--000000000000e68e440614e9e61e--

