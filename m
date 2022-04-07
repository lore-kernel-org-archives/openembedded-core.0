Return-Path: <brenda.streiff@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DE4C4321E
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web08.3355.1649361681885507534
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 13:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=2tyLYOlE;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=1096971498=brenda.streiff@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 237Dv76T003962
	for <openembedded-core@lists.openembedded.org>;
 Thu, 7 Apr 2022 15:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS11062020;
 bh=x0JNybQrW4Y00gsqeJLwg0ANmPUWB0iuDqGhJ/cAv2g=;
 b=2tyLYOlE5brxDwGz/NyWUib1I7gyFUEsS9XtDniTK6Octijj1/FN5bKRSmXCdh02WUeV
 G/x4eEASyK9eKHs0OMe0mVKy8gkB30DxHCpQMcQ6I5UsG0OrmgSWU8P3dsJs4BcAAo3h
 98DQtUy1kbvyYnO289FwFV1Bx2C89F2vxPgGnLkZ1m0G+lDBjADQlSokw9AgnUndFLRh
 t/QsUOCvgES7fZO6UGBQXo8RvI0p9zAFOnZIMU6Or+kiI1jyWYbtYSgmkYqHS/WQQ0iz
 w5MhUTDV4MPXGoz9M0WUWCKiF8Hy4U/jFkTDa8iyNSNUWBDfe7wj05L6hsqrx7T36rfT DA==
Received: from ni.com ([130.164.80.24])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3f6m0t4ndw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 15:01:21 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
 (us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.1.2/8.16.1.2) with ESMTPS id
 237K1KTG018157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 7 Apr 2022 15:01:20 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
 us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Thu, 7 Apr 2022 15:01:20 -0500
Received: from starthinker.amer.corp.natinst.com (172.18.68.32) by
 us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP Server
 id 15.0.1497.28 via Frontend Transport; Thu, 7 Apr 2022 15:01:20 -0500
From: Brenda Streiff <brenda.streiff@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Brenda Streiff <brenda.streiff@ni.com>
Subject: [PATCH 2/2] runqemu: add an option to enable guest-agent virtio
 device
Date: Thu, 7 Apr 2022 15:01:17 -0500
Message-ID: <20220407200117.7576-2-brenda.streiff@ni.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220407200117.7576-1-brenda.streiff@ni.com>
References: <20220407200117.7576-1-brenda.streiff@ni.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 55UC7aJMUzE8UH4uBbOiXwi1Mm9svhhT
X-Proofpoint-ORIG-GUID: 55UC7aJMUzE8UH4uBbOiXwi1Mm9svhhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_04,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Reason: orgsafe
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164143

Add support to the runqemu script for a new option, 'guestagent', that
enables the virtio serial port for host-to-guest communication.

Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
---
 scripts/runqemu | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2f77a7bd0f..c25764b28e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -82,6 +82,7 @@ of the following environment variables (in any order):
     kvm-vhost - enable KVM with vhost when running x86/x86_64 (VT-capable CPU required)
     publicvnc - enable a VNC server open to all hosts
     audio - enable audio
+    guestagent - enable guest agent communication
     [*/]ovmf* - OVMF firmware file or base name for booting with UEFI
   tcpserial=<port> - specify tcp serial port number
   qemuparams=<xyz> - specify custom parameters to QEMU
@@ -214,6 +215,8 @@ class BaseConfig(object):
         self.cleaned = False
         # Files to cleanup after run
         self.cleanup_files = []
+        self.guest_agent = False
+        self.guest_agent_sockpath = '/tmp/qga.sock'
 
     def acquire_taplock(self, error=True):
         logger.debug("Acquiring lockfile %s..." % self.taplock)
@@ -522,6 +525,10 @@ class BaseConfig(object):
                 self.snapshot = True
             elif arg == 'publicvnc':
                 self.qemu_opt_script += ' -vnc :0'
+            elif arg == 'guestagent':
+                self.guest_agent = True
+            elif arg.startswith('guestagent-sockpath='):
+                self.guest_agent_sockpath = '%s' % arg[len('guestagent-sockpath='):]
             elif arg.startswith('tcpserial='):
                 self.tcpserial_portnum = '%s' % arg[len('tcpserial='):]
             elif arg.startswith('qemuparams='):
@@ -1348,6 +1355,12 @@ class BaseConfig(object):
             raise RunQemuError("Failed to boot, QB_SYSTEM_NAME is NULL!")
         self.qemu_system = qemu_system
 
+    def setup_guest_agent(self):
+        if self.guest_agent == True:
+            self.qemu_opt += ' -chardev socket,path=' + self.guest_agent_sockpath + ',server,nowait,id=qga0 '
+            self.qemu_opt += ' -device virtio-serial '
+            self.qemu_opt += ' -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0 '
+
     def setup_vga(self):
         if self.nographic == True:
             if self.sdl == True:
@@ -1459,6 +1472,7 @@ class BaseConfig(object):
         if self.snapshot:
             self.qemu_opt += " -snapshot"
 
+        self.setup_guest_agent()
         self.setup_serial()
         self.setup_vga()
 
-- 
2.20.1


