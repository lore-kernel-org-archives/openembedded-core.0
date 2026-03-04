Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22989EB7EBB
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:28:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14849.1772620102025494084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KnBy0qPu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7523de4f93=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62450GPS2217453;
	Wed, 4 Mar 2026 02:28:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=3RORjqBkD
	RcPSidBt0i4ROMmoLV3jqVk86rhVR3oEro=; b=KnBy0qPuIyuHPwiou99Xx4eBc
	8h1TLD0fpdKe8xBzpkBHh/XAG7Brjp08wDtj2OX+zXH9N+0AQn57bmPaSaCB7g6+
	rZSmTFqczAulJuEfeQs1/ET9lbrIknOon3W6qFMPRyRRRnn/ykiYVw667S0t4xAD
	hRUYoqO+6DPmL5e7oy5K8zTo/0df1czjyyRCltb0klxttCGwQsiqYAWRIcOXkPTf
	9o6Tupf+wOBdDDW5Z2xJfFLAveF7uQss3B0zeHeToK/jFkomfQl2ndEtHDA10Tgs
	nW2TKjuOiiiNciT7iocoP0SEeOV3G2Pyw/Z/k9VyhU5Kf3lzN+dRd3xM2066A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rgme42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 Mar 2026 02:28:13 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 4 Mar 2026 02:28:13 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 4 Mar 2026 02:28:12 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v2] ncurses: upgrade 6.5 -> 6.6
Date: Wed, 4 Mar 2026 18:28:11 +0800
Message-ID: <20260304102811.1530062-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 8QbKoVzBxUo8K9z71bl5WRLTTEeZ1pWc
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a8093d cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=67k8HWImAAAA:8 a=HiWkEfo4AAAA:8 a=a_U1oVfrAAAA:8 a=pGLkceISAAAA:8
 a=NYJ3QU8SUMfMleiBl2YA:9 a=dwZ1aX4BNvL9xv1s:21 a=FdTzh2GWekK77mhwV6Dw:22
 a=-Ce2kUORdVUGt2UwD6To:22 a=_QplDg0m8TGAdENQf2wZ:22
X-Proofpoint-ORIG-GUID: 8QbKoVzBxUo8K9z71bl5WRLTTEeZ1pWc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4MCBTYWx0ZWRfX7cAuLHDERFp2
 jEDwW5z3kcUsa+FRAu9wR6bc9D1rvUQGe106+GutThA5gTQ2yssQJeyHBtJkEIhLzc8vmszm54A
 0ojUs10RVkqVavh3Y5WckcZygTCCJqu67yYt6FqR+OFR8L2rQivZv+R7EIrO7a5jajH2Lh8ALSs
 nOwNFePZoKvL8ZmQ0QJFNZI5vvxYpMcj9aZeZA+48TC+fJ853//jHRxztfbYShSBS/vr1AV2g/C
 w1XNeSuI6kWIjJnGLWD/QihXnKhsqhvo9DgxqYOWjUgk9nVqWBUPIbLvxsFNFWYcNesi6P2cV74
 cxyzmZb1DoEn3WPNjCOpZkIWyioQVlMr5iTREo9D1pVXDsRWZiCXtdSX36e0iiB1sreJAOFqDxw
 Yud/CSoKR5vqnFWNhxlDI8Fytj/7JCRU++5NQLYyISrTuC89D1BDCY/Gi/YOlITDL7jqBqoE12B
 WsKunDNLbbMd3hc34KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232359

1. License-Update: copyright years updated

2. Fix installed-vs-shipped QA error
...
ERROR: ncurses-6.6-r0 do_package: QA Issue: ncurses: Files/directories were installed but not shipped in any package:
  /usr/lib
ncurses: 1 installed and not shipped files. [installed-vs-shipped]
...

Due to commit [1], upstream hardcoded `lib` to create symlink
...
 ** sym-linked tmp/work/x86-64-v3-oe-linux/ncurses/6.6/image/usr/lib/terminfo for compatibility
...

Apply a local patch to not create symlink terminfo under image/usr/lib,
and clean up symlink remove operation in recipe

