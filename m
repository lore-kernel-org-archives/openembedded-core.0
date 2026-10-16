Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E339ACC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 07:03:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16072.1792134231379568650
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 00:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ne5F14vg;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49e73611928so3977375e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 00:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792134229; x=1792739029; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1/L0NPdRQoId4GttsCWfV4/xv0hyKVpJDZZHu3WZGI=;
        b=Ne5F14vgW6Q89JcQLhBLhgP2inN7fn6pgU2SLU99COiCXjYUpU4pyJnpFp62cPN7SK
         9vhDhGlXpt4tGnWpPKlw57sk2YFCsj0kYEq9PhfioV6sWcXhT1mXyInDmMaOH19adORD
         QW1eCGUnav2sufWTZj6xmyNLHUrrmYTHQmkV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792134229; x=1792739029;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1/L0NPdRQoId4GttsCWfV4/xv0hyKVpJDZZHu3WZGI=;
        b=GqROX9278thC6XXDqoG4yB1XRbvfbXEJqfsbvvwJFMCkhoXaVRmFOKoqIij3BeKe+j
         pcYv5Ilcgjrc2nuLRs2j0PX7/8K1fs5R7p+o1tJViGeSSwEzuM79BcVQ8tiJBC2bjdFY
         2pWafIu4qTMLznDQULle4TpAPULq+3msLqNiMwSWSpyQAfUEKCYEVDNxPWWIuWHqAzc1
         CFDtMML+K1wldBbz1cBj1US83ue1HPhdyPS8Ag8f29z3JUAigoTOxjyieCPEl/tTHbkK
         Ixr4/JWr0swnNHWeQlO2mbUPpcpdSnaKCPxUe1FPYPFbeAgcpJmQIqUeZhRZi/9hDpMQ
         RdZA==
X-Forwarded-Encrypted: i=1; AKwUvBwbfA/kABjkYd4sojVxtN2kmfLTMehtAzVZ4fCvNzVz3lUtnD1lKAEmoaU8EUQuVXbGjut6EtR9Zig5bjg2QmF1aw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLp5E+M0B83quma/bCEpK4okIwDFX0HTLBUE890VWeUg8eMjIQB
	FEj1R2NTUZx7XBYgyH2HQ1Ts2ZXbRBpm4xHhcswpDci7ld4+0nv7OWyvw0XbxtkOsKg=
X-Gm-Gg: AYBFou3KaT5+XSGrXVYq+clAq3HSB3WZXoSK/5AsNBuoh+PIL5eFgdBqiyiylqhlGUI
	3gbSW0vznErJoG6FHA0O7QmULnrDwifMMteF+0UsYC4v7D6E/mL/8nq2bK5HPYI2dvIo3c8Ifjz
	rXBFyHHY1d4r6tEkc7lQI5rZoVVb8pSy6yLSTO0ju7fPkrmsJI4TWT1Q9rrbhGF6lwyY/V4Twi5
	uIrFuuQNV9XR0avRQtEXvAvm8vv3PORhnrwCrFZn9iEHHEh/EaF3urBs8KvkgsWh1cfnmwaf/AN
	5xQxFdzhwm7dF9EoOBpFhJBZ6fVXYLSNwmPQIbJcQ3PSg+PdnTVj9rJX/JRlULmNoJIpM9Optyn
	ni/RfZKBrwzVgkX6QwNeVztmhCATZXEzU62wEi8fE+6rHM6VKrOm9nn2YszJvuV7XcRbyMIjjv3
	O2v7NjdBZcnFvMMk5NSFj2fQNehsfXzXO8fRrkfl2OsnS0u9sEYZMLu3v8FmVhIZgq9VCOI9oBN
	PNXqk9ATWl8nH02YpHV0y/Z4Lthtm9oEM3dxl6gf0SdEP10OohEHwsdyhuz+4aPI51X9nh9
X-Received: by 2002:a05:600c:5682:b0:4a1:8dd1:305a with SMTP id 5b1f17b1804b1-4a1c65bd929mr39883265e9.0.1792134229329;
        Fri, 16 Oct 2026 00:03:49 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5035bbsm3126474f8f.44.2026.10.16.00.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 00:03:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 09:03:48 +0200
Message-Id: <DM62KASB5RK9.HMFQ0TUDPVCD@smile.fr>
Subject: Re: [OE-core][wrynose][patch] python3-git: Fix CVE-2026-67326
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261016053344.103696-1-vanusuri@mvista.com>
In-Reply-To: <20261016053344.103696-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 07:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248000

On Fri Oct 16, 2026 at 7:33 AM CEST, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> This patch applies the upstream fix as referenced in [2], using the
> commit shown in [1].
>
> [1] https://github.com/gitpython-developers/GitPython/commit/54538428f79b=
0c91ba52cda5229856a6edf7ac06
> [2] https://github.com/gitpython-developers/GitPython/security/advisories=
/GHSA-mv93-w799-cj2w
> [3] https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-67326
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../python/python3-git/CVE-2026-67326.patch   | 109 ++++++++++++++++++
>  .../python/python3-git_3.1.43.bb              |   1 +
>  2 files changed, 110 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-673=
26.patch

Hello,

This is fixing the same CVE as a patch in a larger/later series:
https://lore.kernel.org/all/20261016054106.210444-2-yurade@cisco.com/

Vijay, can you review Yogita's patch? This would make my life easier.

Thanks!
--=20
Yoann Congal
Smile ECS


