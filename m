Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B386C98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 03:40:48 +0000 (UTC)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4025.1790134840374734066
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 20:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lhDqxa6f;
 spf=pass (domain: gmail.com, ip: 74.125.227.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98e1942dfso450978e0c.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 20:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134839; x=1790739639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKI9NC9ytXkXXwVJqB0fE0f6A0rCTSMr2Yl59HUT/7k=;
        b=lhDqxa6fAYtVb13h5u6qJ29pMNqrCKTyZiOhqk1NzF7bAtn1oSjmOCw3g9GgdaaMSE
         phevgzfCdPyCG9TiWyr214MXDj4K//WlqbvhPi6jFDhHNbTG+7EbFBzIdL2cAt0RdOA+
         MXgszC8nz91SSFbqM/deTwGjKQmgDLbKKb89JwT9y5OQR5WFqerp5Oj3d0jnd6lDjixI
         LXjDvcv87SM45ky2mSPTac0XNDheJo7drPD8Uf92QPURxvViQTk1f2hCjsgPQcyPaCP1
         Y3sv2CUsvktA5kbod3HdvM+mf2Uf+NO2HfbrwAN0S/RPs4YnUO7RLDuNz4rN669GcNmy
         NnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134839; x=1790739639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKI9NC9ytXkXXwVJqB0fE0f6A0rCTSMr2Yl59HUT/7k=;
        b=1/qWOC3G1xGV3AHNjZ6FoCQPZBcuNC6QJonkLQfjw9LgInF2G8891ebDZu0sprewDl
         piufHClB5CEWFwEuJyaZVbbYyyvRWJJYkIhJ/t2Bariw1GETSrXkcEtVh7j/AF/PWNTn
         q4oV/Kr4YX3SlVB4RcxNDkBx2NZgyWzp2nF1ED14eYcbvPeQpEcOLPFSziN2D2p7nSeX
         6E8vLlPqejN+eFseiIdETC6E8Stj7SZYaybJrJw9b5r07tl1FMwwW2+dG9kZWRaJDn7D
         1MMnDeYJTxzPCZtcM4Wt4dqzftHy3jY3fsRGa1C5+xKm+fhNkmkTCV8L+mWh5Pbt7vxK
         gmvA==
X-Gm-Message-State: AFuF++mup9IoiVzPB9TmGQlul7kqROdoi2QbHMdwXzUesCg5YVtBzgNh
	qn4rknp+sDTuut8R9pWdilXRsN/qXtWlKyP/vpN03e3UjlBlRDWuxcwvPGG0/lV4PA8=
X-Gm-Gg: AYBFou2ivyWIWWTQI/hpLAa5enl0t5AjwXxcpG0jJYLdV63X9oYhacyF0cQvNgjQyFX
	WsxJsjPY6ykNdX2rkmp/cLM5cnMIeU03tGHk22lLefLOXa/mSTybOQko1BxNDd0QKDobcJQFSJV
	TH02IwM8919myb1dL4p312Fm4flLMhoXpD17+ojgul+FGa6YGQrFRcRGETtwWYHjK+cgIcgDCJB
	Wt0yS1R7kL4Jnftoj/dmmOvjULqmyqKxNI2VJx3inhoLlwnDHZlOZW8OT7xclNf9YEb/UqYUx5I
	23ZYf8UMg5CEF4ACBtjETrpQ8/ccmVQ+40QmogzGQvyQibnlFyIoSLwRVs8fK5nMwyot0lQmqDR
	dvKEprW9PSum1nzC2Q+fecFQIalOgu/eY+biDR4e9dBT2VyrCuv8iW0wcKv0lyoOG+ORGeEesFF
	J149D3iQjmB9FGrQPomYBPezmnHyLJkI51Lm66hYGbuBM7C07pr4Y0vWz2FT9cgPDKJfKeKAH12
	jwEQVOgje/8BGoV+zR3UFS92KG/ID22p/9fNExLn7C9wagFTB/387kBTQcC0eqUxfIh+vXGWxwt
	no9fHJZZIVpPTlQOKy4SyUjUhBt66TiNW4nOi/zMwasb6BGx5X0zx+umsYeEsDzgVTK2XK73FEU
	7peC/Bm/Unlf7Ges=
X-Received: by 2002:a05:6122:4b16:b0:5c9:c60e:3a47 with SMTP id 71dfb90a1353d-5c9f168b0c9mr1872815e0c.19.1790134839068;
        Tue, 22 Sep 2026 20:40:39 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f053a418sm1767655e0c.13.2026.09.22.20.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:40:38 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/7.2: fix kernel reproducibility issues
Date: Tue, 22 Sep 2026 23:40:34 -0400
Message-ID: <20260923034034.729674-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923034034.729674-1-bruce.ashfield@gmail.com>
References: <20260923034034.729674-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 03:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246433

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/7.2:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: x86/Kconfig.cpu: pin CC_HAS_MARCH_NATIVE off for reproducible builds
    Date: Tue, 22 Sep 2026 14:26:03 -0400

    CONFIG_CC_HAS_MARCH_NATIVE is a def_bool computed from
    $(cc-option, -march=native), i.e. it is probed from the build-host
    compiler. In cross builds the result varies by build host: the kernel's
    own comment already notes "This flag might not be available in
    cross-compilers" So it is captured differently across otherwise
    identical builds and breaks kernel package reproducibility:

      .config / auto.conf:  CONFIG_CC_HAS_MARCH_NATIVE=y   (host A) vs absent (host B)
      autoconf.h:           #define CONFIG_CC_HAS_MARCH_NATIVE 1
      .config:              # CONFIG_X86_NATIVE_CPU is not set
      rustc_cfg:            --cfg=CONFIG_CC_HAS_MARCH_NATIVE

    With CONFIG_IKCONFIG=y the .config is gzip-embedded into the kernel
    (kernel_config_data), so the difference also propagates into
    vmlinux/bzImage/kernel-dbg (the blob shifts kernel_config_data_end and
    every symbol after it), failing reproducibility across the whole kernel
    package set. Not just the config text files, which is why a post-package
    filter is not sufficient.

    CC_HAS_MARCH_NATIVE protects only X86_NATIVE_CPU ("build and optimize
    for local/native CPU"), which is never enabled in these builds and
    is not something we should do in a distributed/reproducible
    kernel. Pin the symbol off so the captured config is deterministic
    regardless of build host. On-target 'make scripts prepare' uses
    this same patched Kconfig, so it recomputes the same value and
    needs no reconfiguration.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

This and the 6.18 fix are the same. You can see the details in the
commit message I captured above.

There's no generic/general solution at the moment, since we can't
drop the problematic values from the .config without changing
timestamps and then having the kernel just regenerate the configs.

We could probably dance around the timestamps for a bit and we'd
fix half the problem, but the .config compiled into the binary would
mean we'd also have to do the timestap fixes all through the build
and it has proven fragile in the past.

I checked this by grepping for the symbols between different builds
and they looked good.

The true test is the AB, so hopefully it holds there as well.

Bruce


.../linux/linux-yocto-rt_7.2.bb               |  4 ++--
 .../linux/linux-yocto-tiny_7.2.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
index 438c896749..e8e6c885ca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
@@ -15,8 +15,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c2f967f4c1065d41084f300d3eca7cd413635dc3"
-SRCREV_meta ?= "b5d69636e3e56aa6a5b8f987b4587e7a56c4782a"
+SRCREV_machine ?= "c3c2a26425ad13ed7d2bee0ff6f11365564bb33d"
+SRCREV_meta ?= "242eecdf2cb368016f92ad5317702b20f71d8c1e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
index 0a9595a749..fe2666b86d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
-SRCREV_meta ?= "b5d69636e3e56aa6a5b8f987b4587e7a56c4782a"
+SRCREV_machine ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
+SRCREV_meta ?= "242eecdf2cb368016f92ad5317702b20f71d8c1e"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_7.2.bb b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
index f1c2d475c1..55326a647b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
@@ -17,18 +17,18 @@ KBRANCH:qemux86-64 ?= "v7.2/standard/base"
 KBRANCH:qemuloongarch64  ?= "v7.2/standard/base"
 KBRANCH:qemumips64 ?= "v7.2/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "56c7106647e505ca1fb15fd433b0bc991024764c"
-SRCREV_machine:qemuarm64 ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
-SRCREV_machine:qemuloongarch64 ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
+SRCREV_machine:qemuarm ?= "3b075480e3eb36dbdbb7459ceb8220e30c168f7f"
+SRCREV_machine:qemuarm64 ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
+SRCREV_machine:qemuloongarch64 ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
 SRCREV_machine:qemumips ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine:qemuppc ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
-SRCREV_machine:qemuriscv64 ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
-SRCREV_machine:qemuriscv32 ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
-SRCREV_machine:qemux86 ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
-SRCREV_machine:qemux86-64 ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
+SRCREV_machine:qemuppc ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
+SRCREV_machine:qemuriscv64 ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
+SRCREV_machine:qemuriscv32 ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
+SRCREV_machine:qemux86 ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
+SRCREV_machine:qemux86-64 ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
 SRCREV_machine:qemumips64 ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine ?= "d8a1ec518ab72fadb60dbe9eed3775b68975defd"
-SRCREV_meta ?= "b5d69636e3e56aa6a5b8f987b4587e7a56c4782a"
+SRCREV_machine ?= "2ebaf2d45071d568d23e6570811bd63fb7cde633"
+SRCREV_meta ?= "242eecdf2cb368016f92ad5317702b20f71d8c1e"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


