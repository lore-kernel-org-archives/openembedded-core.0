Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61AAC25B10
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 10:45:47 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.17641.1714387546528968965
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 03:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KQI++kF/;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51dc5c0ffdbso752026e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 03:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714387544; x=1714992344; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O5WRsFS+J/gkSbIGhy1Djc/cXYkofiDiZJ+HOhp8OF8=;
        b=KQI++kF//vCgq0ni0Ixl2I5nI6THc2gwJiWC7eny14epw4zPCtZOrUEAB2k+1rohLw
         9E+Tei7JS4/r8cgBfafduQzSJUxUCCau16X5HJuwTtVgO/qZidpqeKLhgfgC6TMKX/jl
         Je0E2dDPUdHBOSsXh7vx572gJxPps4ODBvVArBXA3t21ST0VgR/4s444ukWVfLzH+DfM
         AdshQP4HbTmIG4lUdhzm+UkWxbey2wsSxIMbxMFFy8Q9s4+N9C7wqT5POaVDAp3+212X
         ZmRSNWJuAws8KjtpyJz2Od97RJIofxPM4/RwMdP+U0XVFV6VcNVLO90l0BWdThIgEll8
         pAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714387544; x=1714992344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5WRsFS+J/gkSbIGhy1Djc/cXYkofiDiZJ+HOhp8OF8=;
        b=c5dP+hUQC9PH1av0DwppOhCH7lQcU7Ea/ebr7ItETTA5YCztgFwZqadCABNjmRCGtL
         LPD24aU36WTX8ayzDPC/xKTWe9d204wDxcC/7gQkhQdCeUtyFxYwrzflWQ2N/35nRRCw
         9dYUXO/gkbBnjb8UxBTypmoFsPd7LLr33RhuTGkGIRzmHtwxv+EWCTUSUCd7ZE6qteBJ
         ffyOlyUNYQnWC1we+g5yjGcOHAkfoapsAm2L8JfoOgVD7XFKFsSemjTOAfRJEjPmCvbw
         UDEAsyV9gupCJHX0IRMJnsB76gCOgMpObdB7hLUIkeH3iI1ZZDoXPaYo62WjiUmLM/PW
         kjrg==
X-Gm-Message-State: AOJu0YxnXfAnLBui5VO8i6kIOD6gfh7ZY3UUvjk5Q//8bC9/sgoqnBIu
	nwc5ROOpLvWvo+lNrQsJLTbb0er+0tHHExlMJuR+cTJMBTca/KFC4Qa3r0OPsEvteJ3+bIE6+Jt
	Rk0zPM5C6fU2T0msVbTKePQ4RPpo=
X-Google-Smtp-Source: AGHT+IF//QmkhdsfbIWzaWMMO8WP5pk/E9EO1M/I/YxmsNZl3UlRRNu6+rEe+lhj2bxYFwoFWBTYNgfBH3QiuVV8CnY=
X-Received: by 2002:ac2:46c3:0:b0:51a:f0ca:adfa with SMTP id
 p3-20020ac246c3000000b0051af0caadfamr6226216lfo.21.1714387544268; Mon, 29 Apr
 2024 03:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240425055231.668897-1-leimaohui@fujitsu.com>
 <CANNYZj8U5X==Up3C8QoQf_RzEV1-9Ewo8w0Q00HJ3B-uUYBc5w@mail.gmail.com>
 <TY3PR01MB11056396A609AFF1770D3F05EA0162@TY3PR01MB11056.jpnprd01.prod.outlook.com>
 <CANNYZj-RMjrhBZxxmTNrCE+L38YmX1_bvtZnwnBkQLst1XBjkA@mail.gmail.com> <TY3PR01MB11056BE6139DB78A63C9871B2A0142@TY3PR01MB11056.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11056BE6139DB78A63C9871B2A0142@TY3PR01MB11056.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Apr 2024 12:45:32 +0200
Message-ID: <CANNYZj9qz5cfwKjubtb4vobdZhVi1sFnTtfFAqGjA_VsFj+FrQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] libbsd: Fix conflict error when enable multilib.
To: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 10:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198735

On Sun, 28 Apr 2024 at 05:17, Maohui Lei (Fujitsu)
<leimaohui@fujitsu.com> wrote:
> I' sorry. But my first V1 version patch without sed (just oe_multilib parts) did not pass Khem Raj's compile test (bitbake mg https://errors.yoctoproject.org/Errors/Details/759473/). I'm not sure if it is the problem you want to know.
> So, I reproduce the build error and found that the cdefs.h that created by multilib_header has the path "#include <bsd/sys/cdefs-32.h>".
> But mg find herder files without namespaced with bsd/. So, it failed. Shadow has the same build issue.
> So, I submitted V2 patch with sed.

Right, this is the error:

| In file included from
/srv/storage/alex/yocto/build-multilib/tmp/work/x86_64-pokymllib64-linux/lib64-mg/20230501/lib64-recipe-sysroot/usr/include/bsd/sys/cdefs.h:27,
|                  from
/srv/storage/alex/yocto/build-multilib/tmp/work/x86_64-pokymllib64-linux/lib64-mg/20230501/lib64-recipe-sysroot/usr/include/bsd/sys/queue.h:39,
|                  from region.c:12:
| /srv/storage/alex/yocto/build-multilib/tmp/work/x86_64-pokymllib64-linux/lib64-mg/20230501/lib64-recipe-sysroot/usr/include/bsd/sys/cdefs-64.h:49:24:
error: no include path in which to search for sys/cdefs.h
|    49 | #if __has_include_next(<sys/cdefs.h>)
|       |                        ^~~~~~~~~~~~~

I'm utterly confused by that. Why can't the compiler find
usr/include/sys/cdefs.h?
Why is it then happily finding it when bsd/ prefix is dropped from
cdefs-64 include statement in usr/include/bsd/sys/cdefs.h ?

But the fix does seem to help, and makes multilib selection header
match libbsd headers (in overlay mode).

So:
- the patch is ok; but please add a note (a comment in the recipe just
above sed) that it hasn't been tested when libbsd is used in
'namespaced headers' mode according to
https://man.archlinux.org/man/libbsd.7

Alex

