Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89292CD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 10:24:17 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72048.1778581452050737226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 03:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bDIF/r1Z;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8b74b460d77so53120606d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 03:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778581451; cv=none;
        d=google.com; s=arc-20240605;
        b=UWDY522iTAbYKLqoVOrgclkrLiMy6OBZ2QDN0y8hMOIIMTa+m/5cMdqWWDWyz8zzjN
         NHve8l/x4/f+Hd7GSmDX805qqLYCK+xzytvoaioJl1fP+1kEeVV0SQ09kR5zOah9A2L3
         qGI7OqrrQosVsBPQWQj5SUKAwoBIsxECq8o/sGHptr0mPxdDr5YrVEcrwkt+pNDn00b2
         0zZDTa6HdoVwxpGEBipiejnUOWxjyfGzYCXVmAoYKNEipN/njVWER9zMYVvloI0Azytu
         6b4HDaTpizz6rsDtOl14dauHxUy9DYA4qaRUq7Rk9iFQqvnlibUnpgb/5SQZ6epxd7ie
         vvSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zjznu8vlqSky5YFb8qTrdFRgT7GE9GNJD5hjTz69un8=;
        fh=FnIlNDzuM8AAfOJdBVwpNJ6ykjvmIdI/D0h0vYG5wYk=;
        b=ASByhszkDv1ww8LKh7a9miLX2hXpRdbB2AduXZE+K3DUwK+nsihBBJhuoS/B22w6tr
         fm4BhJUxGvuZWgV2OKYmwkj6jcHudaaf9kWr+jig0fS0oZPNyKysBeUK2+2YVU0LqM5j
         tQBi5DrSWN21sUDxm/EXPDRmw/LhRe5j3XyMkC/E2ccKnljKM8oZPyastUoIF9GFq56x
         XKPCk9qJ13LjBlFI/DPCses557bqTiRnK75D8+fieZwT35P27/x4WXpMU4EycGJ4nZX9
         AfXA4NmxU0CgsEpEcuGdjqFQ2Ijyj1zGnmBwUUPI//I9aZKR4tvFrmMe6cnJW+LrFq8S
         Kx9g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778581451; x=1779186251; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zjznu8vlqSky5YFb8qTrdFRgT7GE9GNJD5hjTz69un8=;
        b=bDIF/r1Zf1NsTzoJjES1W9X8Fc0DdL3CWZ7XGjm0UID/7dl0X3z8j+JwEZ+jzf4iXI
         tRpGFD3UgH6ExD+YZCv2fyV6ZDeNPlS/N8kiP2e65ZaNXOgyKQdmbiViV4zvH7wc/9Rp
         0IjE+Cgn99Zujb/zLZxdIMeoO1FGFxoGE+G/41M42DEU3dktAykmbmmtmq6NGKHtoacV
         zSl3jaIpFFW3JeN+1dl153R+H2sbbDPuaFjPEVZKXrkevKaMSbssP05uC1kfldQLv2J6
         hlKrpBRt+GiuDgKEurkm4EhWKOIVatqvxDpSyM6TE/bAPc9uuY8T4rlUhZ0xtLDsJ4U0
         hwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778581451; x=1779186251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zjznu8vlqSky5YFb8qTrdFRgT7GE9GNJD5hjTz69un8=;
        b=KAABzIbfVZJljhx43wylV+6h3GiU/QfdSRYjwsqoG2Bz7jjAJLYpi6tfUcxDFs11Cm
         NQ2Ia/UPqwp0YQCv7zcODONNzSTPjePnbgM3ZIHqOKhjq/pm7RN9Im3UGoyj4OLwvAb3
         1Jdx4P6Lve/FRUK+XbZvXqCkjL5aPS27QRTacBTdTYrKssJBrp+Ic+4pMR7hNgjVhcYA
         TfJRU0LlU1VBBCum//oUeKuCc2IgDr/HQhbNfRoPH7UjBlpkA2oxK3LKHdBMDUEZgviS
         QrmhH9KVermMPGstwcEHZ7LAthLuGRVZNIikZZDYOBG7isERwTvPBp5E7pVkUDZ92soj
         jh7g==
X-Gm-Message-State: AOJu0Ywp8OAuysk7JjgJtT4tyttltUOLZrrLqLyxFTqGjRXkE6uzpBPW
	7MVC/p34Ozbwthm5JtPS83mlfTZhfAadRCUs/qpv0mj46I6MBx7q/5pCna292yRVhYOIPSEZFgC
	NBqURpPNInkT1/waSsMIpnHYVsfxj3u2NYg==
X-Gm-Gg: Acq92OFUn19cqTTEF89lqN9MHx0fFQQXEpdLat8SjYeZ/zrxe3lUEAy5rDOKpRhaDJ2
	nk9GyvrbsVfITWnKgygJRn6kOWwg4J4ogQurB9isBPdMEeyHw3w58t9J3YzmJ/doomqzoqla209
	Sz7HddLZn2i/TbOYEn76ZT2QCjR2deZepU7HqFc2Bx23oOMTO71dIvVt37JFd9F0nnV2mwyjVlE
	Q//nlClOl3JvSHdUhF1FHZutG/r5PhaUvVJN/D172WAb8dASkY6digNLr9JeuAkoBZ32/DW/pAG
	td2fWA==
X-Received: by 2002:a05:6214:6118:b0:89c:4fab:3783 with SMTP id
 6a1803df08f44-8c18808f5afmr166547516d6.0.1778581450921; Tue, 12 May 2026
 03:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260512101002.2282038-1-alex.kanavin@gmail.com> <AS1PR10MB5697F0913DB780BDCC207D55FD392@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697F0913DB780BDCC207D55FD392@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 May 2026 12:23:59 +0200
X-Gm-Features: AVHnY4LoiMUpruGCIh3E6FSlXOaFoTM3bFOT0X9kXZrcb1t81ZFbkleB8cLEHWQ
Message-ID: <CANNYZj8oQBkKCETD92U3RhJkEtqiyv0b0j8XS5VgY__AH9UDAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sbom-cve-check: set PV from upstream tags and
 ensure version checks are correct
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 10:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236877

On Tue, 12 May 2026 at 12:14, Marko, Peter <Peter.Marko@siemens.com> wrote:
> This is probably old commit message that claims PV being 1.0.
> I can see version provided in filename of recipes being updated in this commit.

The commit updates the filenames from not including a version to
including a version, and is based on current oe-core master. Do you
see something different?

Alex

