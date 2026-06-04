Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AFACD6E6B
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 11:46:52 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9466.1780573609568460323
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 04:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O25H94sh;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8cceaacd07bso5581096d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 04:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780573608; cv=none;
        d=google.com; s=arc-20240605;
        b=Yl0I6aUqaQKWAu12aBDMVci6+jfG81aCFCk6HEHQk0Ei343kBUP7Nvep8YExzpNWWk
         M6vShcIus1qHoU1HBHWXs8uMg0vLS7kBQniSfWSFiGUZ1N27osw7CESUEEu4DTpzjlkP
         Msf+o4qnsigCzPWLGGroy7UO0EujJfLV3PXfrCxxnUCtpsbstaooT/LbFqA7+gDn+OiG
         BJYD3j2qyPOa5IwobsuTMKbir+VSC7QAbVh4BD0/Orq0o8UuYqC/Xk8bCQDY/1ikEih0
         UdIBkcAVPgk649aD+TgnlcziAtFB/9A8cUEOXVFMVllMLVenFIRH+5WIE8UDMzNip3Jk
         zWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D6p2XXr8YS8/4psJ1WcCRet0rKQrrL9XWk8IEjhEnWg=;
        fh=3y+xQcHeFd0FImJ9AX33yVbvWSQiwPr/Lco14hP9gC8=;
        b=UotNjRBE64dwz6d8W/MNTqOG358QlbNT8WcujYdjxjsZt6/QyshV3QnB8+yM0Dn7/1
         1hON034aNkJSQRTjG/V+UjqT7/VKkG5hXKjdgXbnS7qhj3zRVUyuG5Zx+JFKVMOlrTi/
         EpTddOMVWc5SBxWVABs0M6qXJ45XL85mN6lhBa5uB14VaZSuf6kMsiE2isuTniKAGVot
         P2DmPwq9Aqyio8lt6T7fnjwJW0LaZRDy31Mq/6xGuaDwYGcLUGxlL4WBZQBM8yeiqk81
         3oMlw4SCjIWUBC4dGtQxfMZ2GXlJGFke4/1scje2c2Fs9wRfOOqZdCcFhaqjbFUsA+Jo
         5p7A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780573608; x=1781178408; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D6p2XXr8YS8/4psJ1WcCRet0rKQrrL9XWk8IEjhEnWg=;
        b=O25H94shWeHJrqU2MVLMnBqL2BQJSzoWXHnRbpMQoREDSJEIqJIRL3W/yJRecybAWE
         N5Wb+KWn0MVGus4mejW7JKR7dGv3VvDQibVYXMsJZUcpXRiime7/42yH9BD3re/QPKey
         Lbx5qorU3X2frnpZJtPjnYyO1RemmFFu2H86Srt8uUTNhISt61oTinqN9CszKeB2FYUY
         xw+/rriUOagzbKprVbbnlXGTHQCTX+Tm8gsyXqFI7CgVmsPeGJjvkgGFOC9vfRGOFrIv
         DC4gwZRZurQU7WHseUF+jSBJ8I3wP5m5fGngsg8AVvHMhzmvnnL9d8akMwl1FNX/guy8
         FvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780573608; x=1781178408;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6p2XXr8YS8/4psJ1WcCRet0rKQrrL9XWk8IEjhEnWg=;
        b=TPokbjBIbAPZSDtML017qYtXzmCLr5W3y3/en3Exzd40EelivSr3dMjpsH8wSYFdee
         +MnuNTklde5P2MUJNRzXBHpwUNfPb1XRPJ10Hxs+qevabwr0Nk+SzlXMijpA36I2HUVE
         +AGv418pEcEKsC/k2cfVJ2WUlf9tsQX0Ir5vWr/uh1AmBDo9ILc16ajiBUnxvqDWKOt6
         0XaJar6hn7K3Vt3vgw1Dyj2A+SlATdmd8DCFB0Nfaa9k6ajlLhYsrxkLbFc6BUvPgELj
         Yi5IH29GEjvo3K/lIrhKISZJRtRci+apLsXwzAPoHbd3rS5tGYDCoV6ZBFR4bwyRtuUX
         n2gw==
X-Gm-Message-State: AOJu0Yz9FWzsHthJNDEPVGCXUItQDNv6mW9hMhcTHCznLWx5X1Zt4qo5
	ztb12KH5/qLQ85TksXfSLeSwAo1733sCE/dJPzslS/0l5oXPhas0xMGzMrR/5u5g+k9WpjeQE/Z
	qqGam0bBLy5vTMUPWFu6NPO2psXd/ZJo=
X-Gm-Gg: Acq92OEQFe3SViXbHgBckZMZXWMt3nIwjcRYq1mA5zVw7N1RXLpU4irvSHYyBJlJ+rI
	GkPxkFr4WNRhFtoAwD/ge2NPru2BW41QWCE6ePR3DFaESzFg/39Tc8fhNFhEeubwwmoqSWND+/n
	LqaX1B44YpB2rxT/5uP/0spg4YDSm++NvKZl++kX9Qf/pJCT8tmGxQj7HLrpu6+o+srkQXyf4bq
	pv0nbYC/7LuFGxAWpd16FZ4wp216l/+IqJRHmnfjI4lS7zpwQV8prGdL2TuVZlOB813Om7BuVGt
	BEGVhJwL4JNJq7NYZ6su9YwiVdBUie/lezltDv3Kpwc0fZAgviqIgE99B0bUUV0=
X-Received: by 2002:a05:6214:2f13:b0:8ce:aace:eaf8 with SMTP id
 6a1803df08f44-8cece152728mr123925336d6.43.1780573608604; Thu, 04 Jun 2026
 04:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260525080108.940237-1-daniel.turull@ericsson.com>
 <CANNYZj9mwWQivfWuO+tPdpzV91_Sw7=LgKj8wj+gVg+ejVf+eQ@mail.gmail.com> <PA3PR07MB107214DC2F231C32D6252FD5F8A122@PA3PR07MB10721.eurprd07.prod.outlook.com>
In-Reply-To: <PA3PR07MB107214DC2F231C32D6252FD5F8A122@PA3PR07MB10721.eurprd07.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Jun 2026 13:46:36 +0200
X-Gm-Features: AVHnY4KiBQCVu3kLn4CFWcA4i8JVGZKuHc5GdtvMbTIeQWelplwiFJizWF-id4k
Message-ID: <CANNYZj-RbGm3DENs8j8LyfztofaMaZxEv2GBc4wWc4U20SGQzA@mail.gmail.com>
Subject: Re: [PATCH v5] devtool: upgrade: extract changelog between versions
To: Daniel Turull <daniel.turull@ericsson.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 11:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238128

On Tue, 2 Jun 2026 at 08:53, Daniel Turull <daniel.turull@ericsson.com> wrote:
>
> Sure, no problem. Once you are ready to add the changelog in AUH I can rebase the AUH changelog patch.
>
> This one is independent and it won't show in the commit messages/emails of AUH until AUH supports it.

This has now merged in oe-core. For AUH, let's get the incremental
mode working first, and then we'll add changelogs to that.

Alex

