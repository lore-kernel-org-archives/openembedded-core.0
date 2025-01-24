Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AB5C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 10:48:52 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.9187.1737715730487462911
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 02:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QOFcdGjb;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso2835243e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 02:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737715728; x=1738320528; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYEI2etOsZDMGBfkwWpsnOOq0w6LfUaMlAkM8BUmIl8=;
        b=QOFcdGjblkrhlQb0OUrLQxz/AtRE3EcCnEqP0t7IAapjvd8jT63zhPVWw7XzLd5JSV
         pWI/uwNtvHHDNumtd1ONZ8ImhH6VVWVBVk1W7MCPGzdU7mJ1mPDYyjUQ0Vcmu4CCw5Ql
         KUULBNsDJOlsMv5wHAhOoS0XFCOTo/IpZzGKcKF8vx0TfHfsKchWjWcW8PawTUArgUWx
         p5oMBfVegqSAoEtXIVVdZHm1DvWTbPP1RGg1bhjlDusCrGR8BiOHeETuXHvseoKwq2m4
         Jh9jcfsKJD/F49LdeybaVxf5ehkmmhrMt83iFppgNBvTmMKUvCR115FdbqY63l82CyHy
         05Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737715728; x=1738320528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYEI2etOsZDMGBfkwWpsnOOq0w6LfUaMlAkM8BUmIl8=;
        b=hPKl+4XSmPJzbXV5jPOnOhjJbqBpFd5q3IKnhsoIplAxLi59MDstt5TBykcOmHuu+h
         TpFP5kHH3jeYcKrCy8t8AuYDEHcRjLoLqWx2O+GgmyzvtCd9vVN9Z9lYwFn9AVAUMDns
         Uh2oIISx/5x5JC0UR6iORqCZK4QlgtPqD59yo9HkqCU/cRr9Yxuph0tJj055e+KNqTqh
         iGsvtHZRNZ9rkoaMSDF2G+cFeMpe4Ei+Yd+GPgi/EhkK7pLbbAXarmUwzoFTQFgacJ/w
         lWWDu8rcLDApoRdX9+9+CnHPCCeUTDnGDnLOxTnY84/Sto2pLi7z7PM2oF+J37sxwSRM
         phXg==
X-Gm-Message-State: AOJu0YwBsLi6wSaH+kJz0kk5VOd++IdqDmJZF3MuyXS4JZuZuWD6zfey
	eK3jjazJM2Z5mZbT8QQWiVubcWDfZf7QmnE4QDwVovBCS9d7hhtcwnEUlkPV3HA=
X-Gm-Gg: ASbGncvBk2lJHP30gST3vxmHRFJlICrot9XtKMAgbzqV4u8Io2Ukc0OaV68aKkGDufa
	NAMnN+JKlMGGC22MpoXhE3cS7vmWLDBCqn/67xKdtF8fbL6DbDz9R/BX9E4rLfl2eH9Uc0InDNc
	0gYe+I/O5hBzH0ovpFCv2wRqpVQeaXai5OIkib+2yftRgspM/a68R9nvNOqfMw2/qLdaCyj9jnh
	Gl+GAy13RxYQJDY7Cvtr/GBvNr9g3lxsq0X+hKxyPN1g8zHnd/Vyav6F1pwrrMz1x/KQPhLsDVZ
	utpgyLr41bg33G5dXJn590qLr+kEfwm9xzFB2jACH3qmrroTZmSATdPrWpVi
X-Google-Smtp-Source: AGHT+IFt3j5YFbvVZQgDShHIRTyn92aEyD+8fgK4FGvCD41tuLvsrpAvtn2wIMu7ZA4Yu+EE6wIZDw==
X-Received: by 2002:a05:6512:4028:b0:540:16b3:3699 with SMTP id 2adb3069b0e04-543c7d5738fmr854543e87.9.1737715728457;
        Fri, 24 Jan 2025 02:48:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c837995esm251527e87.189.2025.01.24.02.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:48:47 -0800 (PST)
Date: Fri, 24 Jan 2025 12:48:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: marc.ferland@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Marc Ferland <marc.ferland@sonatest.com>
Subject: Re: [PATCH 1/3] linux-firmware: split ath10k firmwares in separate
 packages
Message-ID: <z6jsvvuyc2x23pqa6yw7dandwpfukuu3uxm27fznrzbaui7ocg@h2yyduzllnny>
References: <20250120154605.3023068-1-marc.ferland@sonatest.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120154605.3023068-1-marc.ferland@sonatest.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 10:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210219

Hello,

On Mon, Jan 20, 2025 at 10:46:03AM -0500, marc.ferland@gmail.com wrote:
> From: Marc Ferland <marc.ferland@sonatest.com>
> 
> This patch introduces the following packages for ath10k based chips:
> 
> - linux-firmware-ath10k-qca4019
> - linux-firmware-ath10k-qca6174
> - linux-firmware-ath10k-qca9377
> - linux-firmware-ath10k-qca9887
> - linux-firmware-ath10k-qca9888
> - linux-firmware-ath10k-qca988x
> - linux-firmware-ath10k-qca9984
> - linux-firmware-ath10k-qca99x0
> - linux-firmware-ath10k-misc: catches all firmwares that are not
>   already included in the other -ath10k- packages (currently empty).
> 
> linux-firmware-ath10k is now a meta package that depends on all of the
> split-out ath10k packages.

This is a very nice idea. Would you mind introducing the same kind of
changes for ath12k/ and for the qca/ BT firmware?

> 
> Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
> ---
>  .../linux-firmware/linux-firmware_20241210.bb | 56 ++++++++++++++++---
>  1 file changed, 48 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry

