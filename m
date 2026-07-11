Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42663C43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 20:28:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3129.1783801677566301170
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 13:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d3c/va3h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso14368205e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 13:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783801676; x=1784406476; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KQlWJI/PpbMdHD9sgRQajveSvfdaWNV3i3EezIgHkuw=;
        b=d3c/va3h974+SVW5/rOBfktbKb6cMgie4GYDpp30HfzvItpmjJrcoIqtRpn50LGzdt
         xUIWg8SWusJ2a1WveYDWUbF8iLMFDSWkbZpAsVx/kvrSGq+sEKEmjBw0kVbT/p0UNf0O
         7EReBJ9ybLGAbKNJu3kpadPDh1I123BmTAgEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783801676; x=1784406476;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQlWJI/PpbMdHD9sgRQajveSvfdaWNV3i3EezIgHkuw=;
        b=emY8hHJtD8pn6UNwBB1IsA8QWgWs5h1jmsyu68ienln3cyTChGigddQHd/t58++8Go
         n4677+voYZwZMeI+0ahVXrujdRvRFI7Enz5OD2twf+fHXJhG5F3LiOFzbYbFbbwPISUY
         qLiIR6/P3UWyIm4CO1i3dpn+wNAb5RjNurTd/U3IL1gXRIduoxesdKcuRSG+cALlnCrB
         qHbQhuSypW4wrKj8D54MPDqaiJze9Km0l15gQGUbA0BPSNKhxplTO3LH6Ul1wMBMILO+
         KWZk9KpPgNOvBtnK9Djzj/Rxqu9xtas2rwVwdLR6xoNAHRdjvmCIaaj2P5KdtniPfwtz
         BoCg==
X-Forwarded-Encrypted: i=1; AHgh+RrhSbTe08w0c9WU0Fv+OTmvf06j73vHCphQkABU+6yxxc3goKURlK6ZgKodSnzdREoNoS93H8blD4BiRvnzVsDfOw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwwR/PFoOPSxzPh4qgLxV5pAhITcS4HofuDwEqwBneMTlE+3RhL
	/CgXJWLwiU/Y9ic7mvbXfL/KMXC9da1fDIyMXnTPKiB3A+6V7TlDDLkqbkCkjNvZrqE=
X-Gm-Gg: AfdE7cnAauXyPDHDuhs4mSqpq2NwManbawr2D4ROnY69Qo4VkcK5M5Z7uHfn2dMJ8pI
	kyeEZiGxF5iVZarbS87n7aiRJXZ1YKcCPucmm+Ze/ud20I8rj/iZiwCatqoxiggjkN5ZavRtPeS
	Il8TsN5aTu24LyjAN7FQrRGzYr4ds21auc5BaSXx+8KKKxldVajxvwsrCUowawQDPkJ7V2HVjLs
	OKS7eZ1KMA6sPv8FtHeRN+v/dobDobKlLbDQG1SCJw0xO+Pe8C1mZ2fg49RtJiwPIAxnlRg5viY
	tfv2IZ9H/PJSBDoRRcPgB5m8EwP322BgaWU1rfyEXmjo3IDBmCRScm6tQMxeoG6Jbwjk/l0ptTP
	ji9ZsF0uyW7tSGVAvOSJerpFOBitTFwO4Xy+tS5xmNF4nhLw//e/KMG+mrSw4lwBb3uaBou9WWr
	aiSR0Ez0KH4RI4ERdlORcjZ9RBiJFydKonCyida4HMM72WKeEFj07Yh1jwvSQmXbYFXywWsUD2m
	8pvbA==
X-Received: by 2002:a05:600c:8518:b0:493:bb0e:2832 with SMTP id 5b1f17b1804b1-493f8837e4fmr31651755e9.37.1783801675602;
        Sat, 11 Jul 2026 13:27:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2004:2e5c:aef2:b707? ([2001:8b0:aba:5f3c:2004:2e5c:aef2:b707])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f373csm398898525e9.14.2026.07.11.13.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 13:27:54 -0700 (PDT)
Message-ID: <54968e21199487c82f2e6067da717f25ed3de7bf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] memory-control: add recipe and bbclass for
 cgroup v2 memory limiting
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ishaan.Desai@ibm.com, openembedded-core@lists.openembedded.org
Date: Sat, 11 Jul 2026 21:27:54 +0100
In-Reply-To: <20260710170500.3863193-1-Ishaan.Desai@ibm.com>
References: <20260710170500.3863193-1-Ishaan.Desai@ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 20:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240723

On Fri, 2026-07-10 at 12:05 -0500, Ishaan Desai via lists.openembedded.org =
wrote:
> Adds a CLI tool and bbclass for applying per-service memory limits via
> systemd resource control and Linux cgroups v2.
>=20
> The memory-control command inspects MemoryMax and MemoryHigh settings
> for any running systemd service and lists all services with a drop-in
> applied.
>=20
> memory-control.bbclass allows any recipe to set a memory limit at build
> time by inheriting the class and setting MEMORY_LIMIT. Two OOM policies
> are available via MEMORY_OOM_POLICY: "reboot" (default) reboots on OOM,
> and "kill" terminates only the offending process.
>=20
> AI-Generated: Uses IBM Bob
>=20
> Signed-off-by: Ishaan Desai <Ishaan.Desai@ibm.com>
> ---
> =C2=A0meta/classes-recipe/memory-control.bbclass=C2=A0=C2=A0=C2=A0 |=C2=
=A0 95 +++++++++
> =C2=A0.../memory-control/cgroups-v2.cfg=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 ++
> =C2=A0.../memory-control/memory-control.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 196 ++++++++++++++++++
> =C2=A0.../memory-control/memory-control@.service=C2=A0=C2=A0=C2=A0 |=C2=
=A0 13 ++
> =C2=A0.../memory-control/memory-control_1.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 53 +++++
> =C2=A05 files changed, 376 insertions(+)
> =C2=A0create mode 100644 meta/classes-recipe/memory-control.bbclass
> =C2=A0create mode 100644 meta/recipes-support/memory-control/memory-contr=
ol/cgroups-v2.cfg
> =C2=A0create mode 100755 meta/recipes-support/memory-control/memory-contr=
ol/memory-control.sh
> =C2=A0create mode 100644 meta/recipes-support/memory-control/memory-contr=
ol/memory-control@.service
> =C2=A0create mode 100644 meta/recipes-support/memory-control/memory-contr=
ol_1.0.bb

Why a top level bbclass and not just part of the recipe or an .inc
file?

What is the justification for this code in OE-Core? Who is going to use
it and who is going to maintain it?

Cheers,

Richard

