Received: from mail-gg0-f170.google.com ([209.85.161.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TsXC2-0003Ae-Uz
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 12:18:19 +0100
Received: by mail-gg0-f170.google.com with SMTP id l1so29458ggn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 03:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=qLUuhmo6B7GILOSvVYZUpp+oiObtJwmeN944mI9NdL8=;
	b=AruSDuhy6bF6apfhPWreaE7BPg019/IJf2XFZ8GVGHVViqvJmMh1EUGRl5afllRP5s
	Undnj5dOMxW+0SC7hGH8NxCdaEckAUq74PpBhcgrqXbV+VuUPsBPeINQvTt8Qg2+Kc03
	uejHarmQn6QfFr6Y85HvGlcZPT8bYUlzZ772bdpFZ0+juV4WwCH1LjIrbxzOYuDh23N6
	Nzp8uLLPFG2sARwdepkI/0x1IuNCY/+TGiuH3t4U3J9R18qVr2C+VSv+9W6TatMIFk7Y
	uWvghltHJ+cOAz7AtOUI9Mfhc1jyCG+HL0EJNJ5IS1Au6AqbDGHyMV+XjWG83YbI+vF2
	a6xQ==
X-Received: by 10.236.145.100 with SMTP id o64mr71039870yhj.44.1357642975990; 
	Tue, 08 Jan 2013 03:02:55 -0800 (PST)
Received: from nano.lab.ossystems.com.br.lab.ossystems.com.br ([187.23.158.26])
	by mx.google.com with ESMTPS id q4sm63066539anp.18.2013.01.08.03.02.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Jan 2013 03:02:55 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 09:06:25 -0200
Message-Id: <1357643185-495-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] libnl: Update to 3.2.17
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
X-List-Received-Date: Tue, 08 Jan 2013 11:18:22 -0000

* fix-build-using-flex.patch: removed, it was a backported fix from
  3.2.17;

* fix-callback-segfault.patch: added; it is a backport from 3.2.18 in
  development;

* add-missing-header.patch: added to fix build with old kernel headers.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../libnl/libnl/add-missing-header.patch           |  129 ++++++++++++++++++++
 .../libnl/libnl/fix-build-using-flex.patch         |   55 ---------
 .../libnl/libnl/fix-callback-segfault.patch        |   35 ++++++
 .../libnl/libnl/fix-pktloc_syntax_h-race.patch     |    2 +-
 .../libnl/{libnl_3.2.16.bb => libnl_3.2.17.bb}     |    9 +-
 5 files changed, 170 insertions(+), 60 deletions(-)
 create mode 100644 meta/recipes-support/libnl/libnl/add-missing-header.patch
 delete mode 100644 meta/recipes-support/libnl/libnl/fix-build-using-flex.patch
 create mode 100644 meta/recipes-support/libnl/libnl/fix-callback-segfault.patch
 rename meta/recipes-support/libnl/{libnl_3.2.16.bb => libnl_3.2.17.bb} (85%)

diff --git a/meta/recipes-support/libnl/libnl/add-missing-header.patch b/meta/recipes-support/libnl/libnl/add-missing-header.patch
new file mode 100644
index 0000000..ef5f6bb
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/add-missing-header.patch
@@ -0,0 +1,129 @@
+This includes a missing header which has not been distributed by
+mistake in 3.2.16 and 3.2.17 release which allow build with old
+kernels.
+
+Upstream-Status: Submitted [http://lists.infradead.org/pipermail/libnl/2013-January/000857.html]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff -Nur a/include/linux/netfilter/nf_conntrack_common.h b/include/linux/netfilter/nf_conntrack_common.h
+--- a/include/linux/netfilter/nf_conntrack_common.h	1969-12-31 21:00:00.000000000 -0300
++++ b/include/linux/netfilter/nf_conntrack_common.h	2013-01-07 17:19:21.199246084 -0200
+@@ -0,0 +1,117 @@
++#ifndef _UAPI_NF_CONNTRACK_COMMON_H
++#define _UAPI_NF_CONNTRACK_COMMON_H
++/* Connection state tracking for netfilter.  This is separated from,
++   but required by, the NAT layer; it can also be used by an iptables
++   extension. */
++enum ip_conntrack_info {
++	/* Part of an established connection (either direction). */
++	IP_CT_ESTABLISHED,
++
++	/* Like NEW, but related to an existing connection, or ICMP error
++	   (in either direction). */
++	IP_CT_RELATED,
++
++	/* Started a new connection to track (only
++           IP_CT_DIR_ORIGINAL); may be a retransmission. */
++	IP_CT_NEW,
++
++	/* >= this indicates reply direction */
++	IP_CT_IS_REPLY,
++
++	IP_CT_ESTABLISHED_REPLY = IP_CT_ESTABLISHED + IP_CT_IS_REPLY,
++	IP_CT_RELATED_REPLY = IP_CT_RELATED + IP_CT_IS_REPLY,
++	IP_CT_NEW_REPLY = IP_CT_NEW + IP_CT_IS_REPLY,	
++	/* Number of distinct IP_CT types (no NEW in reply dirn). */
++	IP_CT_NUMBER = IP_CT_IS_REPLY * 2 - 1
++};
++
++/* Bitset representing status of connection. */
++enum ip_conntrack_status {
++	/* It's an expected connection: bit 0 set.  This bit never changed */
++	IPS_EXPECTED_BIT = 0,
++	IPS_EXPECTED = (1 << IPS_EXPECTED_BIT),
++
++	/* We've seen packets both ways: bit 1 set.  Can be set, not unset. */
++	IPS_SEEN_REPLY_BIT = 1,
++	IPS_SEEN_REPLY = (1 << IPS_SEEN_REPLY_BIT),
++
++	/* Conntrack should never be early-expired. */
++	IPS_ASSURED_BIT = 2,
++	IPS_ASSURED = (1 << IPS_ASSURED_BIT),
++
++	/* Connection is confirmed: originating packet has left box */
++	IPS_CONFIRMED_BIT = 3,
++	IPS_CONFIRMED = (1 << IPS_CONFIRMED_BIT),
++
++	/* Connection needs src nat in orig dir.  This bit never changed. */
++	IPS_SRC_NAT_BIT = 4,
++	IPS_SRC_NAT = (1 << IPS_SRC_NAT_BIT),
++
++	/* Connection needs dst nat in orig dir.  This bit never changed. */
++	IPS_DST_NAT_BIT = 5,
++	IPS_DST_NAT = (1 << IPS_DST_NAT_BIT),
++
++	/* Both together. */
++	IPS_NAT_MASK = (IPS_DST_NAT | IPS_SRC_NAT),
++
++	/* Connection needs TCP sequence adjusted. */
++	IPS_SEQ_ADJUST_BIT = 6,
++	IPS_SEQ_ADJUST = (1 << IPS_SEQ_ADJUST_BIT),
++
++	/* NAT initialization bits. */
++	IPS_SRC_NAT_DONE_BIT = 7,
++	IPS_SRC_NAT_DONE = (1 << IPS_SRC_NAT_DONE_BIT),
++
++	IPS_DST_NAT_DONE_BIT = 8,
++	IPS_DST_NAT_DONE = (1 << IPS_DST_NAT_DONE_BIT),
++
++	/* Both together */
++	IPS_NAT_DONE_MASK = (IPS_DST_NAT_DONE | IPS_SRC_NAT_DONE),
++
++	/* Connection is dying (removed from lists), can not be unset. */
++	IPS_DYING_BIT = 9,
++	IPS_DYING = (1 << IPS_DYING_BIT),
++
++	/* Connection has fixed timeout. */
++	IPS_FIXED_TIMEOUT_BIT = 10,
++	IPS_FIXED_TIMEOUT = (1 << IPS_FIXED_TIMEOUT_BIT),
++
++	/* Conntrack is a template */
++	IPS_TEMPLATE_BIT = 11,
++	IPS_TEMPLATE = (1 << IPS_TEMPLATE_BIT),
++
++	/* Conntrack is a fake untracked entry */
++	IPS_UNTRACKED_BIT = 12,
++	IPS_UNTRACKED = (1 << IPS_UNTRACKED_BIT),
++
++	/* Conntrack got a helper explicitly attached via CT target. */
++	IPS_HELPER_BIT = 13,
++	IPS_HELPER = (1 << IPS_HELPER_BIT),
++};
++
++/* Connection tracking event types */
++enum ip_conntrack_events {
++	IPCT_NEW,		/* new conntrack */
++	IPCT_RELATED,		/* related conntrack */
++	IPCT_DESTROY,		/* destroyed conntrack */
++	IPCT_REPLY,		/* connection has seen two-way traffic */
++	IPCT_ASSURED,		/* connection status has changed to assured */
++	IPCT_PROTOINFO,		/* protocol information has changed */
++	IPCT_HELPER,		/* new helper has been set */
++	IPCT_MARK,		/* new mark has been set */
++	IPCT_NATSEQADJ,		/* NAT is doing sequence adjustment */
++	IPCT_SECMARK,		/* new security mark has been set */
++};
++
++enum ip_conntrack_expect_events {
++	IPEXP_NEW,		/* new expectation */
++	IPEXP_DESTROY,		/* destroyed expectation */
++};
++
++/* expectation flags */
++#define NF_CT_EXPECT_PERMANENT		0x1
++#define NF_CT_EXPECT_INACTIVE		0x2
++#define NF_CT_EXPECT_USERSPACE		0x4
++
++
++#endif /* _UAPI_NF_CONNTRACK_COMMON_H */
diff --git a/meta/recipes-support/libnl/libnl/fix-build-using-flex.patch b/meta/recipes-support/libnl/libnl/fix-build-using-flex.patch
deleted file mode 100644
index 89a36ba..0000000
--- a/meta/recipes-support/libnl/libnl/fix-build-using-flex.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 89ab8d4f1229a1d2605193686cc00e6b2c9786ff Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Mon, 7 Jan 2013 15:44:38 -0200
-Subject: [PATCH] Fix build using flex
-
-Upstream-Status: Backport [3.2.17]
----
- lib/Makefile.am     |    4 ++--
- src/lib/Makefile.am |    4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/lib/Makefile.am b/lib/Makefile.am
-index 98c7b90..89cc5d2 100644
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -43,14 +43,14 @@ CLEANFILES = \
- route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
- route/pktloc_grammar.h: route/pktloc_grammar.c
- route/pktloc_grammar.c: route/pktloc_grammar.l
--	$(AM_V_GEN) $(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
-+	$(AM_V_GEN) $(FLEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
- 
- route/pktloc_syntax.h: route/pktloc_syntax.c
- route/pktloc_syntax.c: route/pktloc_syntax.y
- 	$(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
- 
- route/cls/ematch_grammar.c: route/cls/ematch_grammar.l
--	$(AM_V_GEN) $(LEX) --header-file=route/cls/ematch_grammar.h $(LFLAGS) -o $@ $^
-+	$(AM_V_GEN) $(FLEX) --header-file=route/cls/ematch_grammar.h $(LFLAGS) -o $@ $^
- 
- route/cls/ematch_syntax.c: route/cls/ematch_syntax.y
- 	$(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
-diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
-index 6688e7c..507635d 100644
---- a/src/lib/Makefile.am
-+++ b/src/lib/Makefile.am
-@@ -11,13 +11,13 @@ AM_LDFLAGS = \
- #cls_ematch_cmp_la_LDFLAGS = -module -version-info 2:0:0
- 
- #cls/ematch_grammar.c: cls/ematch_grammar.l
--#	$(LEX) --header-file=cls/ematch_grammar.h $(LFLAGS) -o $@ $^
-+#	$(FLEX) --header-file=cls/ematch_grammar.h $(LFLAGS) -o $@ $^
- 
- #cls/ematch_syntax.c: cls/ematch_syntax.y
- #	$(YACC) -d $(YFLAGS) -o $@ $^
- 
- #cls/pktloc_grammar.c: cls/pktloc_grammar.l
--#	$(LEX) --header-file=cls/pktloc_grammar.h $(LFLAGS) -o $@ $^
-+#	$(FLEX) --header-file=cls/pktloc_grammar.h $(LFLAGS) -o $@ $^
- 
- #cls/pktloc_syntax.c: cls/pktloc_syntax.y
- #	$(YACC) -d $(YFLAGS) -o $@ $^
--- 
-1.7.10.4
-
diff --git a/meta/recipes-support/libnl/libnl/fix-callback-segfault.patch b/meta/recipes-support/libnl/libnl/fix-callback-segfault.patch
new file mode 100644
index 0000000..ee84685
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/fix-callback-segfault.patch
@@ -0,0 +1,35 @@
+From ba38f3919835c39d7bc1e939ef3ca89cfe31600d Mon Sep 17 00:00:00 2001
+From: "mihai.dontu@gmail.com" <mihai.dontu@gmail.com>
+Date: Sun, 6 Jan 2013 07:07:02 +0200
+Subject: [PATCH] cache: make sure the user has specified a callback
+
+In cache_include(), the user callback is used even though one might not
+have been specified, leading to a crash. This happens, for example, when
+NetworkManager calls nl_cache_include() with the change_cb argument set
+to NULL. Fix it by making sure the callback points to a valid address.
+
+Upstream-Status: Backport [3.2.18]
+
+Signed-off-by: Mihai Dontu <mihai.dontu@gmail.com>
+Signed-off-by: Thomas Graf <tgraf@suug.ch>
+---
+ lib/cache.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/lib/cache.c b/lib/cache.c
+index 883aa51..42c0b5e 100644
+--- a/lib/cache.c
++++ b/lib/cache.c
+@@ -752,7 +752,8 @@ static int cache_include(struct nl_cache *cache, struct nl_object *obj,
+ 			 * Handle them first.
+ 			 */
+ 			if (nl_object_update(old, obj) == 0) {
+-				cb(cache, old, NL_ACT_CHANGE, data);
++				if (cb)
++					cb(cache, old, NL_ACT_CHANGE, data);
+ 				nl_object_put(old);
+ 				return 0;
+ 			}
+-- 
+1.7.7.6
+
diff --git a/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch b/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
index 332ec01..b93d97b 100644
--- a/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
+++ b/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
@@ -17,7 +17,7 @@ Index: libnl-3.2.14/lib/Makefile.am
 +route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
 +route/pktloc_grammar.h: route/pktloc_grammar.c
  route/pktloc_grammar.c: route/pktloc_grammar.l
- 	$(AM_V_GEN) $(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
+ 	$(AM_V_GEN) $(FLEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
  
 +route/pktloc_syntax.h: route/pktloc_syntax.c
  route/pktloc_syntax.c: route/pktloc_syntax.y
diff --git a/meta/recipes-support/libnl/libnl_3.2.16.bb b/meta/recipes-support/libnl/libnl_3.2.17.bb
similarity index 85%
rename from meta/recipes-support/libnl/libnl_3.2.16.bb
rename to meta/recipes-support/libnl/libnl_3.2.17.bb
index db9ae9d..0b65e99 100644
--- a/meta/recipes-support/libnl/libnl_3.2.16.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.17.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
 SECTION = "libs/network"
 
 PE = "1"
-PR = "r1"
+PR = "r0"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
@@ -12,11 +12,12 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
-           file://fix-build-using-flex.patch \
+           file://add-missing-header.patch \
+           file://fix-callback-segfault.patch \
            file://fix-pc-file.patch "
 
-SRC_URI[md5sum] = "f06e6de102abb2cef71ed671957ee099"
-SRC_URI[sha256sum] = "c43a42336c6a3cf559f390e202f8f029d165bd767da7cf7a32a815c570b31826"
+SRC_URI[md5sum] = "2e57ef6ced666b0288a8a205b9a0ad00"
+SRC_URI[sha256sum] = "000a721b6fbfd22190d668a487dfe5945cd1a903b326ac8570a6f20f2466d002"
 
 inherit autotools pkgconfig
 
-- 
1.7.10.4



