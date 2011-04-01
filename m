Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W2U-0005BA-Vw
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:32:51 +0200
Received: by mail-iw0-f175.google.com with SMTP id 10so3432253iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=nIBC0mn+EG5qgt2U+MGtjZ4dza2Rs35YuJHP6Ca9Qy4=;
	b=fd109sBLKu6Ayj79cBGPkP5Ghdqibrbzo9gDpA9BY5k1W5YwJCfVn7AY7zQJb2ANvH
	4n4k6MmXjnjhkGfCUPesukCx3jJckqObj05eaodefiz9hHM8U+M7NGeRsEouHxS81j5J
	+xdaz69PC4hXh7YQEjazSMGfUotwjEpI2gX4A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=sM2thvumyUQrkertOhaZ9T/j5Px/moGsnu/mNO3576gLb+wUydGFqV5t+UBsNI73g5
	fFSA6F62AS2f699r1ZD7eB3Qwy+EBJOM/KIMtBRy4VClHRnz+WKeCawbsruNScbdT5zt
	9Ov7+Lap3gqBFoR5RLDgAugK1qq8FQs7XBbWQ=
Received: by 10.42.153.133 with SMTP id m5mr4535797icw.27.1301632252314;
	Thu, 31 Mar 2011 21:30:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i20sm1181631iby.31.2011.03.31.21.30.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:30:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:30:43 -0700
Message-Id: <674f01045f776753ffafa72d9df37473cb50f397.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 46/46] linux-tools.inc: Dummify do_compile_perf and do_install_perf for uclibc
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
X-List-Received-Date: Fri, 01 Apr 2011 04:32:51 -0000

Perf wants elfutils and elfutils on uclibc does not work due to
its usage of obstack_printf functionality missing from uclibc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/linux/linux-tools.inc |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
index 2ac74a5..9ddebed 100644
--- a/meta/recipes-kernel/linux/linux-tools.inc
+++ b/meta/recipes-kernel/linux/linux-tools.inc
@@ -1,6 +1,11 @@
 # included by kernel recipes if they want to build/provide
 # perf functionality from their tree.
-
+do_compile_perf_libc-uclibc () {
+	:
+}
+do_install_perf_libc-uclibc () {
+	:
+}
 do_compile_perf() {
 	oe_runmake -C ${S}/tools/perf CC="${CC}" LD="${LD}" prefix=${prefix}
 }
@@ -14,6 +19,5 @@ do_install_perf() {
 addtask compile_perf after do_compile before do_install
 addtask install_perf after do_install before do_package
 
-do_compile_perf[depends] =  "virtual/libc:do_populate_sysroot"
-do_compile_perf[depends] =+ "elfutils:do_populate_sysroot"
-RDEPENDS_perf += "python perl elfutils"
+DEPENDS_perf_libc-glibc += "elfutils virtual/libc"
+RDEPENDS_perf_libc-glibc += "python perl elfutils"
-- 
1.7.4.1