3. Delete backport patch
- CVE-2025-6141.patch

4. Announcing ncurses 6.6:
  https://lists.gnu.org/archive/html/info-gnu/2025-12/msg00010.html

[1] https://github.com/ThomasDickey/ncurses-snapshots/commit/a60b584d93ab59e1df0bc9661b7

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...te-symlink-to-terminfo-under-usr-lib.patch | 47 +++++++++++++++++++
 .../ncurses/files/0001-tic-hang.patch         |  6 +--
 .../files/0002-configure-reproducible.patch   |  6 +--
 ...-Do-not-include-LDFLAGS-in-generated.patch |  4 +-
 .../ncurses/files/CVE-2025-6141.patch         | 25 ----------
 .../ncurses/files/exit_prototype.patch        | 10 ++--
 meta/recipes-core/ncurses/ncurses.inc         |  7 +--
 .../{ncurses_6.5.bb => ncurses_6.6.bb}        |  4 +-
 8 files changed, 63 insertions(+), 46 deletions(-)
 create mode 100644 meta/recipes-core/ncurses/files/0001-do-not-create-symlink-to-terminfo-under-usr-lib.patch
 delete mode 100644 meta/recipes-core/ncurses/files/CVE-2025-6141.patch
 rename meta/recipes-core/ncurses/{ncurses_6.5.bb => ncurses_6.6.bb} (80%)

diff --git a/meta/recipes-core/ncurses/files/0001-do-not-create-symlink-to-terminfo-under-usr-lib.patch b/meta/recipes-core/ncurses/files/0001-do-not-create-symlink-to-terminfo-under-usr-lib.patch
new file mode 100644
index 0000000000..86eb41b465
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/0001-do-not-create-symlink-to-terminfo-under-usr-lib.patch
@@ -0,0 +1,47 @@
+From 6464ca567ca012b56bdae127758a118fa193a211 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 4 Mar 2026 16:57:31 +0800
+Subject: [PATCH] do not create symlink to terminfo under /usr/lib
+
+Due to commit [1], it hardcoded `lib` to create symlink
+...
+ ** sym-linked tmp/work/x86-64-v3-oe-linux/ncurses/6.6/image/usr/lib/terminfo for compatibility
+...
+
+It is not necessary for Yocto
+
+Upstream-Status: Inappropriate [Yocto specific]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ misc/run_tic.in | 15 ---------------
+ 1 file changed, 15 deletions(-)
+
+diff --git a/misc/run_tic.in b/misc/run_tic.in
+index 60fbdcc7..fa40b33c 100644
+--- a/misc/run_tic.in
++++ b/misc/run_tic.in
+@@ -215,21 +215,6 @@ if test "$OLD_DIR" != "$TICDIR" ; then
+ 		fi
+ 	else
+ 		cd "${INSTALL_PREFIX}" || exit
+-		# Construct a symbolic link that only assumes $ticdir has the
+-		# same $prefix as the other installed directories.
+-		SOURCE=`echo "$ticdir"|sed -e 's%^'"$prefix"'/%%'`
+-		if test "$SOURCE" != "$ticdir" ; then
+-			SOURCE=../`echo "$ticdir"|sed -e 's%^'"$prefix"'/%%' -e 's%^/%%'`
+-		fi
+-		test -d lib || mkdir lib
+-		cd lib || exit
+-		TARGET=`pwd`/terminfo
+-		if ( @LN_S@ "$SOURCE" terminfo )
+-		then
+-			echo "** sym-linked $TARGET for compatibility"
+-		else
+-			echo "** could not sym-link $TARGET for compatibility"
+-		fi
+ 	fi
+ fi
+ # vile:shmode ts=4 sw=4
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/ncurses/files/0001-tic-hang.patch b/meta/recipes-core/ncurses/files/0001-tic-hang.patch
index 8cb92a3939..b852bf72d2 100644
--- a/meta/recipes-core/ncurses/files/0001-tic-hang.patch
+++ b/meta/recipes-core/ncurses/files/0001-tic-hang.patch
@@ -1,4 +1,4 @@
-From a51a53f0eecfd4d083aba8dfcd47c65e93978ff1 Mon Sep 17 00:00:00 2001
+From 055c095e9b7c850dfb1ad7cf8e334f38fa9ba2c3 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 30 Mar 2018 10:02:24 +0800
 Subject: [PATCH] tic hang
