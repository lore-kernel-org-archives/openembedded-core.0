Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E42CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:27:18 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.35642.1725272830519735549
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=drZqHEV5;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5353d0b7463so6844703e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 03:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725272828; x=1725877628; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cG1itvNW3pjxQpzf25JmSA8Ei8QsNmi7394E3TbH0d0=;
        b=drZqHEV5jUGzHUf85sDDvNDHEs8o+EqMlK7RpiEIS3adzq2ZnyG76R2OOHugBVvjUc
         wv8Y08imNqzQfI+0v42zRtuNeqHsEbzKbaoNqFg5NP6t8zqaDfQ5DIzXSv8f6riusIli
         BcAwfrYGD3lJOJGyqrqPTD+GwNqRkMQI+46mgIF7E0EyHd5u6BMbBtOyZtb/+gLooEz3
         7fadF3++FzzX4dIr6AVefP4kzRHyAAyoVamayNjdeH0tH1qvqKct+tORFb8PWXBCW70c
         34NL2DFn1dre+v92rHfsLYNA+eVYAYeg3XpMof1Jy9vs9D5OmtECUFiuz1ZQY/FVTh2K
         URzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272828; x=1725877628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cG1itvNW3pjxQpzf25JmSA8Ei8QsNmi7394E3TbH0d0=;
        b=H5kOYTvtNb/4DohO0i/lbfu2v5qOtkmBn0aKtTS7gB1ZkXwkxhkv4iQ/OzMgWOEqAS
         OebD3ToVDuhPL1wZpbwi9RSi4p+bNTISeiB2eWHL3RL1S5LHaOwW4EgX8QE5Q4p0SOty
         fZVIxFktkwquPfIM0ekowQVfjeqB8horEtwo6AkO5/XzpfGICzi2gu/iBp03gJkoS2KM
         csDdfVhh0bACRQ0LDohqNn0kHpKDBBcFnCg7sOFnAH3Nk9FDXuolq/QSF0iEhFZpgOhD
         RZ4CvzOJ0LeFLlJYuhhfAZ2xzuR+zlFQwyb8/ti5NXWg7TNQPgDJoliKCgaqgXLmA1Tc
         eSUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb9+6GyGs05lsiEbbknzlf436/4w8SgU8hPmkmAtG8tFdV7Im116wS73sBVPGZtX8mUf7mW9b3lIBQ6tJKaamXKA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzn+ylZswksYirztlXbEyuZxPCfyhxBxglnpHUG/cOQCtY1JRj6
	CGjQsQ6VYMTh6yIUMV87skk2nC1A2Y4ArCDkSj7YoLwKrpJ+tb9ORmOQGXrSgXqF2gkMOB/+CZh
	QJ7I=
X-Google-Smtp-Source: AGHT+IHN89n7O25bvEMKPjMmWkjKM287Vx35QxJ8okJF75aWahRO+mJA24p3l3P02kUSdT6lSA/APA==
X-Received: by 2002:a05:6512:1294:b0:533:c9d:a01f with SMTP id 2adb3069b0e04-53546b1e1c2mr8009184e87.4.1725272828052;
        Mon, 02 Sep 2024 03:27:08 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540827568sm1555982e87.147.2024.09.02.03.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:27:07 -0700 (PDT)
Date: Mon, 2 Sep 2024 13:27:05 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: peter.kjellerstedt@axis.com,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] bitbake.conf: add getopt to HOSTTOOLS
Message-ID: <ZtWS-QhOBS3l6dCA@nuoska>
References: <20240902094117.31156-1-mikko.rapeli@linaro.org>
 <20240902094117.31156-3-mikko.rapeli@linaro.org>
 <DB5PR02MB1021356397EAB4F11F18E3EE0EF922@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CANNYZj_7Q6j1k2bFS3oSa2cjmp9EGd3QWT0HOUtecKE3spLCfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_7Q6j1k2bFS3oSa2cjmp9EGd3QWT0HOUtecKE3spLCfQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204078

Hi,

On Mon, Sep 02, 2024 at 12:15:02PM +0200, Alexander Kanavin wrote:
> Also, can't this be supplied with DEPENDS? Adding to HOSTTOOLS to
> cater to needs of a single recipe is not a good thing.

On Debian/Ubuntu getent is part of libc-bin package which is marked
essential so installed basically everywhere by default. The systemd
side meson build script was failing without it. I can try to check
if there some config etc way to disable the dependency.

Or if this causes problems then I can move this to "usage instructions"
of ukify.bbclass.

Cheers,

-Mikko

