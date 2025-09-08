Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391D7CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 15:35:03 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.747.1757345698676471543
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 08:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=A9nwiUJl;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.169, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-ea00ea11152so1057944276.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 08:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1757345698; x=1757950498; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOaJWINWA5yQ5wReYe++OqNRpMMO9haLj6tEN8Cibzc=;
        b=A9nwiUJlo/obwxkUAbIht4jadzeJrLHr6b3S9ptBVF+mOHtnBzMdqJgxep7N8LHfQS
         CckXxAnYCDtjC6hpnziJeU/82i3ODGztKwmKIlbqkNigzSmBegvXr0lUeZkZRHNSFHoK
         hmBLVZBf63poBvGbn4xtSryg5b/eMXSkT6yu5ScQO6eGZvb7sqmTl8jMvDfH0JG2Blm2
         7RkWQMXfhgEEZbsxgwHs7NvdJ7t/FOQ1I72U1AUhIZ6TSrZYhjxjLMurfZt2/fDRlXDt
         wT/csRkxHRnhy2w3F7DcYebeCnb+2Qkhsq8rdtuoc/FO5hYjQS8L2s+j+wIodTFPwWwR
         PgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757345698; x=1757950498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOaJWINWA5yQ5wReYe++OqNRpMMO9haLj6tEN8Cibzc=;
        b=sG6cU/avcuge6qakx7oudnco6U6mn3k+T0G66Zh6Kb5lvQ+UHa8agIPuLLMyvysslS
         LOo3lPblcWf2jErAuQf3U7CEAf4QAdgiHu0WAy0a0ambo5Up7kXkC5JBGv5eKckr923f
         7DgFWzsSaOutTMQFkKLjEJZ4sx11/YyjFz2iBGH22Z2cJNfNdtHex8dgGw6IAtmFnEAK
         D5G6q5vxE0vusdVf1utDyqqrYEQhMgC5KPm2uwJFLYkHmwpF2V+GQ9zPFXShu/xPGnYh
         D0q4pj/xfhIfyCP7CrlCpC5GBHjGLtpNWZ4CAcHcru+BObWSpABpkUt0gIwbrhEmdVQ3
         r/mw==
X-Gm-Message-State: AOJu0YzjXJwxHLZ3ypR2Gv5dvXpxtq9up7xqfFvZtgaBdTAdwPecirrI
	ujbG51SOCAjjl0AQUUr3ZZRrEHkIylxhNSZ3Q/FY0p4SzC3lSYcbsgp/4jKds6diLmwIzieYmWR
	pCIXOpMa0Ua9PvIwNP+99pdy0xcZsaDoEgvZhD8eg8/bNkr2Qg8Iw
X-Gm-Gg: ASbGnctm0bpJM38fi8g4ZRZUXW8qqoBUc/9qXOSiGM7sXm5sFWxnIvMA1lYxs5qSCPV
	84K7tbxc/q31KPAhFwGVITu+LkIiZCHLmBsFAOYvEb5JJBXmQfFf7HIHLqLqDP82WX0m//KOton
	vy5z5dk4au3G+nnSGTEZI02kPJV4DO3RzdFZxfpr3GYR2y4+AzYvE5JwltGCvO6BtTChGTbs0S0
	Qa0+qWQ189OVaMpFoLPn8wsW/BFruThgFwKFB4=
X-Google-Smtp-Source: AGHT+IF8Ag3AM0+MMWsQQIJuTsCyzfaii3bxp+MW0+BeYYZWRLrgM16sizA+oPSd6WVjb69f3KBUt9j3NyWFQH6hVvY=
X-Received: by 2002:a05:6902:708:b0:ea1:d9fa:4621 with SMTP id
 3f1490d57ef6-ea1d9fa4771mr3283885276.21.1757345697556; Mon, 08 Sep 2025
 08:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250908024455.634404-1-jinfeng.wang.cn@windriver.com>
In-Reply-To: <20250908024455.634404-1-jinfeng.wang.cn@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 8 Sep 2025 08:34:46 -0700
X-Gm-Features: Ac12FXxxDD-ntOqzxNsRvVjuzukPaS-vy56sxiULeV7nFwKKlUBNtqN4Vk-Jdlo
Message-ID: <CAOSpxdZHjHSeJm0WscXGw5m7gbCyFgPyKKZiG9jZ5rH21B1UbA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] systemtap: Fix task_work_cancel build
To: Jinfeng.Wang.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 15:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223071

Is this also an issue on master or walnascar?  Or has this been fixed
with a version bump in those branches?

Thanks!

Steve

On Sun, Sep 7, 2025 at 7:45=E2=80=AFPM Wang, Jinfeng (CN) via
lists.openembedded.org
<Jinfeng.Wang.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>
> Backport a patch to fix:
>  107 |         twork =3D task_work_cancel(task, func);
>       |                                        ^~~~
>       |                                        |
>       |                                        task_work_func_t {aka void=
 (*)(struct callback_head *)}
