Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C14C4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 23:58:26 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.105191.1669593496552814672
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 15:58:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KRQB+J8e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id n3so14348618wrp.5
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 15:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FMFHqbBv5beasOezt13OoPoQzkNs7+p3PMJ+S7rudNo=;
        b=KRQB+J8euDaaU/HlSDC7taW9l9u71FmVpZk/GcGnoa0V2deqcC4w332QCAHC11wZJ3
         JOYiZELvY7O6sf+l2Ekly+LjZO4bS58awUTGPFZ2MKt+MY79Ox57QxYSfuEtHsAINUXE
         N5OZhdRc7OLGWuL5pIiUu9KLwci6JQHOG/ZJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMFHqbBv5beasOezt13OoPoQzkNs7+p3PMJ+S7rudNo=;
        b=FLih/FhQWnBI6n/teSxSvoRJcUbj+UiBRW8BL6WGWl6lKAT4Y0vFNJcxlW0Hadgvbt
         nlcNCESMlEWcoVIbA7hoLvek6cOiR7naQoHWOzjdubta+NKHUEkrwE0D7PY/kBzFPheS
         ZHsh4x1g15qcU4CIrL8zEY27GPR4H6cpieHo+CHRM6jIj5/SujgrSJdVCy6X65igF45A
         m7oDFJVBaH/NAd4mgMI7mbsoUWnhrMAqeGoIGSHwPxacS6lOvoyz+lDB4IfZ4AZckIjd
         sKsnKZzQrWimOQbmE4W97SOaRoflOCJhC9Mwcc4Nsaj/b7kOfFwlDRmpgxlu84X6mMyc
         6I1w==
X-Gm-Message-State: ANoB5pmsQvQrTU0m/WLjBAQHYGYyBViNZQ2BDia4kammE68if9uJ3bWa
	grsattwoavWvvHTdXPMQdFFQ5w==
X-Google-Smtp-Source: AA0mqf70EUtFnrXoa5dj3fL11+FsHURQjme3Gx0AR7S/AaRqora+XIVymm7DeVd8e+pFMixpW1hsVA==
X-Received: by 2002:adf:e486:0:b0:242:1b65:8901 with SMTP id i6-20020adfe486000000b002421b658901mr28969wrm.639.1669593494658;
        Sun, 27 Nov 2022 15:58:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1da4:7286:b644:a924? ([2001:8b0:aba:5f3c:1da4:7286:b644:a924])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c358d00b003c6b9749505sm18291773wmq.30.2022.11.27.15.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 15:58:14 -0800 (PST)
Message-ID: <458025bf556060dc1e3ef56bafd564d4b998c2fb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] qemu-helper: depend on unfs3 and pseudo
 directly
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Sun, 27 Nov 2022 23:58:12 +0000
In-Reply-To: <20221125211558.20985-1-alex@linutronix.de>
References: <20221125211558.20985-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 23:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173890

On Fri, 2022-11-25 at 22:15 +0100, Alexander Kanavin wrote:
> Dependencies of runqemu belong in qemu-helper; in particular
> there is no reason to scatter unfs3 all over the place, and then
> require separate steps to make it available (e.g. 'meta-ide-support').

NFS isn't really a dependency of qemu though. The thinking here was
that you could boot a real board onto an NFS mount from your local
system for development purposes. That is why it was being included as
an SDK tool.

Perhaps we should just add it to qemu helper as well to simplify the
runqemu case?

Cheers,

Richard

