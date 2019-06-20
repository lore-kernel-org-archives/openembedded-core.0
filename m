Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6DB7D65D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 14:35:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5KEZw3H012330
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 07:35:58 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 20 Jun 2019 07:35:57 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jun 2019 10:35:54 -0400
Message-ID: <20190620143554.38138-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] qemu: disable capstone for 32-bit mips with multilib
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
X-List-Received-Date: Thu, 20 Jun 2019 14:35:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When build lib32-qemu for qemumips with multilib:

  require conf/multilib.conf
  MACHINE = "qemumips64"
  MULTILIBS = "multilib:lib32"
  DEFAULTTUNE_virtclass-multilib-lib32 = "mips"

it fails to compile capstone:

|  CC      arch/AArch64/AArch64InstPrinter.o
|  {standard input}: Assembler messages:
|  {standard input}:36033: Error: branch out of range
|  {standard input}:36257: Error: branch out of range

Disable capstone for mips o32 in this situation as a workround.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu_4.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu_4.0.0.bb b/meta/recipes-devtools/qemu/qemu_4.0.0.bb
index f119215b21..76776098d0 100644
--- a/meta/recipes-devtools/qemu/qemu_4.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_4.0.0.bb
@@ -7,6 +7,7 @@ DEPENDS = "glib-2.0 zlib pixman bison-native"
 RDEPENDS_${PN}_class-target += "bash"
 
 EXTRA_OECONF_append_class-target = " --target-list=${@get_qemu_target_list(d)}"
+EXTRA_OECONF_append_class-target_mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
 EXTRA_OECONF_append_class-nativesdk = " --target-list=${@get_qemu_target_list(d)}"
 
 do_install_append_class-nativesdk() {
-- 
2.20.0


