Return-Path: <preid@electromag.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DE5CF6491
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 04:45:37 +0000 (UTC)
Received: from anchovy3.45ru.net.au (anchovy3.45ru.net.au [203.30.46.155])
 by mx.groups.io with SMTP id smtpd.web11.47667.1727671532446350958
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 21:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: electromag.com.au, ip: 203.30.46.155, mailfrom: preid@electromag.com.au)
Received: (qmail 2865 invoked by uid 5089); 30 Sep 2024 04:45:30 -0000
Received: by simscan 1.2.0 ppid: 2649, pid: 2653, t: 0.5876s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950 spam: 3.1.4
Received: from unknown (HELO ?192.168.2.144?) (preid@electromag.com.au@144.6.137.188)
  by anchovy2.45ru.net.au with ESMTPA; 30 Sep 2024 04:45:29 -0000
Message-ID: <79f8b797-a464-4b3b-811f-ba45549821f2@electromag.com.au>
Date: Mon, 30 Sep 2024 12:45:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-AU
To: openembedded-core@lists.openembedded.org, liezhi.yang@windriver.com,
  alexandre.belloni@bootlin.com
From: Phil Reid <preid@electromag.com.au>
Subject: re: archiver.bbclass: Improve work-shared checking - breaks some
 kernel builds
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 04:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205092

This is in relation to commit: 5fbb4ca8da4f4f1ea426275c45634802dcb5a575

Which included the following change:


  def is_work_shared(d):
-    pn = d.getVar('PN')
-    return pn.startswith('gcc-source') or \
-        bb.data.inherits_class('kernel', d) or \
-        (bb.data.inherits_class('kernelsrc', d) and d.expand("${TMPDIR}/work-shared") in d.getVar('S'))
+    sharedworkdir = os.path.join(d.getVar('TMPDIR'), 'work-shared')
+    return d.getVar('S').startswith(sharedworkdir)
  

and the following commit: 9191aa685418af32f003e067ef7c5737a271e3a5
  def is_work_shared(d):
      sharedworkdir = os.path.join(d.getVar('TMPDIR'), 'work-shared')
-    return d.getVar('S').startswith(sharedworkdir)
+    sourcedir = os.path.realpath(d.getVar('S'))
+    return sourcedir.startswith(sharedworkdir)
  
  # Run do_unpack and do_patch
  python do_unpack_and_patch() {



This changes the logic somewhere for is_work_shared
Recipes that inherit gcc-source / kernel are no longer considered work_shared.

It was something like:
   inherits(gcc-source) or inherits(kernel) or (inherits(kernelsrc) and srcin(work-shared))

It now just
   srcin(work-shared)


This change is breaking the follow kernel recipe build,
which doesn't put the source in work-shared, it ends up in work
There's some more detail in previous email: [OE-core] scarthgap: kernel build failure

=========================
KBRANCH ?= "v6.6/standard/base"

require recipes-kernel/linux/linux-yocto.inc

# CVE exclusions
include recipes-kernel/linux/cve-exclusion.inc
include recipes-kernel/linux/cve-exclusion_6.6.inc

# board specific branches
SRCREV_machine ?= "561bbd55f91a8e94576ca3fbf35a0c99ff70d4b2"

SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
LINUX_VERSION ?= "6.6.52"

PV = "${LINUX_VERSION}+git"

KCONF_BSP_AUDIT_LEVEL = "1"

COMPATIBLE_MACHINE = "^(qemux86-64|cyclone5)$"

# Functionality flags
KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"

KERNEL_PACKAGE_NAME          = "kernel-tst"

KBUILD_DEFCONFIG:qemux86-64  = "x86_64_defconfig"
KCONFIG_MODE:qemux86-64      = "--alldefconfig"

KBUILD_DEFCONFIG:cyclone5    = "socfpga_defconfig"
KCONFIG_MODE:cyclone5        = "--alldefconfig"

=========================

Should this still be supported???



-- 
Regards
Phil Reid
  
ElectroMagnetic Imaging Technology Pty Ltd
Development of Geophysical Instrumentation & Software
www.electromag.com.au
  
23 Junction Parade, Midland WA 6056, AUSTRALIA
Ph: +61 8 9250 8100
Fax: +61 8 9250 7100

Email: preid@electromag.com.au

