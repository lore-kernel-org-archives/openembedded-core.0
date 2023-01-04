Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED25C4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 16:25:34 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.16772.1672849525981845124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 08:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N7kOL8L4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id z16so17065713wrw.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 08:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCGwBJ20622N9k0EHfWC2liK261zWyJAPRQ9EBntCjA=;
        b=N7kOL8L4sw4sYJ1Rsv52nKD8Lz0e5okVaVIXdHSLFHfUUY6GXWhbxPSYahA89mT9m7
         bUO/Nwr7pimEL7xFqkFf93a1sMhyiT7SIn6aW5eL7QtMi7VAUX0vTViEdWLxFpOw4xlW
         VZ5MMt/8uO2annerPs+Y9u31r1OPH7BGFZL6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zCGwBJ20622N9k0EHfWC2liK261zWyJAPRQ9EBntCjA=;
        b=BWmb13UAROntQg7Trj6TiOS09JvrYb9ImK1p0ylk6bQCssbD3AC5QxskB2zSfcysYn
         hm/w0GebFbYIWJuVG34MlH06PMAuy26iXIPRqhX5auzublT/GggO8LqD9ae26/NiYwZT
         +NxfbakimIYB/IgldG/OQ8vYyj9uWfQZ2hgWVGoVM+1pTiSvrO0nq2SxNHBzWDFWLtgq
         yvLVPmOB+dyBWwEimkyTwUSXz+UrZjRgIhZ7elr68mV4ERPZSeSnKKTyJue2YxH1KIaP
         btGqrcI+PcrVtLY11KclkDj7ObKvKyPjCaWkiiZLfTOjDawQ6ZskSxCFL/y3iWCxwpWu
         Pl6A==
X-Gm-Message-State: AFqh2kpEmyDIxojQOwe8pO2JAwiC8qu762LQ1qOK7qdclYVqY/MJD06h
	x5ACOONymNm7ZTZ3xC6piqSj07agJxMpo6aM
X-Google-Smtp-Source: AMrXdXv1znrg558q8qn5BgWfvDzdCvQFpS4d+Nc/lm6qOdrcGzFYuwelLKU7dkA8RuP5WdauTzCiBQ==
X-Received: by 2002:adf:f107:0:b0:284:5050:5e59 with SMTP id r7-20020adff107000000b0028450505e59mr18848468wro.29.1672849523958;
        Wed, 04 Jan 2023 08:25:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fcc2:4e85:26d2:6527? ([2001:8b0:aba:5f3c:fcc2:4e85:26d2:6527])
        by smtp.gmail.com with ESMTPSA id p11-20020adfe60b000000b002366e3f1497sm35012800wrm.6.2023.01.04.08.25.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 08:25:23 -0800 (PST)
Message-ID: <4a8cbda140f676a63cff3e13678bcd8407ef50dd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/10] package: Move fixup_perms function to
 bb function library
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 04 Jan 2023 16:25:23 +0000
In-Reply-To: <173725B379431FBC.11747@lists.openembedded.org>
References: <173725B379431FBC.11747@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 16:25:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175500

I'd guess people might be curious on the actual parsing/cache impacts
of this series.

To be honest I'm having trouble isolating a parsing time change for it,
which is quite sad. Someone with a slower system or limiting it to a
small set of cores might get some better results. I can see slight
reductions in the generate_dependencies function times. I was also
profiling the "bitbake -S" cache mode, better results might be obtained
without enabling that.

It does reduce the overall "bitbake -S none" cache file size by around
420k (on a 74MB file). Much more significantly, it also reduces the
do_package sigdata file from 224k to 159k uncompressed or 54k -> 36k
compressed (which the files are).

Whilst those improvements don't sound much, this is a significant
reduction in the amount of data bitbake is chucking around pipes
internally and the reduction in size of the sigdata will mount up over
many recipes/tasks in an sstate share.

I do think we can end up with cleaner more understandable/maintainable
code if we do this correctly so whilst I had hoped for more, I still
think this direction is the right one and the changes are worth
pursuing.

Cheers,

Richard





