Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519BCC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 17:56:48 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.11260.1641923807546418921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 09:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=1kRDiz1C;
 spf=pass (domain: burtonini.com, ip: 209.85.128.48,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f48.google.com with SMTP id c66so11641934wma.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 09:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J1B/7CM9HgSOzrMuA9L03h8JJ9LD6azSDAIXJLOQu6c=;
        b=1kRDiz1CqYmtzJ5lKaTw+7CaEcYgOupli9GRt8bNpDkoFzw/ubNL9ZJ97hBAh2a4WM
         /jIs4LoyNafourl5f6KoViM8bY+p2ltsmZMW+PiD9lGDOofNLqNq1RDfX//Kd3fhKuWF
         3//C5maJiTUHxe8qVuCFKrt6JqJkAZhTF2N/4/07yh7u9BgqkOQig2EG2zvWAS0QnMW7
         0yWO/yEu4omyvE4xtFDqR2Lxk7owbt1tDJUpUT25p8fKzrlz4SAETL6JmPVW34as97Ja
         NseSQIoYYVIY5lheK/NTobv/tVywu8/xm+5DtmxN2tQPc7wa1A8F5IMLhyuQgVhHcUNh
         xv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J1B/7CM9HgSOzrMuA9L03h8JJ9LD6azSDAIXJLOQu6c=;
        b=RKqfQAKSA2LknPsQ2ESTX/YZ4k3/pAnSpqTYflJaIEFPvpKAekJHFLgHYwrVe0SFAw
         PKYVilss1CI+FQ9xQQiaJD2q1Jqi0hlowbmuopOt8OjCfVF4m/oN8ct0miPoZVHkP9z2
         lNLIbOon6/oxlr8HrOJkas+B3z+ITfu66WQVlxuyKsoco/80AZZkyPgPv0GmabvjnXwv
         nqvXEvOe4cy2+hZBc7/Sbr/8sDglZE9z/HxB/h4FWgEHSdFejgtf5VNUK/0JilvmyO+r
         eQa+j/sZrbnKVjLErrN5DudoiTvqiykA9nyey/KpoUh5dLpkLcBfYPkR+zcw/Ea8q2IT
         f3CA==
X-Gm-Message-State: AOAM532QGaCWDxZamZ2i9Jfc8Ax/D8d4Ya55bDK7eL4C8149DYgOvJPL
	exl1BHC6HwfJsbCdnlZBhC49gSL9y5qvJjfLdhi39A==
X-Google-Smtp-Source: 
 ABdhPJyImrF+YHJDfXoFvcbumdIKO90DINH56f6Y1odVpszDEMGLD/KgvlNTSpNTKYZSV4O9yMi33h9JySe2ysWE2g4=
X-Received: by 2002:a05:600c:4fcc:: with SMTP id
 o12mr3394674wmq.184.1641923805707;
 Tue, 11 Jan 2022 09:56:45 -0800 (PST)
MIME-Version: 1.0
References: <20220111135540.2874535-1-ross.burton@arm.com>
 <CAAnfSTuYa5wJEJWwqAFTp8cRYBndYeuh-2opSEYcatcqBo0sZQ@mail.gmail.com>
 <923ce81d-23e3-8ed9-14b9-e03f27bf05d9@gmail.com>
In-Reply-To: <923ce81d-23e3-8ed9-14b9-e03f27bf05d9@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 11 Jan 2022 17:56:34 +0000
Message-ID: 
 <CAAnfSTtDQ8RB8Dud1uVG_GAXTEhqk6P+Lj97K-6YdMRskRvWDw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/selftest: add test that kernels build with
 defconfig
To: Robert Berger <oecore.mailinglist@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 17:56:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160423

On Tue, 11 Jan 2022 at 17:49, Robert Berger
<oecore.mailinglist@gmail.com> wrote:
> Is this only one defconfig and nothing else or a defconfig plus fragments?
>
> I build with an upstream 5.15.13 kernel with multi_v7_defconfig and it
> does not spit out any warnings. Not even after adding some of my own
> fragments.

I've been maintaining a patch in meta-arm to fix this issue and I
believe that v7 actually works out of the box in 5.15, finally.  It
definitely fails for arm64 out of the box.

Ross

