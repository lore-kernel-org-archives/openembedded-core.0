Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9B3CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 10:29:53 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.9853.1757413782828623664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 03:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KFBvzL1s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45cb659e858so37390295e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 03:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1757413781; x=1758018581; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Nxx9kmgLsda8K0kkZhanCml23C5zeYXPaoRdx1ujxJM=;
        b=KFBvzL1s8V+muZBtTv2gmMAJH04j9IoMb+IHtduQCxar6UjMv9i+iO1AK6qyMKIWC0
         jdr6LCWAF0EtmAmUQTc/1nlDRyFWyBbLB7IB/r6bUwvyPVJhjE1yxYf90YadGqCj4D0Q
         pWVWnwgRq++e3c4TsQ78Q8HbV4T2K/IPQbFwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757413781; x=1758018581;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nxx9kmgLsda8K0kkZhanCml23C5zeYXPaoRdx1ujxJM=;
        b=C6uWYHnaSZU0IIKz3JpoqznOvW0RCAAM8Ns8KbjwiPH+YeGq/ELQGHohM8lsEVuhUU
         8xCoI5f3jF22cDf4d9+fSVPI8CR+Cfn2vsSf+gaIyp3y4n/sq4ySZEzRhtvqIumGDEAX
         aK0O+kdJpUbnz3f7dnROyyd2qJdNSxxnEzmNDcdjT2e9qZ5268wWE1+aV4DiUy8Rvngk
         gCyDV6VZqhYotmbB4wmp1Ql4Yh81sSu89Lv8PyLH/8RrqnhW/AZ5pFaOapT2ESHkjqGk
         g9kVyhy+ADs1upjKQnL10wCXX93mXOP+tfO1VZHohabg5sYHJODXvy09mQUJcDYt9uN/
         6Gjg==
X-Gm-Message-State: AOJu0YzgAM4zW7fUF5li8esKEyO1yWsyAq3pAIZrZhJ7VyD8fcut53te
	I5zW4wbxcWNRJQh8ANM08OYGhavmak/0NKiEbv/kF3IgWME8LNjFjrnXLyoqC5lJjwI=
X-Gm-Gg: ASbGnctnn3UMXbp+itLeFTi+NXcuCiHbOh8c5bhRO3cqC+8kRFZANDfuXHLQwuOGI3C
	9GAJMJwCSiu8ejdm+ZJQF8/k/sabXhvRNMxivGdM5dCgW6INA9q5A6OMDQkJC4Nid4YNE0/bj9e
	0PCvYJHRmy5t400ijUuyDu+UPgU/yVhOfMNjolSTvJiyXF1CsB4nv4ppFWDo3O/0ddnggM9s8uJ
	93bBx3bP9eOK8U2hWsVY1/2ZOGRTVjxHQHAvruptjdBZoXIT+wgs1BBzfslC5MCIxGKTuIC3/Nw
	RhYV0xRzVcbAt0+a7s+aBk4LM7XrUfSqYXyhZy9jwv4pOtgdrBNOEKXpYgtfDlbOA43ofzKWa4N
	Lx1pf64kpgsTpO2VG6j8DM6rrVWFMuzxs8615Yk7wibX+qQ9AIGc8/tYJXl9zunUvp3U+RtqV40
	RhFFtkcnGBstc=
X-Google-Smtp-Source: AGHT+IHf4XnggQgCuGbVt5pIfN05VzKFGI90/x9MnenUmKujIG26MPkza2CqQYcyJfjp1y7+X9qEjQ==
X-Received: by 2002:a05:600c:3b21:b0:45d:cff6:733f with SMTP id 5b1f17b1804b1-45dddeb8ee7mr101220395e9.11.1757413781135;
        Tue, 09 Sep 2025 03:29:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:39cd:2850:3a8e:1da9? ([2001:8b0:aba:5f3c:39cd:2850:3a8e:1da9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dda4f2a0dsm178822175e9.2.2025.09.09.03.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:29:40 -0700 (PDT)
Message-ID: <524c91d2f842b4188635b95d6d7803ad47e1288f.camel@linuxfoundation.org>
Subject: Re: [OE-core] Drop rust-llvm and use clang instead
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, Alexander Kanavin
	 <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "Kokkonda, Sundeep"
	 <sundeep.kokkonda@windriver.com>, "Dora, Sunil Kumar"
	 <sunilkumar.dora@windriver.com>
Date: Tue, 09 Sep 2025 11:29:39 +0100
In-Reply-To: <454f5ba1-09a2-456c-8df8-0a0fe441f6cf@windriver.com>
References: <29f1bfef-97ac-44bb-b2de-63661a38e814@windriver.com>
	 <CANNYZj99rO9YpEUe1_sGBFXiaOA0dgoRMRK_AwgPKkaQWCnhfA@mail.gmail.com>
	 <454f5ba1-09a2-456c-8df8-0a0fe441f6cf@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 10:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223099

On Tue, 2025-09-09 at 13:49 +0530, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
>=20
> =C2=A0Hi All,
> =C2=A0=C2=A0
> Summary of discussion with the rust upstream about using latest LLVM
> instead of Rust maintained LLVM fork.
> =C2=A0
> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-
> llvm-fork-what-rust-uses/23489
> =C2=A0
> =C2=A0Upstream LLVM is generally compatible:
> =C2=A0- Rust does support building with upstream (vanilla) LLVM,
> especially the latest major release and the one or two preceding
> ones.
> =C2=A0
> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updat
> ing-llvm
> =C2=A0
> =C2=A0Things to note when using Upstream LLVM:
> =C2=A0- Rust may include cherry-picked bugfixes in its LLVM fork and so
> using upstream LLVM might lacking bug fixes from rust's forked llvm.
> (But,=C2=A0
> =C2=A0this anyway we will catch it up with newly released rust update)
> =C2=A0- If a bug shows up using vanilla LLVM, it's on us to track it down
> unless it's a known issue. (In general, the latest llvm is always
> under test with=C2=A0
> =C2=A0rust nightly builds)
> =C2=A0
> =C2=A0Impact on Yocto Rust upgrades:
> =C2=A0- Rust upgrades shall always check for updates on rust forked llvm
> and backport the relevant patches to clang's llvm.
> =C2=A0
> =C2=A0Regarding the rust forked llvm local patches:
> =C2=A0- There are no local patches on rust forked llvm other than the
> backported fixes from llvm master.
> =C2=A0
> =C2=A0Do let us know how can we proceed on this.
>=20

Given that information, I think there is a compelling case for us to
use standard llvm. Thanks for looking into it!

Cheers,

Richard

