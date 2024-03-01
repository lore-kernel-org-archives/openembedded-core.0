Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9F7C5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:17:11 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.36984.1709331427399702055
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F048BP1K;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d208be133bso30966221fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 14:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709331425; x=1709936225; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RB3Ql44O4iibpHjH1IKa93cXZABAYWnUvAJyFnZNWTw=;
        b=F048BP1Kvmi8yN1ttqk7peRP50QfmB+9ScCgYkOduysDckS7MU1CPmEqZK4aM7Y6X1
         psR4U6EZtVat5oLcu+X0oQL1dgqs2bJ36ZA3VteBcaBx+tvN9sfruxi5qB1zi+Cd9UQp
         eJjbqcFSacDcuFM4LzjwWA+E8IHe03z6F3bipL14+zVeJN83XAFXM2EN4ieEXyGV5Igp
         3rvUVR5Zl5/2/xeDi0eAbDOlcjLxfqSk8OL5FEGBW3gzcYJo8/XobdqG7QCK9kQBCquS
         rwXa4jwstBZtt7exAN2a3yhuO/LicoChOV4Nb8zUV3rPYM9uvoc7SXbHYLfa+KPH5bdQ
         jvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709331425; x=1709936225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RB3Ql44O4iibpHjH1IKa93cXZABAYWnUvAJyFnZNWTw=;
        b=kOeeb4gMi7g3rmzo/OaNWuloiGq4ZFE8T12OSQSDAR2ke2vV4hL1ppkUgC7lTWeYlt
         yDAtg6SEe2rkYQGEBTnxalgXW7qvL/Gf7WqoKEVYWeKZhoOPbDPOT4htvlegyc5fN35+
         tmRM4mesonuO9y0M6vSTDlTt5KeCPqD8fxIhILABu/Ujy8qturx67I5e6ud4ywI+yoGJ
         SL1pCvL7a/iLMC89OioDZZovaIU8IFo0LlJBSUl65kCQN4YmB05vJeeyMO2kLGUBaEOK
         NfwlSnogdNW3XLeSnY6FDntknmWN91N3fGzdPtax0GXdZw6uyD0XwY052A2uqctRbSzO
         OOAw==
X-Gm-Message-State: AOJu0YxzDq80nb5JXlKXValJA40ad8Vhhv2cHv31hxjOLKxGGdF8XMOP
	RM+6YDk4B4aFhL9RsKkiF/M+4CFMN9ncoqOcE2lETMJC1fCPKmRq3b9YmbYxeZYS/bYirRnNVl4
	+ez8X84gnbCRM0Tbbj9Ps9zV4NNQ=
X-Google-Smtp-Source: AGHT+IEkUqLLwi+2/qhw1l5jdLtOVQ/aoinNaLNdyh9HgIqaHAdidKHLvfaU6Z8OybR5+zv4MTQ/PxFvwQ/obrebz5Q=
X-Received: by 2002:ac2:532b:0:b0:512:f17f:2b31 with SMTP id
 f11-20020ac2532b000000b00512f17f2b31mr2134463lfh.43.1709331425088; Fri, 01
 Mar 2024 14:17:05 -0800 (PST)
MIME-Version: 1.0
References: <1ebfc609-cce2-4bcd-b984-ace1cca1162c@bootlin.com>
In-Reply-To: <1ebfc609-cce2-4bcd-b984-ace1cca1162c@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 1 Mar 2024 15:16:52 -0700
Message-ID: <CAJdd5GZXX1AVkLheaj3U_3Xi9tGurC+sAzAxD96UKTxkWCWw3w@mail.gmail.com>
Subject: Re: Easy way to talk to hashserv or prserv?
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196548

On Fri, Mar 1, 2024 at 11:34=E2=80=AFAM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Joshua and all,
>
> I'm going to test changes to the prserv server, to implement
> "passthrough" to another server.
>
> I can make tests by checking the impact of my changes on the build
> results, like checking the revision of generated packages. However,
> would there be an easy way to make a test connection to a server based
> on the bb.asyncrpc.AsyncServer class, such as hashserv or prserv?
>
> Feeling lucky, I tried with a plain "telnet":
>
> telnet 0.0.0.0 8585
> Trying 0.0.0.0...
> Connected to 0.0.0.0.
> Escape character is '^]'.
> get-pr ethtool-6.7-r0
> Connection closed by foreign host.
>
> The request doesn't look that bad, as the server doesn't complain (in
> the logs) but I don't get the return value.
>
> So, any tip for talking to a server from a terminal, or do I need a
> proper client written in Python?

The protocol is all a line based-text protocol (at least for the TCP &
UNIX domain sockets; websockets are another story); the basic flow is
(C for client, S for Server)
1. C: <greeting and protocol version>
2. C: <0 or more lines of headers>
3. C: <empty line>
4. C: <Line of JSON encoding message>
5. S: <Line of JSON responding to message>

Each line is terminated with a single newline

In the (near) future, the Server will send headers back to the client
between lines 3 and 4, but that's not implemented yet

While you _could_ possibly manually do this using netcat (and maybe
telnet? Not sure if telnet option negotiation would mess that up),
it's going to be tricky to get right, so I'd recommend a python
client. Also, if you want websockets I wouldn't try to do that without
a client as that protocol is a lot more complicated



> Cheers
> Michael.
>
>
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

