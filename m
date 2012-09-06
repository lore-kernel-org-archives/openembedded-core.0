Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T9kpu-0003b2-Kh
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 00:46:10 +0200
Received: by iebc11 with SMTP id c11so4142115ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 15:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=g8bRCIfXt+zbMR0p2sdjhf3YtYSvniYPiVxXHlFFVNs=;
	b=Qxwhcg9TZpaEb/trP8xcdmU4/FESS9Mne6Sji2Eo7wqufpjzObhu4eRPA93BBzOl3w
	GVHsyLix40MxbyEPg2yds8EJR+Q+1+AX0cVYs4f0g8LCpdY4qJya89co3U+jEI0Kz2xv
	UZQp/JQCm6lL7Th7HIf6uWMnj/dS7bGFfZs6NNtgWjxApsxx0Awc6CRAbXudGbwwJ1Gy
	BgLIhtfR5J0p8SC3UbHcD7SUJgkuYQ8Mp9OtGuwvbLLIyBG3chYQG/3MH+W+ScokaipT
	LgBmHSLnwzaXGwKq/tB4nSVEVy+3XB8tNWS4+3DqQrnf1/EfclEkgk/P/IP7IQFbtaDj
	CVHA==
Received: by 10.50.95.231 with SMTP id dn7mr5430999igb.36.1346970825237;
	Thu, 06 Sep 2012 15:33:45 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id n5sm8157066igw.13.2012.09.06.15.33.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 15:33:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2012 15:32:44 -0700
Message-Id: <0c34604253bc37b526344df29b3956deafd5a64c.1346970617.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <78bc20e7fc534e4452c6a17c6c5d9020ac014eff.1346970617.git.raj.khem@gmail.com>
References: <78bc20e7fc534e4452c6a17c6c5d9020ac014eff.1346970617.git.raj.khem@gmail.com>
In-Reply-To: <cover.1346970617.git.raj.khem@gmail.com>
References: <cover.1346970617.git.raj.khem@gmail.com>
Subject: [PATCH 2/6] eglibc: Enable kconfig for option management
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
X-List-Received-Date: Thu, 06 Sep 2012 22:46:10 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-initial.inc |    1 +
 meta/recipes-core/eglibc/eglibc-options.inc |    4 ++--
 meta/recipes-core/eglibc/eglibc.inc         |    4 ++++
 meta/recipes-core/eglibc/eglibc_2.16.bb     |    3 ++-
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-core/eglibc/eglibc-initial.inc
index 3b99ac2..f44db0c 100644
--- a/meta/recipes-core/eglibc/eglibc-initial.inc
+++ b/meta/recipes-core/eglibc/eglibc-initial.inc
@@ -19,6 +19,7 @@ do_configure () {
 		--prefix=/usr \
 		--without-cvs --disable-sanity-checks \
 		--with-headers=${STAGING_DIR_TARGET}${includedir} \
+		--with-kconfig=${STAGING_BINDIR_NATIVE} \
 		--enable-hacker-mode --enable-addons
 }
 
diff --git a/meta/recipes-core/eglibc/eglibc-options.inc b/meta/recipes-core/eglibc/eglibc-options.inc
index 6009278..8a8b364 100644
--- a/meta/recipes-core/eglibc/eglibc-options.inc
+++ b/meta/recipes-core/eglibc/eglibc-options.inc
@@ -2,10 +2,10 @@ def eglibc_cfg(feature, features, tokens, cnf):
     if type(tokens) == type(""):
         tokens = [tokens]
     if type(features) == type([]) and feature in features:
-        cnf.extend([token + ' = y' for token in tokens])
+        cnf.extend([token + '=y' for token in tokens])
     else:
         for token in tokens:
-            cnf.extend([token + ' = n'])
+            cnf.extend([token + '=n'])
             if token == 'OPTION_EGLIBC_NSSWITCH':
                 cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG = ${S}/nss/nsswitch.conf"])
                 cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS = ${S}/nss/fixed-nsswitch.functions"])
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 02f3c7a..29e303f 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -56,6 +56,10 @@ do_configure_prepend() {
 	echo '${OE_FEATURES}' > ${B}/option-groups.config
 }
 
+do_configure_append() {
+	oe_runmake config
+}
+
 GLIBC_ADDONS ?= "ports,nptl,libidn"
 SDK_GLIBC_ADDONS ?= "ports,nptl,libidn"
 GLIBC_ADDONS_virtclass-nativesdk = "${SDK_GLIBC_ADDONS}"
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 5a10387..030b235 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -2,7 +2,7 @@ require eglibc.inc
 
 SRCREV = "20393"
 
-DEPENDS += "gperf-native"
+DEPENDS += "gperf-native kconfig-frontends-native"
 PR = "r8"
 PR_append = "+svnr${SRCPV}"
 
@@ -79,6 +79,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
                 --enable-obsolete-rpc \
+                --with-kconfig=${STAGING_BINDIR_NATIVE} \
                 ${GLIBC_EXTRA_OECONF}"
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
-- 
1.7.9.5



