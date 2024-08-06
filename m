Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9A5C49EA1
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 12:54:50 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.6464.1722948887429975904
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 05:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EQDId5LG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.177, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f1798eaee6so6514121fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 05:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722948885; x=1723553685; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mV3zRePT+H6pPxe9A/cNjUiC6wStG5rUpX5oW538y7M=;
        b=EQDId5LG1ySSa+krlxqEQe+QJ5RXypl0r2cItR9uM4zE+Gxb4yd6NU7r6CrQtDO1YA
         E6xcFxjkuHbLeHR9gwKVEDFW10Yu/HnmRQ0gPoJ3Spe+80SolZhyWZmN6p+FMrMbrOQJ
         gZNk2YznjXoWSncw+yIJRQhHcs55o+WS95Th8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722948885; x=1723553685;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mV3zRePT+H6pPxe9A/cNjUiC6wStG5rUpX5oW538y7M=;
        b=PR7pWoIvnmlJitintxtcdjlLhpIdTe9kL769IuwG9SbfHm4z0MSDure2O76apyMBOb
         cBd3CN2HvMUGyOvrdXytiHRwiLNsbwGwOidB8oCnerLI/loqEZEIumw7ijpinhOi4X3j
         SEqupkJbelSKzUkiFyncDWgWqISGpBpkaEYTsgglkwJ5ZP2X6HZHNBEWI7gMR/Ru5NlL
         H0uLnI6sj42ZFR5o30exwAE6VzuzYiHvVlUfv3tSmqjlBQV2BQXIk2+69m+yVqaLn+re
         K2FxMGANNEl6tBWOl0pLxs9syQ6+CM0rUO7BvLSDRWaySpTkkKUbkaDmOfzlbqA7JL2j
         Efvw==
X-Forwarded-Encrypted: i=1; AJvYcCU2AdQ89kWO6XkX2i+dAd2YNvOG6G0QVjOyWhbChTOMp5/EZ5AhcYdiAb2xWclwYjwbI5XPUAKsZ7nxC5Z6NIiZes7lHBkXZnQ8WZ0XVxq2WXkBFnzC4l13
X-Gm-Message-State: AOJu0YwtRTOuiCyuu6aJtfWzIlUfwPpy5odFs/ZQX/8GOrlkNux9blIz
	SWhuy74FV8EpigSoctapRRorPmHb30kShe3MWedKzl8HulEJZRVC09C2ekdxG40=
X-Google-Smtp-Source: AGHT+IHHFqJXm224ibud1rlPwk+dYou+cF9b3Du4o4sYF1lFAkaFVQ7oNHxkAoFGKCU3Tcu4AarguA==
X-Received: by 2002:a2e:8092:0:b0:2ef:2203:5dbf with SMTP id 38308e7fff4ca-2f15aab09aamr81448931fa.27.1722948885308;
        Tue, 06 Aug 2024 05:54:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeae:cd04:92c6:bd93? ([2001:8b0:aba:5f3c:aeae:cd04:92c6:bd93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e7cbd2sm182091925e9.38.2024.08.06.05.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:54:44 -0700 (PDT)
Message-ID: <2c9b758a87799f4307164a24a7cecb2bb3e710c4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] buildhistory: fix package output folder
 creation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Pedro Ferreira <pmi183@gmail.com>
Date: Tue, 06 Aug 2024 13:54:44 +0100
In-Reply-To: <AM8P193MB0900B95FF9A6569D089C600DC7BE2@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
References: 
	<20240802140008.497492-1-pedro.silva.ferreira@criticaltechworks.com>
	 <6185d36c7da8c96430a9a1c51d83ed9afedeee1e.camel@linuxfoundation.org>
	 <AM8P193MB0900B95FF9A6569D089C600DC7BE2@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 12:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203018

On Mon, 2024-08-05 at 14:52 +0000, Pedro Silva Ferreira wrote:
> Without the fix you can check that with:
> Set on local.conf : INHERIT +=3D "buildhistory"
> Run: bitbake -c cleansstate base-passwd && bitbake base-passwd
>=20
> Taking a look on buildhistory you will see that for base-passwd
> packages there is no files-in-package.txt
>=20
> Reason:
> On log.do_package, theres a log,"DEBUG: Shell function
> buildhistory_list_pkg_files finished", which indicates that the main
> shell function for the `files-in-package.txt` was triggered an so the
> function expects that the recipe package folder exists it will skip
> `files-in-package.txt` creation.
>=20
> On `packageData` task, there a python function `write_pkghistory`
> that runs for all packages from a recipe package and this function is
> protected to create the folder if this doesn=E2=80=99t exists.
> When writing `latest` we are protecting it from failing to write down
> the file but for `files-in-package.txt` we don=E2=80=99t.

Thanks for the details. Can you confirm this happens with current
master please? I tested it and couldn't reproduce.

I'm wondering if this was fixed by:

https://git.yoctoproject.org/poky/commit/?id=3D2feb9e20e464088c377fadb9344d=
a28100662130

Cheers,

Richard

