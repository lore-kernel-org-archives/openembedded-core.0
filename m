Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF29AC47DD3
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 10:32:59 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.70541.1705919574797906178
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 02:32:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jN4p8fRt;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cdebb968feso34064031fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 02:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705919573; x=1706524373; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uw3TP3a1bBj4W3abn3l3ZIvGkQty3GuUfTltt4RipQA=;
        b=jN4p8fRtV9kVQytVU2463leUbRzm/s3INFgB4TOzgY8JBqPP9zILBuBsQv5n0O65FT
         SVNraGmnZdn8UJuI3SecfCZWRZYX9ECThKTEGJEEL0R0Prwd+dT9YWK4YGDh4Bc5FxnS
         RWTiX+UEvTCmTaM6MhrAi+O6qCIrk/ViQwX6BlEovNYX6sBoBRtEJOK4y+ASYw8uujfd
         Gvh1tI7zvG5bLxZpFEUqq7n2Hdwq+PLOV16DFaErph+WGfjXBq/TcBby4mm2NM87+Apj
         KKhHGyUUdrPG1PkZePnATwad4XBdLlIyd9VWu4r/8uHfewC2cloqAdzy2KWQCnVPCcJq
         aK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705919573; x=1706524373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uw3TP3a1bBj4W3abn3l3ZIvGkQty3GuUfTltt4RipQA=;
        b=gdNJCGa5A36W8Bh7IBJsU9SfZ186Tm3QsbhL3MBG42s63dBqA311ZdQ8tdwgGMbm65
         4q0sbHtMuWfM+dPKvGiTObWkxj5Bl8O/wE5dBiYKC6v6aspftYwTpkUnxh+4rtTrvgdA
         QmuWwjC78SxAe/CxXuE2B1OMwDIOeEDIxUdsQK7pwtZ1SVcMI9CmWrOHCkV1PZiU5kt9
         JGyKmH05I1UjdnCTdZpewh+tti+MOQaNpchc/U/49pja5rSzTYIdOgl5dcVYlqus23QM
         m3B4Ipm7dI6DURSK/ClTA01XnUbj3eEHykOpuKhQGXzmBVAK8NZTcjANkBruT6oywbXL
         ++Sg==
X-Gm-Message-State: AOJu0Ywzl/4SZwak93mPG4IcRcFN6n5GkkxLB6yW8BPsx9GXxHwozjzu
	4DR+PmvxBmGE0Q/THhYqWw4P/S0QxpZg8CDwcGtqxB5PlVnGRFGWI8owzsN407NIL3LjzzNxHdA
	qDRRdb0tpEDjv9kBR7ZGtIYOSDJg=
X-Google-Smtp-Source: AGHT+IE66Mgd6WtOzYIlS99cayf6EAt+ZJSpmgx8LfpykzOMr+kKk+P06uBkNWCiqp5/eXqyiqYyfKQ/dwFGct3YKNY=
X-Received: by 2002:a2e:a543:0:b0:2cd:1efa:d27a with SMTP id
 e3-20020a2ea543000000b002cd1efad27amr1734007ljn.106.1705919572644; Mon, 22
 Jan 2024 02:32:52 -0800 (PST)
MIME-Version: 1.0
References: <20240122085443.637472-2-pavel@zhukoff.net> <20240122085443.637472-4-pavel@zhukoff.net>
 <CANNYZj-YMGJQ_9s=GE=6gFWcqrz=+OJdPZnRrzq54Hp=GO=eYw@mail.gmail.com> <c8a2cb0e-e2d5-4232-bdb1-a854f8fb6705@app.fastmail.com>
In-Reply-To: <c8a2cb0e-e2d5-4232-bdb1-a854f8fb6705@app.fastmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Jan 2024 11:32:41 +0100
Message-ID: <CANNYZj8vy6j-U03dpnqGAOQMRY2UdoqDxvMb-S+ykedXiuosUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] mdadm: Disable ptest
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 10:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194138

None of the recipes in oe-core set PTEST_ENABLED, they only read it to
determine build settings. If recipes in other layers do that, it's a
mistake.

Alex

On Mon, 22 Jan 2024 at 11:28, Pavel Zhukov <pavel@zhukoff.net> wrote:
>
> Yes, Yoann has mentioned this already.
> Seems like recipes use both PTEST_ENABLED and PTESTS_PROBLEMS for this purposes and I've not found any documentation. I'll update the patch to use PTESTS_PROBLEMS instead
>
> --
> Pavel
>
> On Mon, Jan 22, 2024, at 11:21, Alexander Kanavin wrote:
>
> On Mon, 22 Jan 2024 at 09:55, Pavel Zhukov <pavel@zhukoff.net> wrote:
> > mdadm tests are flaky and cause a lot of failures on autobuilder.
> > Disable them for now. Keeping ptest code in the recipe to fix/enable
> > in the future
> >  SRC_URI = "git://git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=https;branch=master \
> > -           file://run-ptest \
> > +# Disable ptests for now as they're flaky
> > +# but keeping ptest code in case we want to enable them in the future
> > +PTEST_ENABLED="0"
> > +SRC_URI:append = "${@bb.utils.contains('PTEST_ENABLED', '1', ' file://run-ptest', '', d)}"
>
> The correct way to do this is to modify
> conf/distro/include/ptest-packagelists.inc. There's a specific
> exclusion list made for that purpose in there at the end.
>
> Alex
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194135): https://lists.openembedded.org/g/openembedded-core/message/194135
> Mute This Topic: https://lists.openembedded.org/mt/103882792/6390638
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [pavel@zhukoff.net]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>
>

