Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCD6C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 22:23:58 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.1361.1670624627766606917
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 14:23:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NVvdKa/h;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id g14so2398237ljh.10
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 14:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HFHUgLrMgF4cp7/czdh9N1yTB03b1L5daymLxO5DWGw=;
        b=NVvdKa/hmPuANZ8ucaacsynvpsYiWcgrcROQavIi4/nkM3Y0RTQG4iyxYF+95irSFr
         nAeoRd3sBaZY89OcQlmYEo4ZvzUf3i8meWitFV4mtp8JamuKyh7+34EqIs+h+G2QlUMW
         hCkkLWYBHMePu3ZsOXhAqTakUxU/rrKvF5wav6VVL1/CIbvsqbCGO5GNSvAajRSA+p0O
         ffi2oVu+/7QXgf+E/e6QCIV3Wv9YE9wh+NqwXXE3eBqa+6KIlwG0hkIwhlQ4a9JwV0H7
         mn2JwGPdpjtvTJB6HPsRiO4DquaeZ0QHcAriE1GU4IF6F6evs9Nx3be+3pHPppJi9j6F
         JfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFHUgLrMgF4cp7/czdh9N1yTB03b1L5daymLxO5DWGw=;
        b=nCv7aJOeuRJIw1dys2hoEMObnV7mnPtpaI/iiQ9KEmATGTZFxgttqYZV8Q9zCkztQ/
         c3B4MWEBjRNAlOJ7EQfMkxFu3DpTtvo6JHSN+vcH0tjFpVHnpyiYgavwOFA/o/rvVJ/p
         lxlMeXikbt9Bo2SvWsDVWp4mp8GTUbWpSb0KmMcbkSEayB7Kf6FuEIsgu0TIwduN6dOM
         liLldhY+gFaoUxI9PW+rSJIuYQlMXLAcpghNdQSi/sZUGCBdWWdcFPTkGQOB7+jlTVL/
         SUIzeTu9xb7wGMLuR3aUXH+wYYvQ54Q7zWsPKyW+r3gFqwMHyKhnoBCtE4Pd62nldFeH
         SOVQ==
X-Gm-Message-State: ANoB5plnnpMKGQ3R3EbycJIbbTioLMKKiavoTcM9i7bnXKkIphtQpEtW
	ygdH9Zd5wxxlW5AWZDbeypmdWw1Q1sRKZ2BwVRY=
X-Google-Smtp-Source: AA0mqf5rqbDQnbjty7nQSDYV302rI1UzyknYFBzt5s6PII5MiLzHZ2l5elFp4j8sBJyX7HQJHouDl3ZQTkWTXcu8hFA=
X-Received: by 2002:a2e:a174:0:b0:279:75a0:c063 with SMTP id
 u20-20020a2ea174000000b0027975a0c063mr24181751ljl.45.1670624625440; Fri, 09
 Dec 2022 14:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20220811154005.4084669-1-trini@konsulko.com> <CANNYZj82WqbCr2MktnE8GrowoRiXL=W2GGOVpgzgi9Ud9YJJOg@mail.gmail.com>
 <f037201c52a8acd0bbc42b521e40795fb30b0359.camel@intel.com>
In-Reply-To: <f037201c52a8acd0bbc42b521e40795fb30b0359.camel@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Dec 2022 23:23:33 +0100
Message-ID: <CANNYZj_yC4GUJX1SxxJuwBRCkS2KgHg=JR6kYMiQ1nJ6Or=nDg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemux86-64: Allow higher tunes
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "trini@konsulko.com" <trini@konsulko.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"JPEWhacker@gmail.com" <JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 22:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174470

On Thu, 11 Aug 2022 at 18:42, Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Thu, 2022-08-11 at 17:51 +0200, Alexander Kanavin wrote:
> > You won't get AVX or
> > anything newer, which requires adding these instructions to qemu
> > usermode (a project I'd like to do if I had the time).
>
> https://lore.kernel.org/all/20220418173904.3746036-1-paul@nowt.org/
>
> I didn't notice any v3 or an update on the bug.

This is now merged in qemu:
https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg02253.html

7.2 will be out shortly, so then we can look into adding skylake tunes
and perhaps moving qemux86_64 to them. Making skylake a fully
supported default in meta-intel would be nice too.

Alex

