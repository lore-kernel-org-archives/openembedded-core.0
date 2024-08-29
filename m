Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B12C83F09
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 11:53:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.11472.1724932426142641658
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 04:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PaYL8lqX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42bb885f97eso1571365e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 04:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724932424; x=1725537224; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yxR2BksCmkUQB2q1MfoC/VcEM3TY5WuqetPf520LjiE=;
        b=PaYL8lqXMgvyVImlxiWcY6GqET4al5CIa274asIy4w9Ge1mTTp+4t5FJh40EbFhaEn
         lTDWbhZ5AARBZDRtDb3Zw1rDLnKoOXCtpDVqMxgeBYrbtXmsm/rsuHcdBQaN+3lYysKl
         4eAmrcQUzjHgaSyzztAtRyP6x2JWYqDlURjug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932424; x=1725537224;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yxR2BksCmkUQB2q1MfoC/VcEM3TY5WuqetPf520LjiE=;
        b=vzuZIYu30yAAeIFHqYD3liFHdz82ky6o+0m9Wu9PepGoEvAsXOIBXgHKCRupp6H1DE
         yI6jiAq9oG5eHqRLB3tVrtzjmC3tHIYWCyS361oulxn51U5qNP9YDpRTrB5s1e6GqJjo
         TcVMuzyYQFz7/wZrXoUQZmZK3A5a94u5KPjZxi7PeQZ5pioCuuphUEGs8kbI9VW98OU1
         hn1Cndij4Tygd7bOH+fRzh8cReI9R8CpZbsPEuWbsYOm8qbY6e0APOpsPrxjDE8Z3W64
         PukaOrX0HH4h4ms6s3EoMSWxS8wxOV93aFi5PY/Mp5p1tuybT/+Mn3LYmBnRYMAtozOT
         bSeg==
X-Gm-Message-State: AOJu0YzXNpc92FQZN1qsIU46jG06vXmEe7NDzxrtSwADhVT8yG4wlbZm
	0LIntgjz2+iJh1wnYbnwV9Ksrpo+e6uCUNRPlU+Zlbag3aiqp9W/0emV+0KU+So=
X-Google-Smtp-Source: AGHT+IGG1pmxAWDJijJCMY/Q5ltug4xnTmUIQ1rxwxw+cUZMibDVZ7euq3R1paeSrJwTT8lGjwoq1A==
X-Received: by 2002:a05:600c:3ca4:b0:426:62a2:34fc with SMTP id 5b1f17b1804b1-42bb7443a76mr11173635e9.11.1724932424354;
        Thu, 29 Aug 2024 04:53:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:19db:d42a:7902:cfcf? ([2001:8b0:aba:5f3c:19db:d42a:7902:cfcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e33e37sm14982125e9.42.2024.08.29.04.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 04:53:43 -0700 (PDT)
Message-ID: <cf8dc63daf50ca16d4906a0698bd14402964e3c8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] buildhistory: fix package output
 folder creation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Aug 2024 12:53:43 +0100
In-Reply-To: <AM8P193MB09004DD00D04193F371CA700C7962@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
References: 
	<ebbbb5b1cfa0dc87360a1d72db7bf009c7264dfb.camel@linuxfoundation.org>
	 <864.1723536321789931548@lists.openembedded.org>
	 <CAOSpxdaqBx5GMDe2-YJc2z_KA0VuBpv-aqP+Zt=XFa6p-XE9qQ@mail.gmail.com>
	 <AM8P193MB09007D00E8018039DD5FC6A1C7942@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
	 <1e6757fe926b7059a5366b3c7e21c380b6400fb8.camel@linuxfoundation.org>
	 <AM8P193MB09004DD00D04193F371CA700C7962@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 11:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203913

On Thu, 2024-08-29 at 10:55 +0000, Pedro Silva Ferreira wrote:
> I tried to pickup your patch and make it fit but unsuccessful. Would
> this be an alternative only for LTS branches?

No, since there are multiple call sites into sstate_install and this
therefore only partially fixes the problem.

Cheers,

Richard

