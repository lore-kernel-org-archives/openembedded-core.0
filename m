Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754E0C05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 10:57:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.11663.1675940218558464290
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 02:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d/HSKLga;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso3561833wms.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 02:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3a8QbIUu4qSpvvuskTSHCAno9qIfrk7Jb84+Llp6NBQ=;
        b=d/HSKLgaZOz3UhFli7Fc0TSAgZCrBeZV06wZGQbM/Mc1AKS9Z6h1lONFYZQWayWAor
         dsVevWEJF/AOj/fVuP74LFsLFY7gLi4UnD0qvIMbmWu9cYS3xyPUl+kTqNU4sMbpSjRp
         dEtDT/GQBguXY/I/Likl9/VZiDDnVswOCLWsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3a8QbIUu4qSpvvuskTSHCAno9qIfrk7Jb84+Llp6NBQ=;
        b=Gjjd5ADe6E2eubKK6KRZKCioQEj7v7yj37DMttKDGYT7UhPv8yz3mpkotRBEhHOUIC
         kgZhFumrr16ZzZZU4eVWdCc6behggO/AIJN1b+Z3IswD2+qZJiTpU82bWD6sh8Au7TrS
         uYZAIbxJA4V1k+uyFjMqwPySNeWHM8MxjJ9Jx6YNJ/c3XlKZS8yWIGcdsW4LYjbzOaxQ
         sBP7/vxVx5O8MQvdl1AT4tLLIHl/hn6uaQN9fbIYi3YPsQQLsQBfGFWBao2/5dsttIHL
         HAc5B+f10VLwurW1e2co8Qc7YvwErTcsLqsmyDNoLrKBkG5PBTgTmn5guTn5Mw7miRjr
         arLg==
X-Gm-Message-State: AO0yUKW7f+oUmMGom0fcmeswG9eHYGIhWFcnUehWX7zBhjztvdDdPDj8
	lJesthATCrGeFQIyvMVd2OBvVg==
X-Google-Smtp-Source: AK7set/88E/j5kEJNf/hmOm5D9DkiHScryv8Rmu22w6DwzQMbP2UCoczr3rLIyxX61fMqPEyL6Ic7w==
X-Received: by 2002:a05:600c:16d6:b0:3db:14d0:65be with SMTP id l22-20020a05600c16d600b003db14d065bemr9519788wmn.34.1675940217108;
        Thu, 09 Feb 2023 02:56:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:29cf:6f5:fc42:8eb4? ([2001:8b0:aba:5f3c:29cf:6f5:fc42:8eb4])
        by smtp.gmail.com with ESMTPSA id o41-20020a05600c512900b003dc4aae4739sm5282499wms.27.2023.02.09.02.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 02:56:56 -0800 (PST)
Message-ID: <89fbe95fc00bac6429342634edf3586d8c5f2ab8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/8] oeqa ssh.py: fix hangs in run()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Mikko Rapeli
	 <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 09 Feb 2023 10:56:56 +0000
In-Reply-To: <CANNYZj9Hr2AZSuXutfF8kktatFt-AmsYT2bp9oauOLLFonQ5wQ@mail.gmail.com>
References: <20230209080936.148489-1-mikko.rapeli@linaro.org>
	 <20230209080936.148489-3-mikko.rapeli@linaro.org>
	 <b9dd7731ad6e5e5bbe2a061f87c2d2452ca6524f.camel@linuxfoundation.org>
	 <Y+S+g0W4NZ+0zd5g@nuoska>
	 <CANNYZj9Hr2AZSuXutfF8kktatFt-AmsYT2bp9oauOLLFonQ5wQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 10:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176943

On Thu, 2023-02-09 at 11:53 +0100, Alexander Kanavin wrote:
> On Thu, 9 Feb 2023 at 10:36, Mikko Rapeli <mikko.rapeli@linaro.org> wrote=
:
> > I think sleep() is ok in this case to reduce busy looping over serial
> > console and read() more data than what select() initially saw. Reading
> > single character at a time is a bit silly and just wastes CPU time when
> > we don't need ms level accuracy.
>=20
> Something doesn't compute here. The writer should be sending data in
> chunks, and there are buffers all the way to the reader, so where does
> the splitting into single characters happen?

Just guessing but in the case of the serial emulation in qemu,
115200bps is probably "slow" compared to the system speed so they
arrive as bytes?

Cheers,

Richard

