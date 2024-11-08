Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40173D5E158
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 10:43:24 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.9890.1731062598475260424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 02:43:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hLwfJjKl;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53a0c160b94so2216475e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 02:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731062597; x=1731667397; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EF7MYmyn1ecng/2cUCCt4iMUEhu9KVpniFzln5GiuSk=;
        b=hLwfJjKldoAf+UgaKr222JWdwQet+w+K3qUeIDdqQey2BcFx/RqxgBjKaAspugCdyx
         n9IuhfdZgTChg66AXsW3yzvNSbQtQqqrLLucqrmHDyiAtyrRwokawJQSsw6ocd38PpLW
         gLru1sodFvqwL00wRtl5bge4+NOw+deDGxu/iHQYirI7CfBP3o9ur8Aca+iCkvhqGqyT
         j3cEWjrUi4MYShnUJKsjUNDtbDv4aVSp9/SPdC1S+J6l0faHY6gPpak8hw8+galjOW6B
         ah5xPd7R818nou9Qnt8cRMuVk9s3M2XgPU0bD5ftj6W6g1pUt50JWCFk54Fo+nHtpqnW
         BL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731062597; x=1731667397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EF7MYmyn1ecng/2cUCCt4iMUEhu9KVpniFzln5GiuSk=;
        b=nDSvTJwjwSGzFxqizdSUslSswFd7Bzfg9uEiuFxU8V3YYKbDXsCENZ5itsa246QRQ2
         EnH5O2o/1JAhgj2uv3e6/zL7rgPWR6s6EvncDxz2KjcjpiCkXSpKAe/d8OE8K5lXQta8
         AGa+Zlh/OhYiZJgQmlaCMhL4Kj7bE1xZfyFUnKutpu+cwojUKyPFBcAYKzlDUTHScq9w
         v4PijZ3jXIJ2ptn3FtPKS7aJ6f3Wt2A7zB1eaw+VALnEDJ10monZK3cT4gH7N+JWvsjs
         iGSWHYXDmbjZ6AvFXndSyB6qjz4NwtP5RUgRPY5IYN9XUf2J0B8jIGe5+LfXX+zbyofT
         dzPQ==
X-Gm-Message-State: AOJu0YyMFHIchUIoZKP28o45bBH7iiXhdSedNLOrpKlv+gjhr80MAbyr
	/NJjIe6MqYs57j883J43E0GYO5WuNrj8WyXNG5bvvwfEixFLBjw1IY0dy6motNw7hq3Snkgjjgm
	ksUtjDtw7He0IogwRbdOhSMGbDbJpAw==
X-Google-Smtp-Source: AGHT+IHjRUzXEnvDbuTQBYo5MQq5UtMdBvSCfJjIwPVzlEcn2Qxk2OiKNffmaho5ms8jPPvpq/sKIYnJ9cgarlXGxjY=
X-Received: by 2002:a05:6512:4013:b0:536:55cf:3148 with SMTP id
 2adb3069b0e04-53d862c578fmr1117547e87.31.1731062596048; Fri, 08 Nov 2024
 02:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20241108021018.1236970-1-bin.lan.cn@windriver.com>
In-Reply-To: <20241108021018.1236970-1-bin.lan.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Nov 2024 11:43:04 +0100
Message-ID: <CANNYZj9_REchGE7GyQg-TjmOmd3ENo88zP=MBUPYyMiHUWsd6A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] doc/examples/Makefile.am: adds library search
 paths and linker rpath-link
To: bin.lan.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 10:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206861

This seems to replace a submitted lttng-ust patch with a backport, and
so you should delete the original patch and add the new one, instead
of editing the original. Also 'Upstream-Status: Not applicable' is not
a valid status, and the commit header should say: 'lttng-ust: backport
patch to fix ..."

Alex

