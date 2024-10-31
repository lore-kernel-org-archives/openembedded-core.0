Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8F7D767FA
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 20:32:50 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.22658.1730406760778146318
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 13:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TJuma2Fd;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so1440020e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 13:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730406759; x=1731011559; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gmo1iQnE/nCpAne0Yg7bOc+0AMqGq1kyEKqYxXVxU8=;
        b=TJuma2FdFag381zQrxpAJrHABiBMY8ZQp1fDCX45Vp/BlsdPFtzJK7809D0sJ1+KS+
         dR7EIVXd0RtkAJHbPJHUmZvQLgVcF3L9hElvitJumx9s8D6Mpyy4e6j1bsinLaqX45z6
         eeh7+UOD7dYAk5yPxnnIegjsKjZQQclolSc8n5yTefWWBvj71woBPOWdb0ao8K3TSO7T
         aausxhk8blZrPXQ6qKSyn+dZH5I0mK/DFxg0dqqRhTwo9Qd/SSlSutvvAQnib7HsiV14
         SwHSIxF6zzS0ZzgHrDGwA/nfwvOJzRWPUF9gTgiePJ435R8wHI0WvkHIERFjn5uwoGYI
         S6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730406759; x=1731011559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gmo1iQnE/nCpAne0Yg7bOc+0AMqGq1kyEKqYxXVxU8=;
        b=EVA3nMfqbkWXw9rRRD1slcJQdBzxJlhc/GEqU/EyhTIq2AoL0z6voHEgdl94MpTusC
         PCr7/2UVw3ka7uCbcv6sdCylmPe3iA+Hz3G0WwLChJwn/51kxTcNgt5ys72VYOWZDpLS
         ea1hAzyV6GJSNafAALlHpx7oyxUg/YiWDAtu6Q5uu2rQ/CyNmGvBpx1mujTU27+HQjl7
         2Z/1YlfHog7toU2o+qQFKCqcOgiwtgmiBxMoHQ8abVBgR0YlKkGUdL3zaWfO432ujF1r
         Ff8Rr8Pfg0AwXnAYQ702O55cJ5RqxP965U+0WWSV9YlCX7jF3IqAjvQgnhkLvs3n7wuj
         KrCw==
X-Gm-Message-State: AOJu0Yy8QLB/0bvcYp+2ialmwzFuXbZmps8vVYWzd1CPWh5KeqhcCLSG
	tHPwcZf/d7XiV/ipk6KxLUYKJ05CSZenBbXPJCc+I12wXL9D93p9F6TIfob3+IuX66E4InYNDuN
	5bhFkR3wjEZio+1xbvm4vk0/cFwZZTB4P
X-Google-Smtp-Source: AGHT+IFg7T2s/3oKicxC63pUS/QF6wlMo5aZO+vqCk9GpZbl5b++SD0GTN3Dx0jNW066OjyBa/RlViMakOWI0jkIVdE=
X-Received: by 2002:a05:6512:3b1e:b0:539:f37f:bed9 with SMTP id
 2adb3069b0e04-53b348c38d4mr10679410e87.8.1730406758565; Thu, 31 Oct 2024
 13:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241030050745.3702603-1-hongxu.jia@windriver.com> <20241030050745.3702603-5-hongxu.jia@windriver.com>
In-Reply-To: <20241030050745.3702603-5-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 31 Oct 2024 14:32:26 -0600
Message-ID: <CAJdd5GaDjXTY610RKYD0yRTt=XhQk9+_9d11EEMv7MwHfhcC_A@mail.gmail.com>
Subject: Re: [oe-core][PATCH V3 4/6] create-spdx-{2.2,3.0}: fix do_create_spdx
 dependency while spdx include sources
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 20:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206592

