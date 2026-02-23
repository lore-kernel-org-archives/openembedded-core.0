Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BB3EEC2A5
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 22:32:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7324.1771885933618870465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 14:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=in/zd4Oo;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso39021555e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 14:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771885932; x=1772490732; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WYr68ckZrF71NZ7/luSsjHIzwGPa8i+oyr4naS9nQo=;
        b=in/zd4OoM9XzUuBH/leypWbAdpGt9VyGot9Asjq0EayWP/UEinWsWVOaxC6alMvDSB
         o7vNOg6u7LtANvIYMzpnR7tHN4JHm7cqZYgJJ6HGalYAM3EdkM4RYYSRLi/Zyk2OHDAw
         c9ixKYehCYz44ztsfNvaGwv47FSZ0NJN9Z3t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771885932; x=1772490732;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WYr68ckZrF71NZ7/luSsjHIzwGPa8i+oyr4naS9nQo=;
        b=A5frxmFiHM+5TsXIxAMMPgO+urXuDK4fSC7MYWecMNgVpx+3jO6ErfnF1WHD36guTp
         z1dzqrgQ/8N9dQRHtetxKFrT+TrvhkPFVA8C3b+uYssJ67+EpdAqAFY4dL5a8u6/Bbyb
         8zqmAsHosA0sPDz+5Dg5aZUvSozyhiu/MR063HC+P1iRsbvyilMMSk1PWG4hJlvnw4Un
         P3j7hwrzUkPTZV7SqNRjCHB9zoYhpJbI/GhmQPXHGB+ZuddV7g3gIABrQBj/jfnv2Rmr
         WA1BQXTMHRk4VuIJbiw02JdOGFwBa0VEbvGuI4GOOxXhW6k9V+ztVWaZHcchf+E6SQsu
         kRGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4EuTuSoY6ITBrX5tKHDBJdWCn5oovM04Rn6KAhcoYyvCGVz6E+vor4IHumy0PMLJsS3wDrTPx36s8zD3VI1t5fA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwotLzbWg7JoQRDawUHHGDGTfNHeVSVavbzmbvUO5eoKtRsKOOk
	drVMRLnz0fLtXaOLi081qJMvkihY3WQp0mMrvrSTjFYCPOVTD+biuSWAErIrjjSPIMU=
X-Gm-Gg: AZuq6aK2BKezo6ExVG6jRa6BWuy8moY6Ndu5SUHjsAZkEccq4SlRrDxTEDMVDmYeaz+
	vhQXAbg5a7EdM95xkMoc8UEuagQqV+yyg4hnVtqluJsjy9zuL3WljbBJXFFLgRX1NX28OeTtELh
	CcjtuDA4pAAL8MHb3g0sJ4lRS8lMvcoJl1TgcszaW5N5jDEMwvqS9y/NIbNXAHFtYGsACZoxBA/
	O/5gn533OWx0U6KsvZ95cO98G07CIrewFCXCysQ+e2zip2TmGJwSO08Q8KGi4/6Vy4ZSby8RRzE
	h0AgZgLSN10Q9IHuYdq2AgpFqbAX2NwrlBmI/zJfq3YUT/pFzPRrAaQufgRSfvYhd50ti0q8pKE
	OGiFHuZQ+GwWVpxkQ8Z9zO7Z3EZ8vc3YTY7dWgOAN3oIjvcQ1eB9wnUl+9Eq1mj3QeVoAht3qyY
	iQNUUipP5xErE3cn+vSrdSGlvB01LQqhKle1ucpLYS7Z8JRD54VbQuMgTFrqnA7ZZrBlV9X4qZi
	Q6ZyEbn1EPDv7/T33uJud3VyQ==
X-Received: by 2002:a05:600c:4589:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-483a95deea7mr175631715e9.21.1771885932029;
        Mon, 23 Feb 2026 14:32:12 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3dd7sm305560595e9.2.2026.02.23.14.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 14:32:11 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 23:32:10 +0100
Message-Id: <DGMP52YIZ1UA.2M2NWW5M27GWQ@smile.fr>
Subject: Re: [OE-core] [kirkstone][PATCH] glibc: stable 2.35 branch updates
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <colin.mcallister@garmin.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260125161634.729904-1-peter.marko@siemens.com>
 <115433.1771881248075028771@lists.openembedded.org>
In-Reply-To: <115433.1771881248075028771@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 22:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231715

On Mon Feb 23, 2026 at 10:14 PM CET, Colin McAllister via lists.openembedde=
d.org wrote:
> Hello,
>
> Thanks for this patch. I was looking into a few of these CVEs on Kirkston=
e and saw this patch was never merged. Is there a reason why?

Nice catch, I missed it.

I'll add it to the next review branch.

Thanks!

>
> Best,
> Colin
--=20
Yoann Congal
Smile ECS


