Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B821CA5FCF
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:01:50 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7450.1790848905262425962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 03:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TzuWhIMJ;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso2784175e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790848903; x=1791453703; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mxbAVkvhWUT24mO3EeHwvPenBGEEe/Q8yEAPtq3ajF0=;
        b=TzuWhIMJh8ZJt4VfaGWxE/4FEAIvFQlySO+F8sdhSZ7a1orc40bCe5QjSVnXckcdko
         PIItsogiZMo/mxHYK2aTX3MlhwitWITGLkxSVzCXNZBPCV4gfXWVirce3sd2dVFMLq0l
         dm7U+xrMz0qPDJgwgrntTUn4ar5anKDNxGxng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848903; x=1791453703;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mxbAVkvhWUT24mO3EeHwvPenBGEEe/Q8yEAPtq3ajF0=;
        b=xnXcdBHmYW7ZmklIqt0D/QUBfenCFJsosdGTg0mPRhonDJ2J7PqQW0W935CREbEjYL
         J4kCy6zjDFIa9WHVMV/5PWjWO6Ayx2MnJ71HFkmtxpMgIhXMusnB6p22r3asqAFy4tad
         V+fSF7F5CrDHrPwRgHukfGs9iiQ5FPqHOT2RDUutBhzgDpUplcGRN3ZPWzWWATcdRpo9
         82MXGpAHIviIVToJQmgVd6pr5ssCRXlfCwKwYufbEXRI3dczHwoEjL7meZgabfNdBVbM
         pZL5Kurshc4Re/Xpc5jOkKjy05/BaMrhuOqeaK78AGNPJizaJMYAYarRc+wfF0cFx3cN
         xmaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkHDSUWr8tK5MrmlOyAU57evysMx/p1H/Yq9HJsy2cz9C/aX0cP8XaucRGmz9xADslyQerC1q1Q11yK1LEPOe5JQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++kjfqGtE83Lo6tz5rRJmSkiR4o2ZYGTo6d7HcB/Hac8A6Tl7uDo
	3ZanzIPbfmtTFmfSX79Nb51bEnYfKJi2sJcNgstebBmVDLpOQ4g4K6PMIbrwiT+GOk8=
X-Gm-Gg: AYBFou2QG+1Z6CYMWGJeDesCpWH7h/O/UFASdhzVmSPSaIO+YViTK3VhPGo+nfN9mYL
	tZvVCKQSsFHGWnQfI7e3KyMpJiTJT3WJFfQMB5vVGb12vtJ7KLn3r1WvmHIUdjmk40epLbqoMrY
	O/V5mTau5eZ/Md8zp+KWIuEHHqeDxbekBy9j6/3QMHoiYRu+fV5EOWsc5aeZ2wWIp5Kr/ccAN7a
	0Heo9lciaLJTCraSDKet/oOVYNUbJuU5GwQItOH7fA3Yjwi1T5/X+901bbcORlYPLs1S1ocMC+Y
	0ek7EbypTgE1VfyrFZIgTID+AWcsPAkbAtFAQSHe6/uYfIWredpQC/hpfWJPsWSIEnBmXk3Btfc
	+JIDrmzD6IuFrI3gpfnSIBFPaKY9zlp5em5ojo0Wc5v/vXdM8SO+NeSPar6YZ6cQdcF+lTZYtPE
	E1ZQeGqF3442R7QWjxMYo11Ad2FJ++mwwTbyAG8vpEZ7b+jgqdB6R617bx7nAKmek4etweU7uD4
	s5/wqnyc+rNKeoIOLrfsbRpufTKVjHT1Fx1gP1qGcc/1fwxAXwIgXRs9+YabFGIHUFebWFX
X-Received: by 2002:a05:600c:46cf:b0:4a0:1f9e:5f7d with SMTP id 5b1f17b1804b1-4a01f9e631bmr32241705e9.7.1790848901967;
        Thu, 01 Oct 2026 03:01:41 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01fa15e51sm56691235e9.2.2026.10.01.03.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 03:01:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 12:01:41 +0200
Message-Id: <DLTEYBOWDUZM.3VI9GFRHHKE4W@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] bison: Fix CVE-2026-56390
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <yurade@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260928162804.2653316-1-yurade@cisco.com>
In-Reply-To: <20260928162804.2653316-1-yurade@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 10:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247023

On Mon Sep 28, 2026 at 6:28 PM CEST, Yogita Urade -X (yurade - E INFOCHIPS =
PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://cgit.git.savannah.gnu.org/cgit/bison.git/commit/?id=3D8d101c1=
9d4d9aaedf83a448c925513742d4efcf0
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-56390
>
> Signed-off-by: Yogita Urade <yurade@cisco.com>
> ---

Hello,

I think this patch is breaking builds:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/21/builds/1651
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/98/builds/4590

Can you look into it?

Thanks!
--=20
Yoann Congal
Smile ECS


