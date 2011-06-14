Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWYo7-0000an-Pa
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 20:57:47 +0200
Received: by pvc30 with SMTP id 30so2922528pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 11:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=r0uGsXhChMmw+8/IY7X+6ooxBk41BQvMlZFtOAz+I4A=;
	b=uknycWZJGxIAkGmNFmE/Sn56PZEtRfmOoWBuJ8z19uFC/WEYBJ4Q9q3cslfD5bVlsz
	o4QEjfCmdq2taMiuPByPv5y+Ci+EbSDaShMY5NKVPXe4NiE1WywuTG+ALhqp5B3Qi7UP
	nCKFpNUsuZ/k+iAYcJSCTr+PJUWWpXeQaBq7s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=hxraI738vp1HRQqSFleyr2UK4NKtUiHuRCeClt9X7jB/DnB0M158Sw88l1VJE8COE3
	zYHL2LLvZ9IwXguLyR7lmpmjniGHibLgbDJGApwvJAa7b68ZgWnoWJVP/zJ0Fwo8K3r2
	ctbmBbg08z/oGr/tlOkazmYW3GjFDZHPmeQ6E=
Received: by 10.68.35.195 with SMTP id k3mr527769pbj.229.1308077661289;
	Tue, 14 Jun 2011 11:54:21 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m9sm5776388pbd.7.2011.06.14.11.54.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 11:54:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jun 2011 11:53:58 -0700
Message-Id: <1308077638-20075-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] eglibc_2.12.bb: Remove already upstreamed fix-for-make-3.82.diff
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
X-List-Received-Date: Tue, 14 Jun 2011 18:57:48 -0000

This patch is already applied to eglibc 2.12 branch as seen here
http://www.eglibc.org/cgi-bin/viewcvs.cgi/branches/eglibc-2_12/libc/manual/Makefile?rev=12230&sortby=date&r2=12230&r1=10495

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/eglibc-2.12/fix-for-make-3.82.diff      |   27 --------------------
 meta/recipes-core/eglibc/eglibc_2.12.bb            |    3 +-
 2 files changed, 1 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.12/fix-for-make-3.82.diff

diff --git a/meta/recipes-core/eglibc/eglibc-2.12/fix-for-make-3.82.diff b/meta/recipes-core/eglibc/eglibc-2.12/fix-for-make-3.82.diff
deleted file mode 100644
index 89fff79..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.12/fix-for-make-3.82.diff
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Inappropriate [Backport]
-
-Make 3.82, as shipped with Fedora 14, fixes some holes in the parser which in
-turn breaks behaviour of some Makefiles. Most notably eglibc's.
-
-http://www.mail-archive.com/bug-make@gnu.org/msg06220.html
-
-Fix back-ported from glibc/eglibc revision control.
-
-JL 13/10/10
-
-Index: libc/manual/Makefile
-===================================================================
---- libc.orig/manual/Makefile
-+++ libc/manual/Makefile
-@@ -243,7 +243,10 @@ ifdef objpfx
- .PHONY: stubs
- stubs: $(objpfx)stubs
- endif
--$(objpfx)stubs ../po/manual.pot $(objpfx)stamp%:
-+$(objpfx)stubs ../po/manual.pot:
-+	$(make-target-directory)
-+	touch $@
-+$(objpfx)stamp%:
- 	$(make-target-directory)
- 	touch $@
- 
diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
index d851b5d..fe2f51d 100644
--- a/meta/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
@@ -1,7 +1,6 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native"
-FILESPATHPKG =. "eglibc-svn:"
 PR = "r14"
 
 SRCREV = "14158"
@@ -14,7 +13,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://mips-rld-map-check.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
-	   file://fix-for-make-3.82.diff"
+	  "
 SRC_URI_append_virtclass-nativesdk = " file://ld-search-order.patch"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
1.7.4.1



