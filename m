Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD0778267
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 00:00:27 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id p144so2772135ywp.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 17:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Y/DKNXFde0JWIUkvqgweCEkmhLWNhyKeKUbxKrX5OYM=;
	b=lmBOeUKtGvv9h5d213Tzb6/aI7QkIfpdBFk636yRHm7jpFUpoQNNdIGokrQAxiM+Ag
	bCOaxCSV6tLoApzZ0yiW//gFoqQ2SjlYzvLMJ4DJVMrU9KHobdv3/h5044H2KZkanku7
	gGkOkD5lDQvC+lFMKZv07f7WH3zFg55YVvnwEHFLE0+zVfufFBEGEiwXhALkUR6RS/kH
	50q9OEWiyfBgkoCU7P7N2rUX3AT+RLPr2/XjSB1JiYqxzhME11pJL/ISVZyX3TY/DcnB
	oWHIWOfVOrhM7SJfUkWlL+9CMGz4723XPfz7POv3jGnNdkW7ZHQRq8UJxsW/a9tQKPQG
	eQWg==
X-Gm-Message-State: AODbwcBh2zi1968l6vsSRfD2gDP41ux7c0e0x0XKVfjs9VkTfQvr8Kmq
	Bbm4dfYbwz4ZLWGs
X-Received: by 10.13.196.4 with SMTP id g4mr1674829ywd.266.1496966427032;
	Thu, 08 Jun 2017 17:00:27 -0700 (PDT)
Received: from localhost.localdomain (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	w191sm3085796ywg.10.2017.06.08.17.00.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Jun 2017 17:00:26 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 20:00:39 -0400
Message-Id: <1496966441-30260-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/3] cpan-base.bbclass: Move PERLVERSION logic to a new file
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
X-List-Received-Date: Fri, 09 Jun 2017 00:00:27 -0000

It is possible for non-CPAN recipes to contain perl modules.  These perl
modules must reside in the versioned perl library directory in order to
work in normal circumstances..  Export this logic to a separate class so
that it can be reused without the rest of the cpan logic.

Without this, dpkg will not export its perl code to the correct location
and will not be found by utilities that expect to use it.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/classes/cpan-base.bbclass    | 24 +-----------------------
 meta/classes/perl-version.bbclass | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 23 deletions(-)
 create mode 100644 meta/classes/perl-version.bbclass

diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
index 55ac0526953a..577fcd63ce9f 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -7,27 +7,7 @@ FILES_${PN} += "${libdir}/perl ${datadir}/perl"
 DEPENDS  += "${@["perl", "perl-native"][(bb.data.inherits_class('native', d))]}"
 RDEPENDS_${PN} += "${@["perl", ""][(bb.data.inherits_class('native', d))]}"
 
-PERL_OWN_DIR = "${@["", "/perl-native"][(bb.data.inherits_class('native', d))]}"
-
-# Determine the staged version of perl from the perl configuration file
-# Assign vardepvalue, because otherwise signature is changed before and after
-# perl is built (from None to real version in config.sh).
-get_perl_version[vardepvalue] = "${PERL_OWN_DIR}"
-def get_perl_version(d):
-    import re
-    cfg = d.expand('${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/config.sh')
-    try:
-        f = open(cfg, 'r')
-    except IOError:
-        return None
-    l = f.readlines();
-    f.close();
-    r = re.compile("^version='(\d*\.\d*\.\d*)'")
-    for s in l:
-        m = r.match(s)
-        if m:
-            return m.group(1)
-    return None
+inherit perl-version
 
 def is_target(d):
     if not bb.data.inherits_class('native', d):
@@ -36,5 +16,3 @@ def is_target(d):
 
 PERLLIBDIRS = "${libdir}/perl"
 PERLLIBDIRS_class-native = "${libdir}/perl-native"
-PERLVERSION := "${@get_perl_version(d)}"
-PERLVERSION[vardepvalue] = ""
diff --git a/meta/classes/perl-version.bbclass b/meta/classes/perl-version.bbclass
new file mode 100644
index 000000000000..fafe68a775f7
--- /dev/null
+++ b/meta/classes/perl-version.bbclass
@@ -0,0 +1,24 @@
+PERL_OWN_DIR = "${@["", "/perl-native"][(bb.data.inherits_class('native', d))]}"
+
+# Determine the staged version of perl from the perl configuration file
+# Assign vardepvalue, because otherwise signature is changed before and after
+# perl is built (from None to real version in config.sh).
+get_perl_version[vardepvalue] = "${PERL_OWN_DIR}"
+def get_perl_version(d):
+    import re
+    cfg = d.expand('${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/config.sh')
+    try:
+        f = open(cfg, 'r')
+    except IOError:
+        return None
+    l = f.readlines();
+    f.close();
+    r = re.compile("^version='(\d*\.\d*\.\d*)'")
+    for s in l:
+        m = r.match(s)
+        if m:
+            return m.group(1)
+    return None
+
+PERLVERSION := "${@get_perl_version(d)}"
+PERLVERSION[vardepvalue] = ""
-- 
1.9.1


