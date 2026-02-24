Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF74F4BB62
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 17:18:55 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25723.1771953528634600270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 09:18:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hu1QZ1G2;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cb5c9ba82bso925130685a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:18:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771953528; cv=none;
        d=google.com; s=arc-20240605;
        b=X0vtYtjb4yPWXzndU2/U1IH2OnHPpxOxHbqXlcU6YlnDuOr1l2a2v79eewYK1RSfvW
         d5p0/CGGlUsngp8EjzW/ubrghWbJnJr2lEw8DkvNZeEQ8ZtuU30tN8gQ2rVERtKbtOCV
         yHkp537sRNkFfO3lLqCqpoZrdI/1Y/F/gj0BDdPtkY7DSLG9PBhL7LrCANYrX4Aa6KSf
         b6x9M634DMSKugJoHm5vVIeYP38ZUJcnoNZ+uJwvNMOsUZqjHf7UtSobImF/oCxHVe8u
         DIVSyXY+KC/o3sU7uMkv7Xwdlv3/c2vyY8USMa66/r8b8S1iL7CKNUgeyRepfNUoCBQ9
         pEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LNjUreLsQgaCbX9421jHibslIfSwkvimaqcGwEBfDU0=;
        fh=0tbHrJ1/SpbGOR8MmM0yCUWcFLMmsQ70EBst3fi7Lv0=;
        b=jD57B5bGy1B0uOSwC8k1iJ0r708bwiYnzdsnNjs7JdD3PeGva4UziWeGRjoKXOCByn
         ZU6DkkxixWznwYupYxBfQ8QMBrSEpDPZrQ20i0D3SS9PbRk3BH0dyPcbD4wks1d8DofU
         PuzfSKjhNa+cUh1O2uxzmvXB8hvmroK4w6oqPjyMqO4eqcC0jOiFeduyxVSBcXnImEpa
         f4VTB1X/hnHs0Bf8fD87l9Krdp6dlZ5a/FUr3pqFfDRn2jbVAzIKv1doavrCGd9MyusZ
         P/ebt9AfsnU6PTlrt7e7ca+rhBd6SPQnyUi1Qpkl4AW0o1NNkDk+kzN9UZptrVBjwqV0
         0NDg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771953528; x=1772558328; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LNjUreLsQgaCbX9421jHibslIfSwkvimaqcGwEBfDU0=;
        b=hu1QZ1G2vWxG1zRwoNq36pi6X4FfwgFGUPLp0IvmUN9F03+v99oXpfqm49IxsHytPu
         v1359r3g9ACTQ62ISeTJn4QxCVGIPV8pYIHxZqAfax3aSi1qCjTUYwzC1c4HBC1s03Pf
         97mAEUT5I7JAj8nFJC36mjrJOg6TysBZ4eik7lZJOGsZLuRXvrFTUYkBWo8j4s/3UTHO
         wrOqj8Pep7n4ESpB/JFnhwzmd3f+t6Hao44KGAuNSdQS9vPxt0Gf12aMG+TGNHuaOFLO
         tuRVYRa/tiYbi5CRnEif98GVhLSdEH7vpQ3btVDM9hqNYts7+FNgLypGv7adMmY3+m+n
         Rodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771953528; x=1772558328;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNjUreLsQgaCbX9421jHibslIfSwkvimaqcGwEBfDU0=;
        b=gcwP4huq5uI6AIAkhRHk429+Gtrv4aw/z+JD4VfzhJrQSPfcYtXvpNnEm6mIOBfWfu
         WAYM1Hn06J9EH6Prb3fpm6rtp15cTq2gIApSpLYEzzNlnVEqGqKkrQGTvXRlvPWuBC9L
         sfhCCnvgTDb8nRYohlHC41EKomFUa0rRcDUjpFV9mYvf2X5GuxsglgmaYc1jCpkJfH8H
         KnIOw7/gIem5P80Uw1Zq8vWk/Mj05mchrBDxeDfm79H5+vKNmNP9hyUWCyiRvVMDtnE8
         gsO7qQ5huOXafeRFStEe3PNS1+9+QUzI/oWhETmRmrZWIk8vgmU9GN2jMhRUqafeaIz7
         XiJg==
X-Gm-Message-State: AOJu0Yw5vv76Fu6Cab+4z7hy+l64Q1WXVint6NjstZ8uc1ey7PI2oBVM
	cuTxA6VoiYMKfiKLt9n+1+fKn4j2WGZyJOt1xQoyTBDbzWmANWlVMs2fqDkSKL4Tn/ousvnunTX
	fCCdfrwrUIsKtHPjOchvxq6UjDVeiJBo=
X-Gm-Gg: AZuq6aI0mPyHb+yI8PD59Jvdf0KMUDPDhbSdHvkUu2SHoels05L//2wCjqOCAF/s7et
	pMDQXEFYvYSFf3+TlaENbZBkM3I6sgeziznqI5+0jri/ioY7rgvayIByPPyPvVk4do3sDrEo1cs
	B1F3iNdxuIN3F1O4TZmdqab5KjmQqrcKiRueQprpG0nOqiKTPkQ7n6Q/dJ4hDgd37QphEeVyRwE
	0wTCamcqlg+xidG9XVmpSq4uEIEPnISNtA5DLq7/VCW5TiDBW3+enSHfR5lxkLi+DOoGMF5HCsR
	qRK87mleYLFxtaWENjMR1PlANv9MSr9XqpRrtErbAh8mtrkmaVaX
X-Received: by 2002:a05:620a:1348:b0:8cb:4c67:349b with SMTP id
 af79cd13be357-8cb8ca0a68amr1272615385a.31.1771953527499; Tue, 24 Feb 2026
 09:18:47 -0800 (PST)
MIME-Version: 1.0
References: <18973B8A1D1BE087.558139@lists.openembedded.org> <AS1PR10MB56978C6748852F61C4F7109BFD74A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56978C6748852F61C4F7109BFD74A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Feb 2026 18:18:35 +0100
X-Gm-Features: AaiRm501fI_k4-Zv9AvXP_-eiVXevw_eih0zLPtvlMkm6vBYnXY9qt1FEsY468U
Message-ID: <CANNYZj_Wo8czbE191kMach590DA7pyhs=UDGq3aRW9zstbEXBA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] vim: upgrade 9.1.2144 -> 9.2.0
To: peter.marko@siemens.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 17:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231895

On Tue, 24 Feb 2026 at 17:45, Peter Marko via lists.openembedded.org
<peter.marko=siemens.com@lists.openembedded.org> wrote:
> Alternatively, we could also continue updating vim in LTS like we did in the past.
> For now, there are two active CVEs in LTS releases.
> Please let me know if I need to backport patches now or if vim upgrade would be accepted.
>
> Any thoughts from the maintainers?

In the past we tried backporting CVE patches to vim for some time.
Then it became clear that approach is unsustainable.

But I have a different thought. Let's drop vim from oe-core and
replace it with nano :)

Benefits:
- sane version policy, not that many (probably none) CVEs
- it's the only editor that doesn't annoy me :)

Nano is already in meta-oe, if you support the idea, can you prepare
the patches to move it here?

Alex

