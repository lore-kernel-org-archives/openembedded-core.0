Return-Path: <tomasz.dziendzielski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAE7C05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 11:54:15 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web10.12733.1675338853324437230
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 03:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n2WSRQ8k;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id 6so740677vko.7
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 03:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fFF53os3ZWf7+mmrKAo+ZzA8aWqX3RLp5jJ/q0KL77o=;
        b=n2WSRQ8kbMrndWWElT7Jqo5R8fEd+jHJukvGuR3VVy0AEvCRlWr+e0bqeMWTX5jrwO
         gr14Puv+zMyopRfUxoXT0mWekAKllF6CkVkSu+B41bUsCj67VHFIDu0HB4KXC+sVU7Ac
         AszJm8Z7p8f9mRXQfRuKCT1LrJaCLSJp0ht99VkRUbRrKYt1cink9012S+ND1smJkhUv
         TDKNXuexJCA3YF2wU09+h8Zrp75bMll2Zccstth+tXdOEX55l3EBqrVuwshoBcpZa0/m
         pQBiChWx5hZfjKfTCQ1QNWlB9XYQlzWkSsE6Xl9et9ZlirVSzmkFZvWqKwFCFqmeKQJ3
         G+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFF53os3ZWf7+mmrKAo+ZzA8aWqX3RLp5jJ/q0KL77o=;
        b=ofwWZfPELKwi3tch972DrfqNgeNQUXCnZO5lDBqBHh6v5r3L3BHIHN2z4BDMMBclXa
         6lX3Dtod9nzKtvK0OfVwYoL/igGnki+W7a4rpcybGMhgVj6tLcwo1FGjdNqqJz13BVlP
         2WvpPa7WOFtTJFFPk7qR64L+qvpf7h50XHrXeguiqJIgtfks+FeX0thkUE5t9Z+/3nu4
         vFxolfpYujGqnWSUkKGYpXYXzH/yNvbCRjbUkA4BuaPIpnyHgvmX6QD9LZUlgAs2zCQ3
         pII9sTzR72Ns/3DITxTibMy6lO2//Fr/BgkwbyOUl+hHC6bRPfpRxfJ9YH63jJufBaIX
         DxlQ==
X-Gm-Message-State: AO0yUKUHoiIjXtjFVZ6fEVLO9gAHVeMaoek9rVOcgPkaAmfcbLiia3dZ
	RogEQwexygt0AcgSWE07qH1IHiCB8W081ICQdPg=
X-Google-Smtp-Source: AK7set/dd6tnLKmeFIew0JI5M1dZQAr+r/gy30gAZeaFdGJqnxIzWjZmo9o4MG4o0nggWTeKiM91i94zkUqoxGYy4NA=
X-Received: by 2002:ac5:c929:0:b0:3ea:4b4a:160d with SMTP id
 u9-20020ac5c929000000b003ea4b4a160dmr836542vkl.21.1675338852294; Thu, 02 Feb
 2023 03:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20221121111102.5556-1-tomasz.dziendzielski@gmail.com>
 <102181aa-b1c0-85d1-5cc7-cfa5f8f17e7a@windriver.com> <c184c05861049967f118dff802adcc5c26b8cfeb.camel@linuxfoundation.org>
 <xu-5aoliMVVE30en9sdGy2S__-CE6gz-dlYVAISAT22PJegAOBsK66GNviIa2ljiRw-Ct68k1HFU0m84QtQRoR_j0_9sZf5Khdu7jOlIaSY=@protonmail.com>
In-Reply-To: <xu-5aoliMVVE30en9sdGy2S__-CE6gz-dlYVAISAT22PJegAOBsK66GNviIa2ljiRw-Ct68k1HFU0m84QtQRoR_j0_9sZf5Khdu7jOlIaSY=@protonmail.com>
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Date: Thu, 2 Feb 2023 12:56:32 +0100
Message-ID: <CAJkqNs0GtH4+AR1GUzQu0Hh1E3fpWsgVTPrck5+_MetwF3xhDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate-cache-cleaner.py: Add a script for
 sstate cache cleaning
To: =?UTF-8?Q?Miko=C5=82aj_Lasota?= <mikolaj.lasota@protonmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Randy MacLeod <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002b642d05f3b639f4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 11:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176690

--0000000000002b642d05f3b639f4
Content-Type: text/plain; charset="UTF-8"

Hi,

>As for the achieved performance improvement, I don't have access to exact
data (time, sstate cache size) anymore - maybe Tomasz will be able to find
original findings.
>However, from the top of my head I can say that in our case the original
version of the script was not able to finish the cleanup in couple of days
(and got finally killed), while proposed version took just couple of hours
(~4h).

The internal ticket only has a comment "CI execution time reduced from ~16
days to 5 minutes". This looks like a big improvement.

Best regards,
Tomasz Dziendzielski

--0000000000002b642d05f3b639f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div>&gt;As for the achieved perfo=
rmance improvement, I don&#39;t have access to exact data (time, sstate cac=
he size) anymore - maybe Tomasz will be able to find original findings.<br>=
&gt;However, from the top of my head I can say that in our case the origina=
l version of the script was not able to finish the cleanup in couple of day=
s (and got finally killed), while proposed version took just couple of hour=
s (~4h).<div><br><div>The=C2=A0internal ticket only has a comment &quot;CI =
execution time reduced from ~16 days to 5 minutes&quot;. This looks like a =
big improvement.</div><div><br></div><div>Best regards,</div><div>Tomasz Dz=
iendzielski</div></div></div>

--0000000000002b642d05f3b639f4--

