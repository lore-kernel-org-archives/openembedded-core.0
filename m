Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE3AE83063
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 08:30:03 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12144.1770107400613708521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 00:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sA6wpaLp;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4359a316d89so3977581f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 00:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770107399; x=1770712199; darn=lists.openembedded.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version
         :subject:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqx/W1xNg6wQmg0g8EV/P3b1BSV/g24UQ+9+7czU1Ws=;
        b=sA6wpaLpf0de1Jw9z+wOeoE39gDus7+fNNPEJJG198YhRCvrjCcSFcn/MtSk7QSkfw
         Og13rYq16McacdFeLQJl5ftTwMQ2R/se4p6sPsyggZuJuEhFWHmG9RmpkR1jo5wNa/NW
         lvkMjBznYxUTgkYdx1QIQ2tADX06xTt5pX+Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770107399; x=1770712199;
        h=in-reply-to:references:content-transfer-encoding:mime-version
         :subject:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vqx/W1xNg6wQmg0g8EV/P3b1BSV/g24UQ+9+7czU1Ws=;
        b=mzTeQ2K/kPXVdCTd7Q3/hok+XpL3ESb8qMPsO8c+wjhSdFwUBhoA4s/BJnJhxF+Ehf
         atC9f3mRuWx+mz0lh7p5IsFApMSl1T5hvjm9MGZKS3Mi0zHYdwxkOcYG6QKuO+M4E9Wa
         X0PM/Q3powzlaW6HcDqS+Fj8DaBM19I1q+sP/ky8iLj1BfJVh6mmfnPs61y4xq8D7vFL
         HUlscO6qqGjhlzoCfPp606Bi5MI4kfhDxhiokJAMin5rVxzalv+cf6Y51N2ygLY3UoDg
         f2y+rE7FKj8eSjtoONBtg4lsC0nAjsJzy3iGEHTTWWqIBgf98CfUuKT7b3YpbaboM4bq
         pAsA==
X-Forwarded-Encrypted: i=1; AJvYcCWH30Z5jD7SITfflvIxefROsGjxIUqU72c38W/VKlt6qRUPnGgjbecnmO9njm28F4HNWo2wKzlbeWa9FCmxotdFsA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyVG71NTm7K0mNx/ExnI0HKNRr8lr0gfXBPCq4hzVvGbH3E04Q1
	xgKKGdTrd3ni+A3l2OrOXKv6FUDm6CeZZYJks1aNn6FYZ1ux2q7MW7g2mtxHHcAMpNzopbrBwYr
	bQmIMjM0=
X-Gm-Gg: AZuq6aIEtpZlEIbg8k2+aNvdi6V0H1ICXRD8FF815Mm2r1TyiRmYMq2ChQ+hU9/yhU2
	VbjKbFe9ocPq+Hxz1uPDabx3NH/JN6Y8q7tr9/AFSDYHcPVdERvQssoJsx3Oskep7h4jQj2XKhC
	BWrXWFqm0vBnJjFETS0uEEObyVOZjWpH8sEFiYPIrwCd9nnEDxede6U7aMx619V35U0It3hx5VT
	E0ra+IeL3mdP2KzU6Wo4amcj21qsSUHemWHipbkMtIYL3H+0ohPuuk+xCJDf7VbqBih3IaSAZjd
	k3yAobABG5xelK3kevGnZmk6XESXGjzRXdUYwkzOup09RWOx/WfgYvbYmCgTQ6WE3PX1uw5GJy6
	QYsoek/00VguX9iiVpvhGa63dN0FIWjOtE6E0V6wZOPIh30eeDhHXPMeaiMjQ63YxT9PR/UeRbQ
	VAd9ZiTTCPXEH/FU/AjLHYtUrNoOsorkETv1vKRvCQXoN45vG/EsHrFuTrmvXPKjFz0oUJ1gSrO
	1U=
X-Received: by 2002:a05:6000:186a:b0:432:7d2a:2be4 with SMTP id ffacd0b85a97d-435f3ab35b1mr19639122f8f.60.1770107398786;
        Tue, 03 Feb 2026 00:29:58 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm53056363f8f.33.2026.02.03.00.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 00:29:58 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 09:29:58 +0100
