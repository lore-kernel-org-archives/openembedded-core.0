Return-Path: <alexandru.vasiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 45E3D78371
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 10:19:04 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v6O8WnfO011919 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 05:19:06 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2bv91m3h87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 05:19:06 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v6OAJ58G019517
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 05:19:05 -0500
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 24 Jul 2017 05:19:05 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 24 Jul 2017 05:19:04 -0500
Received: from avasiuPC.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 24 Jul 2017 05:19:03 -0500
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jul 2017 13:19:01 +0300
Message-ID: <20170724101901.7728-1-alexandru.vasiu@ni.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=5600 definitions=5800
	signatures=585085
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1706020000 definitions=main-1707190113
Cc: will.page@ni.com
Subject: [PATCHv2 RESEND] dkms: Add new recipe for supporting dkms
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
X-List-Received-Date: Mon, 24 Jul 2017 10:19:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Dkms is a tool used to compile out of tree modules directly on
target devices (sometimes you have sources or binaries which
need to be compiled directly on target, outside OE).
I used a simple module and a dkms config to test it, and dkms
compiled and installed the module on target.

For example:
.
├── dkms.conf
└── src
    ├── hello.c
    └── Makefile

hello.c:
	#include <linux/module.h>

	int init_module(void)
	{
		printk("Hello World!\n");
		return 0;
	}

	void cleanup_module(void)
	{
		printk("Goodbye Cruel World!\n");
	}

	MODULE_LICENSE("GPL");

Makefile:
	obj-m += hello.o

	KERNELDIR ?= /lib/modules/$(shell uname -r)/build

	PWD := $(shell pwd)

	install:
		$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

	clean:
		rm -rf *.o *.ko *~ core .depend .*.cmd *.mod.c modules.order Module.symvers

dkms.conf:
	MAKE="make -C src/ KERNELDIR=/lib/modules/${kernelver}/build"
	CLEAN="make -C src/ clean"
	BUILT_MODULE_NAME=hello
	DEST_MODULE_LOCATION=/kernel/drivers/scsi
	BUILT_MODULE_LOCATION=src/
	PACKAGE_NAME=hello
	PACKAGE_VERSION=0.1
	AUTOINSTALL=yes
	REMAKE_INITRD=yes

All files should be in /usr/src/<package-name>-<package-version>,
in our case in /urs/src/hello-0.1.

Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
---
 meta/recipes-kernel/dkms/dkms_2.4.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-kernel/dkms/dkms_2.4.0.bb

diff --git a/meta/recipes-kernel/dkms/dkms_2.4.0.bb b/meta/recipes-kernel/dkms/dkms_2.4.0.bb
new file mode 100644
index 0000000000..78b23c43e9
--- /dev/null
+++ b/meta/recipes-kernel/dkms/dkms_2.4.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "DKMS Recipe - Adds DKMS tool for target"
+HOMEPAGE = "https://github.com/dell/dkms/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "https://github.com/dell/${PN}/archive/v${PV}.tar.gz"
+
+SRC_URI[md5sum] = "d2e74dd79086c564a924b5763794091b"
+
+RDEPENDS_${PN} += "bash kmod gcc make patch"
+
+inherit autotools-brokensep
-- 
2.13.3


