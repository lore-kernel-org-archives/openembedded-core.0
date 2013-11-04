Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5CE496D692
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 09:57:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA49v1tI021906
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Nov 2013 01:57:01 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 4 Nov 2013 01:57:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Nov 2013 17:56:49 +0800
Message-ID: <1a24320a75995e56db91f05a87315b97de122bd0.1383558655.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383558655.git.hongxu.jia@windriver.com>
References: <cover.1383558655.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 4/5] udev: fix QA issue
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
X-List-Received-Date: Mon, 04 Nov 2013 09:57:01 -0000
Content-Type: text/plain

The commit 7163ebd92a799b8f000b2b6f303b20de468b5f90
Revert "kmod: Use base_libdir for installing libkmod"

It caused a QA Issue WARNING:
...
WARNING: QA Issue: udev: /lib/udev/udevd, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libkmod.so.2 => /usr/lib/libkmod.so.2 (0xdead3000)
...

But we did this reasonably, we should skip the qa check explicitly.

[YOCTO #5142]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/udev/udev.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 2f883a0..92a11e0 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -30,6 +30,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 
 inherit autotools pkgconfig update-rc.d
 
+INSANE_SKIP_${PN} = "unsafe-ref-bin"
 libexecdir = "${base_libdir}"
 EXTRA_OECONF = "--disable-introspection \
                 --with-rootlibdir=${libdir} \
-- 
1.8.1.2