LGTM

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Tue, Oct 29, 2024 at 11:07=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.c=
om> wrote:
>
> Call function ${@create_spdx_source_deps(d)} or ${create_spdx_source_deps=
(d)}
> along with addtask not working, use task do_create_spdx flag 'depends'
> to instead
>
> Move function create_spdx_source_deps to spdx-common.bbclass for both of
> create-spdx-2.2.bbclass and create-spdx-3.0.bbclass
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass |  5 ++++-
>  meta/classes/create-spdx-3.0.bbclass | 19 ++++---------------
>  meta/classes/spdx-common.bbclass     | 21 +++++++++++++++++++++
>  meta/lib/oe/spdx_common.py           |  4 ++++
>  4 files changed, 33 insertions(+), 16 deletions(-)
>
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
> index cd1d6819bf..27242ecf70 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -584,7 +584,10 @@ addtask do_create_spdx_setscene
>
>  do_create_spdx[dirs] =3D "${SPDXWORK}"
>  do_create_spdx[cleandirs] =3D "${SPDXDEPLOY} ${SPDXWORK}"
> -do_create_spdx[depends] +=3D "${PATCHDEPENDENCY}"
> +do_create_spdx[depends] +=3D " \
> +    ${PATCHDEPENDENCY} \
> +    ${@create_spdx_source_deps(d)} \
> +"
>
>  python do_create_runtime_spdx() {
>      from datetime import datetime, timezone
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index 5f0590198f..bc23d2d211 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -132,22 +132,8 @@ addtask do_create_spdx after \
>      do_collect_spdx_deps \
>      do_deploy_source_date_epoch \
>      do_populate_sysroot do_package do_packagedata \
> -    ${create_spdx_source_deps(d)} \
>      before do_populate_sdk do_populate_sdk_ext do_build do_rm_work
>
> -def create_spdx_source_deps(d):
> -    deps =3D []
> -    if d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1":
> -        deps.extend([
> -            # do_unpack is a hack for now; we only need it to get the
> -            # dependencies do_unpack already has so we can extract the s=
ource
> -            # ourselves
> -            "do_unpack",
> -            # For kernel source code
> -            "do_shared_workdir",
> -        ])
> -    return " ".join(deps)
> -
>  SSTATETASKS +=3D "do_create_spdx"
>  do_create_spdx[sstate-inputdirs] =3D "${SPDXDEPLOY}"
>  do_create_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
> @@ -159,7 +145,10 @@ addtask do_create_spdx_setscene
>
>  do_create_spdx[dirs] =3D "${SPDXWORK}"
>  do_create_spdx[cleandirs] =3D "${SPDXDEPLOY} ${SPDXWORK}"
> -do_create_spdx[depends] +=3D "${PATCHDEPENDENCY}"
> +do_create_spdx[depends] +=3D " \
> +    ${PATCHDEPENDENCY} \
> +    ${@create_spdx_source_deps(d)} \
> +"
>
>  python do_create_package_spdx() {
>      import oe.spdx30_tasks
> diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
> index cd9cc0db98..ad02da5cd6 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -39,6 +39,27 @@ SPDX_CUSTOM_ANNOTATION_VARS ??=3D ""
>
>  SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
>
> +def create_spdx_source_deps(d):
> +    import oe.spdx_common
> +
> +    deps =3D []
> +    if d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1":
> +        pn =3D d.getVar('PN')
> +        # do_unpack is a hack for now; we only need it to get the
> +        # dependencies do_unpack already has so we can extract the sourc=
e
> +        # ourselves
> +        if oe.spdx_common.has_task(d, "do_unpack"):
> +            deps.append("%s:do_unpack" % pn)
> +
> +        if oe.spdx_common.is_work_shared_spdx(d) and \
> +           oe.spdx_common.process_sources(d):
> +            # For kernel source code
> +            if oe.spdx_common.has_task(d, "do_shared_workdir"):
> +                deps.append("%s:do_shared_workdir" % pn)
> +
> +    return " ".join(deps)
> +
> +
>  python do_collect_spdx_deps() {
>      # This task calculates the build time dependencies of the recipe, an=
d is
>      # required because while a task can deptask on itself, those depende=
ncies
> diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
> index 1ea55419ae..7a85579f64 100644
> --- a/meta/lib/oe/spdx_common.py
> +++ b/meta/lib/oe/spdx_common.py
> @@ -226,6 +226,10 @@ def get_patched_src(d):
>          d.setVar("WORKDIR", workdir)
>
>
> +def has_task(d, task):
> +    return bool(d.getVarFlag(task, "task", False)) and not bool(d.getVar=
Flag(task, "noexec", False))
> +
> +
>  def fetch_data_to_uri(fd, name):
>      """
>      Translates a bitbake FetchData to a string URI
> --
> 2.25.1
>

