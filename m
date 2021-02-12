Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web08.2625.1613130507358441864
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 03:48:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=oEb8M8kA;
 spf=pass (domain: burtonini.com, ip: 209.85.208.174, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f174.google.com with SMTP id g21so4640417ljl.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 03:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IfLVroJgh4+sHD2Fz+E8CQ+Z53QA1S7X8U+i6QZ+D9E=;
        b=oEb8M8kAJeNxdcpRSuyaF4Pkuo3jCXv8SIXqjEUJPKyo+DT9pAJntksNaf2TFXAy1x
         4uKAqzcDEAO4tCOo7U359uhdIbLRpLUpf0cd3ZeYsntlSIhEAQiEYtpv419TJc1cArKM
         ycn5i2fMQ78XwlsyWL7ve6d5Nh3F2MvBQopL7lvm9z2bM5FsulJgOKsBZ0i+KDeoW5jd
         XxLmPmcgQw4Be0sMLYh+yJq9yJb6cphhDtTIoulsHWx0srUEqXYG8ahbOexX1OdHbH+0
         v5wWeodZytQK+G2cCeirP5KCPSC8TCDxdcbwKMU0/FNgl2uWq3/RQOrCP6scOXD6c6RF
         GJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IfLVroJgh4+sHD2Fz+E8CQ+Z53QA1S7X8U+i6QZ+D9E=;
        b=RleitPoPI2uanNLN4lPJFI6DIDYsawsWtj0e7s8dM3W1CFPpj7TK/fZHX6BDO4e8/M
         O3sEAiT88h0ScSJ5XDVfkcTkYjdbAfKOdTDzzFc5Czc2Ke3QXgh/ctue8+yR8d0xjZur
         cnGPFJENe+OGSXOJBWpUYGiwG5W5N1c5d1AtYBog4QffXzaCKsGW1ffZMMWvTmzQjKJO
         kc1M14H7YAiYtEa4044J8LLaI/Hg09oDYcb4cPAiSwVbO4LvV7i+SxUjbvBUWROvVsab
         IjtUf6UM+Dauu7rZzS4xXOG8B/zExQ8kzuqPslg6Ug5rvp/prUfd03v6n7GShUeW2EKe
         +xzg==
X-Gm-Message-State: AOAM532Tj1UywFn4gGvx4Xb2suBk473KrFdroKgbCQ8WqeWCAonvgVBR
	qXSS1lYGUF2BxbtNhUcmdgAII9RhyMjJuGVPJg6wBw==
X-Google-Smtp-Source: ABdhPJx5Z5u6Ao9cwSo/Ooi/vXubDKhIWMug48VxkEr8NGK9aQgudYNREdPt9kmowYKXuZzuuB/abICsPhEA0Fne3oQ=
X-Received: by 2002:a2e:3507:: with SMTP id z7mr578632ljz.412.1613130505492;
 Fri, 12 Feb 2021 03:48:25 -0800 (PST)
MIME-Version: 1.0
References: <20210212045335.16612-1-champagne.guillaume.c@gmail.com>
In-Reply-To: <20210212045335.16612-1-champagne.guillaume.c@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 12 Feb 2021 11:48:14 +0000
Message-ID: <CAAnfSTvUJvqH0ZNde7VpqTFdLrMC022+T1HPKigUYKDhDZc=WQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/2] replace qemuboot.conf by qemuboot.json
To: Guillaume Champagne <champagne.guillaume.c@gmail.com>, liezhi.yang@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Feb 2021 at 04:54, Guillaume Champagne
<champagne.guillaume.c@gmail.com> wrote:
> This fixes bug #12503. Sending this as an RFC since I'm not sure what to
> do with autobuilder-worker-prereq-tests. It fetches a qemuboot.conf from
> yoctoproject.org, but this cannot be changed yet to qemuboot.json since
> it doesn't exist on there.

I understand that you're simply fixing a newcomer bug but I just don't
see the rationale behind the bug in the first place.  Copying in
Robert for his opinion.

I'm unaware of any real world limitations of INI files that are a
problem for runqemu.  We either break compatibility with existing
builds, or have two separate parsing codepaths in runqemu which
complicates things more (as the ini path won't get tested).

Ross
