Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD15CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 14:57:32 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.296.1778252250530882451
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 07:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KyazMaKy;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-899d6b7b073so17828056d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778252249; cv=none;
        d=google.com; s=arc-20240605;
        b=M6EAhUOlL/Kc03my7GeNBdKFcz9KtAC1hHqqeU1FEN3roH8O6xTE44mGdXXe4M2NF3
         t6EbvaR6NMBVOWZsRq6M2D/5apj6gyElsTmhQcB5GOVJdVR1F7+MJHWdToPgYGRApFgp
         v3T7jHEhmwL2NYOy255p2uTkgVmOsOqE9KdZ+rFRPjVFgEP+waKLQsox9YAuFsZVQCT4
         1t0112Pu2Y+ZF4k1xDVT80JYXMTd1M9f/9ojXio7EvDEvyTJ2mnIrEqs6T2eJ/DWZgNI
         LpQ/2i/hIU0DpIW0ki0kPZGiZDTy8XefmQyrA3GJ2q1W16ChrpJrICqRkaUqREFU+YJA
         PyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Pi/wf4a9bRvnniuhjRfCMmVMTsNXaK6kCcmT5XVaagY=;
        fh=Zve52/atCzKjDBqMU9JGyYKBzgaRoQKPMo/c/LuNNvE=;
        b=k0UZx2jLuuYc2tplELIKcED9Fgm42jnsQPMmyVX24gvRHOn8uhQoV/wnaUGukxeFhW
         BLQXRbyyG9RUOefaCHmse4admSr++Dmh2eAyJEBUrA6SYzqt0S/f1A1fCz9sent3nJIm
         UFnhgsBQg9pMPFOH/zvv8cV36FDbuHvliZlpP8CaWsmfpvbA2WsmHZDWEYqQK53ik3r1
         1hoI9Dt96nnYMncCtinlrIB4AGUG6qCqt/hv2R26eZZ7tvdFr4JLgoly8CKTN5nd2h0O
         lk0S8hX3F1aNl7acHZVGI5V5Nug1DVT4xnPIleJSaD/P4e1bWsMtee3kpLZY+dx//bux
         +SZg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778252249; x=1778857049; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi/wf4a9bRvnniuhjRfCMmVMTsNXaK6kCcmT5XVaagY=;
        b=KyazMaKyKqrQrmlUw30xvIfCnNnLLrsJx0mU2r7gKvqw20teR9VYzMoLEMerswCZP/
         6kGO5Gdiw6dq10sxtIoUI/Wm5sMKfTzQgsIrrv9QvC3ZjAwyUwpKjRRUC+HsODIJkFwg
         ew6erd092NLZ0mEZ1q/2FBvin2W366jb5hIIRxcRbuZAXEyh2e0LJhiAGcDVjzuWuBYS
         friO2hnm7sa1ymTbMN72rClaFV2EqAXzpaqIzr0V+0b4kBMHItCFbYMl1NPhubSwhloL
         hV8YtqgGz7J3Z4BZEd+2PuhINQnrx0koSfOlHzmSsssE5EY6/EUuiV870S9s36cuV606
         JJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778252249; x=1778857049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pi/wf4a9bRvnniuhjRfCMmVMTsNXaK6kCcmT5XVaagY=;
        b=XoKm0Ag+FYzbmyB8DewOJadi6KzOXuwTl51dnoRRDh2ayxfYOlD+yVUn5dQjmf5+O2
         gxfd7fAVphXuvncEbAsvJ7oSscx3jT6bVk9E9R57m4Qre3BD2IWLCGqwOFB29i+yfEEA
         oP6UYzTfoN26nHinO2Cn1+Kw7JLLt5Z7ZTQHy2zjO8OR39VIO9uJv6ZiQtOkSs5eSuZZ
         cNpFARYwMfWAhKVETsGxCCoAoJfLUuHW/bInhh5tB2ZofZ+XYVUFTaSHHU/EyZl4+W2Y
         TGi4o8PweqKcKgYsv9DtAUQS4Uu7vn3gnmWno9lRd6VEVs/QvtZZ0cfs/1xNhkHNWQSr
         xb5Q==
X-Gm-Message-State: AOJu0Ywpl0cXErJ7O1d36QHv5c4/ATjM73Cr4OAsNHtd2UgJHaFU2n2V
	IOm0d93RZ3cbRKfgVqKatMh7REj/JRt14bHf6JAnk2bripkwVQ1pcw4ZE1urr7RPtr2OB0Ezrbl
	Enmr1uFfMhUHLJiZ0quowV2IPuclp32ahIvZV
X-Gm-Gg: Acq92OHfv9wjmWzXVKKRINhALqdH6SMFkbSxspNJOLMZGFNuvurEMbfYIxShyaOTNSa
	AP32tNthTRUOAQz7rokFw6c1xP0t57PCXBKrIStZrM9Cbc+lfKuoh1+f88pkWQPLUeM8IcASnyt
	Lgn5aMYwRpXss1YNpkm92Ppk2FRyHnrt54Sr1Q0ZDgBj09DoeZuX6+14XNwiMB+x5fP1CUbAVGF
	7rhmyWMAB/NfiXNaDmZkReciyAqgQz5UTeOBuXbOZGF4oCagPZnBbK/blstC/IywL5Rt+oZpNxl
	Q/QRG1HUwI/bkOQTduyT2fLene798XlW9CEuvVnjFA==
X-Received: by 2002:a05:6214:2245:b0:8ac:b204:3238 with SMTP id
 6a1803df08f44-8bc444cfb45mr189400036d6.30.1778252249204; Fri, 08 May 2026
 07:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
In-Reply-To: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 May 2026 16:57:17 +0200
X-Gm-Features: AVHnY4I-nmTkQN0-bbCVRvETVyNMj7FiqEpfeZ_Mrk_MAo6AhWCCsDxu0sIYRDI
Message-ID: <CANNYZj8r_M_Oa_WmYrvg1m6P_xswyXDpcVZG7_DLDhWarH4mJg@mail.gmail.com>
Subject: Re: [Openembedded-architecture] What to do with vim in openembedded-core?
To: paul@pbarker.dev
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"openembedded-architecture@lists.openembedded.org" <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 14:57:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236724

On Fri, 8 May 2026 at 15:29, Paul Barker via lists.openembedded.org
<paul=pbarker.dev@lists.openembedded.org> wrote:

> If we do this, what should we do with vim? We could move it back to
> meta-oe, but that would simply be moving the maintenance burden. We
> could stop backporting CVE fixes to vim and recommend that an LTS mixin
> layer is used to provide newer versions of vim for stable branches. I'm
> open to ideas.

We can try to open a ticket upstream, with the goal of convincing the
upstream to maintain stable branches with cve backports, or at least
getting a statement on the subject out of them.

At the same time, I'd drop vim from both meta-oe and core, and if
anyone wants it, they can set up meta-vim, and maintain it there as
they see fit.

Alex

