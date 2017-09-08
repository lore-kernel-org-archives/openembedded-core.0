Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id AB95278231
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 17:33:38 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v88HXdws029943
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Sep 2017 19:33:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1504892019;
	bh=AGxrDetn3I+lNAq/c345SL5895OfuSeoNtOmimKQSVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Sender;
	b=ibOZZkEPvYxcusgs7ghoCIQ4LhbS+zuazW2l+oo14pT4M37Qedbvawz0khQ72o/zX
	WIzojHOTdFikzzLtpj8kke7FpEUJ6WFSfv5OwWmG9iqs87PEuwDuip8QoKJUvBZatq
	uhEO8OXeIKzTT1JDUrn0ksYlBUlrxxYoPIgmTzU0=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v88HXV7X002454 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Fri, 8 Sep 2017 19:33:32 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 140F2B8981F;
	Fri, 8 Sep 2017 19:28:32 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v88HXToD002447
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 8 Sep 2017 19:33:29 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1dqN9l-0007je-Cr; Fri, 08 Sep 2017 19:33:29 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 19:33:02 +0200
Message-Id: <20170908173303.29634-3-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20170908173303.29634-1-enrico.scholz@sigma-chemnitz.de>
References: <20170908173303.29634-1-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.79
Cc: Enrico Scholz <enrico.scholz@ensc.de>
Subject: [PATCH 2/3] wic: allow multiple /boot partitions with different content
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
X-List-Received-Date: Fri, 08 Sep 2017 17:33:39 -0000

From: Enrico Scholz <enrico.scholz@ensc.de>

It can be useful to have multiple partitions with '--source bootimg-partition'
but different content.

E.g. for TI AM335x, one boot partition can contain an first stage
bootloader ("MLO"), while the real bootloader and kernel plus devicetree
are in another one.

Patch allows to specify multiple IMAGE_BOOT_FILES with optional "_label-XXX"
or "_uuid-XXX" overrides.

E.g. with this patch, a .wks file with

| part --source bootimg-partition ... --label=mlo --active
| part --source bootimg-partition ... --label=boot0
| part --source bootimg-partition ... --label=boot1

and a recipe with

| IMAGE_BOOT_FILES_label-mlo = "\
|   MLO-${MACHINE}.img;MLO \
| "
|
| IMAGE_BOOT_FILES_label-boot0 = "\
|   u-boot-${MACHINE}.img;u-boot.img \
|   zImage \
| "
|
| IMAGE_BOOT_FILES_label-boot1 = "${IMAGE_BOOT_FILES_label-boot0}"
|
| WICVARS += " \
|   IMAGE_BOOT_FILES_label-mlo \
|   IMAGE_BOOT_FILES_label-boot0 \
|   IMAGE_BOOT_FILES_label-boot1 \
| "

is possible.  It will create one partition with the MLO and two redundant
ones with the uboot + kernel.

Signed-off-by: Enrico Scholz <enrico.scholz@ensc.de>
---
 scripts/lib/wic/plugins/source/bootimg-partition.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index ca074a3..67e5498 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -54,7 +54,7 @@ class BootimgPartitionPlugin(SourcePlugin):
         - sets up a vfat partition
         - copies all files listed in IMAGE_BOOT_FILES variable
         """
-        hdddir = "%s/boot" % cr_workdir
+        hdddir = "%s/boot.%d" % (cr_workdir, part.lineno)
         install_cmd = "install -d %s" % hdddir
         exec_cmd(install_cmd)
 
@@ -65,10 +65,19 @@ class BootimgPartitionPlugin(SourcePlugin):
 
         logger.debug('Kernel dir: %s', bootimg_dir)
 
-        boot_files = get_bitbake_var("IMAGE_BOOT_FILES")
+        boot_files = None
+        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), (None, None)):
+            if fmt:
+                var = fmt % id
+            else:
+                var = ""
+
+            boot_files = get_bitbake_var("IMAGE_BOOT_FILES" + var)
+            if boot_files is not None:
+                break
 
-        if not boot_files:
-            raise WicError('No boot files defined, IMAGE_BOOT_FILES unset')
+        if boot_files is None:
+            raise WicError('No boot files defined, IMAGE_BOOT_FILES unset for entry #%d' % part.lineno)
 
         logger.debug('Boot files: %s', boot_files)
 
-- 
2.9.5


