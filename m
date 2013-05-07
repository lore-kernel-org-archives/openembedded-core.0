Received: from mail-we0-f181.google.com ([74.125.82.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UZkTr-00031o-He
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 18:11:19 +0200
Received: by mail-we0-f181.google.com with SMTP id q55so686881wes.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 08:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=ZS47OzCw+OKnJvt75lmAOSFbSBidO8wS6vfXkMarxfc=;
	b=mH5Xp9GbDUIwrDcFqjJrCjv9v5YQeKNIRBtF8JoJBIvBdrnX4Fbc09q3XHbNsvd/Xs
	ZywuoPK7sE6kGFweNubQ9n3/fmkk8QeuEJ0ugGSsdu/pbk2/9mDmn8c/+X23Yyd3AuyA
	D7fWpLNbdx4KDxpqzD93iFVoc1wbrgeH5PvLpMucXEupkSOXl8y4lSPqrIx1LsHZYy12
	xrace3W0mCar3/A7RqkDrGcwh46Y6OokaYv/QbKaUm4c48O0Jo4l3MjnVLglIOZAZaVv
	WW9mvUG+dTib6jkQh9xwBftJ8gmTB0MooaJ+GFH5PWHfVc46anTNGXOS3doolpF3jVN7
	kZng==
X-Received: by 10.194.143.50 with SMTP id sb18mr4451815wjb.44.1367941970864;
	Tue, 07 May 2013 08:52:50 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id cw8sm3600076wib.7.2013.05.07.08.52.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 May 2013 08:52:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 16:49:47 +0100
Message-Id: <1367941787-8508-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnOm4ekywRb+J3l7rBm4RNgnLu7TJ9SRa8APPiFkhAjHkJKjb45J5gzGHekCA2XlRvzuKXz
Subject: [PATCH] qemux86: disable paravirt guest, causes test failures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 16:11:21 -0000

The shutdown sanity test that we previously saw on qemux86-64 in 2.6.37 have
started to re-appear reproducably on qemux86 in 3.4 in the Danny series.  Until
this can be root-caused and fixed in the kernel, disable paravirtualisation
across all kernels and all qemu machines.

[ YOCTO #4196 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb    |    1 -
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    1 -
 meta/recipes-kernel/linux/linux-yocto_3.8.bb    |    2 +-
 4 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index fdea085..fcf37cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -44,5 +44,4 @@ COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
 KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index 980229c..38e35db 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -25,6 +25,6 @@ COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index b81b9ac..18d665a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -26,5 +26,4 @@ COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
 KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index 4bf6bf4..75e2dbb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -25,6 +25,6 @@ COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
1.7.10.4



