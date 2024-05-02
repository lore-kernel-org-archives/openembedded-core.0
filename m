Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD94C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 14:20:16 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.6623.1714659616221705890
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 07:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R0kLPL6y;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51f40b5e059so682315e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 07:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714659613; x=1715264413; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbLd4LGvLLG0l+Pfl6EOqWb3uXZIUWbBV3aNgs09kcw=;
        b=R0kLPL6yEiPdqkdcBjLAiHMVT6iGhMJAR30P9826miI3XNQpz908h6GSftMQ4O1mTU
         Lu0gpyEYR+8OXJGU/USL2JTJ4FY2Jyd32r6qJ89EMUguGalHNQ+7KwF63wVRkq0eTaUp
         pRsSZZmvFJDKkFoLbNXpEWlQ+PL4a9hzndedYMDnCJDtQYHvhQVt+Evij9xtzPbjoqTK
         4LARzrsQLrOOeNdkv78m5yE+4N+tTrFnG5IkhRBTrfJrIrBveTqqw9vYFczoOv8FjOCy
         KZyEPY/mKB7RUlEylFJzzzmED6AcAf50Mj6d+j7oTs46VyVqvBOEi2mCD+D8DWAj49Q5
         J3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714659613; x=1715264413;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbLd4LGvLLG0l+Pfl6EOqWb3uXZIUWbBV3aNgs09kcw=;
        b=l1xTmhnSySN07LEp6bu1jjHCzzEZwIghodcdQN0VbF4ENBB4EpIvH2jL1yS6lVXobI
         YFDunmlV994c9VjNFVhIa1HbTvQ2xVOio5Gd97Y/4WkDtufAyzWOUDQJC1+JtfNAerBL
         DQhSU346Eug7iCkj7+6j77T582RzEiHLIYLFn3L/epPyUQYlec0MHY5pPum7udAIZWcc
         53gZRcRxmF3LdR4jf9sSm0+/x7uieofJx+WhBEcKrLP4jPgPZtt8BYJmoFNfTqx6Cpo8
         ONSc4iQS/G1KPbYZRvNib7Sepx9yNjRee5BiMCD3mIKXiS5I8SynxXPLxGz6e9hzaMul
         cbcA==
X-Gm-Message-State: AOJu0YzXze10x48HrZURdOiefRv0DLnb3uLOs9Udc9OJMWoGSg/xW+Os
	5bUFt6Lv8ZrK/HLWe+rS+uI46rEp/B/8gCMvdz6merOo9GLy6ggdFSufKhcS6w8N634G5FTxvBV
	r9pevk++9wz66ISeYIasfYpAGJKVntw==
X-Google-Smtp-Source: AGHT+IHSwAquWy68MLBL2FWf+P65yZa9GQdD/0h6rIn+KArEfZQ5VtNgPY452Ge/j7KDtZJfIBn01+sRer+FqqTW6co=
X-Received: by 2002:a05:6512:71:b0:51e:f177:a1db with SMTP id
 i17-20020a056512007100b0051ef177a1dbmr2020471lfo.57.1714659613358; Thu, 02
 May 2024 07:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240502141830.1137815-1-JPEWhacker@gmail.com>
In-Reply-To: <20240502141830.1137815-1-JPEWhacker@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 2 May 2024 08:20:00 -0600
Message-ID: <CAJdd5Gb+c_PJFaTESbzL0PWKb2wh2CRcVXhQpO7N1d4S1HUXvQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] cooker: Use hash client to ping upstream server
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 14:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198926

Disregard. Wrong mailing list

On Thu, May 2, 2024 at 8:18=E2=80=AFAM Joshua Watt <jpewhacker@gmail.com> w=
rote:
>
> The cooker attempts to connect to the upstream hash equivalent server to
> warn the user early if it is misconfigured. However, this was making the
> assumption that it was a raw TCP connection and failed when attempting
> to use a websocket upstream server. Fix this by creating an hash client
> and using the ping API to check the server instead of using a raw
> socket.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  bitbake/lib/bb/cooker.py | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
> index c5bfef55d67..25b614f1e44 100644
> --- a/bitbake/lib/bb/cooker.py
> +++ b/bitbake/lib/bb/cooker.py
> @@ -315,11 +315,10 @@ class BBCooker:
>                  dbfile =3D (self.data.getVar("PERSISTENT_DIR") or self.d=
ata.getVar("CACHE")) + "/hashserv.db"
>                  upstream =3D self.data.getVar("BB_HASHSERVE_UPSTREAM") o=
r None
>                  if upstream:
> -                    import socket
>                      try:
> -                        sock =3D socket.create_connection(upstream.split=
(":"), 5)
> -                        sock.close()
> -                    except socket.error as e:
> +                        with hashserv.create_client(upstream) as client:
> +                            client.ping()
> +                    except ConnectionError as e:
>                          bb.warn("BB_HASHSERVE_UPSTREAM is not valid, una=
ble to connect hash equivalence server at '%s': %s"
>                                   % (upstream, repr(e)))
>
> --
> 2.34.1
>

