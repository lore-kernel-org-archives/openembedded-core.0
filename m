Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97652C4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 16:26:08 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.443.1784305560962566169
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 09:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KmAwPRMb;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-475417f010dso4363941f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 09:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784305559; x=1784910359; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fK4ABNwrhwCyDZwpm7QheTSZK030gWBOb8K8K/YDVQE=;
        b=KmAwPRMbMtTKIfyaYIFwl7Hj4Tul3/NG7ukFTYyiBMS0iWubSa4ab+tPuy3SG+FpdI
         Jq8PxW0CL+ctoEvszyLvE+YaOCoCGIJDUF4UNncW0fPJwvBmc7/VszyhC2A+hGTh/5qO
         Mh9GL0nv+8+CDY6YXSvwMtYdijG6Zi2QAydHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784305559; x=1784910359;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fK4ABNwrhwCyDZwpm7QheTSZK030gWBOb8K8K/YDVQE=;
        b=PfQ+j+A+8n1wxTHYtpQzEXl8uLWZrMWFLxJPaPbNsx79UtF+XKx7F9t5tQ/zDOdXIC
         sV1m5PCKyKAQ4qxkonUsApoa0VbzMS91Y2n17Ngq/6O8eDg1PdvZ0nbH2kq8tg2YpPlP
         qq0eDAWWI6qy/chmRh9Lc2M96KTbagRsx3tNHrnuVa2fBFFfpcwjOOa0Mvstdxh0NNz/
         hvMmDQrnNG0Xyt0F0N50gjj+z9I7y8dBCLbJQUN1LiUtjV5oRR4VR1DssbWReP72vAmf
         IZqfx5eUaBbdtyatAdQpZ6bWqgEgUMSUkCZfslFmTwYGJJM6JHRjUQOBgePr0xNYgdPg
         walw==
X-Forwarded-Encrypted: i=1; AHgh+RqZLFdUF0HIJlMjTRBCSUTjRKQF42QXKKLWJiWlAR3CIvZ8Zbnvm0RaxsSLrXOar591Fn7fmC6kwYpwrUu5z5eF2Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyC9DhqTN0bxQ8FkHbh5IIRwnT4Du+B8OiDytwtGKytVsyS8FlE
	1hBrEOYYxFjKqx7u1S6s8QYOTuB4pMlAumbnrD9AJm7kBDJr8H43hpRdT0bvY5x8DTQ=
X-Gm-Gg: AfdE7cnExzHQ4jyWl3FwxqzXPMWdovIKFGuaF2W6+DpkUGMGiclJUeXaCp8vfc900I+
	3Ht1HWRiXD/Q0yLX5sLIuaNdH/UxniUbC8MJvSB7Bvpl6DXItVo7m6GT091LVJOQ6P5NlbylVfa
	EzhrWFKUocwEa0EDJMQeFhzXk3zKAfFSGjGtuECi/Uh+Hgk17HX+G7cz+seG9Fsa53Vke9Fk4Lm
	Ap5aX/0MvESb+AAX4kozfTbPCOc1EfulPP0PbndrXJyrjgv1vsFWxZJMFYo3CGpv7fOMMlMPKRe
	aHcDwtSpvt0jrGEK3HdlCSN4aLG7Fjuz/0N8VftkGN76AcF0vx4BkqmxPTzAG324+v3+HApMi+u
	Xehj2hvyUKkMMZrWyFzIfr1T8EjeOh1luK2g3aKmYrGF/yN3BbwCwfhaL3nS6EOm86xsGXKe8w2
	b9bEvQZ0JTBDeURIPWRURn4Eyo0BTUXl5qEBlQMTtG1cvdyWiiTZdvAM0G29HYgZ6Exhw=
X-Received: by 2002:a05:6000:2083:b0:472:3090:d878 with SMTP id ffacd0b85a97d-47f623075abmr4263869f8f.4.1784305559140;
        Fri, 17 Jul 2026 09:25:59 -0700 (PDT)
Received: from localhost (2a01cb001331aa0093f4151e9fe9f4b8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:93f4:151e:9fe9:f4b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edcf8dsm5505921f8f.27.2026.07.17.09.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 09:25:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 18:25:58 +0200
Message-Id: <DK0ZJ5IO54TT.CA3QAFDIJBI9@smile.fr>
Subject: Re: [scarthgap][PATCH] glibc: stable 2.39 branch updates
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260708120108.73199-1-jaipaul.cheernam@est.tech>
 <DU7PPF66507B2D7CF934D9C435C88A84E13F3C62@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <DU7PPF66507B2D7CF934D9C435C88A84E13F3C62@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 16:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241217

On Fri Jul 17, 2026 at 6:01 PM CEST, Jaipaul Cheernam wrote:
>
> Hi Yoann,
>
> May I know did you get a chance to review this patch and another patch fo=
r glibc from me ?

Not yet, but it is in the review list, I'll get to it (next week
probably).

