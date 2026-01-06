Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BC9CEFCF5
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:10:22 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.97989.1767726619560221262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 11:10:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JyUXdmXW;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8b29aebdf3cso24092785a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 11:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767726618; x=1768331418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCNmqatRkTI5xpbleR5UbIQzoEXgsWdlPXf0o/X528s=;
        b=JyUXdmXW9rDbQw5itk+ANnzSFtMPv8bbH4rmaBVma67fISsh5c0EcV3ruEGZeAC9fk
         9XuM2vYVj9GWMPMIjVqk/fhZgvp3ntfZ/orR0qEcCkOrJtiXUbf9tFNsBkmQFdWhOY+T
         858+2DAGjEs1EoVoPnKKjwyzEeSiqWrbinO16jfDe2F9Rxjq5MtrMgMEG3DkhQepy2tz
         r7LPtJSp/O4CM11s7QhME6Q36OvqalKhlUoHCHZTa1P/lYqD7cea7MvfTtiIZtUxzZ28
         RlUgRdc9dOd8v2gFpzPW0L3RNGyuYB1oZRp3tyvfVrBesJBaXl044mOI7qFMngjDZTe5
         fj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726618; x=1768331418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yCNmqatRkTI5xpbleR5UbIQzoEXgsWdlPXf0o/X528s=;
        b=fd1Re1fVIXLEWwnxsjkOJbl6m+gGGwADM5qTtJeQZcqDn3dLDJAN4rnJsolfhdl257
         jQ9rxgjboblKS1FTu5aCIm8z9M/fCaus+VT3H1yD8msDa6cnN5bDoNk39r7oDaY+rhsX
         w8NKQtpKFTRoenm6kOuHPn8+i0hZBo03GO6IUtJpbw1oufCB/IaLr+ztQqYunFe0Oa/O
         hyd9zjFapnpFFbvNp9wECRS6zjTng/VSdNLO3kvImwjPM6v+eoyoQzo98L9NqMh53bkW
         F9R969XW/s+phZT94k5ISxCyYSxA0L7UgsKol+JPzDG+Opc68mNMQcpdKPeNYeo6t3wi
         4ddQ==
X-Gm-Message-State: AOJu0YxrSIumRp5E4DP8mlW9iT7YUcgHBpq3jLquZs/sCqgpnwlOPHau
	yjdcTfFsoL5kDDRXy71Qx0CRaCp8jCOLjbm6OOj40jQIjmE770/dIT67daNCvOWwwxQ=
X-Gm-Gg: AY/fxX7KOuRkOr2V6jX6ns22Jmouu1HnoqCmeakPge+OSkEFYe0C9RhDU1glxLux552
	Jxdw6BXIOGx2QB7zxV6TwELZ3riF3X8gAe/VQaTtUzzEfm6o2mPusOGCg/Debhq8Vn9U41dbwvh
	ISAqwEP+H2z6AtB1kuvKFuJc+15uaxr9ZkaT7TluvW8HBmdP6zqOFJ9YfkDRcW4WWdFhM/AL1UN
	nrfwhwjcj0Px8GXoyHHx07sLnmM2Q6j9xvPao++7Q7xHIykDrJCW5Uw/5evuBFduBazc96Vdnry
	HsUoB0/a5UVpyuH6AalBw9udoJW8G0KvSmpqWtHg+lhmO4DLTPwdlivnjhBNqVsEud/Xh/TFfG7
	87P/FFViA3v82b0jjyWtTOUx8TXUgNiMw9zE80HOhXYIR0YhTa4dkIlGrt1cXp0MgOiFnJUAhGO
	0i8/xfGpelQ+UhjQdDp+R0IoI1Uhemn0kCSFJqd/UYLfCH0NmK0iNL0Ds=
X-Google-Smtp-Source: AGHT+IFsKifPnHkcqBwn1j1GIfzxCVKkDcpPu+9nVD0ePllhDhbi1gCvLgYn7zCAt6T1o+VlcAOdgQ==
X-Received: by 2002:a05:620a:29c1:b0:89d:4a69:1502 with SMTP id af79cd13be357-8c37eb76e90mr404916385a.3.1767726618528;
        Tue, 06 Jan 2026 11:10:18 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51c05csm220480485a.30.2026.01.06.11.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:10:18 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [[PATCH v2] 4/4] linux: Add inherit on generate-cve-exclusions
Date: Tue,  6 Jan 2026 14:10:01 -0500
Message-ID: <20260106191001.3385117-4-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106191001.3385117-1-valentin.boudevin@gmail.com>
References: <20260106191001.3385117-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 19:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228920

All kernel recipes can use generate-cve-exclusions class to perform CVE
exclusions.
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 3 +++
 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 3 +++
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   | 3 +++
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 3 +++
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 3 +++
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb | 3 +++
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 3 +++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb      | 3 +++
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 3 +++
 9 files changed, 27 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 9ac8507f9f..5cc735ae93 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -5,6 +5,9 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 # Skip processing of this recipe if it is not explicitly specified as the
 # PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
 # to build multiple virtual/kernel providers, e.g. as dependency of
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index 1230e4e805..53532b4e7e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -5,6 +5,9 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 # Skip processing of this recipe if it is not explicitly specified as the
 # PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
 # to build multiple virtual/kernel providers, e.g. as dependency of
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 32ed29f25e..e95264d99d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -5,6 +5,9 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 # Skip processing of this recipe if it is not explicitly specified as the
 # PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
 # to build multiple virtual/kernel providers, e.g. as dependency of
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 940561352c..6b17c2ff7f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,6 +8,9 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 LINUX_VERSION ?= "6.12.62"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index ffa15b0c1b..02e502faed 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -8,6 +8,9 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 LINUX_VERSION ?= "6.16.11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 2afdc02467..e36a7fb028 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -8,6 +8,9 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 LINUX_VERSION ?= "6.18.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 84419f8c78..b6ac5f9b90 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -6,6 +6,9 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 # board specific branches
 KBRANCH:qemuarm  ?= "v6.12/standard/arm-versatile-926ejs"
 KBRANCH:qemuarm64 ?= "v6.12/standard/base"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 408f14b451..947de4186e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -6,6 +6,9 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 # board specific branches
 KBRANCH:qemuarm  ?= "v6.16/standard/arm-versatile-926ejs"
 KBRANCH:qemuarm64 ?= "v6.16/standard/base"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 562a997020..66320f7123 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -6,6 +6,9 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 # board specific branches
 KBRANCH:qemuarm  ?= "v6.18/standard/arm-versatile-926ejs"
 KBRANCH:qemuarm64 ?= "v6.18/standard/base"
-- 
2.43.0


