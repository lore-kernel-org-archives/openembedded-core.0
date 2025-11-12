Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDAFCCF9F8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 06:09:53 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6997.1762927784449770471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 22:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VqDAyzN/;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8823cde292eso5744376d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 22:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762927783; x=1763532583; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rb5G8G+Jg08FuERZqcdFaaztc21szdm1dCPDboozMaQ=;
        b=VqDAyzN/OsTh0Kp0SQ22+CKDumM3R5cxDaHP7wqQIbx+M4D6+k+ED+GhGhjrfSNviX
         P9q+ov81QxkgXjGYlGZ4evtibT1aLnqQzGhr6SIuSlpz6E5UpesStAwEeOK02gS1Ni2e
         tgLTo7nS8h+Sfp5HfwzqDeLcpTiY+bsFzYnEmVCX9lNKtpQ/3SFd60qQXnvJPTlfjyiz
         VQkGeludYZ3vhrjgwntn2ks12Pg0kOsYroFnQTXUqQ/XN8oGG6IRAEzFfLnNSQxm86S3
         Ryxj8vPm0tk9vl5Umiw8aAhAuG3oUW6VdzO01ZCfvBHW8V7C8Vv7bIyowa/WlVfnCNp1
         8y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762927783; x=1763532583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rb5G8G+Jg08FuERZqcdFaaztc21szdm1dCPDboozMaQ=;
        b=dUdx2iuiK6YzvREVlKdtxiVB2xJjdF/DmwyNwv7bVGPQwAsLoqQS9THjN+2yglzs7d
         u3MZ8u88PRUas1TXdSaxG1VPUakPmnduVZ9MrmIoNRArX68swPmBknFgcP4TQwISGK8s
         AwxNK6QmPAWx3VWE9GR0fHJlX3M3bFDq0ociZcLrHV/gc/hQ7zp7z/VbTLDqu4Epk/HT
         O1G0/wa7+JPRbEuOMyqIi8dz0FajXEC0tmxLa+MZ1PpjROP7DAT3MxPog6xPfvXQ2MrY
         5ubiaML/ZuRxeBr0fLgdPNkarbRTGhOWOpXch3DCIedbN29Jq3Y6FsDALgNGb37uUEOT
         jcBw==
X-Gm-Message-State: AOJu0Yw+8tQCIm9PN3hupBDGMZBSqRqTxArdoZxQsAGpAIREh30oqt+G
	RsQazyZlizHhBqd7rBFQ+tkxQ2qpJqNUSuCwbooMnNkPoFcPvE3iKFYFsEgHby3OF5fdd/CT+d6
	zIbYEG09Q/yDwxeJn/xAs0rcENtYoaMQ=
X-Gm-Gg: ASbGnctP3Wptj8qrWEC9l21xDLF3EX10wRDCB1y9UN3U6XSXH4uvhVZH1U7bGKQW6QA
	ACGYyd9qdB6+m7CxFAHbTOW19fhyRefN2i+Sl7qCS5XqyDjMrhQTpq/ToqgFaCPZPa5tmGNwXQn
	MtJwHj/R7QELH9pakh/daCPD6+bpHcWVBf4rOBKXFC1v/LVNP20m2/WlnFrpYK6uSZsyktHGQzs
	UAaCXmcCTIduXUdLzIKKtLO3MpUwSsxVuDJF+igmJ/q1dVzwMEKFBpFNJM=
X-Google-Smtp-Source: AGHT+IERx/j1N74dtrKLbj704IAkma+TKDkkUyVbRr45iQgF7FWK14wrZhi5Hh54H+U6lYdvRhS5KXVO6Z/6OZIywYI=
X-Received: by 2002:ad4:5c66:0:b0:87f:b58f:154f with SMTP id
 6a1803df08f44-88271a35effmr28771346d6.50.1762927783329; Tue, 11 Nov 2025
 22:09:43 -0800 (PST)
MIME-Version: 1.0
References: <63cb0d09-2b76-4557-ae38-8ac2d1772cdc@windriver.com>
In-Reply-To: <63cb0d09-2b76-4557-ae38-8ac2d1772cdc@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Nov 2025 07:09:32 +0100
X-Gm-Features: AWmQ_bk1TiXHiFzE2C6fk2IX_ztf1E-gcAMUR4Mbzo-uuu9gqcCKC-5SYxKU3pI
Message-ID: <CANNYZj_MX88gcP+LRtxig04V=htBBpJQ1j3kiPyEw_+goNoYnQ@mail.gmail.com>
Subject: Re: bitbake-setup feedback - long subpath + hardcoding machine and distro
To: ChenQi <Qi.Chen@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 06:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226195

On Wed, 12 Nov 2025 at 03:54, ChenQi <Qi.Chen@windriver.com> wrote:
>
> The subpath is unnecessarily long, e.g.,
> poky-master-poky-distro_poky-machine_qemux86-64. And it's hardcoding
> machine and distro values.
> Such design might be reasonable for testing infrastructure, but it's not
> good user experience for developers.
>
> For example, what if I want to to build things for qemuarm64? I'm using
> layers under the a subpath with the name of
> poky-master-poky-distro_poky-machine_qemux86-64 but I'm building for
> qemuarm64. This feels a little weird.

The directory name is hardcoding the choices made during
'bitbake-setup init'. The reason is that if you want to run 'init'
again and make different choices, it would be able to create a
different directory, and not error out because the one it wants to
create already exists.

There's a patch for bitbake-setup to give you a chance to write in
something shorter interactively. You can also pass in a shorter choice
with --setup-dir option. You can also use --skip-selection to omit the
selection of distro or machine, or anything else that is asked at
'init', and then you will also get a shorter directory. But the
default needs to ensure different setup directories don't clash, and
so the choices are hardcoded in them. If there's something else we
could do, please tell so.

Alex

