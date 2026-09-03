Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E78C624D4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 06:44:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1773.1788417849193403077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 23:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BG/fxW9p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4843f205a5bso1321983f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 23:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788417847; x=1789022647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9djnCIm2zknHI/YAO4y6qzwQDKj1KOUejUli0Or5OGI=;
        b=BG/fxW9p95iZQoZLtJpCgt4ac6t5HI2ejjcemXumGusYqC9w/Xtno6a/mbnK/alvVd
         QtNie3oH5Sj98imRc9ZRN6BQJscnrlWTRgrKTTwJCGPFOwu5FRBHR6tC8Y+1pUu5a9ua
         4QNLyNQiHhYwgQ+g9g3v3aL67lglU5L1SYMqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417847; x=1789022647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9djnCIm2zknHI/YAO4y6qzwQDKj1KOUejUli0Or5OGI=;
        b=UkNjf+TTbsVPhuBkFYY1mIZCn7xFBohATvDgybek8ISSsga1vUqaVr2Si+nbG2njbI
         1WU7N/gUCNGy7bs3mkiSOHjhij8HmSuI8uuJ6v1BkGtrHzMFAK/nnHcg8GTSeXUhnRnp
         m0CbyuchrnKEOhmZDz8Qxwv8yQpHzsJ1FAEHtcX2hlyS40QT9Pbrdy9htai7r0NCCdbc
         Ub30G67ALl9sdEhHUvJAhgGZRbtYzc4355DIWXaeSVae56SOpUV23FSiVI4ooOqRFQ8y
         vrhQYLFvohBZczFGoCHeXDew4bmY9oUqcOzULcROj2w8looG1OazGgRxX/6F1tEVls/w
         Ob+w==
X-Gm-Message-State: AFuF++nsJCgRHCGwxSzsiQc9jG4VEG+tl8PFX48sXf8+kNCVEX8a7bdh
	OcD4NUEpmIdYJIi07Z2h2DSN/Uc5wUJHYQxThU80EBdrBOQ6DwJPPx32vqiRd1HWds5UfQsYKF6
	L161nEc8=
X-Gm-Gg: AYBFou2qTAYnnK+wbVLTWVkWTlaGAaKgy/IQTIn1YYqW9DegD75rHT2mAxv+IrFuw8X
	HjDv2tfF+YqXMwVXPl30URxMYchs8zfI0jLWa4XBd6oqP11uxpbIf6t0OhScHYFEhnLFzXlfiJM
	lFqqSVMx57xzVdE6nHjwNZZ3rMG1zX2XF0uuhSwVoezxEvGMzeU0biguYgCEtD4YPvKCDw9d2Kx
	HpTyIMYB0E4TbnaSqpsL4l+o8VX4fadqGkSIm/1HlrJYE7j2VQM20/PZv3hHFsJI4UXnkbUHEH7
	7psc0UQ3nmJSRrEMUxoENEfmB+MK4fmdVKOmJBPlBYfVHDti29gPFNnT2tqPa9vc4M4jKYo/nkb
	P4Sd49ZiziT4djCDMdGp2DI1FIx7tX/rd8MpJT0tsVuoX3hZNLbD1mbgT2SMhNZqMQ08xGdvY9w
	Ptk6TcD65lzY5Io1v04ti1GH5pKveAZc3UHWgMuxL0wuYQcR2Z8FyTB8ydNwoDlkjUt1QNLN92m
	Qutl7FODykkhuG24Q==
X-Received: by 2002:a05:600c:c48f:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49ce582276dmr148617085e9.14.1788417847071;
        Wed, 02 Sep 2026 23:44:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a76d:4840:1f4f:ed41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dead1sm44278175e9.11.2026.09.02.23.44.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 23:44:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] iproute2: upgrade 7.1.0 -> 7.2.0
Date: Thu,  3 Sep 2026 07:44:01 +0100
Message-ID: <20260903064403.3848874-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 06:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245006

