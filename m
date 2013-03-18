Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Maxin.John@enea.com>) id 1UHZQ8-0000Tf-VX
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 13:44:12 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Mon, 18 Mar 2013 13:27:20 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id D45FF288B02;
	Mon, 18 Mar 2013 13:27:20 +0100 (CET)
From: <maxin.john@enea.com>
To: <constantinx.musca@intel.com>, <radu.moisan@intel.com>,
	<sgw@linux.intel.com>, <richard.purdie@linuxfoundation.org>
Date: Mon, 18 Mar 2013 13:26:44 +0100
Message-ID: <1363609608-11554-2-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1363609608-11554-1-git-send-email-maxin.john@enea.com>
References: <1363609608-11554-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org,
	"Maxin B. John" <maxin.john@enea.com>, dexuan.cui@intel.com
Subject: [PATCH 1/5] liburcu: upgrade to 0.7.6
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
X-List-Received-Date: Mon, 18 Mar 2013 12:44:13 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

liburcu-0.7.6 features support to MIPS.

Ralf Baechle added MIPS support to liburcu on commit id:
e1259cb17954e4e03954ba7376d3ed61649116cd

Now, we can remove the COMPATIBLE_HOST check for MIPS.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-support/liburcu/liburcu_0.7.4.bb |   23 -----------------------
 meta/recipes-support/liburcu/liburcu_0.7.6.bb |   19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-support/liburcu/liburcu_0.7.4.bb
 create mode 100644 meta/recipes-support/liburcu/liburcu_0.7.6.bb

diff --git a/meta/recipes-support/liburcu/liburcu_0.7.4.bb b/meta/recipes-support/liburcu/liburcu_0.7.4.bb
deleted file mode 100644
index a6a5bfc..0000000
--- a/meta/recipes-support/liburcu/liburcu_0.7.4.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "The userspace read-copy update library by Mathieu Desnoyers"
-HOMEPAGE = "http://lttng.org/urcu"
-BUGTRACKER = "http://lttng.org/project/issues"
-
-LICENSE = "LGPLv2.1+ & MIT-style"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89 \
-                    file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
-                    file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
-
-PR = "r0"
-
-SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "7defbc16443e680ce4aad90cf49537a9"
-SRC_URI[sha256sum] = "2294ec969308fc9115b43eb7ed5392a63a7e671f44316446a1149a39db54d51f"
-
-S = "${WORKDIR}/userspace-rcu-${PV}"
-CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-inherit autotools
-
-# liburcu, which is only used by lttng-ust, may not build on other
-# platforms, like MIPS.
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux.*'
diff --git a/meta/recipes-support/liburcu/liburcu_0.7.6.bb b/meta/recipes-support/liburcu/liburcu_0.7.6.bb
new file mode 100644
index 0000000..1b57d10
--- /dev/null
+++ b/meta/recipes-support/liburcu/liburcu_0.7.6.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "The userspace read-copy update library by Mathieu Desnoyers"
+HOMEPAGE = "http://lttng.org/urcu"
+BUGTRACKER = "http://lttng.org/project/issues"
+
+LICENSE = "LGPLv2.1+ & MIT-style"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
+                    file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
+                    file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
+
+PR = "r0"
+
+SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "4c1ecb4bdcd43e36dfdffdd297023c8b"
+SRC_URI[sha256sum] = "71f2c0b75f3473e4d7aa6ac5111ca4d9cccccd5d131e87b53a07d35bd2c5900a"
+
+S = "${WORKDIR}/userspace-rcu-${PV}"
+CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
+inherit autotools
-- 
1.7.5.4



