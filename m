Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2900F8FA9C
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 16:49:17 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38727.1776790150029087139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 09:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=T+y8GgQf;
 spf=pass (domain: underview.tech, ip: 209.85.221.43, mailfrom: vince@underview.tech)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43fe608cb92so3118635f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776790148; cv=none;
        d=google.com; s=arc-20240605;
        b=ltx4ET/El2Om29BHdpgA94sbcKjsSjgctKT6j2XHb1j6mUvrhZN2DGA2WMJAUCgOZF
         hs0VLnVH9GYmWRDEzyMnIn2yiccwbU6fK0/wSWvLI4/pELS8bhQ61y8aABMcVMIf48h4
         u9j+tIhE4fgoYdZo5hZA2HcQejnClfBGlkkX6nHjA3BCxKpfq6KwISYDaULu7hHMeLKz
         3wrs0ay1oHVG72ZXusSwYuamRHXpR+zHlMFRiRXAlyslMWW8EyWDJ3VUrLZ5uMQ/b2T3
         VM67jkKpzdfzV8KGdwUjZIQK+O3k90+H/YamzXj0VaAD4SLpxtvPz5CMXVr+MozxmsHe
         b6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=77TsXqHtFQKJPpJycXCLFee8cSTi2arPLIUNNH81D1s=;
        fh=NNfI88hsO7CI48JebUBbbF8/V41leukwKJNyqPQXUX0=;
        b=V3DWvWaSLJJKloKZEEHjqHMG1jsyf56D1h0HRRW6o7fhLrLT1XI4cxWihbG0iHcLvW
         HdFbLSMo3h0aC423U+0C2p5z3cRuLcjesAP1NNdhlC9x1nuwi/O6/GBuB+LT0CaW51WP
         2EeUS3kLDRFEkDFlTYhrecf78zILc/USTdT2/GBqG7NvzJUuLB7DFIKTLKzkUvYJSBT0
         eERzrYh/IEdpIJrfM7Qf8isLJlo3eXmMnxUnmEL6p4tJamoFmiKl0JBl6wSHwjP+Yj6p
         K2NWOzjQZNnUBiQm3RvzN83wvjL26nKRatDCwvWHJKeHlJTAF+1xojboMHOdx5rseg63
         xgpg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1776790148; x=1777394948; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=77TsXqHtFQKJPpJycXCLFee8cSTi2arPLIUNNH81D1s=;
        b=T+y8GgQfuE8V7KJyDxYOjRKZ/Puj5Ijm5Z1ooNIRMHqQKiwwl5M5FK9NxXQCt7Ws8X
         nRlqctVqxn6g3cRlmDWCmgnpq5Nod6nbjnG7sUHy2H1F4JxzppEo/H5O74erq4J1aA1V
         At2/6nLZMY5wKJb4RA7lVj37bjD/roCFQR5DQaf7xbki7FSAgnG6UrY3pXmfi5vvmHSh
         q3Pf3npxHFf8mPV4B0HhyV3geE4ygbS/n86jY1B6PWIZzip3JLlXwPWsGvJYlf2DMRJ6
         KNAotpzws1bRzwmdkvLFzSSYtYHNPDu14a38vwGNKNUAi9x0mXWDrtigpiMwKfkAYscV
         jx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776790148; x=1777394948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77TsXqHtFQKJPpJycXCLFee8cSTi2arPLIUNNH81D1s=;
        b=CwwaTmsDsa+9A+FwHiMyOorgxtsP7cXNc6XZFZCNF2iZ/1hAfaYyxh+E2hUi89DFfU
         r7PsaxjjaR3/xtbF/B/0w8nuVfuIPwmLIQKoMZIDeD0trb3BU/GSzqhcUXoQGpi1ZW/4
         LJw/xaH5ZrWegXJ2CJT6fnMswRq/Y9PVqwlovMRq4G0UcHoTWRakPNY/FlRV1R0+io0t
         EvlNx4TKTbF+qxgjIiok1PsaVwkSCOx50/4IUfWZaKYU9qo/sIBKq+HUydSH2oWVWYBc
         zJadbHrrX6cB81mb/bENp1fJMPFt/HVygMjR3jCvqB3jFtSUXu4yDS0uBgUEQ5UrnK3T
         sYBg==
