Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.web11.37381.1614012135185005060
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=bnSFtSBG;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3073; q=dns/txt; s=iport;
  t=1614012135; x=1615221735;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=25pNcxdyJ1vDgvsJzpIMG+V7xNVTSmXeAjqw1iaV8lk=;
  b=bnSFtSBG5GAdJSPNECVsgp6hULLmzCYrT8/AmhYlLJEx6PrFnAXWVmfa
   aalQobIz9MogiKEOYeykfbHTEGIgfNbtIqBsv5fF2ua1kS+AD+CidLnBu
   3YH5FKzjJvDOM8S/66eiiCaW+ZB/v2lEequilX/hAiryseKgIESfmnXh9
   Q=;
X-IronPort-AV: E=Sophos;i="5.81,197,1610409600"; 
   d="scan'208";a="850489283"
Received: from alln-core-9.cisco.com ([173.36.13.129])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 22 Feb 2021 16:42:14 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by alln-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 11MGgDbG012381
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 22 Feb 2021 16:42:14 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id 7D32FCC1251; Mon, 22 Feb 2021 08:42:13 -0800 (PST)
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH] vim: Improve reproducibility
Date: Mon, 22 Feb 2021 08:42:11 -0800
Message-Id: <20210222164211.23449-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: alln-core-9.cisco.com
Content-Transfer-Encoding: 8bit

Override awk and perl path to avoid
using local absolute path.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 .../0001-vim-Override-perl-and-awk.patch      | 34 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  3 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/0001-vim-Override-perl-and-awk.patch

diff --git a/meta/recipes-support/vim/files/0001-vim-Override-perl-and-awk.patch b/meta/recipes-support/vim/files/0001-vim-Override-perl-and-awk.patch
new file mode 100644
index 0000000000..1d619e0800
--- /dev/null
+++ b/meta/recipes-support/vim/files/0001-vim-Override-perl-and-awk.patch
@@ -0,0 +1,34 @@
+From 1c1ca2d6306fa4b1391f54325cdd63d56d3b7b78 Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Mon, 22 Feb 2021 15:21:00 +0200
+Subject: [PATCH] vim: Improve reproducibility
+
+Override awk and perl path to avoid
+using local absolute path.
+
+Upstream-Status: Pending
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ src/Makefile | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index b7e2f7eef..c2e7efbde 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -2510,10 +2510,8 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_prefix) $(DEST_BIN) \
+ 
+ # replace the path in some tools, but not when cross-compiling
+ ifneq ($(CROSS_COMPILING),1)
+-	perlpath=`./which.sh perl` && sed -e "s+/usr/bin/perl+$$perlpath+" $(TOOLSSOURCE)/efm_perl.pl >$(DEST_TOOLS)/efm_perl.pl
+-	awkpath=`./which.sh nawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
+-		awkpath=`./which.sh gawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
+-		awkpath=`./which.sh awk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; fi; fi
++	perlpath=$(PERL) && sed -e "s+/usr/bin/perl+$$perlpath+" $(TOOLSSOURCE)/efm_perl.pl >$(DEST_TOOLS)/efm_perl.pl
++	awkpath=$(AWK) && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk
+ endif
+ 	-chmod $(SCRIPTMOD) `grep -l "^#!" $(DEST_TOOLS)/*`
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index d57f784da5..efe63e7a8e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
            file://racefix.patch \
+	   file://0001-vim-Override-perl-and-awk.patch \
 "
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
 
@@ -80,6 +81,8 @@ EXTRA_OECONF = " \
     vim_cv_tgetent=non-zero \
     vim_cv_toupper_broken=no \
     vim_cv_tty_group=world \
+    AWK=${bindir}/awk \
+    vi_cv_path_perl=${bindir}/perl \
     STRIP=/bin/true \
 "
 
-- 
2.25.1

