Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBE3C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 11:59:29 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.7286.1646135968361309810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iiGVaB9/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646135966; i=@fujitsu.com;
	bh=PaddRR4qjRnvdovyUGbT2KpDF0sRb9htu79IFBRcUck=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iiGVaB9/k/SqNkS0ISdYoxJJw5fYBhL9D8mrtV833cantqtyk/SMWSdbRwcKF+roL
	 N9hWua+RUawsciqv33Ddw7RpNI9/5dpptij57HvyfDdM1shQagg0Ad3F5khMwThhcW
	 rYZWZYQgZCVyADG5jaVskrdQY97OESFxG+lcIBtV97jO3vqiM7gsiUQrbk+7XUudwi
	 7QUwDFxGrVutG8Zm0kmFMxjCBdOGgzNojOBD79ObvnfzoCno+79wcWOrhnMzwrAkJX
	 qmINtjAw73wsj4wMTmcOVlzRxHhN+02xhkJ6RleSYAFfLgqRxGREFFwgplfgMcxXLu
	 8x8aHn0AIHpJQ==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 06/F2-00700-E9A0E126;
 Tue, 01 Mar 2022 11:59:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MRojuXSy7
  JoOWZocWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtF9v4e14J1ixfuNmxgbGE/LdjFycQgJTGeS
  +PX2DiuEc5xR4mDvH+YuRk4ONgE1iem3bgAlODhEBPQkrv4TBQkzC6hIvPjdww5iCwtYSrTv/
  sECYrMAxV+3rQKL8wo4SSzvXgIWlxBQkJjy8D0zRFxQ4uTMJywQcyQkDr54wQxRoygx+3IzVH
  2FxKxZbUwTGHlnIWmZhaRlASPTKkarpKLM9IyS3MTMHF1DAwNdQ0NTXVNdIyNTvcQq3US91FL
  d8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwBBLKWZ9uINxcd9PvUOMkhxMSqK8ajdlk4T4
  kvJTKjMSizPii0pzUosPMcpwcChJ8G5nl0sSEixKTU+tSMvMAYY7TFqCg0dJhNeXEyjNW1yQm
  FucmQ6ROsVoyfHh0JW9zBxXr4DIv5/+7mUWYsnLz0uVEuetBWkQAGnIKM2DGweLyUuMslLCvI
  wMDAxCPAWpRbmZJajyrxjFORiVhHkfgUzhycwrgdv6CuggJqCD/gZLgRxUkoiQkmpg8uHl4n0
  YafS7b93foqXWee1HhJhrJh7cdLvt++7zuqsX2MSWWfHLKhcpX2UvctHif/L4tWcIE8PCSuY3
  KuHZabHSbPPEpLgF7VhLa69UuNvZBOTs8tC8yPP6l8kKgVBJx0NHrlQ0vXxV7mdUe+VrQWXHX
  q8e3/lHeefOYT9zzMftLBdjS++rM5Wxp9ZbOv1o07z1JOvmq4OqU2InLYqpe9vZOPfbjLD770
  R2Cj38YLfv9j/zc7MqvpZeZH3BetT7kPW3lULvanSyX30I1visHi3pc0V/e9HsmRYMFQLXVvy
  cufpf8rcV0Tm6Oho+Z/6oX5b5uTtSbEn7g87n8bOcDqx/v+L5Wbka/f5l/H8slViKMxINtZiL
  ihMBNs6xZ0QDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1646135965!15937!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11518 invoked from network); 1 Mar 2022 11:59:25 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 11:59:25 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 221BxIlb015669
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Mar 2022 11:59:25 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 11:59:16 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mesa: upgrade 21.3.6 -> 21.3.7
Date: Tue, 1 Mar 2022 19:59:09 +0800
Message-ID: <1646135949-39195-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 11:59:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162549

