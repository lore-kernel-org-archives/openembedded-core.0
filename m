Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B952D3B7EA
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 20:02:08 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2166.1765224121667762082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 12:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lHSJd/I8;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9372a52af7eso1356138241.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 12:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765224120; x=1765828920; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inJlWE3E+GhCPs2V6wIfTJZyfXbYN888QAEEaUaj1yE=;
        b=lHSJd/I8FxrIb7klLmbEhkJPhPzdh6aD5Cbt88no2NXI/AybOAenBbXv1rgqf+D2DJ
         l7XkNqQ2w3YQd/pCqm6yp2HxTwiF9afc/VW8PcX/uhcbZKgWTgXguvzPOp1snIxNuoZX
         Q4iYz1p0D7Io8drCrnqetLgNcwPq69cE62EAtRJ5I71AtZzleNp8xUyX+3OiwXOwZv6t
         GjLW1NY8eTY0KYel2csC9ysHX9HFWvqj2GQZB1s8IAo4mmO6VOECz0KyAlRme53t1hX8
         b9BcjJ1LQUZfDcwE7CmwDl7OlcYHGWQ4soE5yYfYGxdcZIbz7f30wX2c30j9gotJC8UQ
         utjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765224120; x=1765828920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=inJlWE3E+GhCPs2V6wIfTJZyfXbYN888QAEEaUaj1yE=;
        b=IvuQGrL8M+DxGncAs0DOhhSzbqNrXysFMk6ZMIKiWClACg59ZrGlkrEbc42BM5OlnV
         Hgk+v1SnszQgSdKXWi/1VeUP+EhvRT5olwpzKgvGBzg1UJWF721VU4UbC3c9klBv7GLp
         djWlVW8ccvJWMR/QcNsC3hsoU1OEhX+fCL1U2+dH8MLv5xL4rzTNJrGjt5w7Jdi7PvF3
         p7fUtEF3rNh0Aztl3SN/+3FPOERT4qYk+fRG339ItRCLp5STa+IvP8lUHqQgzJVqgQJV
         atpN0xjiPBooXkSxmaPhiQhYw0OLAd4v1HgC0qFmuQXcvHVQ+QNjcb7X1rEDEkEp3w2K
         pWpA==
X-Forwarded-Encrypted: i=1; AJvYcCUH5bgpYEga7b/LvFbTIK+P6dzZznExW4b1OP779beimvptGkfzyeNvQdNynDdkeNwRdO5D017nHsnmQzPvZW7F1A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YznZrAbzLDpIQa6GJ1vYnOGJJtSREPuyPZJT3y8f2fAF5UifuQp
	Mw7C6ef/DBoHvgHJxU+RDO9t5QlUy/puMwhzSjzHH9RCtCedO6wVmF3AeyFHJRgGKckGY5v+/jh
	1o2ZFQ6HjTErnvm8+MqqH4Fs9ZsQHjxg=
X-Gm-Gg: ASbGncvvu94CncELCJz+Tu/6XLoF6xBQfMJjV5eFfk6Adw84kbnmVFT2je+0KVNEBCc
	Us4LH2VeRAsD3JLwRk02YV6S/EWPpjXdHNSDsoEYQ1MJ7JtbUT5AVkA9UEDjjM0Rk5omsB41/j6
	bhBxfbGDsqsUZhO0hNcCsDW56NBPVqqoPNcY0msd0ONbmR9zahgEXGhl1JhTQ/MLhnaYCRn6yRt
	a4yW2SyeNnScsaaoE0quJJeaIi1Vg7e8RtEEE9HPhmDKpAO6YrX5IaA/c1mzbCxmpihu8z8mY7k
	RI6ZMjp3O5TQ/d1vQHY3VDuAYDi7sQ==
X-Google-Smtp-Source: AGHT+IFZDaXfXZeXsfEJbpghexhoHbo5OZLER++6jzziCAuKJnBMHyvZN/shP/RmgsYpslWWGkIPgnJfAzDG8N/37So=
X-Received: by 2002:a05:6102:1486:b0:5db:faa2:f3e1 with SMTP id
 ada2fe7eead31-5e52c9f9ademr2210422137.15.1765224120400; Mon, 08 Dec 2025
 12:02:00 -0800 (PST)
MIME-Version: 1.0
References: <20251128065949.7462-1-liuyd.fnst@fujitsu.com> <6F4CEC32-3094-4B06-9C62-89C97A07649F@arm.com>
 <TY3PR01MB11483B8E76FD565C2B2BE38749BA2A@TY3PR01MB11483.jpnprd01.prod.outlook.com>
 <DB5PR02MB10213BDFA0F45360B27487270EFA2A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213BDFA0F45360B27487270EFA2A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 8 Dec 2025 21:01:48 +0100
X-Gm-Features: AQt7F2pTItgtD8j-vBbjiurichVJE33grf1Ty1uLAmWQA8bfGo1MdVRK_0hFuNc
Message-ID: <CANNYZj8ruGgfaDju0dpnch7Qmum2ZYTnEechW8HbCgXqj3tEkQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] gnutls: fix postinst script for ${PN}-fips for multilibs
To: peter.kjellerstedt@axis.com
Cc: "liuyd.fnst@fujitsu.com" <liuyd.fnst@fujitsu.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 20:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227407

On Mon, 8 Dec 2025 at 20:26, Peter Kjellerstedt via
lists.openembedded.org
<peter.kjellerstedt=3Daxis.com@lists.openembedded.org> wrote:
>
> The explanation below does not make sense. There is no dependency between=
 the mkdir ${sysconfdir}/gnutls command and the following commands, except =
if it actually fails. However, that would mean that the /etc directory does=
 not exist, which seems unlikely.
>

I think the error is something else: that /etc/gnutls already exists,
as it was previously created by a different package. Then the rest of
the script isn't executed, and because it's marked as ontarget, that
does not happen in do_rootfs.

Alex

