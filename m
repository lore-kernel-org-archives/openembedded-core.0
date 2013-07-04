Return-Path: <radu.moisan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 89B016AD81
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 14:56:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 04 Jul 2013 07:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,995,1363158000"; d="scan'208";a="360532263"
Received: from ubuntu.rb.intel.com ([10.237.105.59])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2013 07:57:00 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 17:57:44 +0300
Message-Id: <84abd44bc70ed4b13ca44a8ad32a8a91d708163b.1372947733.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372947733.git.radu.moisan@intel.com>
References: <cover.1372947733.git.radu.moisan@intel.com>
In-Reply-To: <cover.1372947733.git.radu.moisan@intel.com>
References: <cover.1372947733.git.radu.moisan@intel.com>
Subject: [PATCH 01/11] iputils: Upgrade to v20121221
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
X-List-Received-Date: Thu, 04 Jul 2013 14:56:04 -0000

Removed obsolete patches
Replaced openssl with gnutls in dependency list

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../files/debian/add-icmp-return-codes.diff        |   43 --------------------
 .../iputils/files/debian/fix-arping-timeouts.diff  |   26 ------------
 .../files/debian/fix-dead-host-ping-stats.diff     |   16 --------
 .../iputils/files/debian/targets.diff              |   14 +++----
 .../iputils/files/debian/use_gethostbyname2.diff   |   36 ++++++++--------
 .../{iputils_s20101006.bb => iputils_s20121221.bb} |   14 +++----
 6 files changed, 30 insertions(+), 119 deletions(-)
 delete mode 100644 meta/recipes-extended/iputils/files/debian/add-icmp-return-codes.diff
 delete mode 100644 meta/recipes-extended/iputils/files/debian/fix-arping-timeouts.diff
 delete mode 100644 meta/recipes-extended/iputils/files/debian/fix-dead-host-ping-stats.diff
 rename meta/recipes-extended/iputils/{iputils_s20101006.bb => iputils_s20121221.bb} (80%)

