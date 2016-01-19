Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 96C826FFC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 14:46:56 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0JEkuJe000803; Tue, 19 Jan 2016 08:46:56 -0600
Received: from ionel-workpc.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016011908465626-72947 ;
	Tue, 19 Jan 2016 08:46:56 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 16:46:43 +0200
Message-Id: <1453214803-32393-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/19/2016 08:46:56 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/19/2016 08:46:56 AM,
	Serialize complete at 01/19/2016 08:46:56 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-19_07:, , signatures=0
Subject: [PATCH v2 1/1] gcc-runtime.inc: provide libquadmath
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
X-List-Received-Date: Tue, 19 Jan 2016 14:46:57 -0000

libgfortran's build fails with "ld: cannot find -lquadmath" unless
libquadmath is added to gcc-runtime's RUNTIMETARGET

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index c31072a..0e62e97 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -10,7 +10,9 @@ EXTRA_OECONF_PATHS = "\
 
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
-RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic"
+RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic \
+    ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
+"
 #  ?
 # libiberty
 # libmudflap
-- 
2.7.0


