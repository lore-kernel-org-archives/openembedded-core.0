Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09300C982CF
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 11:38:07 +0000 (UTC)
Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37192.1789645082924828616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 04:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UfamwPIi;
 spf=pass (domain: smile.fr, ip: 74.125.225.106, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-482f6351832so415841f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 04:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789645081; x=1790249881; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nyk5Gl5f63Q/2hAnPT1w5+42zv7CDyXBIxvAuln2gyc=;
        b=UfamwPIiH0Yn2purLPUJQaCxuAIRoSkCbIQuu8dFRqaZrxwg27TTRthWhQaiD+Vwqc
         aPOB5DdzT8c0KlVt2IG1SxB/CYWP9f//O9WU8Y0wuk98MxjVnqP0RYmugDgE0IhMYZ3Y
         X5kZuexlU+hnaOisLEJRz0VjjymP/x95xixEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645081; x=1790249881;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nyk5Gl5f63Q/2hAnPT1w5+42zv7CDyXBIxvAuln2gyc=;
        b=tCU7B0wcfavbtI5X4+LKT1CnINvKZy9EmOXJsZKfLUOGBVKl81nUljLLK+uRBBE0nR
         Ex7bU6mOM6tNsG3gjuXAoIWLkwEbMbue5JeuInVVN6oH+pmli4IQ1BcDXYu2vyEG0Cyb
         rGTLlsC76dGw9Orc99L8SsOCtfqnfhnUvg+zDPUiHhtwxTNQFNNE08adVWC9BPalqwv0
         yl4afKGkZ7dWUyMXj2YLkLZQ3MomdnUc4UIoEiC/ySBZuNDNShvGKGqmJJMrWiK+ElS9
         yIQGGCQGljVsmhKcaJKXipUfGhRbsp06xkkhh95qH7sjwDeL+qZbutuXlcX1XjlDn/O/
         K2Zg==
X-Forwarded-Encrypted: i=1; AKwUvBwTzx8FrE/Zg3hsblk2KVxff32lhd6hwyAGUgleTxzGltrFj3m8xi2gdgRv7qxyx+7K6YTDQQtjrLBxZ6slcHR+hA==@lists.openembedded.org
X-Gm-Message-State: AFuF++mQkjpYtv6ssZr7hyo1hpHu65JesP4AHDihj4EVbLsTInhsl/Ie
	f3NlJV4qqfYn6RTWA/wk2LCAJey5+6HO12Zil75Lk812BxqqbtVSdSQKyV3zkD/O72s=
X-Gm-Gg: AYBFou3lBL200tivASrGGJAZbZEacxDx0EQLoeAFDtetVBDKXmJ7qOhEt4oW/poDRAf
	cnE/NqhlFpSCaH5fqFHMFS2i80bW2HOTKReBgrvOeT3lgVLYiqZfd4/pVXGKfNSL5upoQ4qrUB6
	iEkgEWA2oRAnbzJJAYhEu6cxBWIiwZcy+wh1XYoBHjDFvMgFPi0D2vs63LPwwcoYZjwArY9Y1PY
	KFOhCvGzJAXyK8+NBUnc0PVupnFI55t7Z+14i20nSIKhFOuLJeztWM76+z7fPjbhgKt+3bajJeC
	Tmy5yDfsmkOj8Rsckxw6ZAMqSQtUvaYr2H0MRarL0VYIMHG0bnkdSzvz155sYdGhOB6xESLY2Ni
	G18WWs8ca0EKg7QZgHJj3T//Dws/vraaJKnZq+zteqQcucuA1nHLB79PokdrQ9RUukNVD1JsRYL
	xEwVkjo4wqf6SBYnQYgQ9Ce9/eyA+jq23NCcnZuOsajUgvQ4933Dv62Y4ZnsT4bkjmV1BfXOe7b
	X6IGp/pkkL+7LsbpvE6bjKQHKWQznubkrleI04zb9a+aA5D3IByDGoI8YNvPvCNH7b2yTj9/A==
X-Received: by 2002:a05:6000:25c5:b0:487:9a9:6d24 with SMTP id ffacd0b85a97d-4870cf118d4mr8093976f8f.19.1789645081188;
        Thu, 17 Sep 2026 04:38:01 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fe7esm15198263f8f.6.2026.09.17.04.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 04:38:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 13:38:00 +0200
Message-Id: <DLHK8G1OWTE8.394FSK4TR0VS5@smile.fr>
Subject: Re: [OE-core][wrynose][patch] rsync: Security fixes from
 v3.4.1-sec-patches3
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260917105551.76512-1-vanusuri@mvista.com>
In-Reply-To: <20260917105551.76512-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 11:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246056

On Thu Sep 17, 2026 at 12:55 PM CEST, Vijay Anusuri via lists.openembedded.=
org wrote:
> Backport the security fixes from the upstream v3.4.1-sec-patches3
> branch to address the known rsync security vulnerabilities.
>
> The v3.4.1-sec-patches3 branch contains 239 commits. The GitHub
> workflow commits (037, 038, and 160), which only modify
> .github/workflows files, and the testsuite-only commits (238 and
> 239) are excluded because they are not applicable to the Yocto
> build.
>
> The remaining 237 security fixes are combined into a single patch
> series and applied on top of the rsync 3.4.1 source.
>
> SUSE has also backported these security fixes to rsync-3.4.1-160000.6.1
> to address the corresponding CVEs.
>
> References:
>
> https://rsync.samba.org/security.html
> https://github.com/RsyncProject/rsync/tree/v3.4.1-sec-patches3
> https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-53802
>
> This fix handles CVE-2025-10158 CVE-2026-29518 CVE-2026-43617 CVE-2026-43=
618 CVE-2026-43619 CVE-2026-43620 CVE-2026-45232 CVE-2026-44507 CVE-2026-44=
508 CVE-2026-44509 CVE-2026-44510 CVE-2026-53783 CVE-2026-53784 CVE-2026-53=
785 CVE-2026-53786 CVE-2026-53788 CVE-2026-53789 CVE-2026-53790 CVE-2026-53=
791 CVE-2026-53792 CVE-2026-53793 CVE-2026-53794 CVE-2026-53795 CVE-2026-53=
796 CVE-2026-53797 CVE-2026-53798 CVE-2026-53799 CVE-2026-53800 CVE-2026-53=
801 CVE-2026-53802 CVE-2026-53803 CVE-2026-70452 CVE-2026-70453 CVE-2026-70=
454 CVE-2026-70455 CVE-2026-70456 CVE-2026-70457 CVE-2026-70458 CVE-2026-70=
459 CVE-2026-70460 CVE-2026-70461 CVE-2026-70462 CVE-2026-70463 CVE-2026-70=
464
>
> Dropped CVE-2025-10158.patch
> Refreshed the patch 0001-Add-missing-prototypes-to-function-declarations.=
patch
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  ...-prototypes-to-function-declarations.patch |    81 +-
>  .../rsync/files/CVE-2025-10158.patch          |    36 -
>  .../files/rsync-3.4.1-sec-patches3.patch      | 34052 ++++++++++++++++
>  meta/recipes-devtools/rsync/rsync_3.4.1.bb    |     2 +-
>  4 files changed, 34071 insertions(+), 100 deletions(-)
>  delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patc=
h
>  create mode 100644 meta/recipes-devtools/rsync/files/rsync-3.4.1-sec-pat=
ches3.patch

Hello,

I don't think I want to carry a 34000 lines patch.

Does the rsync project released a v3.4.1-sec-patches3 archive?

If not, can we try to switch the recipe to git and point SRCREV to the
"rsync-3.4.1-sec-patches" branch?
Since the recipe is not git-based now, we'll need to switch to git
first, then upgrade.

Regards,
--=20
Yoann Congal
Smile ECS


