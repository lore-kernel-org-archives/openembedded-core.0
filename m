Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2AAC48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 05:32:27 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.14548.1708925541545023136
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 21:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kdxroiF+;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708925541; x=1740461541;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AtBY3K3D5d0nEMeZ1AtP0N541QWzV74xsS7mhjZkPyM=;
  b=kdxroiF+heoRN9kZWVeAn4qunAhtE5Kzsg6aLA4sVgOxKVjcT2bhBGys
   frNveIJ5NTXM+UBMR1l2Ws4th4iSIgriUJ/v/Rw2mjSqF+jwM7duzD+LK
   rN2Bei6r8HJlOC5ETutCeQIlK2yUJAlAR2X5Epn38bzNSMF6hlm90gMAi
   wp0JAeY+0Z7Y1+HpwHxzKOYhT0gAoWv0hOHlzt0sFJTM4nlsoiHw7LOQ6
   ONfHNvCsLotMvZlWYupkvdb/WPnd8YWz+vE87KUrkeoNoZqRkxmOANkL5
   CuOFWUsi1lwVfsiCDm973auIXRCteyCyI9FSy/AAEcK9e4Sd1vnLq2jqt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="129691251"
X-IronPort-AV: E=Sophos;i="6.06,185,1705330800"; 
   d="scan'208";a="129691251"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 14:32:18 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 70A641590E9
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:32:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A45E0D52A2
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:32:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 241B66B82F
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:32:15 +0900 (JST)
Received: from ubuntu20.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 961F81A006A;
	Mon, 26 Feb 2024 13:32:14 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] glibc: Fix conflict error when enbale multilib on aarch64.
Date: Mon, 26 Feb 2024 13:32:10 +0800
Message-Id: <20240226053210.3501-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28214.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28214.005
X-TMASE-Result: 10--6.307400-10.000000
X-TMASE-MatchedRID: iZD11v4eij7WzUAcn0Tx4LstbCLHbulSQR7lWMXPA1tO2MZoFipNWyX+
	aLb2rzmXOmeki4s2H2F3TaF7+lCZvuaHepMfdPYELTHwnYOikQ2HqfCKxjr5zbKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYvL3NxFKQpq1dumHfQnEWue9HTxRE6QQBwaRAtAzcJ/6myiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1ZF4xnY4mSTeubJ27wJO9r96UpQac8RwtBoBaHECtZ9Swtfd2ovABQQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 05:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196179

From: Lei Maohui <leimaohui@fujitsu.com>

Error: Transaction test error:
  file /usr/include/finclude/math-vector-fortran.h from install of lib32-libc6-dev-2.39+git0+312e159626-r0.armv7ahf_neon conflicts with file from package libc6-dev-2.39+git0+312e159626-r0.aarch64

The difference of math-vector-fortran.h between 32bit and 64bit is as
the following:

--- tmp/work/aarch64-linux/glibc/2.39+git/image/usr/include/finclude/math-vector-fortran.h    2024-02-26 03:41:59.560000000 +0000
+++ tmp/work/armv7ahf-neon-xmllib32-linux-gnueabi/lib32-glibc/2.39+git/image/usr/include/finclude/math-vector-fortran.h 2024-02-26 02:22:28.592000000 +0000
@@ -15,33 +15,5 @@
 !   You should have received a copy of the GNU Lesser General Public
 !   License along with the GNU C Library; if not, see
 !   <https://www.gnu.org/licenses/>.
-!GCC$ builtin (acos) attributes simd (notinbranch)
-!GCC$ builtin (acosf) attributes simd (notinbranch)
-!GCC$ builtin (asin) attributes simd (notinbranch)
-!GCC$ builtin (asinf) attributes simd (notinbranch)
-!GCC$ builtin (atan) attributes simd (notinbranch)
-!GCC$ builtin (atanf) attributes simd (notinbranch)
-!GCC$ builtin (atan2) attributes simd (notinbranch)
-!GCC$ builtin (atan2f) attributes simd (notinbranch)
-!GCC$ builtin (cos) attributes simd (notinbranch)
-!GCC$ builtin (cosf) attributes simd (notinbranch)
-!GCC$ builtin (exp) attributes simd (notinbranch)
-!GCC$ builtin (expf) attributes simd (notinbranch)
-!GCC$ builtin (exp10) attributes simd (notinbranch)
-!GCC$ builtin (exp10f) attributes simd (notinbranch)
-!GCC$ builtin (exp2) attributes simd (notinbranch)
-!GCC$ builtin (exp2f) attributes simd (notinbranch)
-!GCC$ builtin (expm1) attributes simd (notinbranch)
-!GCC$ builtin (expm1f) attributes simd (notinbranch)
-!GCC$ builtin (log) attributes simd (notinbranch)
-!GCC$ builtin (logf) attributes simd (notinbranch)
-!GCC$ builtin (log10) attributes simd (notinbranch)
-!GCC$ builtin (log10f) attributes simd (notinbranch)
-!GCC$ builtin (log1p) attributes simd (notinbranch)
-!GCC$ builtin (log1pf) attributes simd (notinbranch)
-!GCC$ builtin (log2) attributes simd (notinbranch)
-!GCC$ builtin (log2f) attributes simd (notinbranch)
-!GCC$ builtin (sin) attributes simd (notinbranch)
-!GCC$ builtin (sinf) attributes simd (notinbranch)
-!GCC$ builtin (tan) attributes simd (notinbranch)
-!GCC$ builtin (tanf) attributes simd (notinbranch)
+
+! No SIMD math functions are available for this platform.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 1ef987be0a..19eb7afa81 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -167,6 +167,7 @@ do_install_armmultilib () {
 	oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h ieee754.h
 
 	oe_multilib_header sys/elf.h sys/procfs.h sys/ptrace.h sys/ucontext.h sys/user.h
+	oe_multilib_header finclude/math-vector-fortran.h
 }
 
 
-- 
2.34.1


