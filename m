Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003C4CF3971
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 20:56:54 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.3912.1726779412513222353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 13:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M8G78FfW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-374bd059b12so843218f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 13:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726779411; x=1727384211; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=axz/MJaTKcoPjJl3cLWz44z/MGcHfYJJvjmNRjJITuY=;
        b=M8G78FfWd68XQ7GdnXSluZ2hqNUU5B3hM5p88a7sfrI7G3UkIy+p/GOyL+DSf5AZqb
         o88lZKpxAuE9/TwVNonAbb3aTGXiwR4YysVKCDQzCELi0Am3BjLI19kcmZbXQeOcvrqL
         GP9vraY0JuBxtVrFnBNQSlYGBLgQ70ZLVkKao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726779411; x=1727384211;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=axz/MJaTKcoPjJl3cLWz44z/MGcHfYJJvjmNRjJITuY=;
        b=o82R5Zr2MDK250f0zmEnPSrX7kQsmNtsinByzWRoosurfKacF2mDtQ5Ow0Hi1vxCjU
         EFKLxptlFG5T0aYYnNjYEdxVY2RZp4lNj67iVk6nvu8EH56YlcHqlP2nTWWp1OC6vhjK
         BuCaN6bDoFo/gs3VU2oUN+m7LV7gXAK0eIABo+JMrLco/5S4+CicM6yu6LVMm5BdvRNj
         BzlBsws8u0NmXo49bqLABCHWnKDUKNPH9oYkIJth8DDZtFLkCbxzh2rMHQgbcIbTNSx1
         jyy1uBvpOc3+QJBRgmW35ZZfzcgghh1Kf5VwXr/Gh8fe+kTG5f3swEmyjsy9nUNOOh0q
         9h6A==
X-Forwarded-Encrypted: i=1; AJvYcCUG3YSj2cmYLeMnE3+gA33c+BBfWpbcmOSB9YR0AbmVF8ZuzGQmj5+qLnaeojcLf99JzXVIu3LQ0jVJrEHeSKWzUw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzjBzYcRK873g5D/e+GwXZFTbEBkMPu1LF1gGiwuelEou9KGwp0
	lOy1qbSVCxVQQeR6xwUnqJFFC64QMQkDfyXlKWn5TGLfExhKCga3Wg/WPMKXC7A=
X-Google-Smtp-Source: AGHT+IHXWZ2yFZVmNPXDFdHCICIPMd6sb6Y2vqrwwz8UxSME9xiGl6aUiZ22DPggy0EMydc6xmQ7SA==
X-Received: by 2002:adf:ec4d:0:b0:374:ce8b:bc65 with SMTP id ffacd0b85a97d-37a42380fc2mr273928f8f.56.1726779410776;
        Thu, 19 Sep 2024 13:56:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3dff:6e76:1854:48ea? ([2001:8b0:aba:5f3c:3dff:6e76:1854:48ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3790406a33esm5689650f8f.81.2024.09.19.13.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 13:56:49 -0700 (PDT)
Message-ID: <b77f2c6737c330ef9ecce325d50a4aaa25b3e536.camel@linuxfoundation.org>
Subject: Re: [PATCH v7 0/7] Add barebox bootloader support (and testing)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Sep 2024 21:56:49 +0100
In-Reply-To: <20240919120640.19714-1-ejo@pengutronix.de>
References: <20240919120640.19714-1-ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 20:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204717

On Thu, 2024-09-19 at 14:06 +0200, Enrico J=C3=B6rns wrote:
> This adds support for the barebox bootloader (and tools) to oe-core.
>=20
> In order to have proper testing, this extends oe-selftest to allow
> basic testing of bootloaders. While at it, cover both u-boot and
> barebox.
>=20
> v7:
> * add missing HOMEPAGE to barebox recipe
> * ignore barebox for maintainers check since the recipe is skipped
> =C2=A0 during parsing (because of PREFERRED_PROVIDER mechanism).
>=20
> Enrico Jorns (5):
> =C2=A0 barebox: set default BAREBOX_CONFIG for qemu machines
> =C2=A0 oeqa/utils/qemurunner: support ignoring vt100 escape sequences
> =C2=A0 oeqa: support passing custom boot patterns to runqemu
> =C2=A0 oeqa/selftest/cases: add basic u-boot test
> =C2=A0 oeqa/selftest/cases: add basic barebox tests
>=20
> Marco Felsch (2):
> =C2=A0 barebox: add initial support
> =C2=A0 barebox-tools: add initial barebox tools support

This looked better in testing, thanks. There was:

https://valkyrie.yoctoproject.org/#/builders/23/builds/168/steps/14/logs/st=
dio

which is from oe-selftest on an ARM server though :/

Cheers,

Richard

