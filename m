Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 45B5176988
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:14 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id i5so4047655pag.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=KAnvTmG4oITNq2oxF0nwgCtqJ9SGKaWO8YsdOFreeGc=;
	b=QG8vMuAHWOxgSOQf7BWIs0lDl5QACCe1drQPcyIhetoFVKD2Hbhu7JrvgPbM4n/Jl7
	8vRhg3XVXgk0Xn64Ruq3K5nCfwTX0UBBQBAmuIHWHe043+xlbBhuAJqAGh4BqViUJD2u
	FLYyGjZ4tALO+a3Ock25aD5mmdxvT52sYy++eWdLdhaD1r75ooSjht5XBXY6qagGkM1J
	xquW47l/4dHeYH29quNvRFciRBm+D5g78p+yXaueZMxV6f66UbkyD6OdEmLO9BPrg14n
	w0vTc6fLirEbreOH2Li2gjgkZo2PGn9r/BtpIXtSxyzMo23iy6HhIRMEHOhF9tMtxjTc
	TFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=KAnvTmG4oITNq2oxF0nwgCtqJ9SGKaWO8YsdOFreeGc=;
	b=TUXoxAFC4rjmn8tEjMF8GU+buIly0HakV+vYzIYCHywuNKUNJJbGBAQURcJ4papBsv
	h0UVAzSAbmuK2M9UA9YojDmhxAWswPQznkdtiAbTKiKVTZd6ZkMZvJ0z9Uui1zMGyqqH
	Z8FbeXyUo1489s8dIVoTNhFeso0/SxGtxNZrP7M5YcQ/AfHBAMeGs4U+b55QXyZygXhu
	Ad9Y7YpOLmOc7kcRKvijxOkTWNdzrItlPorkypxY3aH0903v+EglUdadybKRiiTWAEng
	RxLbjxYZUkS79Rv3z7wUS+gAcj+pY8zDHPfPK9XYPkutOrMVwBsYGFM5tL1f8tV4TR8s
	pidA==
X-Gm-Message-State: AOPr4FWkI8Da2Uwl5oF4ntsbH/SDdhEfLL3wNo7Z5gut6wQL9+NU7IFD+vW3ei9jsNXgcw==
X-Received: by 10.66.78.73 with SMTP id z9mr6784790paw.4.1462988175803;
	Wed, 11 May 2016 10:36:15 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:26 -0700
Message-Id: <6382d74d223d6df3b58cd4929d3515aed27adbbd.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 23/42] linux-yocto: Fix build with gcc6 on mips
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
X-List-Received-Date: Wed, 11 May 2016 17:36:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...oration-of-MSA-context-in-non-MSA-kernels.patch | 76 ++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/v2-MIPS-Prevent-restoration-of-MSA-context-in-non-MSA-kernels.patch

diff --git a/meta/recipes-kernel/linux/linux-yocto/v2-MIPS-Prevent-restoration-of-MSA-context-in-non-MSA-kernels.patch b/meta/recipes-kernel/linux/linux-yocto/v2-MIPS-Prevent-restoration-of-MSA-context-in-non-MSA-kernels.patch
new file mode 100644
index 0000000..8511df6
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto/v2-MIPS-Prevent-restoration-of-MSA-context-in-non-MSA-kernels.patch
@@ -0,0 +1,76 @@
+From patchwork Thu Apr 21 17:04:53 2016
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [v2] MIPS: Prevent "restoration" of MSA context in non-MSA kernels
+From: Paul Burton <paul.burton@imgtec.com>
+X-Patchwork-Id: 13164
+Message-Id: <1461258293-8863-1-git-send-email-paul.burton@imgtec.com>
+To: <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>
+Cc: Michal Toman <michal.toman@imgtec.com>,
+ Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>,
+ "stable # v4 . 3+" <stable@vger.kernel.org>
+Date: Thu, 21 Apr 2016 18:04:53 +0100
+
+If a kernel doesn't support MSA context (ie. CONFIG_CPU_HAS_MSA=n) then
+it will only keep 64 bits per FP register in thread context, and the
+calls to set_fpr64 in restore_msa_extcontext will overrun the end of the
+FP register context into the FCSR & MSACSR values. GCC 6.x has become
+smart enough to detect this & complain like so:
+
+    arch/mips/kernel/signal.c: In function 'protected_restore_fp_context':
+    ./arch/mips/include/asm/processor.h:114:17: error: array subscript is above array bounds [-Werror=array-bounds]
+      fpr->val##width[FPR_IDX(width, idx)] = val;   \
+      ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
+    ./arch/mips/include/asm/processor.h:118:1: note: in expansion of macro 'BUILD_FPR_ACCESS'
+     BUILD_FPR_ACCESS(64)
+
+The only way to trigger this code to run would be for a program to set
+up an artificial extended MSA context structure following a sigframe &
+execute sigreturn. Whilst this doesn't allow a program to write to any
+state that it couldn't already, it makes little sense to allow this
+"restoration" of MSA context in a system that doesn't support MSA.
+
+Fix this by killing a program with SIGSYS if it tries something as crazy
+as "restoring" fake MSA context in this way, also fixing the build error
+& allowing for most of restore_msa_extcontext to be optimised out of
+kernels without support for MSA.
+
+Signed-off-by: Paul Burton <paul.burton@imgtec.com>
+Reported-by: Michal Toman <michal.toman@imgtec.com>
+Fixes: bf82cb30c7e5 ("MIPS: Save MSA extended context around signals")
+Cc: James Hogan <james.hogan@imgtec.com>
+Cc: stable <stable@vger.kernel.org> # v4.3+
+---
+
+Changes in v2:
+- Prevent potential for malformed errno/signal from protected_restore_fp_context.
+
+ arch/mips/kernel/signal.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
+index bf792e2..fc7c1f0 100644
+--- a/arch/mips/kernel/signal.c
++++ b/arch/mips/kernel/signal.c
+@@ -195,6 +195,9 @@ static int restore_msa_extcontext(void __user *buf, unsigned int size)
+ 	unsigned int csr;
+ 	int i, err;
+ 
++	if (!config_enabled(CONFIG_CPU_HAS_MSA))
++		return SIGSYS;
++
+ 	if (size != sizeof(*msa))
+ 		return -EINVAL;
+ 
+@@ -398,8 +401,8 @@ int protected_restore_fp_context(void __user *sc)
+ 	}
+ 
+ fp_done:
+-	if (used & USED_EXTCONTEXT)
+-		err |= restore_extcontext(sc_to_extcontext(sc));
++	if (!err && (used & USED_EXTCONTEXT))
++		err = restore_extcontext(sc_to_extcontext(sc));
+ 
+ 	return err ?: sig;
+ }
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index fbb592a..a55ac93 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -24,6 +24,7 @@ SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA} \
            file://0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch \
+           file://v2-MIPS-Prevent-restoration-of-MSA-context-in-non-MSA-kernels.patch \
 "
 
 LINUX_VERSION ?= "4.4.3"
-- 
2.8.2


