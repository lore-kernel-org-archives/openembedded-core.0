Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.37.1587380343765310403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 03:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=uh0mI3Cm;
 spf=pass (domain: burtonini.com, ip: 209.85.208.194, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f194.google.com with SMTP id g4so1269483ljl.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2020 03:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r7YF45/KfM6AE+0qXyrlrAyLMwfUqZ1ji9WxkXL4PDU=;
        b=uh0mI3CmXQ22U59jczuCOzUl/US3USlzO/ziYyx6iyw671y/Fly09k3VzwMdEkPckh
         CFdmrGJM8anAyzwRojLLDy+LSiRBTY9s4v9JngX4lfw56cjpVB4a0MzWvIvn/Q9bcx87
         AjfKuVFCxwTLmdWvuSIQjLNyOw47dwdp0onTjM2bf4JKBmojnS43T7nYocpGZxQTDpn1
         uF72T2kGTNN3vuZiTwaAbPHiZMkiBljdWflyYmjOVJcQM3KqCu4qoZc5IhyUzVXeYTNJ
         u48RW4SwpcwM30cSdwWMp5IhAdUnMx/ObkYLeG5CsARQAyEfVh5vnq+12q9GgzWpAaLv
         BltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r7YF45/KfM6AE+0qXyrlrAyLMwfUqZ1ji9WxkXL4PDU=;
        b=uLLZMNCC2gp9Uw4Y1ewta5nZq72vRoi6ImJkncAahQWEDJw+vvuBlWyZvt0pMRLmup
         WfiNpzC50Hn2rcxDCH24ihwBJfOc4T31UlqTwLkB6EGHq58f+gVnBtTi//gMnRVhNNHp
         0GpV958fZ6rjJpXY63uNAnRj1Gjdo+ZcIHx112dFC/zMj+9KFzB9f+HuKBgF8GjZHF/4
         15GebQkVVEaN90nLPqe789Zg4Zlpeu/Sd7rrblihIl72H1nOahFsErRAN62l88MeEb9r
         7YhUBbUzMmdE1OfAawiuMTaj6nDoeSDmFCIo8zkwExXvC4lFg+YyldG/v2y2qoUSDARR
         u8Xw==
X-Gm-Message-State: AGi0PuapDVnB+Q7j8/gUTtJKQAHl4KzL+396qHRfOdWsluV6cZG+wqQs
	RinAQ1F5Ze1JAawmBNYcddSlbpGd+j9YqRBDdt3w2g==
X-Google-Smtp-Source: APiQypLr1e56iWpYO1kTlcwWYTBdf9Oq8IWnwRtcXK79iLNdNU5xmTydKtfsbdRucaOVnHZYyqGzHJO0WmInJ5a3It8=
X-Received: by 2002:a2e:9718:: with SMTP id r24mr9192643lji.287.1587380341713;
 Mon, 20 Apr 2020 03:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRSvxc-Vv3YwJR0xGGQBNmU9NA3V4zCPZfQb17heZhi-cQ@mail.gmail.com>
 <CAAnfSTu17U9n7T7xE-gNszkscbC-_T-WovUP-o_NpD4_uYF4yg@mail.gmail.com> <CALbNGRTDnJPeqRLN7AwtNUrBknVkPNVDS9f=7xopk-vRnVYv5A@mail.gmail.com>
In-Reply-To: <CALbNGRTDnJPeqRLN7AwtNUrBknVkPNVDS9f=7xopk-vRnVYv5A@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 20 Apr 2020 11:58:50 +0100
Message-ID: <CAAnfSTv2HLSPwbvQr7b2ZkZAOG3JYg7S-FoXDCA3jvK78yNw1Q@mail.gmail.com>
Subject: Re: [OE-core] Meson host_machine.system() incorrect on ARM?
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Apr 2020 at 17:40, Andreas M=C3=BCller <schnitzeltony@gmail.com>=
 wrote:
> > There's an argument to be made for validating the OS name is in that
> > list before returning it from meson_operating_system.

> ^ I read this several times - but am not sure if understand it
> correctly: Do you mean it is not correct/expected that meson accepts
> an incorrect name?

Sorry.

Meson doesn't validate the OS names.  We submitted a patch upstream to
Meson to validate the architecture names and patch it locally to turn
a warning into a fatal error:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/m=
eson/meson/0001-Make-CPU-family-warnings-fatal.patch

Maybe we should either do the same for the OS name, or in
meson.bbclass:meson_operating_system() validate that the value it is
going to return is in the list of known OS names.

Ross
