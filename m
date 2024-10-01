Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBD2CE7D07
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 09:53:48 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.77608.1727776421924758496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 02:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EMj3htp+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37ccd50faafso3421222f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 02:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727776420; x=1728381220; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuCoXXRbdLxV9h/vV7BiQKK3eLyn3uLMJ9shw80hb6U=;
        b=EMj3htp+gaY2YfbTGMfs7a0C6NnagCZVwWg148J3zxCQDuEbFEye2rucWM9g4WkFWW
         y1jtgwyJffxoMFOSPkoVaJRxEiHRG3MptBMwET+xcUftGCQe+q8wWe96PbOZ9vSqdObH
         F+hWshJGejCDhaCSkbbmpcetL5+t7fF4aejxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727776420; x=1728381220;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WuCoXXRbdLxV9h/vV7BiQKK3eLyn3uLMJ9shw80hb6U=;
        b=ipuZK9L9h7G4a7vuKCmbiqy8vFeMAcxe6AqAwqYlop2zoBA0vS7BQGvJY475gQEyxn
         9hzie9zO69y9apYn9Q7R2zeZ4fKaX3vndtmifweGFIoAMICgnt9nQ5b2vhuu6IMS4vig
         22Qrip8NCMFmoWKnTryjiKi9aFrIIV81AIWgQfmAbg58IU7EpF8h7TpIJDCcmWAhR7fZ
         2oTBW/7X348t3w132nbjaHo8020meFtlMtsbh9MXUCKmbHrDDXmC3B5jjQCQk1eJtHx2
         TY9vKAbX6z+WYOX7ZWFF4tc6GQJZMxPLfg10TGuj3MlWWly0PUPJ3Rsm95neO+4darGm
         Qk3w==
X-Forwarded-Encrypted: i=1; AJvYcCWB8CdKoP8TqitGhYBV4dz8JGGxFAAPPBX2aelhSYb+XXGZgSsVjwFD9P+tAtJdEFWUfh7Jdja224P3mFyypNURNw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzjYZo+3OJ+rCW66KTfUNR9uzn6gnKqjqFJXoxHz0mb7Qq+/W0v
	iWQ0/P33mGkIbrtH/k+HvYL68JAH7Fz3YSho4I4282yte1lrolGM8VyXAGUcL7Y=
X-Google-Smtp-Source: AGHT+IEhNGzIlR3DqjI/J1ouqrprThHqEj6Sc++1OgfnFQO4pT2pRZmLM+xUfYkgdN4P/NtB0VP24w==
X-Received: by 2002:a5d:6846:0:b0:374:c3e4:d6de with SMTP id ffacd0b85a97d-37cd5b1de44mr10189278f8f.41.1727776420212;
        Tue, 01 Oct 2024 02:53:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:85a4:e3cc:bdf8:640d? ([2001:8b0:aba:5f3c:85a4:e3cc:bdf8:640d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd57429fbsm11333837f8f.103.2024.10.01.02.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 02:53:39 -0700 (PDT)
Message-ID: <c3155a29aa855283f3396582c989263d93ded4f3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][master][PATCH] populate_sdk_base: Add
 SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: claus.stovgaard@gmail.com, openembedded-core@lists.openembedded.org, 
	Ross.Burton@arm.com
Date: Tue, 01 Oct 2024 10:53:39 +0100
In-Reply-To: <20240927132040.200122-1-claus.stovgaard@gmail.com>
References: <20240927132040.200122-1-claus.stovgaard@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 09:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205155

On Fri, 2024-09-27 at 15:20 +0200, Claus Stovgaard via
lists.openembedded.org wrote:
> SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY is a new variable to
> enable installation of recommended complementary packages in the classic
> sdk. Use it to get populate_sdk behave like Kirkstone and earlier.
>=20
> As installing complementary recommended packages is known to cause bugs
> it was disabled. Though it can be usefull when having dummy packages
> with DEPENDS to create SDK's. Use this variable with caution.
>=20
> Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>

The commit message needs improvement since I can't tell what this
means/does.

What was the behaviour in kirkstone and how did it change? Why/when
would I need it?

What is a "hard depends"?

I don't have an opinion on whether should do something like this or not
as yet, mainly as I can't tell what it is doing. Can you explain it
without reference to "behaviour in kirkstone"?

I also have an aversion to "1" as a magic value. Have a look at
bb.utils.to_boolean() for that.

Cheers,

Richard