@@ -17,10 +17,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+), 6 deletions(-)
 
 diff --git a/misc/terminfo.src b/misc/terminfo.src
-index 5d575b8e..f9cc6880 100644
+index f111e534..6e862729 100644
 --- a/misc/terminfo.src
 +++ b/misc/terminfo.src
-@@ -6518,12 +6518,11 @@ konsole-xf3x|KDE console window with keyboard for XFree86 3.x xterm,
+@@ -6644,12 +6644,11 @@ konsole-xf3x|KDE console window with keyboard for XFree86 3.x xterm,
  # The value for kbs (see konsole-vt100) reflects local customization rather
  # than the settings used for XFree86 xterm.
  konsole-xf4x|KDE console window with keyboard for XFree86 4.x xterm,
diff --git a/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch b/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
index 11ca66c8e8..66812f75e5 100644
--- a/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
+++ b/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
@@ -1,4 +1,4 @@
-From 63cf58044f4ab3297c5a2d0e132e87ebfa80c753 Mon Sep 17 00:00:00 2001
+From 58bec4533de00e0b765d8db496f9e20e4efca518 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 16 Aug 2017 14:45:27 +0800
 Subject: [PATCH] configure: reproducible
@@ -18,10 +18,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 488d93fc..005d44e2 100755
+index 48ad381f..c816cbe1 100755
 --- a/configure
 +++ b/configure
-@@ -5129,7 +5129,7 @@ else
+@@ -5422,7 +5422,7 @@ else
  		;;
  	(*)
  		cf_cv_ar_flags=unknown
diff --git a/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch b/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
index d89399bbe5..e004d7950a 100644
--- a/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
+++ b/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
@@ -1,4 +1,4 @@
-From 5962a5ee2885f67a396f7e8955ac1bbd7f15d4aa Mon Sep 17 00:00:00 2001
+From ce86a223b09b27981fb3d5ef32672612f0c2eae7 Mon Sep 17 00:00:00 2001
 From: Nathan Rossi <nathan@nathanrossi.com>
 Date: Mon, 14 Dec 2020 13:39:02 +1000
 Subject: [PATCH] gen-pkgconfig.in: Do not include LDFLAGS in generated pc
@@ -15,7 +15,7 @@ Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/misc/gen-pkgconfig.in b/misc/gen-pkgconfig.in
-index 89a5cd4a..07d94d17 100644
+index c369dd26..abca88fe 100644
 --- a/misc/gen-pkgconfig.in
 +++ b/misc/gen-pkgconfig.in
 @@ -83,7 +83,7 @@ if [ "$includedir" != "/usr/include" ]; then
