Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0ADCFA749
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 06:41:52 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.16330.1728024103870873622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Oct 2024 23:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HbBVbp6i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so16790815e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 23:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728024102; x=1728628902; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mLsIKYp63//FbfTkB30bAMAWbrCoNXgPa/4jPqz/ovg=;
        b=HbBVbp6iGQlVJKiGr6SqajO3GBED+Z9htn2iV7m8bFQP+E94r1PVocEuOM48/V1H4H
         YXWe8V+ZZXWNlkstmqSmby7RazkcGiPyeQQkcOz2G9bG2XiI4rxiPyf20ZNf0xHM6auS
         r7T9fyeZ0MlxtyNtTo7pzxrXHV+YEXpc8HYus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728024102; x=1728628902;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mLsIKYp63//FbfTkB30bAMAWbrCoNXgPa/4jPqz/ovg=;
        b=FsG6dt6lB9SXmtr/UoxYrao7Zu/kZCn0Et/gltODghlXrFtBApg+sMwhMXcsX605ko
         YZZvm/sOWVciex1ZsdQxLoxKFgCwInwhkPWPAFMF0vTNTvZSVkxZv+HbPRz1P6Ky/R/X
         tyx5rOl4eznUc7f+WsY8wmvnNlx05EJEG4emg++ChUjrEjjU/MmTKCxp9r89YC34R8oX
         SgKEpMnI5uYkkcB8MljgsElpfCITUZ4atElvPJELr/wf2a5ShPS82sTOk4tY57izvbus
         Z8Kc6RTNn1fZTx7wisxvT9NcpcPXFDh2/Yxbr+cUxSUm8FZbYet5UKCXXbZ6QM7dlGVJ
         G8YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn9W0h/59ttSAfUUSaXfqMiRev2FNJqfNV9fNv7cEOyUyj4ykZdMKi2jeAMVct47DfyUVLK42P279jcpDpzkSpIg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyOf5g8mmsWaGvzssmBCH7ajrIY5pahFihA+CIUPCuMlxP/t8Rb
	wK+Sqix3g5vihotNXKB4hsDtrBN/zduMP52fsX87pof78fnXrM6qXlW2TeoDA4g=
X-Google-Smtp-Source: AGHT+IGQKqYWueeubYoy+mbKZTy1KCJ+48Iqi4WgMseMFf3GxSXo03Mxtig3Quz0SApA7mQntLnrFQ==
X-Received: by 2002:a05:600c:5251:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-42f85a6df29mr10349445e9.4.1728024102135;
        Thu, 03 Oct 2024 23:41:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:25ac:3f31:db63:541d? ([2001:8b0:aba:5f3c:25ac:3f31:db63:541d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b43ef1sm7482465e9.33.2024.10.03.23.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 23:41:40 -0700 (PDT)
Message-ID: <53ada3238c3d3f02ac1a69c9808febe11e405bf0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] valgrind: Drop patch regressing fdleak_cmsg
 test
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Fri, 04 Oct 2024 07:41:40 +0100
In-Reply-To: <20241003230144.900743-1-raj.khem@gmail.com>
References: <20241003230144.900743-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 06:41:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205222

On Thu, 2024-10-03 at 16:01 -0700, Khem Raj via lists.openembedded.org
wrote:
> This patch is regressing on some distros where systemd
> is used and /var/tmp is same as /var/volatime/tmp
>=20
> Removing this tweak also passes on poky. So I wonder
> if we really need this patch anymore

Removing it does not work on poky:

https://valkyrie.yoctoproject.org/#/builders/73/builds/179
https://valkyrie.yoctoproject.org/#/builders/61/builds/181

Cheers,

Richard

