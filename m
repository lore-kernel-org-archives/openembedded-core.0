Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D22D3ABFF
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 08:41:00 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2467.1765010454244778855
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Dec 2025 00:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZT6jv9DN;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-88244d1559eso42465216d6.0
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 00:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765010453; x=1765615253; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JyRh9D/1rkGIXnF+qVeNqIRMSI/V5YSr67cqwHoN7o=;
        b=ZT6jv9DNx9RTXZGkYY8pFqwXuyJf3JDIDQKLFfn8BoGdiOX90BA38vJfvOzgHGHGkw
         vN5cIaZRNkd5f5RrvaHqHe6DJIvuYm3mIKFeV6G8Wt4v1V3xHoxW0gim/Er1kfugjwWW
         /23aTZfKwR94XJtSWjm0XABp0THzyK7zXX1mqkrNh6KmQZJjrhAtkve1SYo5npSSou/Y
         hJT5jKAC4GzT1ijheUPkJfWAk/Emk8cSODygmwBttcHSrQkO0rPsiB2QGtgZu+gDUWqO
         ePLM35TpZMUMTGztx9mmUxduB/mPFJQTwWneWGrFg8bRbU8hhVC4MISLC+U6XfpAahpn
         5TEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765010453; x=1765615253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5JyRh9D/1rkGIXnF+qVeNqIRMSI/V5YSr67cqwHoN7o=;
        b=hcP6kp5416R7c3XtHAG2vjxYjI6pHNpCRGh3EDhs3q8nLV+8p/7uKpeK8CT8g64wNY
         MFJzrDcDKGcAc8Qt02E69EnzRmd/PM7BcTFciE8V2+yvw+zg030YCLbyyYL2TQOlJQq4
         yS4wShiOShy89+f1Q8eMHw0pzrOFmpGraTOmSM9exSVhtQ5o+NflMj6ucbNwtYGr7P5V
         Audk2RpzhEd+JlCUG0FE2DM3Y/U2zStYWc6kkXFoa4qJLvgQ1Ljuq0wEzZDMSECaqgM7
         mkmKYsSbaRTfXBpPCGP9P/J9EiZf1nCknvHa+lAaJ9PSMweN6iILHZ/JdB37LhIWNRLK
         967g==
X-Forwarded-Encrypted: i=1; AJvYcCUwKH3WsKzFfKKjz0pmO4xBFr2XfQoF9ksVHkpMOScbCDjJP2/lcpxWkY/VpXXTNFH7AFucytJ6sruqL+X98j5NVA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxbObI1Uz8GNWXYsq8QV9rWkbakiKzjzDujeiAQt7RmFUQNmloV
	Fp0Wfj5zjuCJ+VIMLrV7zbeyQAEw6apck2NIeBWP0/pJVzd5R5EHt8ZfKjNbC9P2lRUsAYBD53N
	jrQqZ86pdvB3PpdMa/gCiyYwkBf1WFjc=
X-Gm-Gg: ASbGncsCGuEgVkIbLvGPL4MucmrmEdLAiZCnbwTXrHQikhkR1TxVLrawMNIy7Tqg/Yk
	V8ySIJ0lSEnKOo1fzUyMYh/ue7j9X1BK7+ywUhhBP0Qu1T2RNThZnJWBy2SNflRXpSxdtH095ID
	jXLC6+U5x32FmWYgsAOaXWyFFavlGq4tF8y+o39Us7a4y1bQoAsH5ssH+3dXD5Ja83okyVqcskc
	Ny7AxGxBwfs/y/rF/1FQB4E13nSJJEshDrapQlDdX9PtxhREqPZuqTgMOSZopfN99uZAbfD4FAI
	tBAEVTm0Y//q8WVtxD9wFptDj2Y67Q==
X-Google-Smtp-Source: AGHT+IGchlBt9l+pJSIoz5zt6mU5ZuF+SJRYH3u4NRqOahbAAEWwDjKSEHnDBlcON1N5jNmQwxSaG4Q7ftqTydFO2ks=
X-Received: by 2002:a05:6214:ca7:b0:882:4580:a86f with SMTP id
 6a1803df08f44-888244f33bfmr169245946d6.6.1765010453153; Sat, 06 Dec 2025
 00:40:53 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb8SJ79GDs5aGpz0MGuNNdKf26Z7nw81yNtAsUr9VNq01A@mail.gmail.com>
 <187B446507D0D6B0.100836@lists.yoctoproject.org> <CANNYZj_QRWSTZMne1B0PO8rdo19Ltb=QqQGVmSRk7ZpnaY2MAQ@mail.gmail.com>
 <7cefc9025cec54cc835cd3b065aa653f95a38634.camel@linuxfoundation.org>
 <CANNYZj8bbNnMYWsJb0oz0a3F_gr=zTYkbj8YLKoRYGdF+XbmBQ@mail.gmail.com> <CANDCFSy8dJjVm2qbAgxGDeH3_ywUGLpq=eknCo6n-tgt_7_nsA@mail.gmail.com>
In-Reply-To: <CANDCFSy8dJjVm2qbAgxGDeH3_ywUGLpq=eknCo6n-tgt_7_nsA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 6 Dec 2025 09:40:42 +0100
X-Gm-Features: AQt7F2ohvYCMf6kdC7IeTewp2no4jK561v8mFJZcbTvr1Cdlgq9E1Ep_9MZ3dGQ
Message-ID: <CANNYZj8ff3=tVXJt3rxa3fE0_m9OmDsyBP6A5rrw0b-M7EiUsQ@mail.gmail.com>
Subject: Re: [OE-core] sharing sstate in bitbake-setup
To: Daniel Chaves <dchvs11@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Joshua Watt <jpewhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 08:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227358

On Sat, 6 Dec 2025 at 04:31, Daniel Chaves <dchvs11@gmail.com> wrote:
> Hi, Alexander, I saw your question about integrating the hash equivalence=
 server setup into Bitbake Setup. I've have actually tinkered with the basi=
c hash equivalence setup, and after diving into the documentation for the h=
ash equivalence looks like we could share hash equivalence data through fol=
lowing the "Hash Equivalence Server Setup" instructions here:
> https://docs.yoctoproject.org/dev/_sources/dev-manual/hashequivserver.rst=
.txt.
>
> Look at the `bind` and `database` options used when starting `bitbake-has=
hserv`. Then, on the client side, the configuration would look something li=
ke this:
>
> ```
> BB_HASHSERVE =3D "<bind address of the running BitBake hash server>"
> BB_SIGNATURE_HANDLER =3D "OEEquivHash"
> ```
>
> So, in that scenario the site.conf for Bitbake Setup could enable a bind =
address of `unix://${TOPDIR}/../hashserv.sock` to the BB_HASHSERVE.
>
> And the server can be started with something like:
>
> `bitbake-hashserv --bind unix://${TOPDIR}/../hashserv.sock --database ${T=
OPDIR}/../hashserv.db`

Hello Daniel,

the mechanics of configuring and starting the server are not the
problem. The problem is how to do it in bitbake-setup workflows such
that users don't need to know or care: no separate configuration,
separate commands or leftover background processes. It should just
work, quietly and without fuss. I have some ideas (around sharing the
database between servers started privately by bitbake invocations (if
BB_HASHSERVE is "auto")), just need to sit down and write patches.

Alex

