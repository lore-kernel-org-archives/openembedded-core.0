Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF37ED735F7
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 08:11:50 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.131023.1732954307499372959
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Nov 2024 00:11:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LszUTZpn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3824aef833bso1861246f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 00:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732954306; x=1733559106; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+bWwzdosb0NHHM44CslMKTOh7weHyWgC9M+3beqhTN0=;
        b=LszUTZpn05t1axYQSr89oY4OAoA6q/OVL0tOFPTRoU7yp1YHSz++klIS3CexbVpboX
         vE6pLuy81ebs+PfpGna9hM1jut7So7K5WWAeBuHA2KXfDJn1lWWI2QP9Msanp1ALdJbS
         J4FW9Y2cVY/w8tBvQ9giJjSpwviYPJlcz2cxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732954306; x=1733559106;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+bWwzdosb0NHHM44CslMKTOh7weHyWgC9M+3beqhTN0=;
        b=KJddt14Cv+I/dn7fqDvS6Yy2rNXCzER6CYvG40N+T/SWzsCxVf+B6aspxg2CBo86E2
         by3114AzoZCSdtgQ3Lp1fli0UziEJGtLeJ339kj67WzGUIuC8jsHco7jfmtpOge+zBLO
         l5R3ZRacRrXYEDivbLH6ZKwwTcOEUdTP0xD6SjmQX4hmlM6z+kulB2jPNR4gmbjBFWMW
         U4GHuslfx+aY0Yok85azuPLPjcm5zsdz5VGbKX7DvmXmiwoSDZmLvvwLfvhsDETGxDz9
         0K7ly3onPo7v7Uc883mdwR+pN/pBk2Th9Afh1O8jmsIR1d4Sj9WcL+5Dfc2+YkpqfK+X
         A67g==
X-Forwarded-Encrypted: i=1; AJvYcCXxF2ulkfzmaUhirXDW9pbAq35Cv8wUhDQqK1lFC2oqcaW0NKQg/HvYQ9hwuFMIudW5RcuycDa+JHBZy2Y/7YE9+g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzQTgIsC81qZhWFrIdDhcWZeqX74MCTQ7/wFrcEvmlWA5PHYOQd
	2TNQWNr4AOkkcUmo0wi5h/DQTZwkmlLjm18cKkbw57PYMCXXB5r3tJRgmBejxb4=
X-Gm-Gg: ASbGncveslnaMTBxfKssNBTbYjNdy9DMPTUL947xfcuJ6l0DAMXxhw2K1IS7Pf3RD36
	5HTXAb/dZ60XuzOg98lC1DBlZ43xiiPfy8kuqx+xIJKEL6dNj2khvKdKlUVb4/23Gdt1bQgMFdr
	Eq7Oikmn73ovnyPMHddfFK0VpXUN6IWQVJgoAb5tLgoGdjhvwPB7CZWmxZB6a4EcliYDWb7wGJ2
	zWIyVvscHUTLvgQ4T38bbITm8DMA3+1H8vvmubZVFrHkTK95RFNjm3K6rd0vxERkqCmgb6oJdpB
	qrptGdmsiA7EerXl6ORCQD3//QqcY0VFWg==
X-Google-Smtp-Source: AGHT+IH+THZzGFwwONR3i7iiArlq6eb+UjlBRzri7MqyGzTBd9yEe88Ags75qidt/TN/LEsgajWCKw==
X-Received: by 2002:a5d:59ab:0:b0:382:42d7:eedc with SMTP id ffacd0b85a97d-385c6cca8dfmr13894357f8f.5.1732954305934;
        Sat, 30 Nov 2024 00:11:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1b9:609c:bea3:27d? ([2001:8b0:aba:5f3c:1b9:609c:bea3:27d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e3896b76sm1121019f8f.33.2024.11.30.00.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 00:11:44 -0800 (PST)
Message-ID: <4b5be48c23eed23bd987be2ebdd6adb14838821e.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] openssl: upgrade 3.3.1 -> 3.4.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, peter.marko@siemens.com
Cc: Steve Sakoman <steve@sakoman.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Nov 2024 08:11:43 +0000
In-Reply-To: <CANNYZj_S4YQDVrvs+aREBGxfNfLcwtExHQLNAFFOXr_5T7y_4w@mail.gmail.com>
References: <20241023184829.2216595-1-peter.marko@siemens.com>
	 <180155B44E341F73.23694@lists.openembedded.org>
	 <bc5ea6421ee3bf54f3f950f79036d3b51e60b3d4.camel@linuxfoundation.org>
	 <AS1PR10MB56977189B862AC8B9F71791EFD4E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <AS1PR10MB5697F7732BD8CC377EB0286CFD2A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <CANNYZj_S4YQDVrvs+aREBGxfNfLcwtExHQLNAFFOXr_5T7y_4w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 08:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208038

On Sat, 2024-11-30 at 09:10 +0100, Alexander Kanavin wrote:
> Might be easier if you rebase and resend.

FWIW I retested it last night and it has merged :)

Cheers,

Richard

