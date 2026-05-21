Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B804ECD5BA4
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 08:23:13 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31899.1779351783241511339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 01:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pzYq3ZTQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48d146705b4so64614305e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 01:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779351782; x=1779956582; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AI7LfVzZyYHLNs4SfKj4z4B8kJUWXPxUo3ZJEOVRV8=;
        b=pzYq3ZTQ+2MVX+ukT/zCb4blGxx/30bSLHU2MoQSKL3ZtpYqXd7QOiHbpdGsX2GlFM
         DWi4Y/RBnEUOJot6CXepAitAtuAOtZkH/KuDg/Sx2ivBNcg4QIXIXNn6rn3nVPTROouW
         bm8zrXydYCmLk7sTyFz5IMYS28GimDrM3mC2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779351782; x=1779956582;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0AI7LfVzZyYHLNs4SfKj4z4B8kJUWXPxUo3ZJEOVRV8=;
        b=BS4eMXMmYrSp3DYTCH9R0HyzfYUiGkaVZCI4LMPuVWcWxQfzDJoNziXmctSc2vQdI6
         DNeOBiu/1BiMsI1ijXBEOPY1n805LNgFTKJuun5kgB3eOMnEkaGMgPREUHnDWcvieJko
         dUzlPR6ubQTAWhkR95Ocxp4kSCaK6+o2KqiNk/Ib6JKceMiM9Eko9pAQ91xQQLvo+Rgh
         HKFYe09+sOcS2G0A2H4MYpgTypj6Nc2Trdj8+Oovi86PA1X13BFy3KMKqYQRpvyYLH+/
         1v9Oz+psFO7TlsrYKTfEIYj56osF8VZ60PrfHsctc3K3KgjpzQQcFjvx0wA4WbYOq0L1
         Lznw==
X-Forwarded-Encrypted: i=1; AFNElJ9sjUQXEUcJK10mzuufudS7iTUgvnnAb4gLAx+4Xr0QiyD6C8XqYC0RFVv5PO6TwIZ3BFCWsnIIC2d7SZhjUcVVfQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyuZDtpOYt01R0e9FbluaQ1O0vWcQln1LpbPzb2A4REPms2YT0h
	vLg4OYh4rsvO3pjBYr9LNf9yacpzeE3hlHDEnXmX2gCYlfJ8PCGYYOeuijI+k7rw3NI=
X-Gm-Gg: Acq92OHapwa7x50sh6pEzKDgLYpf9ue5szXKn3wKbEiqRrd6Lyhph5bFGttWgzMGojw
	qhqFD/xMmjTpbK0fFYKuRLgHtonOnR1T8r0mKVlNYLLEDkjSy3kKXfsp19K9Pw2nch/MVO1qlOA
	kTBZn77Nz3eaqNgaeIUY3DPa7ROenJzbWOSDRRrgazphTg1Usc/GrBbeYSbPunz/Xd/F8ODGPjz
	Vs4mDzbgj9hY+02pWPoFnya4vgycM/goypL38ku4FuoMb/FxTIpehlF1hutG9iC5r01LgowdXpp
	eeMm5g+n/QVHTt4fr3im1Ixz+ZZbJSg++nJCuujpfroFC1lTf7J4br8tA2VyD/VZN9HgbWPTmBY
	iB8v6cgMuCz85sgl6IkBndjn1jm/EPcEVzb3a/fScOGNsisy4RDbmg+HbsKbt5Lpnm0Uc6BCTnG
	Ecs2AREWzZBpOBHDpJK5vnMk8hIFRWddg1sbecVXKE2e0wO0zads+hKPd5kWOEx9cIR9+sBYIMq
	RCMSeHmoOc/ozE=
X-Received: by 2002:a05:600c:4f16:b0:48f:e230:2a26 with SMTP id 5b1f17b1804b1-490360e786bmr27684985e9.33.1779351781553;
        Thu, 21 May 2026 01:23:01 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c72c60sm14348495e9.3.2026.05.21.01.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:23:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 May 2026 10:23:00 +0200
Message-Id: <DIO7KBAHLD5C.WFRWBJQPZE1N@smile.fr>
Subject: Re: [OE-core] [PATCH] devtool: prevent 'devtool modify -n' from
 corrupting kernel Git repos
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <yocto@pengutronix.de>, <ejo@pengutronix.de>,
 <openembedded-core@lists.openembedded.org>
To: "Frieder Schrempf" <frieder.schrempf@kontron.de>
X-Mailer: aerc 0.20.0
References: <20260323232008.3456362-1-ejo@pengutronix.de>
 <afdbd1da-826b-48fe-b24c-324e32b14670@kontron.de>
In-Reply-To: <afdbd1da-826b-48fe-b24c-324e32b14670@kontron.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 08:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237479

On Wed May 13, 2026 at 12:41 PM CEST, Frieder Schrempf wrote:
> Hi Yoann,
>
> On 24.03.26 00:19, Enrico J=C3=B6rns via lists.openembedded.org wrote:
>> Running 'devtool modify -n' on a kernel recipe that inherits
>> 'kernel-yocto' can unintentionally corrupt an existing Git repo or
>> worktree.
>>=20
>> The work-shared optimization introduced in 3c3a9bae ("devtool/standard.p=
y:
>> Update devtool modify to copy source from work-shared if its already
>> downloaded") is not skipped when '--no-extract' ('args.no_extract') is s=
et.
>>=20
>> As a result, for kernel builds where STAGING_KERNEL_DIR was already
>> populated when running 'devtool modify -n', the existing source tree is
>> overwritten (via oe.path.copyhardlinktree()) with the contents of
>> STAGING_KERNEL_DIR.
>>=20
>> Fix by adding 'and not args.no_extract' to the kernel-yocto guard
>> condition.
>>=20
>> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
>
> Can you please pick this devtool fix from the following upstream commit
> to stable branches scarthgap and kirkstone?
>
> d383ea37e4 ("devtool: prevent 'devtool modify -n' from corrupting kernel
> Git repos")

Hello,

I've added it to my scarthgap review branch.

Thanks!


> Thanks and best regards!
> Frieder


--=20
Yoann Congal
Smile ECS


