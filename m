Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 345927E5AE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 18:45:41 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id e184so20667088ite.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 11:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GR8ChvanHYBdRfdL76Nv6dEuhXAOBwd+woA5wV89Jg0=;
	b=txHDhV2FgbFOHULeZHmovtmkx5wPWl8QdKtaT6W8nVT4MKNnN7vgoys5TvFao0jjYu
	+9H6FIMTkOx/nMfI1y0iWjvrW6iEwN/XH+9dZf4yFwfmX93TzHpRcmn8sWFVfP1V+z0v
	/aQods7oiQBZBtyOm1NYx8EySq/AGX6n7KC5dZhSzXMooPyYNRgD0TsOUuwoyANHtMQu
	5RwNQ3vvBLrTTW3VH9EbwkZbPo5qaHHYoW4/UjDbbERzHVGefcxdvCdbUbcnOZH0o8wc
	1ZEaa+FwQj0LoC3Q+HZbinJLehJ6Ppnmsw3VP9u8w7Pm/rBT37o6UnbwhYiKN6kqsCZO
	eeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GR8ChvanHYBdRfdL76Nv6dEuhXAOBwd+woA5wV89Jg0=;
	b=IOsmR0MSpvblB5E0nJnSDPJ1X8KHbfUWk+v0xayrfA3RM5zSbr+lqwHU27iiKzG2pZ
	MAr9jMc7pqi1ILRmTWy+chI9FEkP+2+4XvHsTf8vP1+y37ZQ8AJxee9ts55kt0GpEIWw
	7+EYSlQ9icJo2dN+Godbex5ORTTOtZ3Z1tOO3HMl6+2xAM6gVtGYSXkF5exrkUFIosb4
	SrB5Z99XFrXzOpoMoKJOvS95VsejDZRdNZJ18SyZvQiIgEMAZxNvwfj9p34oE7G25amO
	fkoe/SSruI5lu1XG8qjyHyVEyBI848ld49ZiWUBqvcCiCcEt48qoTOSf2ckc1oR49gtY
	JN3g==
X-Gm-Message-State: APjAAAWWuzGtFv7Sv+3DGQKmHADme7XcmEB3DZl4swLGM8LBjd40jYV2
	vs1hqLu5aF92cZ63FUOP+wI=
X-Google-Smtp-Source: APXvYqyXLyi7bGJgF+GuSJQLzT4qQSmOtzSmmTtbflTZ8xIEOoRPAZsTt3dwQMXtrpISXLUl8/EzXA==
X-Received: by 2002:a24:6292:: with SMTP id
	d140mr11523011itc.132.1559414741814; 
	Sat, 01 Jun 2019 11:45:41 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	s70sm4101756itb.16.2019.06.01.11.45.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jun 2019 11:45:41 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sat,  1 Jun 2019 14:45:39 -0400
Message-Id: <20190601184539.15436-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.0: fix systemtap on arm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Jun 2019 18:45:41 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The following commit is part of 5.0.17+:

    ARM: fix function graph tracer and unwinder dependencies

    [ Upstream commit 503621628b32782a07b2318e4112bd4372aa3401 ]

    Naresh Kamboju recently reported that the function-graph tracer crashes
    on ARM. The function-graph tracer assumes that the kernel is built with
    frame pointers.

    We explicitly disabled the function-graph tracer when building Thumb2,
    since the Thumb2 ABI doesn't have frame pointers.

    We recently changed the way the unwinder method was selected, which
    seems to have made it more likely that we can end up with the function-
    graph tracer enabled but without the kernel built with frame pointers.

    Fix up the function graph tracer dependencies so the option is not
    available when we have no possibility of having frame pointers, and
    adjust the dependencies on the unwinder option to hide the non-frame
    pointer unwinder options if the function-graph tracer is enabled.

    Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
    Tested-by: Masami Hiramatsu <mhiramat@kernel.org>
    Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

As such, we no longer have UNWINDER_ARM enabled in our ARM builds by
default, since we do have FUNCTION_GRAPH_TRACER enabled in the common
ftrace configuration.

We disable FUNCTION_GRAPH_TRACER for ARM, which allows UNWINDER_ARM to
remain enabled and hence systemtap work out of the box for our ARM
reference builds. Obviously, BSPs or other users of the fragments can
make a different decision, but we chose unwinder to be on by default.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

If you apply this on top of my latest consolidated pull request, system
should work out of the box again:

   root@qemuarm:~# stap --disable-cache -DSTP_NO_VERREL_CHECK ./hello.stp
   WARNING: Kernel function symbol table missing [man warning::symbols]
   [ 1721.562007] Kprobes globally unoptimized
   [ 1721.617209] stap_2107: loading out-of-tree module taints kernel.
   hello world

Bruce


 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 2249feb9fe..e1d2b2e9ac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "9c1e84c9b81b6bf1df55f26f2e0517266c37f7eb"
-SRCREV_meta ?= "d4b67d66fd9d40e4ec149500f57b991c83362a17"
+SRCREV_meta ?= "ff7928637fcdf5a7176a2f735f8cb21cd0f4b219"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 0c240708df..7024d7017f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "fabee455f397ba8054f35a3ad5f2250bbad93bef"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "d4b67d66fd9d40e4ec149500f57b991c83362a17"
+SRCREV_meta ?= "ff7928637fcdf5a7176a2f735f8cb21cd0f4b219"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 0510187197..214e83bd33 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemux86-64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemumips64 ?= "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "d4b67d66fd9d40e4ec149500f57b991c83362a17"
+SRCREV_meta ?= "ff7928637fcdf5a7176a2f735f8cb21cd0f4b219"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


