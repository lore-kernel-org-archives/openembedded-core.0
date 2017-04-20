Return-Path: <avery.brian@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5D777684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 17:38:08 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id a3so6556667oii.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 10:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Pqxci4ZCVhQxLogGYSyiCouv3KvKiPHFHnS1PYRsr1M=;
	b=YQTeX+AmTIj7bcgzm6FD8f+yM8YwufvAv5yYF9S/wSCNwkSPm1Osfnah2biHtDIaVY
	at0vUMb6WQ/cr7xvAUwQn3HNmsMCKPswDqPU3UK+W5h3QVxxmLd04P0xB7ogwbyYZxfN
	5O3npPSQQ2htI2N/+d98dp60nvde1zVM+myKbcre0REv0Pk4OehQBFCeytwjcb7mcgc9
	kc4BiJlkijzZkIvDcmtSR1Xym43REaqofY03fIfapPg76uWH+J2Fe/+8sl3bZsEhNgjN
	4KC13BBc1psozOf0CCWDmN09l22W/rVh2Pe8ZLhIjK6h9gRUPpda7qzTvOdsGiZJs8iU
	+EEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Pqxci4ZCVhQxLogGYSyiCouv3KvKiPHFHnS1PYRsr1M=;
	b=AEy6XxEj6CdystLyUf1Ji6ylEivFWKgwRZT0pzAns53iz0hqzzPrk7mYaHE7KEO+YW
	d6fdma7zCzRuM8Sy1fj68SdS3JB0tJzB6i3GOq6pPP+siPEE5AzRfidWgMGIkvzNIX+b
	k2nKTU5+XDPKme1vxIaiIHrNBk6SNTwa/j0EDSutLfsA8WzhnG4ipYIUAyH7Mn1zN/OI
	QlMryzOBmNiIWIMn4PSTB4MIHF5u33rFK19I49FeyC7mvvj6YF23ukBHzoDTOEhMcTWW
	53fGnys4BQ5Byx4tsw1t/y6ZRT62v33aVd1+S8kS/wxDZYPLkRGx2A9wZzQgrDDBQjGE
	BJXQ==
X-Gm-Message-State: AN3rC/5uYDdqxIeUIjpNsRyFJXB7Hj9HlFOalLGY/qZjmO07TVWYmZoP
	e9pypQKETwlqXw==
X-Received: by 10.84.163.75 with SMTP id n11mr11255945plg.186.1492709890005;
	Thu, 20 Apr 2017 10:38:10 -0700 (PDT)
Received: from whisper.hsd1.or.comcast.net
	(c-98-232-142-195.hsd1.or.comcast.net. [98.232.142.195])
	by smtp.gmail.com with ESMTPSA id
	u129sm11669746pfu.48.2017.04.20.10.38.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Apr 2017 10:38:09 -0700 (PDT)
From: brian avery <avery.brian@gmail.com>
X-Google-Original-From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 10:38:18 -0700
Message-Id: <fe62329de806650fd62f3c83c284c7b36329c1be.1492709567.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1492709567.git.brian.avery@intel.com>
References: <cover.1492709567.git.brian.avery@intel.com>
Subject: [PATCH 1/1] testimage.bbclass: add additional dependency
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
X-List-Received-Date: Thu, 20 Apr 2017 17:38:09 -0000

qemu-native-helper has an additional task that needs to be run in order
for testimage to work. This task is usually run by default in a full
build but there are use cases where it might be skipped. This commit
adds the dependency explicitly.

Also, this commit adds a try/catch error message to make it clearer what
you need to do if you try to run testimage before you have built or
downloaded the image artifacts.

[YOCTO #11375]

Signed-off-by: brian avery <brian.avery@intel.com>
---
 meta/classes/testimage.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index a259423..fb21460 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -71,7 +71,7 @@ TEST_QEMUBOOT_TIMEOUT ?= "1000"
 TEST_TARGET ?= "qemu"
 
 TESTIMAGEDEPENDS = ""
-TESTIMAGEDEPENDS_qemuall = "qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot"
+TESTIMAGEDEPENDS_qemuall = "qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot qemu-helper-native:do_addto_recipe_sysroot"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS_qemuall += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS_qemuall += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-c-native:do_populate_sysroot', '', d)}"
@@ -166,7 +166,11 @@ def testimage_main(d):
                              d.getVar('IMAGE_LINK_NAME')))
 
     tdname = "%s.testdata.json" % image_name
-    td = json.load(open(tdname, "r"))
+    try:
+        td = json.load(open(tdname, "r"))
+    except (FileNotFoundError) as err:
+         bb.fatal('File %s Not Found. Have you built the image with INHERIT+="testimage" in the conf/local.conf?' % tdname)
+
     # Some variables need to be updates (mostly paths) with the
     # ones of the current environment because some tests require them.
     updateTestData(d, td, d.getVar('TESTIMAGE_UPDATE_VARS').split())
-- 
1.9.1