On Fri, 8 Nov 2024 at 03:10, Bin Lan via lists.openembedded.org
<bin.lan.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>
> There is the following error when building doc/examples/cmake-multiple-sh=
ared-libraries:
> /usr/bin/ld: warning: liblttng-ust-common.so.1, needed by ../../../src/li=
b/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-li=
nk)
> /usr/bin/ld: warning: liblttng-ust-tracepoint.so.1, needed by ../../../sr=
c/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpat=
h-link)
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_add_fd_to_tracker'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_urcu_after_fork_child'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_common_ctor'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_tp_init'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_tp_probe_register_queue_release'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_cancelstate_disable_pop'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_urcu_synchronize_rcu'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_urcu_register_thread'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_tp_probe_prune_release_queue'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_cancelstate_disable_push'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_urcu_before_fork'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_lock_fd_tracker'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_trace_clock'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_urcu_has_sys_membarrier'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_unlock_fd_tracker'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_tp_exit'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_get_cpu_sym'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_common_alloc_tls'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_urcu_after_fork_parent'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_delete_fd_from_tracker'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_urcu_register'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_urcu_reader'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_urcu_gp'
> /usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined =
reference to `lttng_ust_tp_probe_unregister_queue_release'
> collect2: error: ld returned 1 exit status
>
> This change set adds library search paths and linker rpath-link are set
> for both the standard and cmake examples.
>
> Upstream-Status: Not applicable
> Backport patch: https://github.com/lttng/lttng-ust/commit/5d10459b6b5182f=
cbc98240d9dace026c87a5037
>
> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> ---
>  .../0001-Makefile.am-update-rpath-link.patch  | 70 +++++++++++++++++--
>  1 file changed, 65 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-=
rpath-link.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-upd=
ate-rpath-link.patch
> index 6aca8f85fa..cdf5cb70d8 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-l=
ink.patch
> +++ b/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-l=
ink.patch
> @@ -14,20 +14,80 @@ Upstream-Status: Submitted [https://github.com/lttng/=
lttng-ust/pull/61]
>
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
>
> +
> +doc/examples/Makefile.am: adds library search paths and linker rpath-lin=
k
> +
> +There is the following error when building doc/examples/cmake-multiple-s=
hared-libraries:
> +/usr/bin/ld: warning: liblttng-ust-common.so.1, needed by ../../../src/l=
ib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-l=
ink)
> +/usr/bin/ld: warning: liblttng-ust-tracepoint.so.1, needed by ../../../s=
rc/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpa=
th-link)
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_add_fd_to_tracker'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_urcu_after_fork_child'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_common_ctor'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_tp_init'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_tp_probe_register_queue_release'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_cancelstate_disable_pop'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_urcu_synchronize_rcu'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_urcu_register_thread'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_tp_probe_prune_release_queue'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_cancelstate_disable_push'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_urcu_before_fork'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_lock_fd_tracker'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_trace_clock'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_urcu_has_sys_membarrier'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_unlock_fd_tracker'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_tp_exit'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_get_cpu_sym'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_common_alloc_tls'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_urcu_after_fork_parent'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_delete_fd_from_tracker'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_urcu_register'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_urcu_reader'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_urcu_gp'
> +/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined=
 reference to `lttng_ust_tp_probe_unregister_queue_release'
