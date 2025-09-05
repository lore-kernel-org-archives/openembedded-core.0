Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A71ACA1016
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 18:33:01 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.1100.1757097179730975934
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 11:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=j8XHm/9G;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.218.44, mailfrom: jester@theyoctojester.info)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b047f28a83dso378888866b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 11:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1757097178; x=1757701978; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KWr0vHyrQqlDeFx2Vt0XbtQxPLLB08twQk5ir185/pQ=;
        b=j8XHm/9GAerlhqdx+qtZwS3lxRSChLY/tj9KITN8JvOB0MwGITPD6SXJltaTDmZx2X
         Fh5HYAmoAF0nAw+dIOyZRnmRHOmfGcyRSJInvDSx20VUjQP30DkhqfHNBlEL4qQbn4u0
         bYCI0xEibAX4jfMaYw7/QjpqF09B0t0G+OZwnkRLJC39AMIEkwaVtZT8C8H0aj9/MxUs
         4CWhttNAjDkbGHY2E/hwWx9Fv0m29J5a/P5Kl6cxLDxE/sZ0Lwu1TroCyhXmvYUQvwMl
         qoKzQ97lYm5odDaKNNmPWEM7uxce9zeKLywls2u6iuYnVlBFBmXHzElGrVINrJ7z9nAV
         TkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757097178; x=1757701978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KWr0vHyrQqlDeFx2Vt0XbtQxPLLB08twQk5ir185/pQ=;
        b=WLS8Ue/LDn4ASGzAdy4TPkywlisrmHIH1BoMkO4vHbyhUaUQE8shZ9M15iBhbFJFtN
         OLcDuCGEI41cHZtWu3eLgp9NHtXHFgmzfuEEu4/VcrycOCO1nEk2PYLFiVWeA/Ak/N/C
         OKJ2qr8kUDa+oojGDODphGnrUcuayPlNXKOC3FS2v82tZpqT/1WjPZTIUcD3mGWe4KLk
         PCtxa+dn802CwTUcTRT46h1N2YDcL7ZtDvn0u4pxR+z4drmAVvk+LA9lsLcf5s7/0JFA
         8q+fR6NRJNQygD1eE2erTYhbtqMKl4FYJhUrI3qLoHRqbQD2EcgThcIRtltnzIxu9t59
         QbSw==
X-Forwarded-Encrypted: i=1; AJvYcCU3FBhx2uHUxUEQAdUQlZCHwGcyO2eQNDIVWvCFqDzCmUfycQLf6Avnf0EpVAaS4HvwwPT38+WSMjGjfU9J4/A/wg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxZ1xbfRs5B0VlNk2aY69AlFG34tnQ1K4+PTEJeyS5kHKf49zKW
	ZnRTR5topbPobxm9ZPvednGawERujVupB2uisRh7CWLgT9SMJBNvEs+8XTcjSvBT0Zhoj3w25g1
	9uf/G9iW1JgNyIiFAGhoLZJPVNLM5003RTqt+R0CN3A==
X-Gm-Gg: ASbGncuNDr2e91DXMk2iSeXnVhbCPv2LibohDM1xoweyJwrT3ARuHWlaH0SdqBQXg3G
	3+bWd7lumej058d6OJV7tAjvpPI4Yk4KQwGMk5+yVYrEbUYI21oLYZ6FdogIYoUU+bE/uTy3Fb9
	gLQKVVTkS5bbOCrEBNbeVE2APluCPoP+4xka4gBhOWQD1UDxqEwvtBWm36lB022wDsEvRm6M3a5
	XvHbwACT8GAW7RhrHR+MmQw31d89jILY5efPFRImPOvDc8B90s6
X-Google-Smtp-Source: AGHT+IHzSwll/ivhVsIIArOEJwxZHRp2sCEPanc8sM4ZAW8th0t47MKLFQM/jZf4d9Op6MZJKtBCce4oDZqbcH0L2xs=
X-Received: by 2002:a17:907:9410:b0:b04:7702:c18f with SMTP id
 a640c23a62f3a-b047702c450mr920377066b.15.1757097177974; Fri, 05 Sep 2025
 11:32:57 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Fri, 5 Sep 2025 20:32:31 +0200
X-Gm-Features: Ac12FXwpTHYhcLDW4J6EKWX5QWE2lqmCSdTMcAvL7EIiHaVpRR8442er3BxQQGs
Message-ID: <CAEt6Nwoo7YJnEmMO2qneyuKstuGbwE__OVUGUptppT0+GL=75A@mail.gmail.com>
Subject: RFQ / job opening: Yocto Project Ecosystem Engineering and Operations Lead
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Cc: Michelle Favalora <mfavalora@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 18:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223036

Hear me, hear me!

<quote>
We are seeking a highly motivated and autonomous Ecosystem Engineering
and Operations Lead to support the ongoing operations of a high-impact
open source project. This is a full-time role focused on maintaining
and evolving the release processes, technical infrastructure, and
interaction with members and community across a complex and widely
adopted open source ecosystem.

The role will work across multiple domains=E2=80=94including release
engineering, automation systems (e.g., autobuilders), CVE and security
management, documentation, and community/member support=E2=80=94to ensure
timely execution, quality, and alignment with Technical Steering
Committee (TSC) direction and Yocto Project governance board (GB)
goals.
</quote>

Curious? Check out
https://jobs.smartrecruiters.com/LinuxFoundation/744000080228346-ecosystem-=
engineering-and-operations-lead-remote-contractor

Josef
Yocto Project Community Manager
on behalf of the YP Leadership working group

