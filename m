Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32F6E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 16:44:29 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.25426.1736268265872283621
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 08:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UDOA+6/H;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ffd6af012eso212515431fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 08:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736268264; x=1736873064; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/8hI/QMOpI4iCzUC38DyUyDqQdV6mFg3xTPafev33M=;
        b=UDOA+6/HrK1h3ovA8Ybu+4Gc88cJBv6MXf+ERWBT4YxH9JCoqMOfFXFhiOUaG7J+Zq
         NkB963LMABw80Ul75rxmcbebf4MGn2gYpwlQSac0tF8KhRPHZrwp/xkSpNAA1/AjcALQ
         EvRjbrd7epewXHrcY6C66V/82tq+9/VMcf4+HjHZzlrSPDd+BH0D7Wyf2yPszYV4qg9I
         5LxQ2Mf+LMHzHEE3OWCJUcaZgSL47tHryhpALB3WmZYf3lBCUD8Ix+K+VqsX2F3lFAmj
         SPL8zc3VyuKuGvJC24UfGwZyx8T+QckendpPNUn7x0c2ufcU0rVvU/xjcMfwr+3LH5Pc
         r1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268264; x=1736873064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/8hI/QMOpI4iCzUC38DyUyDqQdV6mFg3xTPafev33M=;
        b=prHH902t3qN4uA8aWUnomS4mTK2jMpl/NvNMYVjvVTeZxxQ35X9+d101LRm/L9zg4P
         EoS/R48KNtjiDo0YAq7yH/xoy6IEx8kfgXeHloRnYbFfyCzgOheDuWcqqXCaf56GS/fT
         25dBVvXrAn2Fj8Mrr+Mh4/2C1qkcwHy7d68/MLiGH3ffdUudu1Y3zd8kVBdnLfl9lk/d
         dKyqUc4eqjdWB8p58K5UUzd8yF0lhW/wWnwq23OATBZGUcM1BEcWUEBjx9YZc1Pr+pK/
         GSfOQ0bycnAWmjFwMp6+f4KR3RfQL4/AiB3ggigZJU3EfQj7llceHaQ3E6lGGsZHUN6U
         KpDw==
X-Gm-Message-State: AOJu0YwZWiMpcTY9pqoqyWssXJa8AJa/F2sOWx/QZukEqbDdFS1tlP7x
	M3Hp1ns4osrXEn5c8eVCNFy9QQpEJFyLIYnMPkDeYJcLkPVGlov+VAcFNgigZU24u7//EnMnWK9
	2sbXl8JpzAIDfkmcUl6iR505SHEx5hg==
X-Gm-Gg: ASbGncsUsYRsb5/gF845JOALOj8H48Ns05F2SIEl8FyT8AtEQJD+xm3Ua8O+uY3TR4u
	LlZWaEUxmsHMyF4rIkmYsOOqiFKduurbYNi0U5+vbt8Jn726lGBm7
X-Google-Smtp-Source: AGHT+IERLLUWblVlgmDLYrVibClk5AVyjLeED0mFIoM7vfAYYSDgNVpPjsWkA0R6Vrsw0b9477tEo7uGbXp70p8BgmQ=
X-Received: by 2002:a2e:a98a:0:b0:300:15d9:c625 with SMTP id
 38308e7fff4ca-30468575296mr156286061fa.14.1736268263729; Tue, 07 Jan 2025
 08:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20241227061111.2086879-1-hongxu.jia@windriver.com>
In-Reply-To: <20241227061111.2086879-1-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 7 Jan 2025 09:44:10 -0700
X-Gm-Features: AbW1kva3mfkqB5sDxdJZRO9vgzF0_7hoCU8mxzt7tqm1nxDH4Mq8piZFc_sPV-c
Message-ID: <CAJdd5Gaz6WaRzm3ikZ33xXy_53O1trq4FvHz7fHBV4jB5-Qnrg@mail.gmail.com>
Subject: Re: [PATCH] meta/classes/create-spdx.bbclass: support to inherit SPDX
 class conditionally
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 16:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209478

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Thu, Dec 26, 2024 at 11:11=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.c=
om> wrote:
>
> In order to inherit SPDX class conditionally, using variable ${SPDX_CLASS=
}
> to inherit SPDX class other than original 'INHERIT:remove =3D "create-spd=
x"'
> and INHERIT +=3D "create-spdx-2.2"
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/create-spdx.bbclass     | 3 ++-
>  meta/lib/oeqa/selftest/cases/spdx.py | 8 ++------
>  2 files changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.=
bbclass
> index b604973ae0..35cd63f31e 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -5,4 +5,5 @@
>  #
>  # Include this class when you don't care what version of SPDX you get; i=
t will
>  # be updated to the latest stable version that is supported
> -inherit create-spdx-3.0
> +SPDX_CLASS ??=3D "create-spdx-3.0"
> +inherit ${SPDX_CLASS}
> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
> index f3b955ed2b..4789041a6a 100644
> --- a/meta/lib/oeqa/selftest/cases/spdx.py
> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
> @@ -24,8 +24,7 @@ class SPDX22Check(OESelftestTestCase):
>      def check_recipe_spdx(self, high_level_dir, spdx_file, target_name):
>          config =3D textwrap.dedent(
>              """\
> -            INHERIT:remove =3D "create-spdx"
> -            INHERIT +=3D "create-spdx-2.2"
> +            SPDX_CLASS =3D "create-spdx-2.2"
>              """
>          )
>          self.write_config(config)
> @@ -89,8 +88,7 @@ class SPDX3CheckBase(object):
>          config =3D (
>              textwrap.dedent(
>                  f"""\
> -                INHERIT:remove =3D "create-spdx"
> -                INHERIT +=3D "{self.SPDX_CLASS}"
> +                SPDX_CLASS =3D "create-spdx-3.0"
>                  """
>              )
>              + textwrap.dedent(extraconf)
> @@ -138,8 +136,6 @@ class SPDX3CheckBase(object):
>
>
>  class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
> -    SPDX_CLASS =3D "create-spdx-3.0"
> -
>      def test_base_files(self):
>          self.check_recipe_spdx(
>              "base-files",
> --
> 2.25.1
>