Contains changes:
* v7.2.0
* man/ip-ntable: fix app_probes typo
* SECURITY: add threat model
* ip: drop unnecessary fallback to ioctl for tx queue length
* add print_hexstring helper
* man: fix troff warnings and whitespace
* bridge: whitespace cleanup
* CREDITS: remove trailing whitespace
* .mailmap: remove trailing whitespace
* uapi: update headers from 7.2-pre-rc1
* devlink: add scope filter to resource show
* devlink: add per-port resource show support
* devlink: show port resources in resource dump
* devlink: add dump support for resource show
* devlink: fix memory leak in resource_ctx_fini
* devlink: Move dpipe tables query to resources show callback
* devlink: Split dpipe tables output to a separate function
* iplink_geneve: Support IFLA_GENEVE_LOCAL and IFLA_GENEVE_LOCAL6.
* iplink: set NLA_F_NESTED for IPv4 devconf attributes
* man: iplink: fix indentation level after inet parameter
* Update kernel headers
* iplink: bridge: add stp_mode support
* iplink: add support for setting IPv4 devconf parameters
* dpll: monitor: add -t/--timestamp and --tshort options
* dpll: man: restore Frequency monitor status in device show output
* ll_map: add RTEXT_FILTER_NAME_ONLY to ll_link_get() and ll_init_map()
* Update kernel headers
* tc/netem: display per-impairment xstats counters
* netshaper: Fix man page accuracy and formatting issues
* netshaper: Update man page for new parameters and group command
* netshaper: Add group command for creating scheduling hierarchies
* netshaper: Extract struct shaper_args and parse_shaper_arg() helper
* netshaper: Extend show output with parent, bw-min and weight
* netshaper: Add bw-min and weight parameter support
* netshaper: Extract parse_scope() and parse_rate() helpers
* bridge: vlan: Add support for neigh_forward_grat
* iplink: bridge_slave: Add support for neigh_forward_grat
* devlink: Drop now duplicate pid fallback for netns
* rdma: Allow netns to be specified by pid
* iplink: Drop pid fallback code for netns
* namespace: Add fallback to netns by pid
* dpll: add fractional-frequency-offset to parent-device
* dpll: add pin operstate attribute support
* Update kernel headers
* dpll: add frequency monitoring support
* dpll: add ps unit to phase-related pin attributes
* tc/class: use rtnl_dump_request_n() in tc_class_list()
* tc: qdisc: provide tcm_handle and tcm_parent to kernel dump requests
* tc: use ll_init_map() only when needed
* lib: add input validation for time, rate, and size parsing functions
* man: remove libnetlink man page
* bash-completion: devlink: Fix dev completion trailing colon
* ll_map: add RTEXT_FILTER_SKIP_STATS to ll_init_map()

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-include-libnetlink.h-add-missing-include-for-htobe64.patch | 2 +-
 .../0002-include-color.h-add-missing-include-for-types.patch    | 2 +-
 .../iproute2/{iproute2_7.1.0.bb => iproute2_7.2.0.bb}           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_7.1.0.bb => iproute2_7.2.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index 1d3fc5bb405..ececd00539a 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From dc1db1129a98530fb44b3d1a448e991adaf5b066 Mon Sep 17 00:00:00 2001
+From 61a0f63cd424b2e521b8b2e190c98271ced98de6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 24 Aug 2024 15:32:25 +0200
 Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch b/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
index 2078e48d8a2..5ed8335be7e 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
@@ -1,4 +1,4 @@
-From 5c7bd395e9364a1c7c9370680ff265e50cf2b2b9 Mon Sep 17 00:00:00 2001
+From 7dc5b9726cdf214835c62967f7dcb8ceb660ece7 Mon Sep 17 00:00:00 2001
 From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
 Date: Thu, 5 Mar 2026 08:06:54 +0100
 Subject: [PATCH] include/color.h: add missing include for types
diff --git a/meta/recipes-connectivity/iproute2/iproute2_7.1.0.bb b/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_7.1.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb
index c5944f2e540..096601029c3 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_7.1.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0002-include-color.h-add-missing-include-for-types.patch \
            "
 
-SRC_URI[sha256sum] = "fd9fa1b95809417157ca83dd72957e3261bdbce896353cb936f80af0b33a4b5c"
+SRC_URI[sha256sum] = "4c2fa124c2cf0afd7ca34d1eeacba6ba048a56f6374e2aab93dafbdbd4eea9c0"
 
 inherit update-alternatives bash-completion pkgconfig
 

