Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6687C6CFF9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 04:16:01 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id y13so3407531pdi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 20:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rFNZv4aODNC1QCGjyNNDBk4pQIr3KtiPj3GQ+K47WOQ=;
	b=U3U3SrubgKzG1erDsNnVMVQEFcpAt31j39MOTEiHgBKbBDypNswTSTOYClfFWebHyc
	UGyZXwxyivcTfrgQUiXYmo69OXZuoEgJr6jKyG4qj/6+LPC5vjMA9DMssXefDoyCg/yW
	uEczuGAnXp4i8hpf9QOzPiO5Ut5GOCY1miTWa5lzkrXZKT6jMY2S3Drr8eIo6M6wPlQW
	W0O2lr1ewShm36wt3vThrhqrlaZb0o8VD9X3nXL+0aeM8knhSUPHomod5rJQQWHSHtWY
	QHl42lseslF78/E9PZEsx4hxR4V21hm71PIa5yHmp5CgjqUKHdQOHUxqjtEYCHO8BVN6
	VXEw==
X-Received: by 10.68.219.167 with SMTP id pp7mr33456006pbc.125.1384229763242; 
	Mon, 11 Nov 2013 20:16:03 -0800 (PST)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	wp8sm34347079pbc.26.2013.11.11.20.16.02 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Nov 2013 20:16:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2013 20:15:53 -0800
Message-Id: <1384229753-24016-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [for-dora][for-master][PATCH] libnl: Fix random segfaults due to memory corruption
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
X-List-Received-Date: Tue, 12 Nov 2013 04:16:01 -0000

This is a backport from upstream fixes a severe problem
w.r.t memory management, where it would result in random
segfaults in applications depending on libnl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...free-caused-by-freeing-link-af_data-in-rt.patch | 41 ++++++++++++++++++++++
 meta/recipes-support/libnl/libnl_3.2.22.bb         |  4 ++-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libnl/libnl/0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch

diff --git a/meta/recipes-support/libnl/libnl/0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch b/meta/recipes-support/libnl/libnl/0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch
new file mode 100644
index 0000000..6d2c8ff
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch
@@ -0,0 +1,41 @@
+From 6f37b439af7e96104aadd8ec3ae8d3882df8d102 Mon Sep 17 00:00:00 2001
+From: Jiri Pirko <jiri@resnulli.us>
+Date: Wed, 21 Aug 2013 14:40:34 +0200
+Subject: [PATCH] fix double free caused by freeing link af_data in
+ rtnl_link_set_family()
+
+Introduced by commit 8026fe2e3a9089eff3f5a06ee6e3cc78d96334ed ("link:
+Free and realloc af specific data upon rtnl_link_set_family()")
+
+link->l_af_data[link->l_af_ops->ao_family] is freed here but not set to
+zero. That leads to double free made by link_free_data->do_foreach_af.
+
+Fix this by setting link->l_af_data[link->l_af_ops->ao_family] to zero
+rigth after free.
+
+Signed-off-by: Jiri Pirko <jiri@resnulli.us>
+Signed-off-by: Thomas Graf <tgraf@suug.ch>
+---
+ lib/route/link.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/route/link.c b/lib/route/link.c
+index a73e1db..0bb90a0 100644
+--- a/lib/route/link.c
++++ b/lib/route/link.c
+@@ -1762,9 +1762,11 @@ void rtnl_link_set_family(struct rtnl_link *link, int family)
+ 	link->l_family = family;
+ 	link->ce_mask |= LINK_ATTR_FAMILY;
+ 
+-	if (link->l_af_ops)
++	if (link->l_af_ops) {
+ 		af_free(link, link->l_af_ops,
+ 			link->l_af_data[link->l_af_ops->ao_family], NULL);
++		link->l_af_data[link->l_af_ops->ao_family] = NULL;
++	}
+ 
+ 	link->l_af_ops = af_lookup_and_alloc(link, family);
+ }
+-- 
+1.8.4
+
diff --git a/meta/recipes-support/libnl/libnl_3.2.22.bb b/meta/recipes-support/libnl/libnl_3.2.22.bb
index 30f85b2..3c31b1a 100644
--- a/meta/recipes-support/libnl/libnl_3.2.22.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.22.bb
@@ -12,7 +12,9 @@ DEPENDS = "flex-native bison-native"
 SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
            file://fix-pc-file.patch \
-           file://fix-lib-cache_mngr.c-two-parentheses-bugs.patch"
+           file://fix-lib-cache_mngr.c-two-parentheses-bugs.patch \
+           file://0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch \
+          "
 
 SRC_URI[md5sum] = "2e1c889494d274aca24ce5f6a748e66e"
 SRC_URI[sha256sum] = "c7c5f267dfeae0c1a530bf96b71fb7c8dbbb07d54beef49b6712d8d6166f629b"
-- 
1.8.3.2


