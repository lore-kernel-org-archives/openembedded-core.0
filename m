Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087BEE7D271
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 09:25:21 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.14854.1695720319349379365
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 02:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U4WUuTKI;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c00e1d4c08so137923631fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 02:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695720317; x=1696325117; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fiA/KGQoODsWTJYBa5AJbpDi53lb/HM8lMpdDTtyYQU=;
        b=U4WUuTKIY23WAOIWbUXEb/nbjWGVaaMhNrCWYX33Da36P509+dDuy23spHPPDE1lg6
         I+mxe62iA5verHOahFkOWxTRoR30ND2y3XzybjVH1wP5ni/Mka/l3p6u4HV7nSPdne1E
         ls5X5bzaJM15q1B7Zjy1HL3pjIyRss5s0/+RAWWL3Oi3tPX30Q1XZaCLKZ8LBs0D9e1S
         EgvXVCUYjzBpsCt4LQ4NAlgzP0R6SZTc/+6D8Ct3O9E/zDj59CH77d1kMYmEHxE9j402
         DTyy80vNPspJCs4VpRrol8CxibtuJJc9aab+C6v/yK+EV6eYyO1bdTThFv7s7nNwZlXC
         zmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695720317; x=1696325117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiA/KGQoODsWTJYBa5AJbpDi53lb/HM8lMpdDTtyYQU=;
        b=rEHqOPzi3gElSfoNJRqTUws/1tm6Xk43z47n7E2UZAeO589xghGAYOvoWlyfYg+DSK
         2dYm7jvm3v7UT2h6kfoPvJWxdFaOh8utDsDlQXI5l+hlcUVqIljpIv1tG66Zger63xQH
         NgqtjOVQUEie5yop6GDzTjmgbHuOqCBdB00NcVHVjcRucaLGWY+/F/0J94tWGS6Defvi
         CejQfA9P6wLr76OBZv6DcIEvaAnMWxkceWbbcQCxnvvMZNlDb+CXAqlHw8PaWWsm6KND
         Y+3a/F5NXT6rnm1LiR0IvZt6aXAvhGfR4UX0sVt5b0BOsMdDu/tGa6sTurBqPN+NKrzS
         VF6g==
X-Gm-Message-State: AOJu0YwJ6FaBbgh/hNtfeJ0aQnGSRvBa/UvS802GbH7keOUxM4A+XB0K
	wpL6mzahRMibJZpdca4qil2NokvbDg+XA1QUhDc=
X-Google-Smtp-Source: AGHT+IHsAaasOMtpjINGupqao2AoLtNd+Ywfcid+PSVwRDxAhNOgXiTe9NABbBNtOkyWa70YXborE+4neGIMQrv5HnA=
X-Received: by 2002:a2e:2d12:0:b0:2bc:d5ad:2758 with SMTP id
 t18-20020a2e2d12000000b002bcd5ad2758mr7082085ljt.5.1695720317230; Tue, 26 Sep
 2023 02:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <1695620387-2946-1-git-send-email-qiutt@fujitsu.com>
In-Reply-To: <1695620387-2946-1-git-send-email-qiutt@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Sep 2023 11:25:05 +0200
Message-ID: <CANNYZj-afJpe-zF_ANYRQO3o+FdR6N1EhWcDh3Zoqv+y=FLkuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V6] tar: add ptest support
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org, 
	Yan Xinkuan <yanxk.fnst@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 09:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188241

On Tue, 26 Sept 2023 at 11:17, qiutt@fujitsu.com <qiutt@fujitsu.com> wrote:
> +Upstream-Status: Submitted [https://git.savannah.gnu.org/cgit/tar.git/commit/?id=39849e9d91f477d3fb839f93cd0815d0cb3273e9]

Thanks, this is nearly fine, only this line should say:

Upstream-Status: Backport
[https://git.savannah.gnu.org/cgit/tar.git/commit/?id=39849e9d91f477d3fb839f93cd0815d0cb3273e9]

'Submitted' means the patch was sent upstream, but is in review and
has not yet been merged into the trunk development branch. It also
needs a link to the upstream submission (e.g. github pull request, or
an email thread in the mailing list archive).

'Backport' is when the patch is already in that branch, and is
expected to be included automatically in the next release.

Alex

