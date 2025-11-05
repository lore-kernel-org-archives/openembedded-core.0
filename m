Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7844DCCFA13
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 10:15:45 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6192.1762337735432590213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 02:15:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fjg79+rL;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-880570bdef8so32154036d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 02:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762337734; x=1762942534; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=paN7lULPJ5j6Tji7eS2IFDScOUE4/Y3Mh71jUqmX4HM=;
        b=Fjg79+rLkLD5wm53HQr0xqabnIU4d760zl3aS+WSungZ2yk7/Odx0oJBSrP6+0eKGP
         zlWFCo0SzozD+oa9NSmzyXSC6bgnWg+m+XNRXL9HEgR+Yrc7YbUsm4NEJs21KgWFrHZm
         ykEEWwR350WeEt60BReQPqaccDjjXWgZZQlviOW9ysdDvkvKpee72CIfbJEDL0+mPjkQ
         OL1K8oatkn2HkxdITRvD6tlhnWPuWViJLv5TfWPE0z1c55Uhvx0Ty6ZzrdxDQ2ZCJqfu
         fUmJm0CfXuiupoQ3uwllCjI5bB+q1vorioNWTEIPaHfXPLEecd3C1NH6m3KHHfKIYxR0
         4v5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762337734; x=1762942534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paN7lULPJ5j6Tji7eS2IFDScOUE4/Y3Mh71jUqmX4HM=;
        b=ktc3cRZcuTleU33yFSDpruJNtNn0oa+aOEUxaaBWQI++QD9nlxykYI7YayoEIWZLdb
         eNdVutbYkpBwhYLP7cb8tC0J0eyNezS0xRhgoIHmq2GNfS65vKoyatRqEddMQ/qZ6luh
         WW4stBRayFgItzdb5LvNha8T2GBt8YW8mwgZwVW8AP+MLJGF/gMdOfJALMKtekPMr2E0
         P5YHQYbESzllC8ltztPiTrMV3qIdPpys0scHTykosUgq8nUnXyKov6F1NvjhP5F2OBWX
         jfDQUqVOOv1d5H4N0seWcBNJKgCJOU6f3VZKp0pda/jw/5UmdL9mv7bf0QRB/1mqlVEJ
         1CIA==
X-Gm-Message-State: AOJu0Yxxdo8tBuqM1qFlF+5Shd8/spd89Jit4SbPV4ILreXjsFywzNdg
	BplRkg4GPoKZ+/WkrY4f7R8NdGA9JHBtYWyrpJS0c2IOzTlAlfs0aj3PmPiIBf1ZNdaBIVRKq4n
	mZ+YvcX4mRfsd3oiIh4GSc3BJj+Y3PdvLO9A3
X-Gm-Gg: ASbGncsu4Qay0MSqs52nlPVi8MKYv9fwnCot7NRArxNrkfu0nB42orOTUq17tMo5nf+
	+DLA+1XPp0K1wOVehHfSQYg9DR3EuZ9tOb1T7NB0zRu1YHnOKUJB0HSJmaAo6Tb2K6psWIZZbnf
	h0Q3FHzNXP/H+4nFrhNSK5z7nGukGy+iQd5dhPT69H6zVMxDTRaVe+1oPjQ8NBkzgmv6MmGtXA6
	swfGrxG+9ViioIjPIOQ+HIc6KbcARbQBgNJWCYp6t5zJf99198E0iydpA==
X-Google-Smtp-Source: AGHT+IG/cYxtdszScvJRQYcCYkrj5vYHumxDG9qyNlghV738ViYlotFZLxEVKP+dJBjXATulKEtY9fD3baqyDFmMVYA=
X-Received: by 2002:a05:6214:21a8:b0:880:486d:18dc with SMTP id
 6a1803df08f44-8807118c05dmr32120286d6.58.1762337734304; Wed, 05 Nov 2025
 02:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20251104033329.466996-1-Qi.Chen@windriver.com>
 <CANNYZj-1v+RJvkMaij=LQJH=Edbp2ci80_+qOuGfDSkbCNY3xw@mail.gmail.com> <a42b8494-ded5-43df-87af-a48700d27cc8@windriver.com>
In-Reply-To: <a42b8494-ded5-43df-87af-a48700d27cc8@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Nov 2025 11:15:22 +0100
X-Gm-Features: AWmQ_bmskXlhQmj9ZyJivKtD6-Q_8OLv_1J1ggD_ZPMaWNvl6PoaaanPkB4dzK8
Message-ID: <CANNYZj9V8NB_3nMUgSx2OsMHdUKRryZ4PiUcTL6=8BW=+Deh6Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] oeqa/sdk/cases/autotools.py: fix host_sys value
 to handle multilib case
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 10:15:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225749

On Wed, 5 Nov 2025 at 03:40, ChenQi <Qi.Chen@windriver.com> wrote:
> When getting host_sys from td["HOST_SYS"], the value is always
> x86_64-poky-linux. This value is correct for
> environment-setup-x86-64-v3-poky-linux. But for
> environment-setup-x86-pokymllib32-linux, it's not correct. The correct
> value is i686-pokymllib32-linux.

Right, what I was trying to find out is if there's some place where
that value can be obtained directly. As far as I see, CONFIGURE_FLAGS
is set in meta/classes-recipe/toolchain-scripts.bbclass, and there's
no separate variable holding the correct value. So the patch seems ok.

Alex