diff --git a/meta/recipes-core/ncurses/files/CVE-2025-6141.patch b/meta/recipes-core/ncurses/files/CVE-2025-6141.patch
deleted file mode 100644
index ec7e8a94e4..0000000000
--- a/meta/recipes-core/ncurses/files/CVE-2025-6141.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 27d1493340d714e7be6e08c0a8f43e48276149c4 Mon Sep 17 00:00:00 2001
-From: "Thomas E. Dickey" <dickey@invisible-island.net>
-Date: Sat, 29 Mar 2025 22:52:37 +0000
-Subject: [PATCH] snapshot of project "ncurses", label v6_5_20250329
-
-CVE: CVE-2025-6141
-Upstream-Status: Backport [https://github.com/ThomasDickey/ncurses-snapshots/commit/27d1493340d714e7be6e08c0a8f43e48276149c4]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- ncurses/tinfo/parse_entry.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
-index a2278c07..c551c780 100644
---- a/ncurses/tinfo/parse_entry.c
-+++ b/ncurses/tinfo/parse_entry.c
-@@ -985,6 +985,8 @@ postprocess_termcap(TERMTYPE2 *tp, bool has_base)
- 	    bp = tp->Strings[from_ptr->nte_index];
- 	    if (VALID_STRING(bp)) {
- 		for (dp = buf2; *bp; bp++) {
-+		    if ((size_t) (dp - buf2) >= (sizeof(buf2) - sizeof(TERMTYPE2)))
-+			  break;
- 		    if (bp[0] == '$' && bp[1] == '<') {
- 			while (*bp && *bp != '>') {
- 			    ++bp;
diff --git a/meta/recipes-core/ncurses/files/exit_prototype.patch b/meta/recipes-core/ncurses/files/exit_prototype.patch
index 299852d2c0..0aa7fb22bb 100644
--- a/meta/recipes-core/ncurses/files/exit_prototype.patch
+++ b/meta/recipes-core/ncurses/files/exit_prototype.patch
@@ -1,4 +1,4 @@
-From af798dceafec8a9ea3f83fc250d784511ca0a29c Mon Sep 17 00:00:00 2001
+From 5ed47758886dabe74ff1709137cfc8ea1a4dc3e4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 30 Aug 2022 15:58:32 -0700
 Subject: [PATCH] Add needed headers for including mbstate_t and exit()
@@ -10,18 +10,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index 005d44e2..72fa6c23 100755
+index c816cbe1..c4e1e14a 100755
 --- a/configure
 +++ b/configure
-@@ -3462,6 +3462,7 @@ rm -f "conftest.$ac_objext" "conftest.$ac_ext"
+@@ -3769,6 +3769,7 @@ rm -f "conftest.$ac_objext" "conftest.$ac_ext"
    cat >"conftest.$ac_ext" <<_ACEOF
- #line 3463 "configure"
+ #line 3770 "configure"
  #include "confdefs.h"
 +#include <stdlib.h>
  $ac_declaration
  int
  main (void)
-@@ -13533,6 +13534,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
+@@ -13903,6 +13904,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
  #include <stdlib.h>
  #include <stdarg.h>
  #include <stdio.h>
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 8482db7f6e..ec265e63f2 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -2,7 +2,7 @@ SUMMARY = "The New Curses library"
 DESCRIPTION = "SVr4 and XSI-Curses compatible curses library and terminfo tools including tic, infocmp, captoinfo. Supports color, multiple highlights, forms-drawing characters, and automatic recognition of keypad and function-key sequences. Extensions include resizable windows and mouse support on both xterm and Linux console using the gpm library."
 HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6f291ee54551d9d8d992ecd623fe4bc7;endline=27"
+LIC_FILES_CHKSUM = "file://COPYING;endline=27;md5=c534844fa5a74d14ae8fa3d9b3b42138"
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS:class-native = ""
@@ -201,11 +201,6 @@ do_install() {
                 ln -sf xterm-color ${D}${sysconfdir}/terminfo/x/xterm
         fi
 
-        # When changing ${libdir} to e.g. /usr/lib/myawesomelib/ ncurses 
-        # still installs '/usr/lib/terminfo', so try to rm both 
-        # the proper path and a slightly hardcoded one
-        rm -f ${D}${libdir}/terminfo ${D}${prefix}/lib/terminfo
-
         # create linker scripts for libcurses.so and libncurses to
         # link against -ltinfo when needed. Some builds might break
         # else when '-Wl,--no-copy-dt-needed-entries' has been set in
diff --git a/meta/recipes-core/ncurses/ncurses_6.5.bb b/meta/recipes-core/ncurses/ncurses_6.6.bb
similarity index 80%
rename from meta/recipes-core/ncurses/ncurses_6.5.bb
rename to meta/recipes-core/ncurses/ncurses_6.6.bb
index eccc1c1809..7459e445f8 100644
--- a/meta/recipes-core/ncurses/ncurses_6.5.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.6.bb
@@ -4,10 +4,10 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            file://exit_prototype.patch \
-           file://CVE-2025-6141.patch \
+           file://0001-do-not-create-symlink-to-terminfo-under-usr-lib.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "1c55d64d9d3e00399a21f04e9cac1e472ab5f70a"
+SRCREV = "a1c9c082bbe6ac18d96eb2e1ee2146e1665deaf8"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+_\d+)$"
 
-- 
2.34.1


