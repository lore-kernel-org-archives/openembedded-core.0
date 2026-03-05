Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA348F30947
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:32:32 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42317.1772710344294131356
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CYlQSYSE;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cb3825b0fbso776792085a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 03:32:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772710343; cv=none;
        d=google.com; s=arc-20240605;
        b=dM5RbOSLWsYz17S0Dq/1+vxAV7S8wvTaNhSIlkblHNyTn4zRukSg9ySiSTgqtgSXOQ
         xsZKSwK3IylzYIxIbYjCmnoRbWWHyfw/YOtup9oAHPpboszatQM1sbfimSTncwQxrisG
         1D5mFIpz9D9JklCV+RNHjCoCOXckSiLolxVmU7zxNdI5984w+TD2IKWHAIoTAYK4+bmq
         X4bb/aKx9sSASLb7mdHP94aAOh5d7YHedk+sM8DIKoDh4mg2KoL58xv6nxkdzsocXrys
         xOCP9hs1Mr9r+5VWm3YizpaAF+uFrpwqMJeUH8TCYpER2vfCYr4Oa6rRj8dpq+Op8BMZ
         vqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qhuTUGDcaDWTczdG8cZSznZppobvqWcpV8VVx6DbJnY=;
        fh=KYcK21Z2eUk14PoG6/CZ1uYdrVWsbJl06ahfZgj4c8E=;
        b=RVcLFdTHjXsTNiDy372e7ffn2RGRv+8xmLGEX2bHl/OD+lHpmOGRbOvLPx+9JFBZhb
         J/qKiYe+dBcLv6V0RscBuBZpSe1OB8TxGP/q703wYI1peN9nqt8e1MolTZNbCePAM3/5
         b2V0PBvvorfXpoffhDW0e1G1P3+ib3O3a8l10Q3KO4srxUxOa2mg4hDp3V0ajdTYcfzH
         kmdfxn6udL/88Ly3aE6umFevUqEE+pqIU11/ihOQTEzGSKXyKMRB444+LO6b7Da+JJmJ
         /vvWY7gqJK/CUOAAHnSlHcfpABJhImRLCAlYSdRUrH6//CwqoQnlEWNLAZyEid/ggmTc
         jOcQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772710343; x=1773315143; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qhuTUGDcaDWTczdG8cZSznZppobvqWcpV8VVx6DbJnY=;
        b=CYlQSYSEMwDW2p0WJ5j4+kzG36QTgukY0TpKm36bmyph18x5YxN9/uw/0XQOYHtbnN
         mM8s05927AiaXZBWOTmjT9/eZaZ3N3HyUsi1vnvqaXB+8vQ5tdHhYq498JsLWF88w6+h
         I8o9/SnZiohAPqUAXfMlZozVOSryS8sz+aTVPsg9YMYZdtOARsowgQLFzIIuBbGpRTfD
         AndHH6KLv3VSGE9A8cG9hiW1aviFhmQhWPqcNqcwLBdlErMgu3UtfwqIq0RIrjcKLUQ6
         X2hyNUbq4LtuIDFKqId+qwuX00ZDYZSaTNDQ1EAJozecNaQizrazcGBXhC6Whue/d8Cf
         HI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772710343; x=1773315143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhuTUGDcaDWTczdG8cZSznZppobvqWcpV8VVx6DbJnY=;
        b=efzFGe9MGrX6/id5Ne/16cO+VFRx9+fnCOy8/LPjt6d6JiI6S4euXwaWRJFvuZ4py6
         AUZmTbS+uqZlQfUmbWsvZ3rDmKFtQZ4HdpN0iv8PurxgEtIfY1uki3UksoBipcl8fxh7
         EjXXM3kXTE+hvqgZsyYJbiuN7KVOiFEPBapDgUATGf3huAIeV77fwqKvfe3jsmPCXkco
         WmISY94hA3e8W2W0ZnDpGTJka1hr9Toav+EhIR4rN+1748HdC+/gpX4RnqcmuSNnvDPV
         Aup3e0VPpxipbAdSxsksR61IFuF9k+33tA3sCPtboOzguqlWVl+7IBlktIYHFxZKI66P
         nTBQ==
X-Gm-Message-State: AOJu0YzHp1otrCN9ce2OFM66rFBgiF71KXrDls54EVbm2VO0xoQDXkY3
	11IrYyNH68WY5PaT2GPcmyJ9yQJaqSgPPPs4QmeN96t0zgzO4mY9Xe5FhqFlIghKhRNVHLOLrJ6
	QHDX5QbEBHXvslJn6HUC7fyPVbgYpOHsc3SS2
X-Gm-Gg: ATEYQzwsZjQEPnA+OvXIdseeUv26p1ScBxpbK4XosKrHjjcWBTKIL6SMaHmySWiEwvh
	pM7dqAhB53mAsKiyVSFPq8ocwBNPbeOLpT7JnmndPOkek5xTy/8/hd8KMWPE65kP+CMTuLLlkvH
	0477kO6q0YPf/uUPPsL9JyxJGab8VPWLIlftykwWefy+wjmWVWtEeG9zHJEvZLua7nMluByZTka
	09C06uOufvGvAqbLitwUeCaClqkMRBFPzGfo7uKy/7oBiRPtzRGF52ZuyJOJuj8thYgxKn075YE
	Ddcd+CnAfSiD8+TvzjAhjp4abW6h+a3ppP3lQFWv9Q==
X-Received: by 2002:a05:620a:4410:b0:8cb:b22c:90f8 with SMTP id
 af79cd13be357-8cd5af79ef8mr655508985a.49.1772710343239; Thu, 05 Mar 2026
 03:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20260302132815.2922014-1-sunilkumar.dora@windriver.com>
In-Reply-To: <20260302132815.2922014-1-sunilkumar.dora@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Mar 2026 12:32:12 +0100
X-Gm-Features: AaiRm51T50pQ_04aEHKtlpvsNKL473CuACF1avVbuiCMACx3aEqSe_SaWXsjPdg
Message-ID: <CANNYZj8TCoYWsniWbOK0-eaTOg+8npU3fxAMFifsS2MjPaYPRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Enable dynamic LLVM linking for nativesdk-rust
To: SunilKumar.Dora@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 11:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232481

On Mon, 2 Mar 2026 at 14:28, Dora, Sunil Kumar via
lists.openembedded.org
<SunilKumar.Dora=windriver.com@lists.openembedded.org> wrote:
> -    if d.getVar('PN') == "rust-native":
> +    if d.getVar('PN') in ("rust-native", "nativesdk-rust"):

Looking at the error, it seems the problematic binary in nativesdk
builds is rustc-1.93.0-src/build/bootstrap/debug/rustc - does this
mean building target rust has the same issue? Should we just go back
to the initial patch, which sets link-shared for all rust variants
without conditions?

Alex