Message-Id: <DG56PCMQ9NI1.13P2LDOX6H825@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [Whinlatter][PATCH v2] binutils: Upgrade to 2.45.1 release
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.0
References: <20260203040418.4155081-1-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260203040418.4155081-1-Hemanth.KumarMD@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 08:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230420

On Tue Feb 3, 2026 at 5:04 AM CET, Hemanth.KumarMD wrote:
> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
> Brings binutils 2.45.1 release and followed by latest commits from 2.45 b=
ranch:
>
> 12d0a1dbc1b i386: Add GLIBC_ABI_GNU_TLS dependency only if used
> e3a18893e1c LoongArch: Use more appropriate assertions for the relocation=
 of TLS LE
> b136efd10a7 Re: dlltool memory leaks
> b4bde11f310 ld: Don't use -mdirect-extern-access for LoongArch
> a813a6a6ea0 Re-enable development on the 2.45 branch
> 48324fde1e2 (tag: binutils-2_45_1) This is the 2.45.1 release
> ab776bc8685 lto: Set plugin_format to bfd_plugin_no only if known_used is=
 set
> cec7ab85f24 aarch64: gas: Allow movprfx with fmmla and bfscale [PR gas/33=
562]
> 0b040187894 aarch64, gas: Relax Armv9.6-A mandatory feature set
> 4df2be75910 i386: Add GLIBC_ABI_GNU_TLS version dependency
> 71c1de4b0c8 x86-64: Add GLIBC_ABI_DT_X86_64_PLT version dependency
> b0fe5c23780 x86: Add GLIBC_ABI_GNU2_TLS version dependency
> d5945a221ff x86: Copy non_got_ref_without_indirect_extern_access
>
> Testing Results:
> +-------------------------------+--------+--------+------+
> | Metric                        | Before | After  | Diff |
> +-------------------------------+--------+--------+------+
> | Expected passes               | 317    | 317    | 0    |
> | Unexpected failures           | 1      | 1      | 0    |
> | Untested testcases            | 5      | 5      | 0    |
> | Unsupported tests             | 8      | 8      | 0    |
> +-------------------------------+--------+--------+------+
>
> ld/configure is regenerated.
>
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---
>  .../binutils/binutils-2.45.inc                |    6 +-
>  ...-system-directories-when-cross-linki.patch |   38 +-
>  .../binutils/0008-Use-libtool-2.4.patch       | 1827 ++++++++---------
>  3 files changed, 836 insertions(+), 1035 deletions(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/reci=
pes-devtools/binutils/binutils-2.45.inc
> index 16a63cabc5..6e0d8cfa7d 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.45.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
> @@ -12,8 +12,8 @@ LIC_FILES_CHKSUM =3D "\
> =20
>  # When upgrading to next major release, ensure that there is no trailing=
 .0, so
>  # that upstream version check can work correctly.
> -PV =3D "2.45"
> -CVE_VERSION =3D "2.45"
> +PV =3D "2.45.1+git"
> +CVE_VERSION =3D "2.45.1"
>  SRCBRANCH ?=3D "binutils-2_45-branch"
> =20
>  UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d_?)*)"
> @@ -21,7 +21,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(=
\d_?)*)"
>  CVE_STATUS[CVE-2025-7545] =3D "cpe-stable-backport: fix available in use=
d git hash"
>  CVE_STATUS[CVE-2025-7546] =3D "cpe-stable-backport: fix available in use=
d git hash"
> =20
> -SRCREV ?=3D "2f028c6bb163a045db95439fb92e1dcbc919413c"
> +SRCREV ?=3D "b1300fdc25572ab9f523249aea2363f844f47957"

Hello,

Sorry, I did not noticed earlier but that would put whinlatter ahead of
master on the binutils recipes (there is at least one "meaningful" commit).
Can you send this upgrade to master first? (And request a backport after
that)

Also, you may want to send the backport request for the 2.45.1 upgrade
on master:
https://git.openembedded.org/openembedded-core/commit/?id=3Def0f7ed49bb5338=
0c218dd529bcf25c5b6681223

Thanks!

--=20
Yoann Congal

