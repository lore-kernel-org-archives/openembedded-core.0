Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id B06A9731BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 16:12:18 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id r184so21376613qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Eh5ZFz+w9/Lz3221kuP+e9mHYCwTT2tewSbJng4nj8c=;
	b=IWoPjTJH3ktCyV5BnNcskRcED9SO1DFekt3iQVk3T5lMRR1L/XjGnm+mlKeLFQvnCd
	ubOwQpoN79+NBK98Lfg2mO9lKpzpsPeGGWTgqMDWpVry4S+TZM+gOzc8VF9j2y5e22EX
	iFQ1bPvXIGI/8v969PFjO0cgUtZgsuVUkQGLflxhuwVLzx3ovlvSsCU3XwtS4O14K4gv
	VCHcMsHjmgkf2qgcLcLLnDOLr1jfbw3Be/eFVyxIXlL7NqevB2Sj5n/QgYgp6CyQYx+0
	wbvaVUfVNEO6+52pHZ9C6uWN2fUkPVLO7NxN7cW/XFKaYy4hThNOSC9qOc4x8moydbDe
	2ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=Eh5ZFz+w9/Lz3221kuP+e9mHYCwTT2tewSbJng4nj8c=;
	b=hs6b/O+Har93E0pjD//j7HKzvGxfC0rgBaJyLJpS7tPzxAQjMGe4Bqay26lMQlnpP1
	f1ZEJAS3GGFRIvxP1IbYGJhHyIIbcd2Nzo9kOvSPX/MT0FJ8F21v/paMoXMzQm/B+Gnt
	e6oeSsVGaHmCE2fxOoYU0Y/pm8hQ7me6xSVWtcgks25X/8FFDJHaVmm2gld5w8W58PY+
	Jykci01IG/Ay44ELTD8AMuhzq9WghTgE5Wkfr+wc6QJswj+i5YIGHNd6i8rZ1utTd96M
	Z6YUd5wqyV1akNXh3/HZWr0b+QXgGT7lUV2yJHCedAOmEPqaMyrfwCFQmrKwcqjugXn5
	MEQw==
X-Gm-Message-State: AOPr4FUph9Dhl6QJ2LjXKBkyUUYTncJGaoWZBVvwRAk7aw5xkQJUHSJ72wRpCKT6PcUfaw==
X-Received: by 10.55.75.203 with SMTP id y194mr12431946qka.2.1460563937415;
	Wed, 13 Apr 2016 09:12:17 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[99.224.124.24]) by smtp.gmail.com with ESMTPSA id
	y123sm16264104qka.0.2016.04.13.09.12.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2016 09:12:16 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 13 Apr 2016 12:12:09 -0400
Message-Id: <16a67bef083b0b289ed3a31b868acfa8267830df.1460563722.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1460563722.git.bruce.ashfield@windriver.com>
References: <cover.1460563722.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1460563722.git.bruce.ashfield@windriver.com>
References: <cover.1460563722.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto/4.4: gpio-pca953x: fix the "drive" property cannot read/write
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
X-List-Received-Date: Wed, 13 Apr 2016 16:12:21 -0000

    The gpio_drive_show/store use incorrect gpio_desc,
    this causes the drive sysfs property cannot be used,
    This patch fixes this issue

    Upstream-status: Inappropriate, custom code for legacy userspace

Signed-off-by: Yong Li <yong.b.li@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 87b46e48c5ea..9ae4174f96cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "8611de4e967b16bd5b63714045329d621ee744d0"
+SRCREV_machine ?= "d5a75e64945b378d22b136d8c33a1e9120c3bbb9"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 9bae4faeb0f9..b6a5fea6cb0d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.3"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "73481a3abd4ee49c1cf5561fea997275f535098e"
+SRCREV_machine ?= "0148b3601f29b159b4f84c1478ff1859bbd48efe"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 7aeb7c35db23..8a9e67126645 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8809b2c36a60829bb9a7c3b04cdf42e95d8e93ae"
-SRCREV_machine_qemuarm64 ?= "73481a3abd4ee49c1cf5561fea997275f535098e"
-SRCREV_machine_qemumips ?= "6a62ed62536c0f50050e24ee385b9e3965d43c97"
-SRCREV_machine_qemuppc ?= "73481a3abd4ee49c1cf5561fea997275f535098e"
-SRCREV_machine_qemux86 ?= "73481a3abd4ee49c1cf5561fea997275f535098e"
-SRCREV_machine_qemux86-64 ?= "73481a3abd4ee49c1cf5561fea997275f535098e"
-SRCREV_machine_qemumips64 ?= "c61be23279c09c6906571de734b583dc7eacedc6"
-SRCREV_machine ?= "73481a3abd4ee49c1cf5561fea997275f535098e"
+SRCREV_machine_qemuarm ?= "a1201019dd589ee33964da46a8402c7e00133ee2"
+SRCREV_machine_qemuarm64 ?= "0148b3601f29b159b4f84c1478ff1859bbd48efe"
+SRCREV_machine_qemumips ?= "2f8a14c3f7c6372b00bfa4fea186f277d8125963"
+SRCREV_machine_qemuppc ?= "0148b3601f29b159b4f84c1478ff1859bbd48efe"
+SRCREV_machine_qemux86 ?= "0148b3601f29b159b4f84c1478ff1859bbd48efe"
+SRCREV_machine_qemux86-64 ?= "0148b3601f29b159b4f84c1478ff1859bbd48efe"
+SRCREV_machine_qemumips64 ?= "b65cb9e6c3ed6e8f97150d4de0f651c7cd1c4fdf"
+SRCREV_machine ?= "0148b3601f29b159b4f84c1478ff1859bbd48efe"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


