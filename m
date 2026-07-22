Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601DDC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:16:03 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46769.1784722562933008057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DSTAW72f;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ff88549786so152442826d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784722562; cv=none;
        d=google.com; s=arc-20260327;
        b=W4wFC9uh2rXtaLFVVor2hWtuLiCsSv7PB04RbVMAJSjT2wYiH3O347gPANG4PiHUmz
         f/VOiU3ZwdKJ1HAp+OikjD/3sFdJBl2sBXkvIwKVk2a+wPeeWBei9x/HtFHatOclBEOx
         RK2Mc/Vg8j8f1CQm50Gxpp1mq5zpY8urvmI1z6zDwq/py4v6svwQM8Styg3TbYqsuDnL
         7Jqopvzly0Ivov3sU/rSKP1dh2Ly7run0vEyIysEPb5G7Y1ez5THgLvNglJCR9gfirkM
         gzUcJPS+EDW9CfDjI3f6i22Lmv3d/XOq9LDXjn275YYeZOmWPnjLsjl9o8Dvq0gpiKYE
         iEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hFdtlOlCmKwl2nmd4Z8WF0SaYymN5ZN5sZ4plcdWK3U=;
        fh=6DRnRsodwJgYP+rxnMrtCbtlIW9oHYTvWPZfyvv7+y0=;
        b=lGF6pAH1X6kKqJu6B9F9V8hIbqne+RLbu964/Hz5wgVbSfkYeOOR8QV6hu9+tEBqk0
         D7MuUSTwYBVJxs2jZMaqx+m0cQE+jYJBm9mFT6+ZkTIp2S+vLfB2UIfQ4OZN7o081p/L
         mgi5odcLVLfnTzppFyKYVnfwmByx5kdXtzRtvWSdyK15qIGfB4Ml3ivCvCNslABPUspa
         KA8alaIoGOcRGLc8Zilpp5i32CXZPqNYEw7VlndOCvErpakmmtrbosxornYQZFbFNqYL
         C7lhm/D912Qg1IVDlMJDfS8H4sLmaDDsuL7FWc0J2trC/Rz8ZWfOklGQH+RWXt/ZzxnF
         8n2A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784722562; x=1785327362; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFdtlOlCmKwl2nmd4Z8WF0SaYymN5ZN5sZ4plcdWK3U=;
        b=DSTAW72fOloL65lkt6VmJHaoyR0Wk95+XNQU1foguu7A0G6V1AYB55adehjERHvZd5
         PKEkl061oexEMiI7a/Bcr27NKC++CTSSdcVJzrTKvHF42jA0Ppf05FRuKSMJhEMiTGO3
         CospVZNVllG0d46adhNN2xkaKIh8AApvF+4sKjJBBRdegoLUPwqIBAadJwVdpvSj3kNY
         M8Y48aqfEVfye9xvUZnHA25ypgngwgUDHON61MruuX0fWEfVpdEld9lC0iTsGE8u9nUO
         8CHrD3GaOymdHm921nLtMmZgA1Zppvz3epw3bWW3MvHqlEEGWgf7pCxupuQ+HDvjLl/P
         nJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722562; x=1785327362;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hFdtlOlCmKwl2nmd4Z8WF0SaYymN5ZN5sZ4plcdWK3U=;
        b=KjOuys22B4VO2vlnn8tm96tjPs/TQmNSOLYQqpZ5IfZ0AGrk4zCn6f9TzVYsbEfna4
         WBenT2APjLqykAZN/DtRZNEasuo7m/plJlprU30Egc+3DyBxdGD0tfs991NVPwrqtZEG
         06MwuH8l9fGsxtEcpS8684Xgpw+eqTzU+wRZY3HPRSvuYhRsvXTosbblRG8VI+8OyVkc
         Qpc2/C3JMGYh6z6A+2BAP4u15PVqJ0qoq6WAKVQTzdSjBIC7/im023pMdPofinSo1Ruw
         6Lx4q8YCW8Beo2HsKH3WPTS08dM6IwLUOUOFJ1LeOI5CAZKmLM3W70U07/5COfhjnQY5
         Bfhg==
X-Gm-Message-State: AOJu0Yw0KuuCztyXKkp1/QWut+Fm7Sgb3s4sOtUeWGwwFDypz3epQngT
	KsM5dXUdNlZfPSNxvIzgvSXftGBZlSWUJtK63pWfK5WvHuy5bU8HpYscK7WiVEBCHhP1G6+qlgS
	yW/9Hk379Hd3tVAs+eehM15HYvleyJiw=
X-Gm-Gg: AR+sD12346hC37JHvQD88svlVhTja6DzWYrjXKlwabAbJ6O206adTDtxV3Cfoxc5FuE
	ILNqrbObW2AkAysrR7WIVguxJhKV6g3HSKgGe6tZSqcem+1V4U/5829NA9j77aqx/fkPbpfcWdj
	01fLMyDyBHu7HBazTXMiTpv37hvvcfqVF3YEilWYR+kGYlwrzklABMAK3Q7/8Z9EVca61B5/EYV
	vgfSgnrRPD1EShVyPGYT7CSi+ogqFtXYJ7ndUOUwzkI2fIcPKkDRR2kYhjE67XcVpbNV6kks0Vi
	PTt+ZHLJ5qv8hL7iBclj
X-Received: by 2002:a05:6214:4990:b0:8e2:e366:15e0 with SMTP id
 6a1803df08f44-9077831265amr260090706d6.2.1784722561690; Wed, 22 Jul 2026
 05:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260722103621.1810876-1-leon.anavi@konsulko.com>
In-Reply-To: <20260722103621.1810876-1-leon.anavi@konsulko.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Jul 2026 14:15:48 +0200
X-Gm-Features: AUfX_mwjHkGbJhUQAulje3EY2H40byBRkvkuVWmsNby_iDelvljcDL3yjj24Qm0
Message-ID: <CANNYZj9fX1aBA+3TA_GvvFmbr6Q+YO+6_K5NzUTskaYKU13W-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-chardet: Upgrade 6.0.0.post1 -> 7.4.3.bb
To: leon.anavi@konsulko.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241664

On Wed, 22 Jul 2026 at 12:36, Leon Anavi via lists.openembedded.org
<leon.anavi=konsulko.com@lists.openembedded.org> wrote:
> License-Update: Change 7.x license from MIT to 0BSD

In addition to what Yoann said, why did you write MIT? The previous
license was clearly LGPL.

What prompted you to work on this update and add ptests for it?

Alex

