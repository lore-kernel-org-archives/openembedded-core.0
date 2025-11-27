Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353B2D111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 18:37:34 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1349.1764268643571297847
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 10:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j3CoZhdK;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4eda6c385c0so9010301cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 10:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764268642; x=1764873442; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KlmprLVbtr0Dq7xo3Rtx/qbzFUJ/TIdQGeyroOWV4x0=;
        b=j3CoZhdKv6QhywhBXs2JojEnw9Z0ShydvHYWDWnW1ONY8qR2be+WROHm/JgOD0GDE6
         7AkVLfQrTsDJAHyZMLWbgLWKuLFhWqJA6T+KH4Gnit1BOP4b86tskqopwBiq08NqpBA/
         ZHstEkI9eACGGWyLEGoFrEwZ/UrmuLmzyzC67UekHUPNDDF2ELScO3XHi8x6dM/pm1lc
         kpE74YMen/yxmNNBWISd5JFJwPJZx+5cvqVfy6WPFFIPuTY4WG3bh5k/N6x+7fVWybDE
         B26gymLqO0fL673PLcGOJgI8S9YATDS0VORw281O+PLbGtkWS40m73oZfj7Z/x4uCRI3
         rg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764268642; x=1764873442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlmprLVbtr0Dq7xo3Rtx/qbzFUJ/TIdQGeyroOWV4x0=;
        b=JGs91EMSaf4AY7guCHltXf4nP2DtuomaFbAe6623RSx2HGnj2rVP5EPk5IiMdrKRsq
         aTk+Bc4Hi4G+94bnCtHhzJw4VmKHO7x4HZLFoYsrQjJVSbrL96MwR4XerzUAJSME0mPX
         H+JmDU/FEAqArQ0+F3AG4L5MyhrZW462CdNw2kODIDOy9iB9GsBpHmJpGpKnukzDAwzE
         JCmwPm1nxKKCEeWqpisJEeGojvmHl/liyUHI/+KfE6eKwG5iOUctwRd7O7s0aYJ3ZwNm
         x98+OFocbuo28Ry5rZ56WNsltgqPbzn5Xpl1vfph7iO+Qz6269GaqEOB/zqcIvM7xsDw
         ybWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfoaPDLTp9OmWlyZenY/0IIND8I/1N8YKdHl5h6idE+1NOtFGKHzcNucOrSgmW2kD1u1cY8QSPfpI1J1rUXRmTkQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz1zxsdE9DnCNFBksxQjLRQodlzo26lt9Ivt57Hlw8BA457HWgH
	YXGsC+dMQ0V2U3a3YlRvoHbQjhSykqeFn8CYW8DOdDyCbLuigvCU+xhEkV73af/qu3sUT6lNPcc
	s1E77vv0pZ/r2pL89DxgkpgiJY+wCxUY=
X-Gm-Gg: ASbGncuIJqX7MLG9l6w3jA565WOMjiaK8SnmdKPKy7oQPLbAQDOwz553AH5QRwSR+r1
	Ez+9wgvsyvYcTeGgJpzGwyWAPHdx7cK8uvfZt5xaOzMHftV9rQZ3t3UeOPVSZSBMlyUzja3nrqZ
	q8axfWRG1fM54VrgQzXOwuIiQV021BeE5QHBEUgW20q4E5HP1w2ATIacb2RQLW6viTSe8eaZokY
	xT4NJvngsEfqT7Bb0kjbwLnQWE29xYeRS4GfFHGO+UAw11SbwNKIpGPL4R7AUVTPj8gQOTcUsry
	+2C6UU0zqeu64meBbgfVU2Wr6PCzKA==
X-Google-Smtp-Source: AGHT+IFeCTyvsTOxql4XOSL676YDW10CZyU56wwngHskKk96q4FZSqCv7aR5lm1YOXdWHM5qYhBQ+Tdfl8VbgBt14RI=
X-Received: by 2002:a05:622a:295:b0:4ed:b448:b19f with SMTP id
 d75a77b69052e-4efbdad012amr143650851cf.51.1764268642482; Thu, 27 Nov 2025
 10:37:22 -0800 (PST)
MIME-Version: 1.0
References: <20251127174140.906490-1-skandigraun@gmail.com>
 <CAHUKmYaChMBkis0gG8voSntJeC+xPM0+5D2Bk=de2_QdwOXmDw@mail.gmail.com> <51e4d1b7-018e-4549-9be3-e66b6b1b0385@gmail.com>
In-Reply-To: <51e4d1b7-018e-4549-9be3-e66b6b1b0385@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Nov 2025 19:37:11 +0100
X-Gm-Features: AWmQ_bm1ijavEvTsuWFmXnPQqzJSxsP_FdnrVFzxbpeejbsymuYrtvwhUFtE6t4
Message-ID: <CANNYZj8k_Lnj5GxchW+b9ZXeWB3DpneQ-vVGueeOu9jpcw4Ezg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] opkg: enable ACL only when present in DISTRO_FEATURES
To: skandigraun@gmail.com
Cc: Etienne Cordonnier <ecordonnier@snap.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 18:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226867

On Thu, 27 Nov 2025 at 19:26, Gyorgy Sarvari via
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
wrote:
>
> On 11/27/25 19:22, Etienne Cordonnier wrote:
> > Hi Gyorgy,
> > I have sent a patch to opkg upstream to fix this issue
> > ( https://lists.yoctoproject.org/g/opkg/message/175 ).
> > I think it would be better to either:
> > - add my opkg patch to oe-core and not merge yours
> > - or to keep your patch and not add mine, but at least add those lines
> > as os-core patch:
> Please feel free to send your patch - I just sent this as one possible
> solution, but I am not particularly attached to it :)

Option three: both patches are correct :) Regardless of upstream
behaviour, adding missing packageconfigs to recipes is always
desirable as it lowers the chance of build non-determinism and
floating configurations.

Alex

