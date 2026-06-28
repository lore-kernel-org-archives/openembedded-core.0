Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA77DC43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 11:07:06 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16465.1782644821123698063
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2026 04:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jn2efsoq;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6626b5ace23so1759625d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 04:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782644820; cv=none;
        d=google.com; s=arc-20260327;
        b=Nrp/T1VFFCv5M1zbjA2JVd8Y89j/ZYFoCCEv3E9Fy+MtOnhdJ01wMB6UU8fSXNlGy/
         nHXbfPq4eXGY3WL+Fe+yS9ODGhg8SZlHl3vTc/BrGA0eh6zueJqU3bMNa8qrzjly8FU7
         jD7H+wsHg1eD5MAha2bf9CZAHdP3D7JAoQjvKb++0QStyH2FvpGYomUaRyjohhixI8hA
         XF5OiQaCJKFpFe18fAvcVKsb3Bdrsw2T1pAYYMFjnJwr57/7776gRwndsIFVqoFATecQ
         gSW4xRtXj+sXNCT9cn6orhn8Ngb7DUR3/c3bRPVM4DrOBZrFcCqnRziUoCgpwbkvVydp
         krsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=wS8HOTVU8hduH/QWR7M+Gr5kPTakk0/HeeC29Ge6SBA=;
        fh=S7/sK8EQ1mFd1pq+JI6LVEdFR++R0x4bWvYdNlc53wc=;
        b=gR1BreDBjk6zIcj60w2qA2AJaniJZozomZCjQwU+jGsc0PHemX8ROGKEgm67wv3nQ1
         FbM1z2NucHnROU2MpI6NAzOGqYTPlhQ3idpboFd3NZGZ12c9SLgqAOWhfA1IsXV6Td0R
         ceYaIfqBaMXqm+DrQm50GwgaFQ+u49BXMWHHRqb0hA7ZP1JTzTO35UXkaDe+r34lPLMH
         cNu307mLbe4zL6uQmJZq/SpWo9gNpYeMWgpvYQCZzuj/uythS4J0Dd6zXOmdlnbsBOjT
         49FGGpke/JOEjySySe2GkZZrNaOX9C0ViDjYeXuk7uWpmuNM1DX9mwKABfQ/89LxfxKQ
         R0Ww==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782644820; x=1783249620; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wS8HOTVU8hduH/QWR7M+Gr5kPTakk0/HeeC29Ge6SBA=;
        b=Jn2efsoqwzZLkJZuTC/xD/T864Ca+WO2B7vLcn6/EBX28F9yLSSL/nygOlBdR3wk1c
         YneGQHCziIxjxZbrB/gYheukm0Hr5c0D4R9Itjh3rS5qbRfwZeqSpz9hjBqRTtywrnpd
         n/BE2ZlkXcGh3HE5FouoOR2l/y/GhOKxd8hRHwrtajiuYG9V2rv+c550LTO2VUpYVAe6
         vc7pNZs2JnE6DrGtmNvtNuw8DtgFeLGkJv7OV7on8vtc7+L48Xmg1V1ipKstefF3n/VP
         VWr2LHRm2wnpOWSMYJhcpbX+Ct8Fvv27UZ4BdIXXpnxiRTA0wnmVHeyZF52XNRig9IVv
         APOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782644820; x=1783249620;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wS8HOTVU8hduH/QWR7M+Gr5kPTakk0/HeeC29Ge6SBA=;
        b=q4LtaVXcjFGZs9mqOlJzCTOc7VCb3YBK4UDitORSWuaQkHWwJGHBLhLNqdtpE/MxAP
         UNUJzMe21YOWKE9EV4thDu9o6OjKsSSSZf7avyWhahDYzXWYaoem6N91oIvU/UkKboXc
         3KbElm6O4XuvIP5AaGwmHKVVUA6ZgthH5Bl2n3x2XVlLjTjcSZgDzlropWJsIoYjT9eh
         EKapaIHOlgOnv/jrgMD/N6nf3stlBE6YUbqCYjkU9lwA4dZlBqmRBrR8fL/EVxf5PR1c
         pvfAtP3WZG0Lesxyh1emfhlFdK3M3BWI3jOEwCCXvTm+nKCO30VtvJ1eIZABzRvQiVDs
         DczQ==
X-Gm-Message-State: AOJu0YxkG0tdY5q3/3ds/Mktq2m5im2/VOOwah+X0Uoz83nplmzErxul
	TnanhaZqFgqJG9rLalpZsGWtq08nKwDj0c2S0vKlYVvZnA5tyhZr5/ZRSjSjSifZYih//2P7rSM
	WvUemW5DjYMZrWj3SeRjCC4gkWocmvsp12ZmfAMQ=
X-Gm-Gg: AfdE7cn2dhYa5vsWSM/ph3cqG+3wZWrWtuJ5jwQxt1sjN7QG2I15Ci1MBqlmbMcY6qt
	KvpJwehPVl9hNdEaTIUIaIJkkc2QQQU9sHLUEaxukGVOluLl2m1RnwfieLUkRX9N3iYOQl/kGdg
	JYNpSEL0knAVJ8NifIZGVlvfUaStg1g3YXIcu51UWy0bhmj1QMZ528UtNMxnXJW/eXs0TZL/pUL
	ssfTJxhcvuhBh0z1lgLqvyR3+KA7Qh7EGkPgyvxnMnitiggupYyqLRMT+FrRTig6xh5qT1E4r6Q
	Ofso1SHBDYflaKORl++Ev4LUjAwaLFaQup1mETth62sHt4GY8BhfNgSa7gNMIw==
X-Received: by 2002:a05:690e:d06:b0:664:c9aa:16dd with SMTP id
 956f58d0204a3-664c9aa8116mr1862572d50.19.1782644820168; Sun, 28 Jun 2026
 04:07:00 -0700 (PDT)
MIME-Version: 1.0
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sun, 28 Jun 2026 13:06:49 +0200
X-Gm-Features: AVVi8CcFmyRoW6Vzuc_fbLRPz_ajwtRVT2hCS_MLbNHnhtTVb6lQW5gI5e-EK_M
Message-ID: <CABF_=yhLuHYF6MAW03=CbgUMFdBXaNBpQ=OEVe8d-bCimYv9eA@mail.gmail.com>
Subject: -native: which tests should be done
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 11:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239710

Question:
I need the python3-unidiff in the -native format.
And the -native is missing at the moment.

Which tests should I do before submitting the patch to add BBCLASSEXTEND?
Is loading the python package in qemu enough?
Or is there a kind of ptest for -native?

br
--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

