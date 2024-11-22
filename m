Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F58E69194
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:02:48 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.34901.1732309363571049464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bZa+fODx;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-460b16d4534so15846851cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732309362; x=1732914162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcM4L8edhbFzfBrqFG4uKKcv5IZ0pYD1XSq333EbdG4=;
        b=bZa+fODxp3bc13HkQJkIvhq1pFRKWgQlVrd6dIIp0oLFrA+WM8gv6zLGqE81MWQgxa
         Ns30pyueMehKWLwGcpHv2Rl7mKS6iB6xhsCaJY3nvGC9hfjrx2uZ2WwQYQQK1JAXy2dW
         0UDGFX4GKmrlJs55kp4CAa/MZLDuuxWYzoIIetd7Fg2JEfQ9w2SHGfYhQmhzI8yugY3r
         Smqjs+tIoWpHN5Qw49wbVav79FQ2Q6q7+bI9wdF2uvXy0uzlWPKeS4HjXKWb2cLN0VbH
         Geic1c6fmhVhM1WqwUVQ6VHVcXdP+DeEY+bmb/wAj8DPlFSB9LMVMwxEwl6d+gvQdrMo
         +wAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732309362; x=1732914162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcM4L8edhbFzfBrqFG4uKKcv5IZ0pYD1XSq333EbdG4=;
        b=UJycwnZiUn/icc3pCTHQksOIDSDPeVIV3nz7eSVEtLLRhjRaicJbBs5yH77Sj81C5S
         PyInc+9kCHeBv3NF49LjDtMv6TJZFc+L9Kqfrb5pMs16e1YzC+EbVGqlBYL0BcSzpYjY
         +dPTzNNseialA2fz9+mtWwalPj9LuXIR5AdoNS+8evZKb5QTa+zXXgxgufZCq9qeWgyK
         WdZz1strdvB9BWbFRcdLTGbs8BhEwoZdRSFI9AETh+OpStLU8pS1bpBnYMcK/CRpMcEo
         B3zprcqMX8lT6b6HXLSSXJb9IQ93e0AC3bd/il/VZeO5yBQHJzBEMdjILX5NcfhAmNRf
         4+eg==
X-Gm-Message-State: AOJu0Yx3lBgBlBO4lpfA5eFpVaCsE4GtUkYw02Dq7jsSZw8sTGWoZf1G
	6TpS8CyCty4/VZb+Lvf+0p5Ml3GtFXGR8V1NtjPJFXDElfYZTnT1XKjtjGxQ
X-Gm-Gg: ASbGncsKuju18A4TJAHQQIXK/jG+ui/PAINVqjqB4pow8ynvExjRq42WEQiE7d8LsR7
	diF8kusQ04pUwZvBqeBDtNqDZTtyVw0WO3/s7/hahYIiThLtTw5sqRJ7z7cYp5IAuDAhR1f9xzW
	3VUabqLWLHPPz17NAjQPyQTfdGPttBeyJyajIiZd7seHrV3n07B9a8bvtuRpiW1kKJUJQw5EfZD
	VUSGShTwtsmDNMIemg1J/7Kx1LLaS5w2+mhaqnPrtJ0jhLr+FpB4g6s1vfdfR1982gq+ymyvNGZ
	uugXiEvzEWxGujwROBP5ssNRL+S23k2UtdUkKZlw8fJ3tw0a+7Y=
X-Google-Smtp-Source: AGHT+IGgrFm/HhNaxhSxJbMcvX7ZqTefSunfQQuHDnNSb6xjH0IINfT+LEUfNbyw2d5Hc47g0HA8gg==
X-Received: by 2002:a05:6214:d66:b0:6cb:c85c:5654 with SMTP id 6a1803df08f44-6d450e69926mr66931626d6.4.1732309362418;
        Fri, 22 Nov 2024 13:02:42 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451a83775sm14281056d6.4.2024.11.22.13.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:02:41 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/6.10: bsp/genericarm64: disable ARM64_SME
Date: Fri, 22 Nov 2024 16:02:38 -0500
Message-Id: <20241122210238.2546434-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241122210238.2546434-1-bruce.ashfield@gmail.com>
References: <20241122210238.2546434-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207649

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: bsp/genericarm64: disable ARM64_SME
    Date: Thu, 21 Nov 2024 15:53:35 +0000

    From upstream:

        arm64: Kconfig: Make SME depend on BROKEN for now

        commit 81235ae0c846e1fb46a2c6fe9283fe2b2b24f7dc upstream.

        Although support for SME was merged in v5.19, we've since uncovered a
        number of issues with the implementation, including issues which might
        corrupt the FPSIMD/SVE/SME state of arbitrary tasks. While there are
        patches to address some of these issues, ongoing review has highlighted
        additional functional problems, and more time is necessary to analyse
        and fix these.

        For now, mark SME as BROKEN in the hope that we can fix things properly
        in the near future. As SME is an OPTIONAL part of ARMv9.2+, and there is
        very little extant hardware, this should not adversely affect the vast
        majority of users.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index fa78313a9e..7c0425bb27 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "3e91e02b6041d6720a5cf2f64323bb9b73f20765"
-SRCREV_meta ?= "3a72fcf6df4fd9edc8c5933393be76cea6cb4a42"
+SRCREV_meta ?= "af06ad75b8da89e99d2cc0090ce2a7877ef51391"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index d21fd63d38..891dcb596a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_meta ?= "3a72fcf6df4fd9edc8c5933393be76cea6cb4a42"
+SRCREV_meta ?= "af06ad75b8da89e99d2cc0090ce2a7877ef51391"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 7b1b6685b5..1d5b8af337 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
 SRCREV_machine:qemux86-64 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
 SRCREV_machine:qemumips64 ?= "61cac1396fe9250a4b7a5cc6ae3deb9dda4290c3"
 SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_meta ?= "3a72fcf6df4fd9edc8c5933393be76cea6cb4a42"
+SRCREV_meta ?= "af06ad75b8da89e99d2cc0090ce2a7877ef51391"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