X-Gm-Message-State: AOJu0YwusFcLwr/D/Z/F/XYV5wopw2Kar9oGblKsmGVYJPoqfu37CfTh
	AA8p1EgxA4jxCcZiNHrdsmwESyyPOGzkFac4gm1sSfkkQ8DBlTTdw4eSVNr60zs0I0+REbvpmBe
	RY5h9ooSlV8jO6NpU3HYbbVAX+avyO7ZGfrwe4b/Jqg==
X-Gm-Gg: AeBDiesXhP1rq8PBjizPqxxXB5E4CRkrXE2i7qfbQCSilXOBQHwXCLOHO/JUE1Wxr/u
	BkpNirLjm3kPSI2ZTLmloIsW2BI7IYr6HFGgs0OV33Sl+TXCFQQRTvqQFBWh7LYrAXeAcDZFnOd
	NMRSmP9003U7axMU/Y3hWmjH8mJqttAWzzNV9csbY3vD3M/HvXEDSbFqpwB0+V4CM60Sn9WDwVN
	k2bcsT0XacBNjY9qvRnNeRgVYJ106ZIaypvXe4DbAtBx+unwCCdLFBYN7xU4IUMJu+g6uqsaEZN
	FtH589QaKT3jF0ry2qJnLHgusw==
X-Received: by 2002:a05:6000:2511:b0:43e:b0b0:629a with SMTP id
 ffacd0b85a97d-43fe3e0a1bemr28776824f8f.34.1776790147868; Tue, 21 Apr 2026
 09:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260418214910.47616-1-vince@underview.tech> <9973BEAD-DA01-46ED-8BA5-C950F4B15DBD@arm.com>
In-Reply-To: <9973BEAD-DA01-46ED-8BA5-C950F4B15DBD@arm.com>
From: Vincent Davis <vince@underview.tech>
Date: Tue, 21 Apr 2026 12:48:55 -0400
X-Gm-Features: AQROBzC15MibJNBHI_3MJd7fZThshuY_Z47VIa4ROV93lJoE8voTfMQVFGJvmic
Message-ID: <CAPQx_gODhcxv4SZ-Ec=b4iNqgEJxuVC1irRAJwsh2DJsKQ04BQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub-efi: support custom embedded grub configs
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009ac64b064ffb313c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 16:49:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235687

--0000000000009ac64b064ffb313c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

O yeah!!

We can drop this patch.
Don't know what I was thinking here.

Vincent

On Tue, Apr 21, 2026, 8:32=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wro=
te:

> On 18 Apr 2026, at 22:49, Vincent Davis Jr via lists.openembedded.org
> <vince=3Dunderview.tech@lists.openembedded.org> wrote:
> >
> > Adds support for including custom
> > embedded grub configs. The default one
> > provided in OE-core is limited to everything
> > being in the /EFI/BOOT directory.
>
> The cfg file is in SRC_URI, so you can do this with a simple bbappend to
> provide a replacement cfg file without any changes to the recipe.
>
> Ross

--0000000000009ac64b064ffb313c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">O yeah!!<div dir=3D"auto"><br></div><div dir=3D"auto">We =
can drop this patch.</div><div dir=3D"auto">Don&#39;t know what I was think=
ing here.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Vincent</div><=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Apr 21, 2026, 8:32=E2=80=AFAM Ross Burton &lt;=
<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On 18 Apr 2026, at 22:49, Vincent Da=
vis Jr via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">lists.openembedded.org</a> &lt;vince=3D<a href=3D=
"mailto:underview.tech@lists.openembedded.org" target=3D"_blank" rel=3D"nor=
eferrer">underview.tech@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; Adds support for including custom<br>
&gt; embedded grub configs. The default one<br>
&gt; provided in OE-core is limited to everything<br>
&gt; being in the /EFI/BOOT directory.<br>
<br>
The cfg file is in SRC_URI, so you can do this with a simple bbappend to pr=
ovide a replacement cfg file without any changes to the recipe.<br>
<br>
Ross</blockquote></div>

--0000000000009ac64b064ffb313c--