diff --git a/meta/recipes-extended/iputils/files/debian/add-icmp-return-codes.diff b/meta/recipes-extended/iputils/files/debian/add-icmp-return-codes.diff
deleted file mode 100644
index 40070c3..0000000
--- a/meta/recipes-extended/iputils/files/debian/add-icmp-return-codes.diff
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Pending [from other distro Debian]
-
-Index: trunk/ping.c
-===================================================================
---- trunk.orig/ping.c	2010-05-07 23:13:54.000000000 -0700
-+++ trunk/ping.c	2010-05-07 23:23:22.000000000 -0700
-@@ -883,9 +883,36 @@
- 		case ICMP_SR_FAILED:
- 			printf("Source Route Failed\n");
- 			break;
-+		case ICMP_NET_UNKNOWN:
-+			printf("Destination Net Unknown\n");
-+			break;
-+		case ICMP_HOST_UNKNOWN:
-+			printf("Destination Host Unknown\n");
-+			break;
-+		case ICMP_HOST_ISOLATED:
-+			printf("Source Host Isolated\n");
-+			break;
-+		case ICMP_NET_ANO:
-+			printf("Destination Net Prohibited\n");
-+			break;
-+		case ICMP_HOST_ANO:
-+			printf("Destination Host Prohibited\n");
-+			break;
-+		case ICMP_NET_UNR_TOS:
-+			printf("Destination Net Unreachable for Type of Service\n");
-+			break;
-+		case ICMP_HOST_UNR_TOS:
-+			printf("Destination Host Unreachable for Type of Service\n");
-+			break;
- 		case ICMP_PKT_FILTERED:
- 			printf("Packet filtered\n");
- 			break;
-+		case ICMP_PREC_VIOLATION:
-+			printf("Precedence Violation\n");
-+			break;
-+		case ICMP_PREC_CUTOFF:
-+			printf("Precedence Cutoff\n");
-+			break;
- 		default:
- 			printf("Dest Unreachable, Bad Code: %d\n", code);
- 			break;
diff --git a/meta/recipes-extended/iputils/files/debian/fix-arping-timeouts.diff b/meta/recipes-extended/iputils/files/debian/fix-arping-timeouts.diff
deleted file mode 100644
index 3e34788..0000000
--- a/meta/recipes-extended/iputils/files/debian/fix-arping-timeouts.diff
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Pending [from other distro Debian]
-
-Index: trunk/arping.c
-===================================================================
---- trunk.orig/arping.c	2010-05-07 23:13:52.000000000 -0700
-+++ trunk/arping.c	2010-05-07 23:41:16.000000000 -0700
-@@ -182,12 +182,17 @@
- 	if (start.tv_sec==0)
- 		start = tv;
- 
--	if (count-- == 0 || (timeout && MS_TDIFF(tv,start) > timeout*1000 + 500))
-+	if (timeout && MS_TDIFF(tv,start) > timeout*1000 + 500)
- 		finish();
- 
--	if (last.tv_sec==0 || MS_TDIFF(tv,last) > 500) {
-+	if ((!timeout) && (count == 0))
-+		finish();
-+
-+	if ( count!=0  && (last.tv_sec==0 || MS_TDIFF(tv,last) > 500 ) ) {
- 		send_pack(s, src, dst,
- 			  (struct sockaddr_ll *)&me, (struct sockaddr_ll *)&he);
-+		if (count >= 0)
-+		    count--;
- 		if (count == 0 && unsolicited)
- 			finish();
- 	}
diff --git a/meta/recipes-extended/iputils/files/debian/fix-dead-host-ping-stats.diff b/meta/recipes-extended/iputils/files/debian/fix-dead-host-ping-stats.diff
deleted file mode 100644
index fda42bf..0000000
--- a/meta/recipes-extended/iputils/files/debian/fix-dead-host-ping-stats.diff
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending [from other distro Debian]
-
-Index: trunk/ping_common.c
-===================================================================
---- trunk.orig/ping_common.c	2010-05-07 23:13:51.000000000 -0700
-+++ trunk/ping_common.c	2010-05-07 23:22:33.000000000 -0700
-@@ -872,7 +872,8 @@
- 		printf("%spipe %d", comma, pipesize);
- 		comma = ", ";
- 	}
--	if (ntransmitted > 1 && (!interval || (options&(F_FLOOD|F_ADAPTIVE)))) {
-+	if (ntransmitted > 1 && nreceived &&
-+		(!interval || (options&(F_FLOOD|F_ADAPTIVE)))) {
- 		int ipg = (1000000*(long long)tv.tv_sec+tv.tv_usec)/(ntransmitted-1);
- 		printf("%sipg/ewma %d.%03d/%d.%03d ms",
- 		       comma, ipg/1000, ipg%1000, rtt/8000, (rtt/8)%1000);
diff --git a/meta/recipes-extended/iputils/files/debian/targets.diff b/meta/recipes-extended/iputils/files/debian/targets.diff
index 6b899cb..2cb5576 100644
--- a/meta/recipes-extended/iputils/files/debian/targets.diff
+++ b/meta/recipes-extended/iputils/files/debian/targets.diff
@@ -1,15 +1,15 @@
 Upstream-Status: Inappropriate [disable feature]
 
-Index: trunk/Makefile
+Index: iputils-s20121221/Makefile
 ===================================================================
---- trunk.orig/Makefile	2010-05-07 23:43:00.000000000 -0700
-+++ trunk/Makefile	2010-05-07 23:47:10.000000000 -0700
-@@ -16,7 +16,7 @@
- CCOPT=-D_GNU_SOURCE -O2 -Wstrict-prototypes -Wall -g
- CFLAGS=$(CCOPT) $(GLIBCFIX) $(DEFINES) 
+--- iputils-s20121221.orig/Makefile
++++ iputils-s20121221/Makefile
+@@ -106,7 +106,7 @@ endif
+ endif
  
+ # -------------------------------------
 -IPV4_TARGETS=tracepath ping clockdiff rdisc arping tftpd rarpd
-+IPV4_TARGETS=tracepath ping arping clockdiff
++IPV4_TARGETS=tracepath ping clockdiff arping
  IPV6_TARGETS=tracepath6 traceroute6 ping6
  TARGETS=$(IPV4_TARGETS) $(IPV6_TARGETS)
  
diff --git a/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff b/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff
index 1d01e15..d3b1886 100644
--- a/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff
+++ b/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff
@@ -1,31 +1,31 @@
 Upstream-Status: Pending [from other distro Debian]
 
-Index: trunk/tracepath.c
+Index: iputils-s20121221/tracepath.c
 ===================================================================
---- trunk.orig/tracepath.c	2010-05-07 23:13:52.000000000 -0700
-+++ trunk/tracepath.c	2010-05-07 23:24:09.000000000 -0700
-@@ -338,9 +338,9 @@
- 		base_port = atoi(p+1);
- 	} else
- 		base_port = 44444;
--	he = gethostbyname(argv[0]);
+--- iputils-s20121221.orig/tracepath.c
++++ iputils-s20121221/tracepath.c
+@@ -370,9 +370,9 @@ main(int argc, char **argv)
+ 	}
+ #endif
+ 
+-	he = gethostbyname(p);
 +	he = gethostbyname2(argv[0], AF_INET);
  	if (he == NULL) {
 -		herror("gethostbyname");
 +		herror("gethostbyname2");
  		exit(1);
  	}
