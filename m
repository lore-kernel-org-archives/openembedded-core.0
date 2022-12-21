Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E4DC10F1B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 10:18:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.15624.1671617886235374552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 02:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TpNjMyjR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id f13-20020a1cc90d000000b003d08c4cf679so1068302wmb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 02:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iU0fDu9/9G78kg62tY3nxAKwo107GCelRB2ilrumQv4=;
        b=TpNjMyjRWNEFlyBrUJASSA2k7eWawA7UBpker9Jj85K3sKjpy5BeGRJrBu30x8BDvE
         rNUZenCZ1/gC/QIIpTq3wD/HUwIMQe4PnoQN8zpi8zjDffsjc7hYJwAFDTK5DOnlYcEe
         qcyACZSeCw+/wJBwOY27G6Z8Cljl8wM3nAfm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iU0fDu9/9G78kg62tY3nxAKwo107GCelRB2ilrumQv4=;
        b=PRHDXHncJWL+2G+l8RQswyBL6Y6d0FyHf1R4jwLokbglcUOEVb7Df6y093CUeFB9h+
         cNvYWoF87oI5D2i+7GVqGjCMfNvzgKkm9LxMokkD1TYpd84qQ4HGtprSksCGl6/LAHte
         BqknLK8Qp/xIfKglmj1g/YV4i9Llx+UPSBFcL/+rZBlLHna5Egc+8ccS09732agfgUYr
         zryBspGJBIW9DgOyQ/Dl2YQykGXCUke6duyyVLjAE+JOIZ16jOeZNqUqVnq9ktu3xiuw
         ExNzeRZIkWlIx8w1BTvLMNxKtXThc3Hn/R2T5Jm67P4z21CT6ieZiMJ0huhsvzOLyFI0
         UKhg==
X-Gm-Message-State: AFqh2koc7+m3bR+7yBGrZT5VuSa9MDRs9sssuwJNxEWjfNZRBV3SMTDA
	UPUtpJSbH7jjZZo0A/ZiM+YnfA==
X-Google-Smtp-Source: AMrXdXtvug3kPKeIRSNr+q/S7wO6aoub6Zj4OGYAJR0FzacghzzmhtMERmfAIJTJmfZzxoJWgzLl5A==
X-Received: by 2002:a7b:cb86:0:b0:3d0:4af1:a36e with SMTP id m6-20020a7bcb86000000b003d04af1a36emr4026421wmi.26.1671617884520;
        Wed, 21 Dec 2022 02:18:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e749:b020:2cdb:af31? ([2001:8b0:aba:5f3c:e749:b020:2cdb:af31])
        by smtp.gmail.com with ESMTPSA id z21-20020a1c4c15000000b003d1b4d957aasm1736499wmf.36.2022.12.21.02.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 02:18:04 -0800 (PST)
Message-ID: <b268f409aff38b2ea20b2d1b57fbbe65414b1d5f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 14/24] cmake: always add local files to WORKDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Wed, 21 Dec 2022 10:18:03 +0000
In-Reply-To: <20221213111118.149697-14-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
	 <20221213111118.149697-14-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 10:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174904

On Tue, 2022-12-13 at 12:11 +0100, Alexander Kanavin wrote:
> This reduces friction in version updates, as devtool can handle condition=
al
> patches, but not conditional local files.

Whilst I understand the desire, putting files in SRC_URI which aren't
used just complicates the build=C2=A0and means if you change those files,
things rebuild which really don't care. As such I'd really prefer not
to do this.

Can't we fix devtool to handle this if it can already handle patches
that way?

Cheers,

Richard

