Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1RkiUG-0002ZU-Eo
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 21:40:04 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0AGBQm8028264
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Jan 2012 08:11:26 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 10 Jan 2012 08:11:26 -0800
From: Zumeng Chen <zumeng.chen@windriver.com>
To: <yocto@yoctoproject.org>, <dvhart@linux.intel.com>,
	<bruce.ashfield@windriver.com>, <sgw@linux.intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 11 Jan 2012 00:11:06 +0800
Message-ID: <f42f850e2c27a23f9e7b46bbebe977a6a19a6c54.1326210673.git.zumeng.chen@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326210673.git.zumeng.chen@windriver.com>
References: <cover.1326210673.git.zumeng.chen@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] lttng-ust: Integrate into yocto linux
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jan 2012 20:40:04 -0000
Content-Type: text/plain

This patch intended to integrate the LTTng UST 2.0 package, which
contains the userspace tracer library to trace userspace codes.

Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
---
 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb |   25 ++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb

diff --git a/meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb b/meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
new file mode 100644
index 0000000..846019e
--- /dev/null
+++ b/meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
+DESCRIPTION = "The LTTng UST 2.0 package contains the userspace tracer library to trace userspace codes."
+HOMEPAGE = "http://lttng.org/lttng2.0"
+BUGTRACKER = "n/a"
+
+LICENSE = "LGPLv2.1+ & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e647752e045a8c45b6f583771bd561ef \
+                    file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
+                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
+
+inherit autotools
+
+DEPENDS = "liburcu util-linux"
+
+SRC_URI = "http://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "0f09bb954c99cb99ab6997cd492953c1"
+SRC_URI[sha256sum] = "e9ec3c55c2251b3f3b512bfa1015b0f67e35d55793850ccea5134f7b24ee3ba1"
+
+S = "${WORKDIR}/lttng-ust-${PV}"
+
+# Due to liburcu not building on MIPS currently this recipe needs to
+# be limited also.
+# So here let us first suppport x86/arm/powerpc platforms now.
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
-- 
1.7.5.4



