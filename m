Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.10559.1608738190015537779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:43:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f/tGmpdl;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id 143so15221244qke.10
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 07:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zuQAGPpj+/+ZzV6PKoI6/tzlFUDzqDkt0aQ0gM8fmIA=;
        b=f/tGmpdlWXSLp4XiyY0TShd4lrHR/Fk+H7PC6kfQPlUR92efHzh+y78L9iij5Q6c8C
         xmEauhgWsbu1MDa+PAMG8WZ6mh38t8f0fdp/0e5kZFcaN04ICFpfqoLuucvLvYpXDelG
         Qt/+TiPeDfuO9DjUpYMEHIgQqZqGgcgaw+M73haxcdhQnbRPLDcFFDCZRx2CyO5Om8QK
         ErxqwSaylamPTXEwRun35ehZ63fKGgbE6IzWuImZt2J/zwbMJy48F9vmE2NugNlG622D
         4tug3E8iqb66c/4RibtaQBEf3zisxvGC21VK4XuziYhP3RJqZFOI2u8BiwBY1ojkx+1J
         6QZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zuQAGPpj+/+ZzV6PKoI6/tzlFUDzqDkt0aQ0gM8fmIA=;
        b=Veqxv7nOkw8DgjJ0wHx/sj+Gdr6Qz+CKEJAXxa35l7IGqEZN6dHWB/19Zh434wqcFI
         WttiEF/LBSTD1UnBEj97LLj14z9JDbu+TSE2SRLhfTJITDAiNhEIMtERkt3WeMbxr9dV
         ghbMJupm+T4g3aR+FlKTFJTT9At0y/qV5+EY7/hdcKKNMFhB3mo15UkrexLsILlzTzQ5
         8obXhOwg36IoaJmJeffE/6J8DDpZPTeq6J7rPV4i9DgbI+VBCVMhjp1FIjalHXhHJpcr
         fcBJm3+OngxAGfC1CbUkLiv9tg3sf9mHwtwgavusaXOmJxYLQ51hla59ORvDrbE7jDPn
         Prkg==
X-Gm-Message-State: AOAM530PhKP/dI+afYKObBPAHTTd1cr+siBVccB8R2f/VNsbbXs37nGy
	vs7YtbsvPv9JZx6Y5vfEG5o=
X-Google-Smtp-Source: ABdhPJx1woXLLZV+z273ItUm9I9l38tUWzCZzq+yqY8CFH07oetbE0zjsLM/bipuKxeS8xtN7qiBcw==
X-Received: by 2002:a05:620a:62b:: with SMTP id 11mr27527224qkv.229.1608738189120;
        Wed, 23 Dec 2020 07:43:09 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id r1sm13969914qta.32.2020.12.23.07.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 07:43:08 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.4/cfg: fix FIRMWARE_LOADER warnings
Date: Wed, 23 Dec 2020 10:43:06 -0500
Message-Id: <20201223154306.37009-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s):

    a1b2d188bdf config: set firmware loader to 'y'

The updated kern-tools are showing us warnings that were previously
hidden. To silence the fw_loader warning, we need to set the value
to 'y' (since it is 'y' selected by other options and we can't
override that).

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

With this stacked onto my last queue, it should fix the warnings seen
in meta-arm and meta-intel BSPs for 5.4 kernels.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index f35de787e1..1fda45f7aa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "7bc8ae3fc04fdc06192d39d725cb18d4c0b78d9f"
-SRCREV_meta ?= "b721178c41a2bffd19cc9be9e33af23b7a4affd9"
+SRCREV_meta ?= "a1b2d188bdfc855ff9dff770480a24cecf66285d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 2c7ce3621f..0d29f8f63c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "2b6db4fbe53a1986c0249bc663d8ce7d99cbf19c"
 SRCREV_machine ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
-SRCREV_meta ?= "b721178c41a2bffd19cc9be9e33af23b7a4affd9"
+SRCREV_meta ?= "a1b2d188bdfc855ff9dff770480a24cecf66285d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 032a1a3392..99ca27c26f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
 SRCREV_machine_qemux86-64 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
 SRCREV_machine_qemumips64 ?= "75c7340de480587c3a6650b46be7b1a2f71501a9"
 SRCREV_machine ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
-SRCREV_meta ?= "b721178c41a2bffd19cc9be9e33af23b7a4affd9"
+SRCREV_meta ?= "a1b2d188bdfc855ff9dff770480a24cecf66285d"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

