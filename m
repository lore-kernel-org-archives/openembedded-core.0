Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EB2C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 16:43:45 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.146.1752770619021043550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 09:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QAWx2bzW;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e8d157c946eso924119276.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752770618; x=1753375418; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWZjF9h0Z919/8AyLpFPZI0NWlixKhGxCEw+TddAIhU=;
        b=QAWx2bzWRufbFjKz+D4KpcIfSq58Igq8jZNnEQFVOXrjfJZVS9rzC27DLViXZ6nX4A
         eGGtMVuzhdZIPfnkfdFzS7U00rP1Po+c49w47G+mC2mid8Hy+I/Pn6RZCZ/k8ZuGaSpL
         7qzJuecLBrOUT+AbD/DYKHyjZni7Ir1mbddRDjaYSKGNtjFwxNKPezLP/7ix+o3fGox4
         fBMAWa24gZlEleR7jZOOsC9WJ+JRi9i5p2Oz6H8L8lcqnztMPMybCYTGECM/9Bpm4Wf+
         iVjxsbkxye+XBEa7CbZE9Dbty3qRcgblUPHIOzpzGFbdfSdQPorToaLSVCQeETUs8yvm
         prIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770618; x=1753375418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWZjF9h0Z919/8AyLpFPZI0NWlixKhGxCEw+TddAIhU=;
        b=h8Z1GEFOCcZm3QL/ns6sTIJOIaCyDvgKC6eVt5Zef5wPzypH5n109LKRZbDwrvy7lx
         N+vah4nNjwNlF99f2CfC0Qgp2uVdm99B7DUt59m1bWfFnonvc6VTv6m+IwUsk17xl7tV
         TI6U3vZXtDTDtMfnU8KVDh3HCPyDh5mD9VjrNRLLcDag5Hzf4Rjd7XEaYU6YNlx9P0wf
         aGZKFHOBMUJIJTbEHM1Xf2/I8G9D07SdL64UQ259kGBZqHNCAN99idztQYAK6PLLy+PZ
         PSSCR1eLXeRCm/U1DW4sulv1z0Fm3JG6tq/cT1QQt2jtHI4uO5KorA7cvED3lmx98hA+
         9XxA==
X-Gm-Message-State: AOJu0YwyBwXYo2iHKJtfLP4llxmHJQl7Ivj/6BfQljjjJL2jKCxzPkwy
	/vQUqDrfHByVf1t3K+ERt0uCSRXA9PIS6ijLxtKVbWCXCEL83r3KK66BoWjqBZorn/pN+YyqS9U
	F8lJ8JGCVHXSwa2WZFVvzT+t2V05oAtw=
X-Gm-Gg: ASbGnct9N83SRQM5+7/rDlIAN0tJU6AmyNrJhPA1rOdSn+kg7ijkp3LXJBj/2wIOS8W
	05FODCc4PIeRAW+7vVtQMGU/HfiQ0y84Z477UuuD8oEXFEUOJj61X7L9ei09ifYYTR9ApTUyaob
	idKLfxUNLBPCHVo+aBH7GwARqbzRpjRNph4wsCjLMS4HS11jOSik5wGMsCylSsuJT7/ntvzo3AY
	lKF4g==
X-Google-Smtp-Source: AGHT+IEoA3cfzUZQ30SZJS7/trEEmf3xZ3MutJTf/w8o9u8Md6zZzBKY3IZihfGUw6OylQ6miNDl5f1mjMb9c10Wf10=
X-Received: by 2002:a05:690c:6f82:b0:718:38bd:bee4 with SMTP id
 00721157ae682-71838bdcffdmr91346207b3.40.1752770617943; Thu, 17 Jul 2025
 09:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250716123047.1322878-1-ross.burton@arm.com> <CAMKF1srjH=+jMcY4BqMToXWF_Q0DfPcnWynuqVBPK5h5H8azJg@mail.gmail.com>
 <FF19A1C4-1D84-46F9-917E-90F7C2078E87@arm.com>
In-Reply-To: <FF19A1C4-1D84-46F9-917E-90F7C2078E87@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Jul 2025 09:43:11 -0700
X-Gm-Features: Ac12FXxG37Fs9R_V4W4w41NzWxGesqUDtD8Ndt2chuKXymZzUATd16O4Fkioyrc
Message-ID: <CAMKF1sq0y+JU3eNpdDUQ97SLwwHs8dB6D9m0cY9XsgQ-i6uWng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang: remove obsolete 'terminfo' PACKAGECONFIG
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 16:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220552

On Thu, Jul 17, 2025 at 5:13=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 17 Jul 2025, at 02:32, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Jul 16, 2025 at 5:30=E2=80=AFAM Ross Burton via lists.openembed=
ded.org
> > <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >>
> >> Neither LLVM_ENABLE_TERMINFO or COMPILER_RT_TERMINFO_LIB are used in t=
he
> >> current CMakeLists.
> >
> > It has transformed overtime, so removal is perhaps fine. although this
> > has transformed into lldb cmake detecting it for the build
> > so it might be doing the job due to ncurses being in deps which now it
> > gone. TUI with lldb might be disabled
>
> I don=E2=80=99t believe this is an issue, as you say lldb depends on libe=
dit which depends on ncurses, so the dependency is still there.
>

OK, that is good then

> Ross

