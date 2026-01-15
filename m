Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B3ED4661E
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 19:49:58 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3512.1768506594317373806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 11:49:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mR2YAXPo;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-45c889aba0dso799121b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 11:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768506593; x=1769111393; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1VZMDdZ8oNUQ7mcL7TD27XHkCtOa2HX+ZHPrttr2g0=;
        b=mR2YAXPoRbsFavEIMypSbULY7Fnu/3BZZ8gDAQ9Ys40mzXIEuzI1j32/kviosSs5I0
         jnTRHKB3LOnNwohnUuJV9PjQWJRlSO37Y2Jjrd+iiHn/kL4QfwzXGlWgjWyMfLDN4+zc
         eQxf/xUtwRHyKro9DbBgjQG5t7AMGuEqdUGyPIaQB6rEeSfMqtovPKDskHeX0kc+F4cJ
         9ptz3fGfcR914slZJyt5A8TR6cY2zk0vtRQ57kgbv7I/2tnU008AuwzHojVNOpWaFECw
         Kvh2fzDVhCFhJ794yqRmIZqd2WPl0ZL5WAmKZwZiquCZh0jwk+RaEnf7bbpfRSyEcA4r
         03rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768506593; x=1769111393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B1VZMDdZ8oNUQ7mcL7TD27XHkCtOa2HX+ZHPrttr2g0=;
        b=jQccBG1asJQ+PqoQQBb2aKA+n7ncwJbyxVT2oDsk2HzgSAyU+WmgQRpGeKPIzFyIDm
         olbrf3l4c+AtNbyvhoUWyA7BIPx+Py7f0DQXNVwYbtzqp8FMnliHnie+LNJAUMqybYsx
         w94jnNgNHGQVocSrzXnsLMLMv6B2dkQi+xx8tTiwhDF2IHZ0CgmhEYgCsX1q8pX0rla2
         KEHXwPCbom9ZZ+DwLup3fXJoWt+bS/ce+xDyrnIF7b2qpway8fPl4s1KaTMd80lP2uPI
         VR9V5DzXjUyEQylcTCE6FrJimpJ+ZR+wQcSPC1M4B6QlWLUqXhaZDGKa/KmI9pERfvNg
         Y9jg==
X-Gm-Message-State: AOJu0YwhpRfHw1XoatgveZcfl0K6efEPWKo+G73YF/2vGWQB7MogWvp2
	qQWY/oJ4ntJ2EGOZegjSpVb/9OebPgrQNRgmLg/PgSdVVCLADy6WXc04XlKX3VkxQqDXPKhKpCQ
	5XWTzJm/PFLSfW83O63NMRh1F74h8aXc9T0wq
X-Gm-Gg: AY/fxX6IQg7zknG7/yb1/c8ASTzXcK0yCfWGnXD4sNkg15uwQP8zorH+j46OopqF+Z+
	aGVXs0XiydG9NA6yOqE2egDMIYeraZIIZJw3UARF7f5UkA/YyRhqMLIW1B1y9/0TYb5U5K6uc5m
	ugng++b8beMLH/2VrEIqMofYcqWJFtQ7m/OmMIK5NWwVs6Nquwl26y+WA6s+vZaO6l9HtqPOfUE
	7W3Z1unUKW9Zvx+O2t95AUJAXfzZzZr7pq8NJiUox1uzrHMjd+mW0RE+ia6r05XHmhCuZefc9vK
	venfXws=
X-Received: by 2002:a05:6808:6c93:b0:453:7403:888f with SMTP id
 5614622812f47-45c8816f3c6mr2617571b6e.28.1768506593515; Thu, 15 Jan 2026
 11:49:53 -0800 (PST)
MIME-Version: 1.0
References: <20260115190331.2276779-1-valentin.boudevin@gmail.com>
In-Reply-To: <20260115190331.2276779-1-valentin.boudevin@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 16 Jan 2026 08:49:40 +1300
X-Gm-Features: AZwV_Qho-Srlklz8qG556gQ939tGCCv4_y9UQtekUrlyG725u2F4G2AspLJPCH4
Message-ID: <CADySD0Fov-=8PnT=Y2hEHz+JLMcmfgYfOfjWW_XT69arWo9-Cg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 0/4] generate-cve-exclusions: Add a new bbclass
To: valentin.boudevin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 19:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229437

On Fri, Jan 16, 2026 at 8:03=E2=80=AFAM vboudevin via lists.openembedded.or=
g
<valentin.boudevin=3Dgmail.com@lists.openembedded.org> wrote:
>
> Changes since v3:
> - Patch 2/4:
>   * Add variables to control offline mode, source URI and
>   SRCREV for deterministic testing (GENERATE_CVE_EXCLUSIONS_SRC_URI,
>   GENERATE_CVE_EXCLUSIONS_SRCREV, GENERATE_CVE_EXCLUSIONS_NETWORK).
>   * Updated generate_cve_exclusions task scheduling to be executed before
>   do_cve_check.
>
> Changes since v2:
> - Patch 4/4: Inherit the new bbclass in linux-yocto.inc instead of
>   individual recipes.
>
> Changes since v1:
> - Patch 2/4: Removed the mandatory execution of the
>   generate-cve-exclusions class on every build. It now needs to be
>   manually run using:
>     bitbake -c generate-cve-exclusions <kernel-recipe>

I think it will be good to update documentation as well mentioning new
variables and the step

https://docs.yoctoproject.org/dev/ref-manual/variables.html
https://docs.yoctoproject.org/dev/dev-manual/vulnerabilities.html

> ValentinBoudevin (4):
>   generate-cve-exclusions: Add --output-json option
>   generate-cve-exclusions: Add a .bbclass
>   generate-cve-exclusions: Move python script
>   linux: Add inherit on generate-cve-exclusions
>
>  meta/classes/generate-cve-exclusions.bbclass  | 97 +++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto.inc     |  3 +
>  .../contrib}/generate-cve-exclusions.py       | 64 +++++++++---
>  3 files changed, 150 insertions(+), 14 deletions(-)
>  create mode 100644 meta/classes/generate-cve-exclusions.bbclass
>  rename {meta/recipes-kernel/linux =3D> scripts/contrib}/generate-cve-exc=
lusions.py (71%)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229427): https://lists.openembedded.org/g/openembedde=
d-core/message/229427
> Mute This Topic: https://lists.openembedded.org/mt/117285139/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

