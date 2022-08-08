Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E845C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 15:11:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.26839.1659971474986622121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 08:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZqfLwECB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 v131-20020a1cac89000000b003a4bb3f786bso7592193wme.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 08:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=vAzaqp2IHLEdg0g0Vm12JEr7hykC83yVZHm2wMfYVx4=;
        b=ZqfLwECBbD1OgbLY2sD/rhAb0h0AEZWv4DzLC63DuM0F05h41IC9OBAloktglxljfP
         QIDsyU2o+/UzO/0ydtJnHz+yFN2Ky+lluoR31ih2y1ZsqnuJveCY7GGAfNIRzAID2RAy
         621013uS5GE+YoYGcn3tcD+5vcfG268QNRP/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=vAzaqp2IHLEdg0g0Vm12JEr7hykC83yVZHm2wMfYVx4=;
        b=OL/Z224aj7Ds79U+KJ+OXqs2B1dk/tmnlzW8rgru/Slc//4wSNlksoXk2W/o4EW/mr
         D9xED4MKhAm3wndmLDG+jvMUJ6gFB7sW6zEbVDE2LhdUOYTQj6bWfZ6+5Ap8Y54DbOSD
         dn8HuCXPSz9kCC6b0L/zD3jqwfAtE5hYq7Juc91xo6Uh3O9UwzfpKziCOO4peSJvqyL2
         7nd/r11hu41BmYt4+bcUDQ8uG68luJpe65NJ1ayaJqQS2exZxdSUXlaX14/ibq2aO7Xq
         yDopwlYItqqSX7+cHW8cf5mCrz01elbH2LbZ73gS7IvJPHRyBPriikWXoErpP4gh0ze2
         rV0g==
X-Gm-Message-State: ACgBeo11W4iLfhiivaqDTEQ7944HQMXnUxqulwnMHeB804v8ip36JfOu
	hYbNcJkhu+d6Gs/ZImEOW8FRcA==
X-Google-Smtp-Source: 
 AA6agR6Sr0v4ISuWg3jN0mcG07CjTHHyrZ7HvgCgdevTdfY/JB0XjCPA057EZSKBpNEtTRfzGrQiLw==
X-Received: by 2002:a05:600c:3641:b0:3a2:df38:7ec8 with SMTP id
 y1-20020a05600c364100b003a2df387ec8mr12732754wmq.34.1659971473351;
        Mon, 08 Aug 2022 08:11:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d3ed:8697:1d83:a16?
 ([2001:8b0:aba:5f3c:d3ed:8697:1d83:a16])
        by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c190600b003a31b79dc0esm41621269wmq.1.2022.08.08.08.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 08:11:12 -0700 (PDT)
Message-ID: 
 <91ae37e140b97207709b75e3e54a925ecb40b6ec.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] oeqa devtool: Add tests to cover devtool
 handling of various git URL styles
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: luca.ceresoli@bootlin.com, "Roos, Thomas" <throos@amazon.de>,
	openembedded-core@lists.openembedded.org
Date: Mon, 08 Aug 2022 16:11:11 +0100
In-Reply-To: <20220808151959.22790acf@booty>
References: <20220804134920.167173-1-throos@amazon.de>
	 <20220808091813.6a467409@booty> <1659947998632.6878@amazon.de>
	 <20220808151959.22790acf@booty>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 15:11:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169093

On Mon, 2022-08-08 at 15:19 +0200, Luca Ceresoli via
lists.openembedded.org wrote:
> Hi Thomas,
>=20
> On Mon, 8 Aug 2022 08:39:59 +0000
> "Roos, Thomas" <throos@amazon.de> wrote:
>=20
> > Hi Luca,
> > thank you for this - will update my patch and try with the sendemail.fr=
om parameter.
> > The correct procedure will be creating a v3 patch and send as new again=
?
>=20
> The correct thing would be to configure your git sendemail.from
> parameter, fix the issues I reported, and send a v3 with those fixed.

I think I merged this into master-next in the meantime so there isn't a
need for a v3 in this case.

Cheers,

Richard