> /work/rad/wrs/wrl-systemtap-demo/qemux86-64-std-23p17/build/tmp-glibc/wor=
k/x86_64-linux/systemtap-native/4.8-r0/recipe-sysroot-native/usr/share/syst=
emtap/runtime/stp_task_work.c:107:40: note: expected 'struct callback_head =
*' but argument is of type 'task_work_func_t' {aka 'void (*)(struct callbac=
k_head *)'}
> /work/rad/wrs/wrl-systemtap-demo/qemux86-64-std-23p17/build/tmp-glibc/wor=
k/x86_64-linux/systemtap-native/4.8-r0/recipe-sysroot-native/usr/share/syst=
emtap/runtime/stp_task_work.c:13:26: error: incompatible types when assigni=
ng to type 'struct callback_head *' from type 'bool' {aka '_Bool'}
>    13 | #define task_work_cancel (* (task_work_cancel_fn)kallsyms_task_wo=
rk_cancel)
>       |                          ^
> /work/rad/wrs/wrl-systemtap-demo/qemux86-64-std-23p17/build/tmp-glibc/wor=
k/x86_64-linux/systemtap-native/4.8-r0/recipe-sysroot-native/usr/share/syst=
emtap/runtime/stp_task_work.c:107:17: note: in expansion of macro 'task_wor=
k_cancel'
>   107 |         twork =3D task_work_cancel(task, func);
>       |                 ^~~~~~~~~~~~~~~~
>
> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> ---
>  ...sk_work-compatible-with-6.11-kernels.patch | 103 ++++++++++++++++++
>  .../recipes-kernel/systemtap/systemtap_git.bb |   1 +
>  2 files changed, 104 insertions(+)
>  create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Make-stp=
_task_work-compatible-with-6.11-kernels.patch
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Make-stp_task_w=
ork-compatible-with-6.11-kernels.patch b/meta/recipes-kernel/systemtap/syst=
emtap/0001-Make-stp_task_work-compatible-with-6.11-kernels.patch
> new file mode 100644
> index 0000000000..62a8dafa9b
> --- /dev/null
> +++ b/meta/recipes-kernel/systemtap/systemtap/0001-Make-stp_task_work-com=
patible-with-6.11-kernels.patch
> @@ -0,0 +1,103 @@
> +From 317669e7b44bc2688253f5ab9641c308f30566bc Mon Sep 17 00:00:00 2001
> +From: Martin Cermak <mcermak@redhat.com>
> +Date: Wed, 24 Jul 2024 16:47:42 +0200
> +Subject: [PATCH] Make stp_task_work compatible with 6.11 kernels
> +
> +Update systemtap runtime so that it works with kernel commit
> +68cbd415dd4b task_work:
> +
> +s/task_work_cancel()/task_work_cancel_func()/
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dsystemtap.git=
;a=3Dcommit;h=3Da64dc4e2e0195ca80c6509df511a42459b40e9af]
> +
> +Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> +---
> + buildrun.cxx                                  |  1 +
> + .../linux/autoconf-task_work_cancel_func.c    |  3 +++
> + runtime/linux/runtime.h                       |  2 +-
> + runtime/stp_task_work.c                       | 21 ++++++++++++++-----
> + 4 files changed, 21 insertions(+), 6 deletions(-)
> + create mode 100644 runtime/linux/autoconf-task_work_cancel_func.c
> +
> +diff --git a/buildrun.cxx b/buildrun.cxx
> +index 816842072..4c528b1b1 100644
> +--- a/buildrun.cxx
> ++++ b/buildrun.cxx
> +@@ -396,6 +396,7 @@ compile_pass (systemtap_session& s)
> +   output_exportconf(s, o2, "__module_text_address", "STAPCONF_MODULE_TE=
XT_ADDRESS");
> +   output_exportconf(s, o2, "add_timer_on", "STAPCONF_ADD_TIMER_ON");
> +   output_autoconf(s, o, cs, "autoconf-514-panic.c", "STAPCONF_514_PANIC=
", NULL);
> ++  output_autoconf(s, o, cs, "autoconf-task_work_cancel_func.c", "STAPCO=
NF_TASK_WORK_CANCEL_FUNC", NULL);
> +
> +   output_dual_exportconf(s, o2, "probe_kernel_read", "probe_kernel_writ=
e", "STAPCONF_PROBE_KERNEL");
> +   output_autoconf(s, o, cs, "autoconf-hw_breakpoint_context.c",
> +diff --git a/runtime/linux/autoconf-task_work_cancel_func.c b/runtime/li=
nux/autoconf-task_work_cancel_func.c
> +new file mode 100644
> +index 000000000..0d460de6c
> +--- /dev/null
> ++++ b/runtime/linux/autoconf-task_work_cancel_func.c
> +@@ -0,0 +1,3 @@
> ++#include <linux/task_work.h>
> ++
> ++void* c =3D & task_work_cancel_func;
> +diff --git a/runtime/linux/runtime.h b/runtime/linux/runtime.h
> +index a5840794a..acb32d584 100644
> +--- a/runtime/linux/runtime.h
> ++++ b/runtime/linux/runtime.h
> +@@ -246,7 +246,7 @@ static void *kallsyms_uprobe_get_swbp_addr;
> + static void *kallsyms_task_work_add;
> + #endif
> + #if !defined(STAPCONF_TASK_WORK_CANCEL_EXPORTED)
> +-static void *kallsyms_task_work_cancel;
> ++static void *kallsyms_task_work_cancel_fn;
> + #endif
> +
> + #if !defined(STAPCONF_TRY_TO_WAKE_UP_EXPORTED) && !defined(STAPCONF_WAK=
E_UP_STATE_EXPORTED)
> +diff --git a/runtime/stp_task_work.c b/runtime/stp_task_work.c
> +index 0dd3095b6..4818fecbf 100644
> +--- a/runtime/stp_task_work.c
> ++++ b/runtime/stp_task_work.c
> +@@ -3,14 +3,25 @@
> +
> + #include "linux/task_work_compatibility.h"
> +
> ++// Handle kernel commit 68cbd415dd4b9c5b9df69f0f091879e56bf5907a
> ++// task_work: s/task_work_cancel()/task_work_cancel_func()/
> ++#if defined(STAPCONF_TASK_WORK_CANCEL_FUNC)
> ++#define TASK_WORK_CANCEL_FN task_work_cancel_func
> ++#else
> ++#define TASK_WORK_CANCEL_FN task_work_cancel
> ++#endif
> ++
> ++#define STRINGIFY(x) #x
> ++#define TOSTRING(x) STRINGIFY(x)
> ++
> + #if !defined(STAPCONF_TASK_WORK_ADD_EXPORTED)
> + // First typedef from the original decls, then #define as typecasted ca=
lls.
> + typedef typeof(&task_work_add) task_work_add_fn;
> + #define task_work_add(a,b,c) ibt_wrapper(int, (* (task_work_add_fn)kall=
syms_task_work_add)((a), (b), (c)))
> + #endif
> + #if !defined(STAPCONF_TASK_WORK_CANCEL_EXPORTED)
> +-typedef typeof(&task_work_cancel) task_work_cancel_fn;
> +-#define task_work_cancel(a,b) ibt_wrapper(struct callback_head *, (* (t=
ask_work_cancel_fn)kallsyms_task_work_cancel)((a), (b)))
> ++typedef typeof(&TASK_WORK_CANCEL_FN) task_work_cancel_fn;
> ++#define task_work_cancel(a,b) ibt_wrapper(struct callback_head *, (* (t=
ask_work_cancel_fn)kallsyms_task_work_cancel_fn)((a), (b)))
> + #endif
> +
> + /* To avoid a crash when a task_work callback gets called after the
> +@@ -35,9 +46,9 @@ stp_task_work_init(void)
> +         }
> + #endif
> + #if !defined(STAPCONF_TASK_WORK_CANCEL_EXPORTED)
> +-        kallsyms_task_work_cancel =3D (void *)kallsyms_lookup_name("tas=
k_work_cancel");
> +-        if (kallsyms_task_work_cancel =3D=3D NULL) {
> +-              _stp_error("Can't resolve task_work_cancel!");
> ++        kallsyms_task_work_cancel_fn =3D (void *)kallsyms_lookup_name(T=
OSTRING(TASK_WORK_CANCEL_FN));
> ++        if (kallsyms_task_work_cancel_fn =3D=3D NULL) {
> ++                _stp_error("Can't resolve %s!", TOSTRING(TASK_WORK_CANC=
EL_FN));
> +               return -ENOENT;
> +         }
> + #endif
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipe=
s-kernel/systemtap/systemtap_git.bb
> index 68f5c76428..c2874516f4 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> @@ -9,6 +9,7 @@ require systemtap_git.inc
>  SRC_URI +=3D " \
>             file://0001-improve-reproducibility-for-c-compiling.patch \
>             file://0001-staprun-address-ncurses-6.3-failures.patch \
> +           file://0001-Make-stp_task_work-compatible-with-6.11-kernels.p=
atch \
>             "
>
>  DEPENDS =3D "elfutils"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223057): https://lists.openembedded.org/g/openembedde=
d-core/message/223057
> Mute This Topic: https://lists.openembedded.org/mt/115124766/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

