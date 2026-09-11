Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B703EC88E4A
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 10:49:57 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36935.1789123793952079837
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 03:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CBfD3p9P;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-485850cf499so596953f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 03:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789123792; x=1789728592; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/u+ClNF1GGMYZWpHfDAA0/jTd6a8r7LrpZGuqAHdpJw=;
        b=CBfD3p9Pb53sc6UTQob3QbiiO2O2sKkIvNTjPA6Zlde/UgVLD4LeKMYahlT5FCDtTa
         rEproX9Mw5AfXfn4wVChF8+N55n09BHGfvUFHy8nMFVxvQG5ezWCKCjvYsRIMRuIKrN5
         J9FCUtxh6QKHNArsuXwpHCKlY67UM3Y0WDGvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123792; x=1789728592;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/u+ClNF1GGMYZWpHfDAA0/jTd6a8r7LrpZGuqAHdpJw=;
        b=j9GVhRdWI931iyWdjQhvdWcXj4OVTypVtneA0brrYPyt8n/B0GFTFpJ65vxo+mk2X1
         UhMKkXZ0/GnnjdWAYtd6BLWr6f3TtFwdW3SmytIqu/1017qgLoAa2ATcM8B4F01AFNt5
         EVydfT1JOHxFBT9I1pmqxOTJ2rpiiNpEFtLiEv/fn25W43KyFZwUEGCST87h6L6eZnwv
         tnXisL7AZS7tsXS6PYsSZBg7zTTOoDjXSmiILW1fHH/Zb9WOPyk/38ECacQbvxFmbzJ5
         mfr7lrvQ3hRLV6WWZ35ZO/InFOznmIa3SCSvZFLazMHpz6nkAIIurZ3LUakBXP6yxw4d
         oXLA==
X-Forwarded-Encrypted: i=1; AKwUvBzHXHnp1DKIjZr/CIUaSc4QauDUklvAmaS8kAcGDgruY34C4z5qM5lcQEpz0DVJGlpr5h35h/utIL5SSG3ro3Q9cg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mXfdfcf849VvyCWXzQFElXWxsiZYBo5G8p5iBBdBA4LCWGASPL
	yss89TgnQe0bjKcZcwwQC2QNTHvPZQcLe5OuTeiZHz05VfFqE3X1ymdxaLflY2Lif9w=
X-Gm-Gg: AYBFou0/aKnKRv82lVt3cLlFzrYgTPRbrwr2SICpiGL0TcMUO+T3taZUoJ+PXwUWkgU
	cACpq3darlMueoWBZuI3S/AZHRQkfSme9gUIVYGC4epjVSfYD2sogCfsClEQ8iUBTVxnxMKpa6e
	IwZTyW2e7wlwddXHbW7zYdcG89RJTt2EuIPYMuQirLBPk2fzQdt4J8eEqNgBSK9oPgJrnDJzYwL
	4sB80G7QP/iY/fFtuwtMI82ijK75S0nULk4fZznaPVz7W0V8PFuj3hunI/DFn6lSkeC8wu3gxJV
	ETYvptm3cR8ugikG6Z3jglQILpo84cY5B40pj+RAka3mgCRF15SaWeg/fHN4XsaMjtwGBESBXVj
	eDzoSw9zsjMWKdI/oR0MZ9SW5UIAXQv6Gej9TrANFSk2Y9ICAKvDLrwCL1TSPXs65gT+ATFVQrU
	Xri1zkfiVobE4O0zA5fz6DmjjRESQhLT4RNVjRZnBDFA+fYG3xjkglKPJs5Axkq7sE3Yxh6G1MA
	BweagNM7JQyQQptPkj7xnTZcQIaxRILr4YWZW5aUMvrbbNCamMHN01cVh3eAdE=
X-Received: by 2002:a05:6000:2992:10b0:485:8c17:9775 with SMTP id ffacd0b85a97d-486eb326385mr2645595f8f.55.1789123791932;
        Fri, 11 Sep 2026 03:49:51 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm4780637f8f.34.2026.09.11.03.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 03:49:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 12:49:50 +0200
Message-Id: <DLCFGAY7ME0S.2VZPV9KTTLMI@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: Fix CVE-2026-6238
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Sundeep.Kokkonda@windriver.com>, <sunilkumar.dora@windriver.com>,
 <Deepesh.Varatharajan@windriver.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260904130447.1762441-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260904130447.1762441-1-Deepesh.Varatharajan@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 10:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245631

