Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F8FC433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 14:19:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.7875.1652797164122947928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 07:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aDwex6E/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id k126so10538835wme.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 07:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=s4JzeoFp8HkEptZTy7V+fHED/VpgCnXKueiV7wnMr2c=;
        b=aDwex6E/CGoqmSm6xBu7y5X5rs6LgEmWTWehLUAcPE0l2Qh4NloKfU4kXkBhhWCQt0
         22QJs3TQ5UNJmizSMy3LAvkHYtXr4AgA3eeJY5rFizQ006babVz2zzD+Z+Y5AUY44VJq
         l3S+/ZsVpI1JsDKKnb1i5t91U/wEY5NOXIryc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=s4JzeoFp8HkEptZTy7V+fHED/VpgCnXKueiV7wnMr2c=;
        b=F+UnG35a/qacmjhIPWXEfP8ExWwfKclxx6u68Jj4KY9Np5NNn9V+t3LDocvKTtOnw9
         JGTXlNt6FiFgyxlhrCmqkA22zoAEvYLJJaxvHf2oDLQOdaMyHLWPzuwoW3POQV05gRJL
         Oxa2h7+HmGkU0nrExdqdqSbKkSwo66GQq8s+85+e3PT3Hd2gRgz+ZF3j9QbM3SiD5r06
         2zejpFTWOKvCBhsY1g01Op6DLweWKjptch5V1p4f3LLq8+WN93cZII9OS3F6q7eHd8uZ
         f3V3eqcaWqGoSRfK4Z5VIlEhu3v1XKLsUMYZX+domPKqFzX5rbgxzfJrKlOR7jI3M035
         2wlw==
X-Gm-Message-State: AOAM533ycfYOxTsqmiujLXFStHN2JN2TbFtHyHw10zI3OVv8AUEqUHpT
	ZPS+zktS5d7nvjas0lHU8ST+bQ==
X-Google-Smtp-Source: 
 ABdhPJyb4vu6gn+7MWmOj2bVEXv/oS7JcG38iZTBuc1EbfOnTRnMpFKNKOitLzz9ZGMkgGF8/eJ2iw==
X-Received: by 2002:a05:600c:1f0e:b0:396:8a52:bbc4 with SMTP id
 bd14-20020a05600c1f0e00b003968a52bbc4mr19071318wmb.119.1652797162316;
        Tue, 17 May 2022 07:19:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f9c5:af58:f70a:331b?
 ([2001:8b0:aba:5f3c:f9c5:af58:f70a:331b])
        by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c2b9400b0039453fe55a7sm1948848wmc.35.2022.05.17.07.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 07:19:21 -0700 (PDT)
Message-ID: 
 <722011c32a289bb9945a491e1f9b9e290e62c3ea.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][master][PATCH 1/3] cve_check.py: Add new
 method get_ignored_cves
From: richard.purdie@linuxfoundation.org
To: akash.hadke@kpit.com, Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Ranjitsinh Rathod
	 <Ranjitsinh.Rathod@kpit.com>, Akash Hadke <hadkeakash4@gmail.com>
Date: Tue, 17 May 2022 15:19:20 +0100
In-Reply-To: 
 <PN3PR01MB67120A503C169C733A3C0A888ECE9@PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM>
References: <20220511143613.25002-1-akash.hadke@kpit.com>
	 <CAApg2=Q1STrbYF0PE_R9qZE9xRbM-su-iouWi=6CgEepGn--BA@mail.gmail.com>
	 <PN3PR01MB67120A503C169C733A3C0A888ECE9@PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 14:19:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165737

On Tue, 2022-05-17 at 11:42 +0000, akash hadke via lists.openembedded.org w=
rote:
> Actually, I wanted to add the ignored and patched CVEs in
> buildhistory and for that purpose, I am exporting variables
> CVE_IGNORED and CVE_PATCHED with those values. I don't want to use
> cve-check.bbclass as it checks for the CVEs from the NVD database,
> and I only want to get ignored and patched CVEs from the recipe.

I'd really prefer to have one cve handling class where we can configure
it to get the data different people need rather than multiple
difference cve classes which are going to confuse people. Could we have
a way to disable NVD data from the cve-check class?

Cheers,

Richard