Changelog:
=========
Bug fixes
---------
lavapipe: dEQP-VK.spirv_assembly.instruction.compute.float16.arithmetic_3.step fails
ANV: Bad output from TransformFeedback . Regression from Mesa 21. Something to do with VB+XFB -> VB+XFB dependency?

Changes
-------
pan/bi: Avoid *FADD.v2f16 hazard in optimizer
pan/bi: Avoid *FADD.v2f16 hazard in scheduler
pan/bi: Lower swizzles on CSEL.i32/MUX.i32
panvk: Use more reliable assert for UBO pushing
radv: Fix preamble argument order.
ir3/spill: Fix simplify_phi_nodes with multiple loop nesting
lavapipe: fix sampler + sampler view leaks.
lavapipe: reference gallium fences correctly.
crocus: fix leak on gen4/5 stencil fallback blit path.
i915g: Initialize the rest of the "from_nir" temporary VS struct.
pick_status.json: Update to dabba7d7263be6ffb6f3676465e92c65952fa824
pick_status.json: Mark b07372312d7053f2ef5c858ceb1fbf9ade5e7c52 as denominated
gallivm/nir: Call nir_lower_bool_to_int32 after nir_opt_algebraic_late
nir: All set-on-comparison opcodes can take all float types
intel/fs: Don't optimize out 1.0*x and -1.0*x
spriv: Produce correct result for GLSLstd450Step with NaN
spirv: Produce correct result for GLSLstd450Modf with Inf
spirv: Produce correct result for GLSLstd450Tanh with NaN
nir: Properly handle various exceptional values in frexp
nir: Produce correct results for atan with NaN
nir: Add missing dependency on nir_opcodes.py
anv: Call vk_command_buffer_finish if create fails
dri: avoid NULL deref of DrawBuffer on flush
nir: fix lower_memcpy
anv/genxml/intel/fs: fix binding shader record entry
anv: don't set color state when input state was requested
ac/surface: add more elements to meta equations because HTILE can use them
lavapipe: use util_pack_color_union() for generating clear colors
aux/draw: fix llvm tcs lane vec generation
zink: always set VkPipelineMultisampleStateCreateInfo::pSampleMask
zink: always invalidate streamout counter buffer if not resuming
iris: Don't fast clear with the view format
r300: fix transformation of abs modifiers with negate
radeonsi: workaround Specviewperf13 Catia hang on GFX9
radeonsi: fix depth stencil multi sample texture blit
glx: fix pbuffer refcount init
radv/winsys: fix initializing debug/perftest options if multiple instances
intel/genxml: add PIPE_CONTROL field for L3 read only cache invalidation
anv: invalidate L3 read only cache when VF cache is invalidated
iris: invalidate L3 read only cache when VF cache is invalidated
iris: fix a leak on surface states
mesa/st: always use DXT5 when transcoding ASTC format
tegra: Use private reference count for sampler views
tegra: Use private reference count for resources
radv: Disable IB2 on compute queues.
venus: properly destroy deferred ahb image before real image creation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mesa/{mesa-gl_21.3.6.bb => mesa-gl_21.3.7.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.3.6.bb => mesa_21.3.7.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.3.6.bb => mesa-gl_21.3.7.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.3.6.bb => mesa_21.3.7.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.3.6.bb b/meta/recipes-graphics/mesa/mesa-gl_21.3.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.3.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.3.7.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cfd325add1..2f79e8b34d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,7 +23,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch \
            "
 
-SRC_URI[sha256sum] = "96bb761fd546e9aa41d025fcc025225c5668443839dae21e3731959beb096736"
+SRC_URI[sha256sum] = "b4fa9db7aa61bf209ef0b40bef83080999d86ad98df8b8b4fada7c128a1efc3d"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.3.6.bb b/meta/recipes-graphics/mesa/mesa_21.3.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.3.6.bb
rename to meta/recipes-graphics/mesa/mesa_21.3.7.bb
-- 
2.25.1