> +collect2: error: ld returned 1 exit status
> +
> +This change set adds library search paths and linker rpath-link are set
> +for both the standard and cmake examples.
> +
> +Upstream-Status: Not applicable
> +Backport patch: https://github.com/lttng/lttng-ust/commit/5d10459b6b5182=
fcbc98240d9dace026c87a5037
> +
> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> +
>  ---
> - doc/examples/Makefile.am | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + doc/examples/Makefile.am | 13 ++++++++++---
> + 1 file changed, 10 insertions(+), 3 deletions(-)
>
>  diff --git a/doc/examples/Makefile.am b/doc/examples/Makefile.am
> -index 57782cc..d46caa6 100644
> +index aebf63bd..79766ec0 100644
>  --- a/doc/examples/Makefile.am
>  +++ b/doc/examples/Makefile.am
> -@@ -167,7 +167,7 @@ all-local:
> +@@ -169,7 +169,10 @@ all-local:
>                                 CFLAGS=3D'$(CFLAGS)' \
>                                 AM_CFLAGS=3D'$(AM_CFLAGS)' \
>                                 LDFLAGS=3D"$(LDFLAGS)" \
>  -                              AM_LDFLAGS=3D'$(AM_LDFLAGS) -L../../../sr=
c/lib/lttng-ust/.libs -Wl,-rpath=3D"$(PWD)/../../src/lib/lttng-ust/.libs/" =
-Wl,-rpath-link=3D"$(PWD)/../../src/lib/lttng-ust/.libs/"' \
> -+                              AM_LDFLAGS=3D'$(AM_LDFLAGS) -L../../../sr=
c/lib/lttng-ust/.libs -Wl,-rpath=3D"$(PWD)/../../src/lib/lttng-ust/.libs/" =
-Wl,-rpath-link=3D"$(PWD)/../../src/lib/lttng-ust/.libs/:$(PWD)/../../src/l=
ib/lttng-ust-tracepoint/.libs:$(PWD)/../../src/lib/lttng-ust-common/.libs/"=
' \
> ++                              AM_LDFLAGS=3D'$(AM_LDFLAGS) -L../../../sr=
c/lib/lttng-ust/.libs -L../../../src/lib/lttng-ust-common/.libs -L../../../=
src/lib/lttng-ust-tracepoint/.libs \
> ++                              -Wl,-rpath=3D"$(abs_top_builddir)/src/lib=
/lttng-ust/.libs/" \
> ++                              -Wl,-rpath-link=3D"$(abs_top_builddir)/sr=
c/lib/lttng-ust-common/.libs/" \
> ++                              -Wl,-rpath-link=3D"$(abs_top_builddir)/sr=
c/lib/lttng-ust-tracepoint/.libs/"' \
>                                 LTTNG_GEN_TP_PATH=3D"$$rel_src_subdir$(to=
p_srcdir)/tools/" \
>                                 AM_V_P=3D"$(AM_V_P)" \
>                                 AM_V_at=3D"$(AM_V_at)" \
> +@@ -222,10 +225,14 @@ all-local:
> +                                       CXX=3D"$(CXX)" \
> +                                       $(CMAKE) \
> +                                       -DCMAKE_INCLUDE_PATH=3D"$(abs_top=
_srcdir)/include;$(abs_top_builddir)/include" \
> +-                                      -DCMAKE_LIBRARY_PATH=3D"$(abs_top=
_builddir)/src/lib/lttng-ust/.libs" \
> ++                                      -DCMAKE_LIBRARY_PATH=3D"$(abs_top=
_builddir)/src/lib/lttng-ust/.libs;$(abs_top_builddir)/src/lib/lttng-ust-co=
mmon/.libs;$(abs_top_builddir)/src/lib/lttng-ust-tracepoint/.libs" \
> +                                       -DCMAKE_C_FLAGS=3D"$(AM_CFLAGS) $=
(CPPFLAGS) $(CFLAGS)" \
> +                                       -DCMAKE_CXX_FLAGS=3D"$(AM_CXXFLAG=
S) $(CXXFLAGS) $(CPPFLAGS)" \
> +-                                      -DCMAKE_EXE_LINKER_FLAGS=3D"$(AM_=
LDFLAGS) $(LDFLAGS)" \
> ++                                      -DCMAKE_EXE_LINKER_FLAGS=3D"$(AM_=
LDFLAGS) $(LDFLAGS) \
> ++                                      -L../../../src/lib/lttng-ust/.lib=
s -L../../../src/lib/lttng-ust-common/.libs -L../../../src/lib/lttng-ust-tr=
acepoint/.libs \
> ++                                      -Wl,-rpath=3D$(abs_top_builddir)/=
src/lib/lttng-ust/.libs/ \
> ++                                      -Wl,-rpath-link=3D$(abs_top_build=
dir)/src/lib/lttng-ust-common/.libs/ \
> ++                                      -Wl,-rpath-link=3D$(abs_top_build=
dir)/src/lib/lttng-ust-tracepoint/.libs/" \
> +                                       .. && \
> +                               $(MAKE) \
> +                       ) || exit 1; \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206853): https://lists.openembedded.org/g/openembedde=
d-core/message/206853
> Mute This Topic: https://lists.openembedded.org/mt/109456988/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

