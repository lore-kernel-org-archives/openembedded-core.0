Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF0CC54EBD
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 17:39:47 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.94683.1673631578633102799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 09:39:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HLWh3Dso;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id y18so19647209ljk.11
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 09:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlxTawysMaWfbvLzQcnF4OT9tfZtLTjMi1Aw+Od6xdE=;
        b=HLWh3Dso58PTBJ3Ltj1R+fPu49XbYi9tvDuO2AmT+/Ni2tp0jLjCJMiFwkrz+9YLso
         4EHtQ8Qt4wRMO0ZtdVvf8TsJRf7r8EYeWgqwWqPFCt3bZkif5pOgxepMjo7XgZgXnpUp
         6EmeL1N5ETPsgYkfWnhFCu8n0k5kadW7vdmwn9hCdz5x/dt7hFLXIajOxurtqoNe1H8b
         MYoVzeZfO25VGJejZjd0IQoSw1n+YAvOtmwXplE6023xrF1HVUfqLyYWf4naXeReUFJW
         QR1FigYGTSpma9/UwNUCIyEMyt98egxXh3uZgal4PvIYpTnQYVstA7wT8gCZXzjnhbVC
         5/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZlxTawysMaWfbvLzQcnF4OT9tfZtLTjMi1Aw+Od6xdE=;
        b=K4exApZdEnozRIjDE9tp8sGihvtyYPNS5IvICA4b5/2bE89RSdyBeT3Syp6q2gBnwg
         RuFew3wbh8ouV1LVQ9V7Zb4NhWhJuVWQD3A643FoRuAvFc01t6tQ9M7xsld4UlLDj4N6
         0lOcnqDaoQrbNBO4tKqKrAI9gfDiXAjxWHZQF/AJQDPeR0BdtZtN71JZsLZdSdexUY09
         yJS4nafDkXnQAItCRVCa66R+6GrH/icjbOO27uXag/zjKvyKKL24YCFpwyaAeDi09Pkg
         evxbWj2bxj1a2fZLD2TKFix9B0gjK23GlHpw1++tfzL7m1eG4fdYy+nCuXhSYDxttuPp
         JTHw==
X-Gm-Message-State: AFqh2kqwPhxu3olByOUzcS83C9CUmsR7z2R44JTiKh4bNXLyXFRAzwF8
	HJe7Z4zvqdQHpHVkoeGSJJbib76KLB3PsUU1iEI=
X-Google-Smtp-Source: AMrXdXtZcQMHkk7NKD6EyOWy67n6dCg6AE/VvDJ0j4SitES8lH0iTRrMuO+BFzvMzCylWcPFX66SKlsksB3VeFr55gU=
X-Received: by 2002:a2e:96c4:0:b0:28b:6d42:c63a with SMTP id
 d4-20020a2e96c4000000b0028b6d42c63amr95469ljj.45.1673631576879; Fri, 13 Jan
 2023 09:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20230112213301.11768-1-s.zhmylev@yadro.com> <a956c7ec6640cfee5bebb41720beec74e8b663cf.camel@linuxfoundation.org>
 <dca56133ff38a2700cdeda8832d187e8f1863a63.camel@yadro.com>
 <CANNYZj89sJH398ksmtB-TRcTOW6_MYKsDdCie3mHe7QRvKu47Q@mail.gmail.com>
 <8eae30b2192df5bae48ad7c8eb028b868ef89e55.camel@yadro.com>
 <ea059c6fd86267376a501008384d57dd9c7f96fa.camel@linuxfoundation.org>
 <CANNYZj-P38yonASaKJFq_r+KvKvX6wj_7j7O=NFR3=SeUt-38Q@mail.gmail.com>
 <2ef83acb208a3e7222b699a6ecf894b184f87444.camel@yadro.com>
 <B94C4C10-689A-4105-93A1-0DC0EBA92161@arm.com> <77a8632e7d40624f3af87feba2adccaa986390ed.camel@yadro.com>
In-Reply-To: <77a8632e7d40624f3af87feba2adccaa986390ed.camel@yadro.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Jan 2023 18:39:25 +0100
Message-ID: <CANNYZj-y4iwM2bVHJ=Bi9qUCvywzhOACubOCVD4CBfxnti3jyw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_rpm: allow arch overriding
To: Sergey Zhmylev <s.zhmylev@yadro.com>
Cc: "ross.burton@arm.com" <ross.burton@arm.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 17:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175846

On Fri, 13 Jan 2023 at 17:01, Sergey Zhmylev <s.zhmylev@yadro.com> wrote:
> There are a lot of useful tools in this huge world of enterprise-level
> distros, especially all those staff related to static security
> scans/audit and around SBOM collection and processing.  Those tools
> rely on some basic rules of rpm naming for their analysis and do not
> handle architectures like "genericx86_64".

Can you list the tools please? Are they under open source licenses?
What do they do that Yocto doesn't yet offer? Yocto does CVE scans,
and SBOM generation as well, so what is it that is missing?

It also goes both ways: you can figure out why the tools do not handle
architectures in a generic way and submit a patch to respective
upstreams so that they do.

'Enterprise-level distros' means vendor lock-in and expensive
subscription fees. Precisely the thing that most or all of us here do
not want. Yes, we are not mature.

Alex
-

