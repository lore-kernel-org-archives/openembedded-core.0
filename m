Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 090247807D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 16:22:11 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id g29so97258wrg.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 09:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=OCn8NZC3oLDviUyI/2wYURSyFU1Nh2UQMgeDR9jk6Xg=;
	b=xMZv1GmWYRXG2Mv8psmQDLDWPcf/Fc1z6CuSw1As9ZuToMzNrsIJ0ODCVCjTWH4Xks
	Cbv9f7PuLBEDgbzugiLVoMUDaH1HqjJ5cAflkisRqKIgImOVZMNcGw/BBgsPkPbZEBuj
	rPFAsbzBBurijLWu6pRnMZNs/yX6R3GGfrXUWP/D31QXxzDERf3MBJto90Q5Lcf49IpE
	ZLM22WaFnjzVqAtGX8zwWjmei9leCVWq1K3+I1V9vZGdD1DFk9X0AIZykvE4MqZ/JSG0
	c+qnl7LhlCwagyljvskblgMtBF+S8benfHgqjrXoa5EGe0iAcpZryvQJW1q1ioDyxZbW
	efwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OCn8NZC3oLDviUyI/2wYURSyFU1Nh2UQMgeDR9jk6Xg=;
	b=SzFixiCnsINh4sfKbR/ZaYCOFoymS3ZbF1mTu+DADoY+7HnqyLRP8eFVgwB76r5GWq
	Pb8F3yEvl2nXMy4MeL3OpPSKFjY431XIRkHIb+SRQzi7hV2RMcdM0LgOtv3q+B+i1U23
	pCi6YzpO3oy5fBFIOf90PfCcqyZIg3Ktxu8fVvEnQCtdSmyxBQ45FhxAuHKDqLh9RAl6
	tsh60j7yS1iMZENaRgSCa94dR5s1V05I8D5My82Fwfn/Lzp+GM4NCP/zviBENbW3WJNh
	4Q8EpGWSPI6Lgyy/O2917uPinCLqZT0C76TfArqEH8VqMx46zEO4ejnCdUc1JN3WrueJ
	u7UQ==
X-Gm-Message-State: AHPjjUizNM9T/XSLyBD59ptaZATuNTZIBS38iNmR8ms6O+V7IT9reVNT
	d1CNC50hE3ZOQgHrQ+GT86PCJ6lO
X-Google-Smtp-Source: AOwi7QCv2toS2LHZmKmWg2MlRrczu7KNy/aDtdlkmrmMA8rIFJmESeV8SY5cc3e5+OB2xDhKXu/5ig==
X-Received: by 10.223.160.23 with SMTP id k23mr1977135wrk.212.1505838132216;
	Tue, 19 Sep 2017 09:22:12 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	z108sm10527219wrc.49.2017.09.19.09.22.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 09:22:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Sep 2017 17:22:08 +0100
Message-Id: <20170919162208.14673-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] classes/image: move image_qa to between rootfs and image
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
X-List-Received-Date: Tue, 19 Sep 2017 16:22:12 -0000

It was noticed that do_image_qa is useless when rm_work is enabled as the rootfs
directory is deleted before image_qa is called.

This indicates that image_qa is incorrectly scheduled as it failing should mean
images don't get generated, so move it between do_rootfs and do_image.

Also, add a little bit more documentation to the comments.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/image.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3639aa44f4e..4850eed7717 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -297,8 +297,11 @@ addtask do_image_complete_setscene
 # IMAGE_QA_COMMANDS += " \
 #     image_check_everything_ok \
 # "
-# This task runs all functions in IMAGE_QA_COMMANDS after the image
+# This task runs all functions in IMAGE_QA_COMMANDS after the rootfs
 # construction has completed in order to validate the resulting image.
+#
+# The functions should use ${IMAGE_ROOTFS} to find the unpacked rootfs
+# directory, which if QA passes will be the basis for the images.
 fakeroot python do_image_qa () {
     from oe.utils import ImageQAFailed
 
@@ -320,7 +323,7 @@ fakeroot python do_image_qa () {
         imgname = d.getVar('IMAGE_NAME')
         bb.fatal("QA errors found whilst validating image: %s\n%s" % (imgname, qamsg))
 }
-addtask do_image_qa after do_image_complete before do_build
+addtask do_image_qa after do_rootfs before do_image
 
 SSTATETASKS += "do_image_qa"
 SSTATE_SKIP_CREATION_task-image-qa = '1'
-- 
2.11.0