FYI, scarthgap merge is directly slowed down by this bug:
15289 =E2=80=93 [scarthgap] AB-INT: sstatetests.SStatePrintdiff.test_gcc_ru=
ntime_vs_gcc_source failure
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15289#c41
... as an example as to why the project is asking for help fixing the
AB-INT issues.

Regards,

>
> Regards,
> Jaipaul
>
> ________________________________
> From: Jaipaul Cheernam
> Sent: Wednesday, July 8, 2026 2:01 PM
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Cc: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> Subject: [scarthgap][PATCH] glibc: stable 2.39 branch updates
>
> git log --oneline ce65d944e38a20cb70af2a48a4b8aa5d8fabe1cc..be1e627cd72db=
31161a3b4ce1c8114674f0895eb
> be1e627cd7 Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if unde=
fined (bug 33921)
> 98bc06a361 include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h
> 3e13579841 Use pending character state in IBM1390, IBM1399 character sets=
 (CVE-2026-4046)
> 0dc95ae109 elf: parse /proc/self/maps as the last resort to find the gap =
for tst-link-map-contiguous-ldso
> 9344c796f7 resolv: Check hostname for validity (CVE-2026-4438)
> 5663ab0b83 resolv: Count records correctly (CVE-2026-4437)
> c53cd6e738 posix: Run tst-wordexp-reuse-mem test
> 2760e4c5ed iconvdata: Fix invalid pointer arithmetic in ANSI_X3.110 modul=
e
> ba29a36aa3 posix: Fix invalid flags test for p{write,read}v2
> 60b039bf6a socket: Add new test for shutdown
>
> Testing Results:
>              Before    After    Diff
> PASS         4892      4896     +4
> XPASS        4         4         0
> FAIL         371       372      +1
> XFAIL        16        16        0
> UNSUPPORTED  224       224       0
>
> Changes in testcases:
>
> testcase-name                                before  after
> posix/tst-wordexp-reuse-mem(new)               -     PASS (native)
>
> [Note: posix/tst-wordexp-reuse-mem is a new test added by this uplift
> (c53cd6e738). It fails under QEMU user-mode because the test-wrapper
> cannot support LD_PRELOAD and MALLOC_TRACE needed for mtrace. Running
> natively with LD_PRELOAD=3Dlibc_malloc_debug.so confirms the test passes
> with no memory leaks.
>
> nptl/tst-getpid3 is a flaky test under QEMU user-mode (passes 7/10
> re-runs). No nptl code was changed in this uplift.]
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  meta/recipes-core/glibc/glibc_2.39.bb     | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index 03a8e5d01e..5d57dafed0 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.39/master"
>  PV =3D "2.39+git"
> -SRCREV_glibc ?=3D "ce65d944e38a20cb70af2a48a4b8aa5d8fabe1cc"
> +SRCREV_glibc ?=3D "be1e627cd72db31161a3b4ce1c8114674f0895eb"
>  SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
> diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/gl=
ibc/glibc_2.39.bb
> index 7958d64eed..f6be1b5fc9 100644
> --- a/meta/recipes-core/glibc/glibc_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc_2.39.bb
> @@ -18,7 +18,8 @@ easier access for another. 'ASLR bypass itself is not a=
 vulnerability.'"
>
>  CVE_STATUS_GROUPS +=3D "CVE_STATUS_STABLE_BACKPORTS"
>  CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2024-2961 CVE-2024-33599 CVE-2024-3=
3600 CVE-2024-33601 CVE-2024-33602 CVE-2025-0395 \
> -    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058 CVE-2025-15281 CVE-2026-08=
61 CVE-2026-0915"
> +    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058 CVE-2025-15281 CVE-2026-08=
61 CVE-2026-0915 \
> +    CVE-2026-4046 CVE-2026-4437 CVE-2026-4438"
>  CVE_STATUS_STABLE_BACKPORTS[status] =3D "cpe-stable-backport: fix availa=
ble in used git hash"
>
>  DEPENDS +=3D "gperf-native bison-native"
> --
> 2.34.1


--=20
Yoann Congal
Smile ECS


