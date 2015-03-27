Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id AC58F734E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 15:24:08 +0000 (UTC)
Received: by wgs2 with SMTP id 2so103162882wgs.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 08:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jwII1avVim51/dUgZfLWCOhjCoDsiUwcrp2YdRLfgRc=;
	b=MLeZXWN+21xgwNX5Ohbu6l9IppqAKvnYaDbNnCf8OFBHOc2S0NG8AdjcVQ8O+ajCe8
	vtrVRPxu7MfT0QJsPk4qTeTcQKhcXobhqFPZy00Pvy6rO0I+RNAekaUA52tuFNF08aDw
	NeAMvx4RUWr7p3MaTRUUX/P9VIZC4dgWCsby7b1cb3Fb343mAPyynVMqqxaI+kLvQwjr
	qby3Q8i7r9pwTqD/vAkpMHeesBh1wl1M7amqHbJ40X9bJJ1gl/bohBFVGTZWUa5BV4yk
	s5oPQYwPFNewILvyhpGMlXeIpPWXWyFawvIomKmxpA7LRLPbQcmThUpSoDnDJWNWYzjb
	L+cA==
X-Gm-Message-State: ALoCoQl4gnvX0iVSSwt+uNtJ28rPjpA0oMuQDQWYLrEMDohf1WRIpNJrbqNZkQ9fmdNZWKGzTaZU
X-Received: by 10.194.78.144 with SMTP id b16mr38226003wjx.18.1427469849422;
	Fri, 27 Mar 2015 08:24:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id g2sm7682715wib.1.2015.03.27.08.24.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Mar 2015 08:24:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Mar 2015 15:21:00 +0000
Message-Id: <1427469661-14521-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] linux-yocto: add kern-tools-native to kernel_metadata depends
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
X-List-Received-Date: Fri, 27 Mar 2015 15:24:14 -0000

The autobuilder failed like this:

  temp/run.do_kernel_metadata.25242: line 165: createme: command not found

createme is provided by kern-tools-native.  do_patch has a dependency on
kern-tools-native, but do_kernel_metadata runs before do_patch.  So move the
dependency from do_patch to do_kernel_metadata, moving the statement from the
.inc to the class so it's alongside the task definition.

[ YOCTO #7531 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/kernel-yocto.bbclass         |    1 +
 meta/recipes-kernel/linux/linux-yocto.inc |    2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 14551a2..a1fbb51 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -261,6 +261,7 @@ do_kernel_checkout[dirs] = "${S}"
 
 addtask kernel_checkout before do_patch after do_unpack
 addtask kernel_metadata after do_validate_branches before do_patch
+do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
 
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index c62f8ca..5b69a49 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -32,8 +32,6 @@ KCONF_BSP_AUDIT_LEVEL ?= "0"
 
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-do_patch[depends] = "kern-tools-native:do_populate_sysroot"
-
 addtask kernel_configme before do_configure after do_patch
 
 # Pick up shared functions
-- 
1.7.10.4


