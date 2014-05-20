Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9313660196
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 01:27:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4K1RmCA002625
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 18:27:48 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 19 May 2014 18:27:47 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 May 2014 09:27:47 +0800
Message-ID: <1400549267-16062-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1400124104-10777-1-git-send-email-rongqing.li@windriver.com>
References: <1400124104-10777-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2] perl: fix for CVE-2010-4777
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
X-List-Received-Date: Tue, 20 May 2014 01:27:50 -0000
Content-Type: text/plain

From: "yanjun.zhu" <yanjun.zhu@windriver.com>

The Perl_reg_numbered_buff_fetch function in Perl 5.10.0, 5.12.0,
5.14.0, and other versions, when running with debugging enabled,
allows context-dependent attackers to cause a denial of service
(assertion failure and application exit) via crafted input that
is not properly handled when using certain regular expressions,
as demonstrated by causing SpamAssassin and OCSInventory to
crash.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4777
Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../perl-5.14.3-fix-CVE-2010-4777.patch            |   45 ++++++++++++++++++++
 meta/recipes-devtools/perl/perl-native_5.14.3.bb   |    3 +-
 meta/recipes-devtools/perl/perl_5.14.3.bb          |    3 +-
 3 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/perl-5.14.3-fix-CVE-2010-4777.patch

diff --git a/meta/recipes-devtools/perl/perl-5.14.3/perl-5.14.3-fix-CVE-2010-4777.patch b/meta/recipes-devtools/perl/perl-5.14.3/perl-5.14.3-fix-CVE-2010-4777.patch
new file mode 100644
index 0000000..da3c545
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.14.3/perl-5.14.3-fix-CVE-2010-4777.patch
@@ -0,0 +1,45 @@
+perl:fix for CVE-2010-4777
+
+Upstream-Status: Backport
+    
+The Perl_reg_numbered_buff_fetch function in Perl 5.10.0, 5.12.0,
+5.14.0, and other versions, when running with debugging enabled,
+allows context-dependent attackers to cause a denial of service
+(assertion failure and application exit) via crafted input that
+is not properly handled when using certain regular expressions,
+as demonstrated by causing SpamAssassin and OCSInventory to
+crash.
+
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4777
+
+Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -11868,8 +11868,25 @@ Perl_save_re_context(pTHX)
+ 
+ 		if (gvp) {
+ 		    GV * const gv = *gvp;
+-		    if (SvTYPE(gv) == SVt_PVGV && GvSV(gv))
+-			save_scalar(gv);
++		    if (SvTYPE(gv) == SVt_PVGV && GvSV(gv)) {
++			/* this is a copy of save_scalar() without the GETMAGIC call, RT#76538 */
++			SV ** const sptr = &GvSVn(gv);
++			SV * osv = *sptr;
++			SV * nsv = newSV(0);
++			save_pushptrptr(SvREFCNT_inc_simple(gv),
++			SvREFCNT_inc(osv), SAVEt_SV);
++			if (SvTYPE(osv) >= SVt_PVMG && SvMAGIC(osv) &&
++			    SvTYPE(osv) != SVt_PVGV) {
++			    if (SvGMAGICAL(osv)) {
++				const bool oldtainted = PL_tainted;
++				SvFLAGS(osv) |= (SvFLAGS(osv) &
++				    (SVp_IOK|SVp_NOK|SVp_POK)) >> PRIVSHIFT;
++				PL_tainted = oldtainted;
++			    }
++			    mg_localize(osv, nsv, 1);
++			}
++			*sptr = nsv;
++		    }
+ 		}
+ 	    }
+ 	}
diff --git a/meta/recipes-devtools/perl/perl-native_5.14.3.bb b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
index 2ef0a51..c38be41 100644
--- a/meta/recipes-devtools/perl/perl-native_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
@@ -17,7 +17,8 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
            file://MM_Unix.pm.patch \
            file://debian/errno_ver.diff \
            file://dynaloaderhack.patch \
-           file://perl-build-in-t-dir.patch"
+           file://perl-build-in-t-dir.patch \
+           file://perl-5.14.3-fix-CVE-2010-4777.patch "
 
 SRC_URI[md5sum] = "f6a3d878c688d111b495c87db56c5be5"
 SRC_URI[sha256sum] = "03638a4f01bc26b81231233671524b4163849a3a9ea5cc2397293080c4ea339f"
diff --git a/meta/recipes-devtools/perl/perl_5.14.3.bb b/meta/recipes-devtools/perl/perl_5.14.3.bb
index c307b99..fcd665b 100644
--- a/meta/recipes-devtools/perl/perl_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.3.bb
@@ -74,7 +74,8 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
         file://config.sh-32-be \
         file://config.sh-64 \
         file://config.sh-64-le \
-        file://config.sh-64-be"
+        file://config.sh-64-be \
+        file://perl-5.14.3-fix-CVE-2010-4777.patch "
 #	file://debian/fakeroot.diff
 
 SRC_URI[md5sum] = "f6a3d878c688d111b495c87db56c5be5"
-- 
1.7.10.4


