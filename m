Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9886DC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 05:42:56 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.5981.1714714975647929201
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 22:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UJJWHULu;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5e8470c1cb7so6001863a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 22:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714714975; x=1715319775; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0xtYkeNJuZM6F6cog7KFXQn881i4NZnSWcfCs7jLYw=;
        b=UJJWHULu0MRhPo1mK7sxLW3z+YYaTnt+r05oajCgRCF5DSW98yZnRJ5cvQYAf0dMXr
         HAYWFPUGfUIBpuBQxjw4mxw3NPw0PlytmL0hZ/1PJmSXom5aF0ndR5koFVs1knfwRtko
         4qMzssMMgKpl6anDJSceOneCDhVq3OqDOePY0R+BKmo5T0kjUmMVmtAIph3AHyV94Jjx
         CKKoa1H2NzX2gKyhcQpFbM7pXzyf3BNff4JNuO0okTVJoZKG29BpNXOCo5DE9jlBcSwW
         RVgDb6pq6IgQb7gskmzoQbyBB/oavieCRyjFDcB4GHglUohBHI8046DcwJEyMFJX3SGa
         jsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714714975; x=1715319775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0xtYkeNJuZM6F6cog7KFXQn881i4NZnSWcfCs7jLYw=;
        b=aZ1zNCVJvlXoxVviXWygcUMTSF1AT4c+iu82yRH7K7TOKOugyh8ohT/a5QvcxFgUMP
         vxBzgoF4baaJKoSjiRx2VVAeM1gX3F6kuvmcFxpljMpCSDXP5zsFJDFgoPq2F+sxPS4A
         5alrJftsyRPvWdGYTD0cLHhlzpxbPxLRfsDb+ZxBWXpM8kvRF83jUKq2PV4LAwUHVMJk
         Zu4H1QgzGhb7MQXm46j5TaqGKQ3PT9Ukzxv0REqE/yTc1FE+1Gp1poq+HCejpIfEeQja
         eTxgDWHxBcRokpzJI7sEFBUk8nNQEAWm264rdmi/i+xNarJraVXca+wk4wZxNCR96eNG
         V2bQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0XmBMJVQ6+MAJWnz2UikOvS7vL5npmuxlquDRBTEyLj4ACx8K9nlDPbC7zVUhTjxqc9ZoyBlea4Sqf7EvxgAsde4IGU+EvEn3jWH5ti2YZ+kQcdEISR/K
X-Gm-Message-State: AOJu0YwpT4JpG9eYX9WBvzouBHUuhrEHngRCmuDCAVTWt4087hCbh9J+
	tsVd6M4vC4IunUEVdohHZ+iKoHi9VNHDKzH4vn2iA8NyiaGXjlnZPNRnsOoPbW2b0qFH6PMwJdR
	M7TjtR1h+J8zIbYrgH3VLcOLtDDH3p6fa
X-Google-Smtp-Source: AGHT+IEqSmkkjQoE7CXzCivzmYuAPZ+GBqFzXA8S1mRFOM3PgXofEbfBfVdbzY7KInN/QtO0I1EfSAZ/lBQvRRzVq+U=
X-Received: by 2002:a05:6a20:970f:b0:1aa:583d:6a72 with SMTP id
 hr15-20020a056a20970f00b001aa583d6a72mr1708530pzc.56.1714714974864; Thu, 02
 May 2024 22:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1714703667.git.bruce.ashfield@gmail.com> <fd6e4f80902a641f397ac02aa3de486aa2dcd137.1714703667.git.bruce.ashfield@gmail.com>
In-Reply-To: <fd6e4f80902a641f397ac02aa3de486aa2dcd137.1714703667.git.bruce.ashfield@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 3 May 2024 07:42:43 +0200
Message-ID: <CAApg2=R-fUrVcD3Fb1gvozynwCJE-pW+7=erXFUG7iW0npFPqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/12] linux-yocto/6.6: update CVE exclusions (6.6.24)
To: bruce.ashfield@gmail.com, yocto-security@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 05:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198966

Hello Bruce et al,
For information, the linux_kernel_cves repo has now a banner "This
repository has been archived by the owner on May 2, 2024. It is now
read-only. ",
so I guess this is the last update.

Greg has scripting for statistics of the new process, haven't looked
into them yet.

Regards,
Marta

On Fri, May 3, 2024 at 4:40=E2=80=AFAM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Data pulled from: https://github.com/nluedtke/linux_kernel_cves
>
>     1/1 [
>         Author: Nicholas Luedtke
>         Email: nicholas.luedtke@uwalumni.com
>         Subject: Update 25Feb24
>         Date: Sun, 25 Feb 2024 07:03:08 -0500
>
>     ]
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/cve-exclusion_6.6.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.6.inc
> index bb9ba49c48..133cab88a3 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
> @@ -1,9 +1,9 @@
>
>  # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
> -# Generated at 2024-03-28 16:40:04.102652+00:00 for version 6.6.23
> +# Generated at 2024-04-04 03:23:25.421265+00:00 for version 6.6.24
>
>  python check_kernel_cve_status_version() {
> -    this_version =3D "6.6.23"
> +    this_version =3D "6.6.24"
>      kernel_version =3D d.getVar("LINUX_VERSION")
>      if kernel_version !=3D this_version:
>          bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198933): https://lists.openembedded.org/g/openembedde=
d-core/message/198933
> Mute This Topic: https://lists.openembedded.org/mt/105881317/5827677
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ry=
bczynska@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

