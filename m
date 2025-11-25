Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED02CFD37F
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 10:23:38 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13934.1764066216954445262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 02:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tm8pCBYj;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b2148ca40eso725865885a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 02:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764066216; x=1764671016; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pqb1vArhlZEIzp3GpEybDE/sCkvRrSkjdS1joh2+BuU=;
        b=Tm8pCBYjCRielKZ9AuZN4iWT3N9Sjc65BvtRYGhNs90QhPQMbljtP260griBwcKTfU
         OVqFBbuHYc1rdCOus9cKqyqbIx01fvDxd1vujw4Uu+2FhnXF7rYzUC1SJQ6ku+m1TCg6
         vsn0n8Rt3iOXe3X9y+wPYpiwIzv3/PouJghMElNRTG4aNF9wXLM2qhSkJzmG+B+ACTB2
         hRJBksqviXfL6eTWig/pQ4rQOX6S95uPWNGnC5viZ+tbymEOlYSSTzE96lrPp8kVkvs4
         P4rI/nIaBGVaHy0W66dDIgsNgi0WRBQDvPMkCOugGxXsoexyVwfQ7tQtudQa7o7W03qC
         R2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764066216; x=1764671016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqb1vArhlZEIzp3GpEybDE/sCkvRrSkjdS1joh2+BuU=;
        b=tQbCMJL1UXBWy7mHN9yoszEJdAwRgypGwldGtQ4xViQ0EurGKfRs/hNi44HoAM36Ye
         7T9H1losOu7m1FOlyhNkZQ9UrnB3pY3Nm1FWQXhXYg9UR3ooNYeRxVYGY5ZP1dbIQ+dg
         WyEkGoaOH7SwC5SscUV44JgzT98HsshJO5/pwscvSf7vmVPfVrR9NoMSfMobkV8oVZpa
         AdE4TzTe26Y01zpappmTVEz7sbA2INuLhAtswLhjcpBBCG+sYBwcuC3XsSEHA9vjGUyB
         BaKWJg4/ZYMi31YVOCcqOYJ30Pc8Zdcl+ByK8G9kGKBDF3/UHGQRwBTu5pieAnlfQIBZ
         qQ/g==
X-Gm-Message-State: AOJu0YwoNrlgN+FaDIJOHTF+PiYW0jbH7UxUdPReZcG+GoMDCRgxXMJ1
	A8Y0iXtuHfb89+2O3HBSgQCy5gqz3aHUikB4kwliJBF7PnOAVsg6fr8suROqVBB2I3sA/4XmUfM
	XC+KNirCzBrr1d8C9gI+lVLcQxqCyvGQ=
X-Gm-Gg: ASbGncsu9otX+JnL5f7IgNsar2V2aUpoaOEcebQyT/C1tjUkDSkvL9IBHh2xDaK4tF9
	XOCm5wgokipbLnNpi/hFXjU+c9bSoFpDCm4UvdVcpuBep1dBlwpCLmRA0aQtOQay4nkWR23ATxf
	2UEu5KFerfUJ084sEncn3e/uVNstuSAbMtZsix7ObWEChiFrYcirANcF1PYDSzOmp4NKvg4xA1R
	IahRBp4R8Aq9JihV10/eg+u4YOGyFoFycMTkTE4EBh90BbIkQitkuLH59uwGovu6h/FbE0W7fV+
	tfXCtrR+qTUlKQUswe6fjblP726beRO3yCa33cE3
X-Google-Smtp-Source: AGHT+IG0oikH0WSneB1kWfyy/0fDgt3RUlTxq4bY6SZs36cJfFWWVRhWhhpZWzI18t0/fuHKSYienRyGNCKf4GcJCmw=
X-Received: by 2002:a05:620a:4690:b0:8b2:e4f0:74c4 with SMTP id
 af79cd13be357-8b33d4c729cmr2001554285a.84.1764066215673; Tue, 25 Nov 2025
 02:23:35 -0800 (PST)
MIME-Version: 1.0
References: <20251125090059.3155853-1-m.schwan@phytec.de>
In-Reply-To: <20251125090059.3155853-1-m.schwan@phytec.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Nov 2025 11:23:24 +0100
X-Gm-Features: AWmQ_bkZYjyZbR2hhQesWJ7n2iBec2jivR_eT0K2TtMzNBMIThwhaCjG9D8bRrE
Message-ID: <CANNYZj96iASKujEQRjxVn9AMSRjHV7ep=oh6JbaZw+kWnOOsqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo-update-recipe-crates: Don't fail for
 partially empty Cargo.lock
To: m.schwan@phytec.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 10:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226761

On Tue, 25 Nov 2025 at 10:01, Martin Schwan via lists.openembedded.org
<m.schwan=phytec.de@lists.openembedded.org> wrote:
>
> Do not fail if only some Cargo.lock files are empty. Only fail, if there
> are absolutely no dependencies found in any Cargo.lock.

...

> While at it, restructure do_update_crates() to be a real Python function
> and use the corresponding code directly inline.

This, as a diff on the mailing list, is incredibly hard to review, and
needs to be split up. Refactoring in one commit (explaining the
benefits), functional changes in another please. Even better if you
can split things further, and explain what the particular
modifications are (rather than use terms like 'restructure').

Aelx

