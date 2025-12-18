Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93927D711B7
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:03 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1930.1766089380483462528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:23:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cpAQVoTS;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b2d32b9777so147325585a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089379; x=1766694179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tT8OTIZP57jq61k/d/c0TiWooAYmMNl4xF1s8oTBt4Y=;
        b=cpAQVoTSbYDjjuRfUdSVV2DSwz3cB6gkiKhF+yOrHK9xnRlHp/NCe2dL0ZpAhBPAoU
         R2fWJIaxOB6WDgIAMD0xq8VP3V/8KMLV2N7JNEUfAxev6IdPXGKqF5IMRfGD+lwRdmKv
         IAXHq/J6Wzrjd4Paq1tC+tVQMk6EFTLq+KxgACKJBE42gTuGeDtK9IBNUIItUIArDD4T
         Prwm7Xs/kHARuG6RtCGINFAZL7yWOSqzz8GvNTnCKzi31mFlpQoYW+AwgFYjEB4I+r65
         Z0eeRbwMY63EjsVEfuTnfMNDpgZ0yeZ6vyNoZ7hmZSoQzEXMkvEV+TjuW2PzZ2i2NCc2
         KizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089379; x=1766694179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tT8OTIZP57jq61k/d/c0TiWooAYmMNl4xF1s8oTBt4Y=;
        b=GSblK+KL1Iu4YNEtrRqg4VHHjAqDoOJhGLL2N/o7plKjuI9I6Fsn+K3SJkrEGiV6pe
         TWzhUjTR1LdvEXSj+htK/0H3TySfNJ3ylh+Pnm8T7IWzNzEKmp2W/qOrO1sNq0PIsR+Y
         TpLwgTvu1lPoCXtS1C+oWnywVvT+fZM0/dFhx/piNYWj0Nk+20kX3YRzsDuXarPNyE4f
         RqHyDz9D/HKZtK1uJCrBUup3bp3oOhDNJuztSYdraE0+WLicjzwi9HQUYnpPpx1HdsV1
         Hs46+cQZu16HM4ehDOd64wkYZFqH/Hjf+D3D34kcuFB+C9MW2AYfi5zgW7SQuP3B651c
         6z1w==
X-Gm-Message-State: AOJu0YwFwvRU4sKhLufc/j+QM+rH3jJP5TQlB41sNI+wsdsO5LYLEt48
	9WzTJsZDdxZn2AxvsEMhvYaANWgSkCDfsOvQu0vQHcw3IvOD3Ojr3UYS/J8Evgzw0As=
X-Gm-Gg: AY/fxX5oSxN2Dh17tbSr5x3J7EZ88u9Z4AyWFP3d0YYTQN2rgFOFxmplJNuoP4Ob9BH
	q+Xqh3B25QTukAcckMuvR0zPZ6Y84fisk1+VdpbbUIleXfrlmGc2g4d9fHg2GDowx1UtjqnM1Is
	8dECTfINIOOzW+u+ZUJlkdDTzLFh1bD9GSunE+K60rs3N7O1e0ZXRLTcpqE4+ZDs8DjZjrLYA6m
	0gai+GtsZto8Q6Ad80qlDby1T+0spT9OiObUiL8OhO+rqtwa1w8iRA8a9ghd/zY/E8JRf4g9nRo
	qn4QdQ9BcjJcfbThIUxHUND/lMSydyaZvqFcBesy7ORijOMKbO7ODPnw3mWEsDabUL9xRyw6OG2
	NJ44opNLKpWTBNCPRPBi2Jq5D3FmxhDds0zx0j0isscIOYhDlFI2no6qINLBZs7wvmPkHABq48U
	wYjQ+hQZXLYlnjWsl+M4Fh7tJVdH87ml+is71q9yvULp+HQddnRt3HxJ4dfwnULoB+sH8tmOqfm
	J5Y3FKKZleoLig=
X-Google-Smtp-Source: AGHT+IF9aaMYj+0LkZFB0eC+BuKZYY6Lv5U1bcJ4Z+xdnJEBNcx02l2CIlWKhmZiDUBCl0lGTkPhPQ==
X-Received: by 2002:a05:620a:46a0:b0:8b3:aa:f61d with SMTP id af79cd13be357-8c08fa9c153mr142798985a.49.1766089379419;
        Thu, 18 Dec 2025 12:22:59 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:22:58 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [09/15][openembedded-core] linux-yocto/6.17: rust kernel configs
Date: Thu, 18 Dec 2025 15:22:34 -0500
Message-Id: <20251218202248.70476-9-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228152

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/3 [
    Author: Harish Sadineni
    Email: Harish.Sadineni@windriver.com
    Subject: features/kernel-rust: Add feature to enable Rust kernel support
    Date: Thu, 11 Dec 2025 04:42:31 -0800

    Add a new kernel feature that enables Rust support in the kernel. This
    introduces kernel-rust.cfg to set Rust-related Kconfig options and
    kernel-rust.scc to define the feature metadata.

    The feature enables:
      - CONFIG_RUST
      - CONFIG_RUST_OVERFLOW_CHECKS
      - CONFIG_RUST_BUILD_ASSERT_ALLOW

    Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/3 [
    Author: Harish Sadineni
    Email: Harish.Sadineni@windriver.com
    Subject: kernel-sample: Add Rust sample configuration files
    Date: Thu, 11 Dec 2025 04:42:32 -0800

    Extend the existing kernel-sample feature by adding support for the Rust
    sample modules provided by the kernel. This adds a new kernel-rust-sample.cfg
    and corresponding .scc entry alongside the existing kernel-samples.cfg.

    The new configuration enables:
      - CONFIG_SAMPLES_RUST
      - CONFIG_SAMPLE_RUST_MINIMAL
      - CONFIG_SAMPLE_RUST_PRINT
      - CONFIG_SAMPLE_RUST_HOSTPROGS

    Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

3/3 [
    Author: Harish Sadineni
    Email: Harish.Sadineni@windriver.com
    Subject: debug: Add kernel Rust debug feature
    Date: Thu, 11 Dec 2025 04:42:33 -0800

    Add a new debug feature to enable Rust-related kernel debugging support.
    This introduces debug-kernel-rust.scc along with its associated Kconfig
    file debug-kernel-rust.cfg.

    Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.17.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
index 960b9c29ba..99d757b3c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "d79ffb7a9e37174f6d1704bfc632f87f29358e98"
-SRCREV_meta ?= "514f487f912a5a1a34fd874487ef23b7b08497ed"
+SRCREV_meta ?= "d84c38d95b4e042c0df0f6cdd14ee36909f86ea3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
index 790fd4a95a..00da6d8a13 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "b49bfa0f53123c942faa17ac437d343ca144a38d"
-SRCREV_meta ?= "514f487f912a5a1a34fd874487ef23b7b08497ed"
+SRCREV_meta ?= "d84c38d95b4e042c0df0f6cdd14ee36909f86ea3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index 439aba2e8c..17919bbd3c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "69e150f88757e3d8bbdb3eee9207aa5f627ed70a"
 SRCREV_machine:qemux86-64 ?= "69e150f88757e3d8bbdb3eee9207aa5f627ed70a"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
 SRCREV_machine ?= "69e150f88757e3d8bbdb3eee9207aa5f627ed70a"
-SRCREV_meta ?= "514f487f912a5a1a34fd874487ef23b7b08497ed"
+SRCREV_meta ?= "d84c38d95b4e042c0df0f6cdd14ee36909f86ea3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