- 	memcpy(&target.sin_addr, he->h_addr, 4);
-Index: trunk/ping.c
+ 
+Index: iputils-s20121221/ping.c
 ===================================================================
---- trunk.orig/ping.c	2010-05-07 23:23:22.000000000 -0700
-+++ trunk/ping.c	2010-05-07 23:24:09.000000000 -0700
-@@ -250,7 +250,7 @@
- 			if (argc == 1)
- 				options |= F_NUMERIC;
- 		} else {
--			hp = gethostbyname(target);
-+			hp = gethostbyname2(target, AF_INET);
+--- iputils-s20121221.orig/ping.c
++++ iputils-s20121221/ping.c
+@@ -279,7 +279,7 @@ main(int argc, char **argv)
+ #else
+ 			idn = target;
+ #endif
+-			hp = gethostbyname(idn);
++			hp = gethostbyname2(idn, AF_INET);
  			if (!hp) {
  				fprintf(stderr, "ping: unknown host %s\n", target);
  				exit(2);
diff --git a/meta/recipes-extended/iputils/iputils_s20101006.bb b/meta/recipes-extended/iputils/iputils_s20121221.bb
similarity index 80%
rename from meta/recipes-extended/iputils/iputils_s20101006.bb
rename to meta/recipes-extended/iputils/iputils_s20121221.bb
index 2c2766c..3892cab 100644
--- a/meta/recipes-extended/iputils/iputils_s20101006.bb
+++ b/meta/recipes-extended/iputils/iputils_s20121221.bb
@@ -8,25 +8,21 @@ LICENSE = "BSD & GPLv2+"
 
 LIC_FILES_CHKSUM = "file://ping.c;beginline=1;endline=35;md5=f9ceb201733e9a6cf8f00766dd278d82 \
                     file://tracepath.c;beginline=1;endline=10;md5=0ecea2bf60bff2f3d840096d87647f3d \
-                    file://arping.c;beginline=1;endline=10;md5=ada2a6d06acc90f943bddf40d15e0541 \
+                    file://arping.c;beginline=1;endline=11;md5=fe84301b5c2655c950f8b92a057fafa6 \
                     file://tftpd.c;beginline=1;endline=32;md5=28834bf8a91a5b8a92755dbee709ef96 "
 
-DEPENDS = "openssl docbook-utils-native sgmlspl-native"
+DEPENDS = "gnutls docbook-utils-native sgmlspl-native"
 
-PR = "r6"
+PR = "r0"
 
 SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
-           file://debian/fix-dead-host-ping-stats.diff \
-           file://debian/add-icmp-return-codes.diff \
            file://debian/use_gethostbyname2.diff \
            file://debian/targets.diff \
-           file://debian/fix-arping-timeouts.diff \
            file://nsgmls-path-fix.patch \
-           file://arping-break-libsysfs-dependency.patch \
           "
 
-SRC_URI[md5sum] = "a36c25e9ec17e48be514dc0485e7376c"
-SRC_URI[sha256sum] = "fd3af46c80ebb99607c2ca1f2a3608b6fe828e25bbec6e54f2afd25f6ddb6ee7"
+SRC_URI[md5sum] = "6072aef64205720dd1893b375e184171"
+SRC_URI[sha256sum] = "450f549fc5b620c23c5929aa6d54b7ddfc7ee1cb1e8efdc5e8bb21d8d0c5319f"
 
 do_compile () {
 	oe_runmake 'CC=${CC} -D_GNU_SOURCE' VPATH="${STAGING_LIBDIR}:${STAGING_DIR_HOST}/${base_libdir}" all man
-- 
1.7.9.5


