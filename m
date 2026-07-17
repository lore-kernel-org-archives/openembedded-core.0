Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E8CC4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 14:53:36 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15372.1784300013819340823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 07:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LY9sV+Xz;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8efef6533aaso44361616d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 07:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784300013; cv=none;
        d=google.com; s=arc-20260327;
        b=LQ2fZVCFl+rOHGOcJddP0nrD3T+0S2VA0x+IvoAiOrFtUGze0ub19gwX5dAKGUptpf
         Q7tcBHFt7Dt/AF5UDNbwRC2yltA0OG20Fo6xFH7qCbV97kh4wDLhUSRFkVbQvOrG8UpZ
         ZQld6T7PPrajLDKPvLETK1v9FLEoZnU0NDlxn3sGDQp9slA0mgbBJViIXeR+GxHiS85N
         SUAK0FRplyZpXZm79CTyHSEsxpemzJQm6auKHYfDqKBRFqHoGG7UAGGTrxQTjbqOVUMT
         FOqvi3XHj11gm9GL0yp6m6DEKb10gNtTy4SsHNwZXYpgUEgX8sNCfF9DcMZCXeFrGxyA
         W5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7Znq6B1KG7Gm7EiAzFR3zs11HFuSzhxmpumKp68cAdQ=;
        fh=JhwpbyHLlW2kAdWl7OYmYdGmK+rcdV7LEjWyEKW6Pwk=;
        b=N32806xaoQIV0o88ATLv/EuvpOCgEeAOMZj/CW5vU2KDqYbSqnY1Mhr4KPbwWCuOn/
         HjMPFxfuJHA33ax3QFQAigBX5EYAlkOU5rEnQmFPthAHUMjKrFpF9yaZmG4C/6TrBy51
         4CGdflQct230hCKvOo15JaoIQ+93MONDqFqU3FpMR8Ax8BRXNom1kLTVmJe9cLbC9olD
         k6TZUU63VOFVP55cVkQ9Z9wPG0WHIyMC2djGtOQ9dZ1kgjq5vmwazyP0RKjkk5aRuUFC
         FcJMejmFSJrMAPmPsRn6X0LdWjNC1BJBfAWIljvtMs32PSQFnrkjmM2BGxayUOhstMWe
         /4bg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784300013; x=1784904813; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Znq6B1KG7Gm7EiAzFR3zs11HFuSzhxmpumKp68cAdQ=;
        b=LY9sV+Xz84mNJd3Z6NlefB9a//I4Yl1U7G7/KXvby+scII73lRH67srfTIHdCAui8/
         /pGFBwU/pqUBBDYuZWWY+yzo46EH+IBESjM7tqLhWa4VDBnRtDkZMc4PKI654xidZW0m
         6h1WxxgBGjgNNELn1Y6eeRkJS5Sq/QVeV3p47PxJuH3kRCKHvzIvuguYA/EcMS9jfkvn
         3/pxVXD/hgCouG7OMOKVJYqWYP3qmGhJqbomkF4wgiM92FFchQjfu9zGCZcpNo4kdz+e
         df7g0SCNRqrN64ODlYijIWud6sh0yM0jSZia79x6xSIYTkCpf5HMLJYzlKBrm79hCr1Z
         sdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300013; x=1784904813;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Znq6B1KG7Gm7EiAzFR3zs11HFuSzhxmpumKp68cAdQ=;
        b=IC04x/4Xj56gEms6xYe20wXLXiULIrHpiAteRLi0s1YG7M7vEPTgmvnArCDqJrb63g
         mPn1zBaYHKPiFfHvuUndlRvVVJtVyoq/AAhbKvBv/VfsvsLTBO5GYrX+ZKW0Dtnoi1s6
         L5Ibx4u/cBaJLjYA3h0RRK9uWlfLyC+vDtj7+3veietuazfyDeJ/TSUhNXLFBNIOZay2
         D0WsApnD8Zg7vxf0bEU0k4RF2Zq54GSiNuL4tLnERIiGancNTywc900vDZN2zS2boWws
         wf/+4LVBIKP44sYl+8e/Xk4/f5hN5BwCUKsXKaxF125o8oD6PFojaiIrsgmKV59n5Hc+
         EXdg==
X-Forwarded-Encrypted: i=1; AHgh+RrW5Vud7pol/vmUfTjwO2lkQiEgUuMI+uW2NmuJPiHBVRU+8k9cA/QeGbTGRWZv7GX/obzo5J/RwcU0aM21Rq8Keg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwmqCBTuyd6kcAThJBcWKBwjVNa3e5r6BnqCB16fZ2bi4b0ivIq
	gy3VB5Rq000hSK/f6ieHMBj7muby/m20acu1diDkTkpqlzqJOQvP2NPIm+BobZF9QeiiXlkd6qo
	OnbtL1E0Aanz0+iI8Cm48F7lVk6oxqzk=
X-Gm-Gg: AfdE7ckVKaAb1cSDOluFxYc1REZIw19Mb7HdwE2+cjt06JtziwLMdhIOyImI4IOVvvA
	SOQyNo6W5mW7bxzLTxB4vbl/IY3UKaCk4zOtAz6L/LNNntUycFgvT9CJ+QZOXWZhe3oJF9wAyig
	L8eF752l1MYvI29mydqFjhmCKh67Bh1SoBdkf6IPuBpp9fyAGQ4h31DjJjDF/oj+RNElRDyQKc5
	wCJMz0Y3pq1gePxL2axsWj+5FoSNTMkvMSPSkN48gzzF7mjiC3O2XIwy9swxg/LlrJDqmbD1ieQ
	K/S5eOiwQoaSIWYVFO/E
X-Received: by 2002:a05:6214:e6f:b0:8f1:ddcb:baa1 with SMTP id
 6a1803df08f44-9077836830dmr31759786d6.19.1784300012512; Fri, 17 Jul 2026
 07:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260715140507.2329605-1-ross.burton@arm.com> <20260715140507.2329605-4-ross.burton@arm.com>
 <CAMKF1soJNFHLg3ChGnfT7DHNdR8XF9WeTrHqLVxY5e48a_Q4Eg@mail.gmail.com>
In-Reply-To: <CAMKF1soJNFHLg3ChGnfT7DHNdR8XF9WeTrHqLVxY5e48a_Q4Eg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Jul 2026 16:53:21 +0200
X-Gm-Features: AUfX_mw9b06xLw5opRUgBfYn0sV4okplapONM-J0N5ky7HO8qbTTA0B6KHhwklY
Message-ID: <CANNYZj9jKGugpVhDSXVadnpjMy6VxsfX+c4dbM0dcUj=qk9QmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/12] patchelf: build with meson
To: raj.khem@gmail.com
Cc: Ross Burton <ross.burton@arm.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241202

On Fri, 17 Jul 2026 at 04:30, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:

> README "Compiling and Testing" documents them in order: Autotools first, then CMake, then Meson. It seems meson is still work in progress
> E.g. tests support is TODO I wonder if its too early for distros to use it

I assure you, even experimental and incomplete meson is a better
choice than autotools. Especialy 'mature' autotools which tends to
grow so many custom warts that we have to figure various
'Inappropriate' ways to patch them out.

Alex