On Fri Sep 4, 2026 at 3:04 PM CEST, Deepesh via lists.openembedded.org Vara=
tharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Backport six commits from upstream glibc to fix CVE-2026-6238.
>
> 4ba0b79b95 resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
> a7b60d23bb resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
> cd0db208d5 resolv: Check for inet_ntop failure in ns_sprintrrf
> d58415eb17 resolv: Improve formatting of unknown records in ns_sprintrrf
> f69b7f95e3 resolv: Fix ns_sprintrrf formatting of class, type values (bug=
 34289)
> 360f352c9a resolv: Declare __p_class_syms, __p_type_syms for internal use
>
> The upstream patch series [PATCH 0/5] contains five commits:
>   1/5: Update GLIBC-SA-2026-0012 to mention A6 records (doc only)
>   2/5: resolv: Check for inet_ntop failure in ns_sprintrrf
>   3/5: resolv: Remove incorrect parts of TSIG handling from ns_sprintrrf
>        (CVE-2026-5435)
>   4/5: resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
>   5/5: resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
>
> For this backport:
> - Patch 1/5 is skipped (documentation-only change to advisories,
>   upstream glibc itself does not backport this to older releases)
> - Patch 3/5 (CVE-2026-5435) is already patched in scarthgap sources
> - Patches 2/5, 4/5, and 5/5 are backported as:
>   0028-CVE-2026-6238-0004.patch (inet_ntop failure check)
>   0029-CVE-2026-6238-0005.patch (buffer overread fix - CVE-2026-6238)
>   0030-CVE-2026-6238-0006.patch (test case for bug 34033, bug 34069)
>
> However, the test case (tst-ns_sprintrr) from patch 5/5 failed on
> scarthgap's glibc 2.39 due to missing prerequisite commits. Three
> additional patches were backported to resolve the test failure:
>   0025-CVE-2026-6238-0001.patch (Declare __p_class_syms, __p_type_syms fo=
r internal)
>   0026-CVE-2026-6238-0002.patch (Fix ns_sprintrrf formatting of class, ty=
pe values)
>   0027-CVE-2026-6238-0003.patch (Improve formatting of unknown records in=
 ns_sprintrrf)
>
> CVE-2026-6238 fixes buffer overreads in ns_sprintrrf affecting A6 and
> LOC record handling. The vulnerable LOC record handling was introduced
> before glibc 2.0, while A6 record handling was added in glibc 2.7.
>
> Reference:
> https://inbox.sourceware.org/libc-alpha/cover.1777546194.git.fweimer@redh=
at.com/
> https://nvd.nist.gov/vuln/detail/CVE-2026-6238
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D34069
>
> Testing Results:
>              Before    After    Diff
> PASS         4896      4897     +1
> XPASS        4         4         0
> FAIL         372       372       0
> XFAIL        16        16        0
> UNSUPPORTED  224       224       0
>
> Changes in testcases:
>
> testcase-name                                before  after
> resolv/tst-ns_sprintrr(new)                    -     PASS
>
> commit - 4ba0b79b95 resolv: Add test case tst-ns_sprintrr (bug 34033, bug=
 34069)
> +PASS: resolv/tst-ns_sprintrr
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  .../glibc/glibc/0025-CVE-2026-6238-0001.patch |  56 +++
>  .../glibc/glibc/0026-CVE-2026-6238-0002.patch |  80 ++++
>  .../glibc/glibc/0027-CVE-2026-6238-0003.patch |  55 +++
>  .../glibc/glibc/0028-CVE-2026-6238-0004.patch |  70 ++++
>  .../glibc/glibc/0029-CVE-2026-6238-0005.patch |  66 +++
>  .../glibc/glibc/0030-CVE-2026-6238-0006.patch | 379 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.39.bb         |   6 +
>  7 files changed, 712 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001=
.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002=
.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003=
.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004=
.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005=
.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006=
.patch

Hello,

Out of curiosity, did we try to send these backports to upstream? I'd be
more confortable keeping the "update along the upstream maintained
branch" idea we had until now.

The 2.39 branch has not seen updates since 8 weeks so it looks like they
finally stopped maintaining it, but I've not found an anounce, did you?

In the meantime, I'll keep reviewing those.

Thanks!
--=20
Yoann Congal
Smile ECS

