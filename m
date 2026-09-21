Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47484C982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 09:46:56 +0000 (UTC)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45527.1789984009250023007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 02:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aCa8iPTc;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.228.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f56039dso355917766b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 02:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789984007; x=1790588807; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u+5weJxw1sW2H0RLbGk9a9DRonxEp7c7BeMhYcRmgbU=;
        b=aCa8iPTcM1cJ4L+ng4ep/Q8/Ow0XdlJd018NLehff6jqIi8I4cI+FYPTy+u4qVosFR
         5FRNs7PftjpICQIHNO3+PNqHpzKiwW9VhR66ThPxC0WIVg2QiysJU8cE1PSbOk+roOps
         UUA/P32ykLCQ9W2R+MVc2FbSmB1KnJ3wL0r+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984007; x=1790588807;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+5weJxw1sW2H0RLbGk9a9DRonxEp7c7BeMhYcRmgbU=;
        b=Rum9NIW7O2wsmCIxf3fYzs/L35oFt82cwjZVoA9YiweFDR3RgdEaDnB9OFxZ7Ukp1c
         bg7SCNsEbWgIRkfBHX4OAxP8UEnCgSMGXWESIALvPXQklnQ3ABYjEhjoyeTtNqJxQR7n
         Xw9uT/1sMRkMAUfrvSWHkRAxNX+3bvRiSCfXdO5pktpwDO8wtYHCQIfu2EexdOMo+oex
         svE/AB60aS72uBiRYaxtkW1rBTX14PaOBVZ7/BusMi0zV+55UWKPW0NK77IAdRyHwlTC
         qXHWC18HQiCt0PVv0wWdrYOxq/KGKUjUfx+u85f6SCHvapQYfFspfnbXibwAEqk5DSrR
         XBpw==
X-Forwarded-Encrypted: i=1; AKwUvBzIKsUGyZ34lDBZciNV9ZnHZjavjU6jJLI9b6Yy9hUm8JRjoBlveMQ4XfWLQwJKpf+ZD1/l/szObexOV8PDYgFpkw==@lists.openembedded.org
X-Gm-Message-State: AFuF++mm1dL1f+FKevfjLXvw65wzOcQL7502rIe5zPDPecTqVQFQLqEj
	4+QnGACrnDaHxfufGiuEiMbxvPFiNPS83XPeuYD3nlzw/+tmSP57okjfPC2JnfnlRwY=
X-Gm-Gg: AYBFou3j5szHjTYcSPuC5RbskjTtWORHyFnLpS9ZZYyKUJUZO5E2eMqbTYCcYCR+RHA
	FkyuaJLIQmI2+S8qoYfs+wafYFESHwy3qBYvtNhtxelQptBuDFvdKjnR50UBo99F2inkEf3c30D
	7ywCiobOqZNCPf6pyqa0Cl7WDCcJrGdrMvyn0AU3fy8K4rRrdsMlqiPRUklTufUjgA+ogGOkrtV
	zsdA0x+YVPiphZq3Qj3o6d+vuaLxyGGfN7ESMgOVTw5+TVsJeNqviTmwXJOjoiWPnBMjugkg8G+
	xouEYujt9ZecqL5zqFdQw3zgvoUzqEHQnCUjIfCqSybn8OUzfvYGVemA6ey1tHQ1WUTgBtpd6iO
	iXVpVzj/mqfb0XKM2mQPXCbTqAJmXnzkzzBXZ77Kudhd32B4Auvc+PSbfI1Z7H7sEYSt6pFLrte
	JU6z6iVYOiGZrYQhlELKloKbDCeoJNezl9mLaBPagJoVXhH6TaWqvQF4xbPPNjWeSeQUC/5+Zwd
	COu/d96hXFEhozWSXuBQnRTas3tRDYgH4fDzNIdfVLIID5F6RYNHzUHBZ2HS4g=
X-Received: by 2002:a17:907:3e09:b0:c29:4d53:787f with SMTP id a640c23a62f3a-c2a15ce5bc1mr804740066b.41.1789984007472;
        Mon, 21 Sep 2026 02:46:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:481d:998f:15fb:95da? ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35701bb8sm275508666b.28.2026.09.21.02.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:46:46 -0700 (PDT)
Message-ID: <3cd5b736f6fc19ed3242c2da05dd60b675cfe0f1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/5] rust: reproducibility fixes for arm build
 hosts
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alhe@linux.microsoft.com>, 
	SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org
Cc: sundeep.kokkonda@windriver.com, Randy.Macleod@windriver.com, 
	alejandro@enedino.org
Date: Mon, 21 Sep 2026 10:46:45 +0100
In-Reply-To: <b8a0599c-a7e4-44b5-b8c9-6a72d14a70fc@linux.microsoft.com>
References: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
	 <b8a0599c-a7e4-44b5-b8c9-6a72d14a70fc@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 09:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246311

On Tue, 2026-09-15 at 09:53 -0600, Alejandro Hernandez wrote:
> Hopefully these fix reproducibility issue when built from different
> hosts.
>=20
> Unfortunately these go in a bit of a different way than my next
> version, so I will wait for the result before sending to avoid
> confusion, but I'm fine with these if they work, lets just add my
> sign off to the actual patches based off of mine
> instead of the "Patch from Alejandro + OE link".

I just wanted to say a big thanks to you both. The autobuilder is
showing much less delta for the cross build arch tests now, around 30
or so differences in the maximum case. I've added the git fix from
Sunil and some queued some locale and perl fixes I came up with to get
us there but the rust 'noise' is removed, which helps a lot.

Thanks again!

Cheers,

Richard

