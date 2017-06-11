Return-Path: <tom.rini@gmail.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 284DB781F3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 12:36:14 +0000 (UTC)
Received: by mail-yb0-f193.google.com with SMTP id j65so3887517ybj.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 05:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to;
	bh=XqmE/Sy0dg4mZ6rn4zj/Gf9NPOSZifLANRm0r4h6VLY=;
	b=uZjr/X85Ow2aB4xx3dGp3BGMw2DTszodnQLjH1dWIoCgP3AjilVUJezFQmAArybcbe
	OXdBqxNkX9vn029nS/36SUVxGKVNmE1ndqhIEArCk5r7dXJk9Boo5vx8GOcpM2Ys++Mo
	wUUiJbqm9wmbRjVE+n+E+ZCBVOfrywUrODtPhpdjKUNZTF/RAXbtox6aFqzDYWIkoHag
	kFkoKlc5cKsMHHoMjvtQQpyQCEYTtQknfxpGHRF186m+5s4BIqouggEZGlEvPdyQQYF7
	wW5fD7BD+uru7jMV1VyTjIekKpH3ZdQxbg3rYbbQjLa2YcSxbwnmrOcK7fQhaM6g4eew
	ONBg==
X-Gm-Message-State: AODbwcBVwpqmRRNblE4d2OG8by5ZGKUZ2myGRF/niyF8uJ3ZlLCScNMU
	80YUDHAxPJnTGY7W
X-Received: by 10.37.220.2 with SMTP id y2mr19050655ybe.188.1497184575747;
	Sun, 11 Jun 2017 05:36:15 -0700 (PDT)
Received: from localhost.localdomain (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	v75sm2629901ywa.51.2017.06.11.05.36.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 05:36:15 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Jun 2017 08:36:31 -0400
Message-Id: <1497184592-28388-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: 1496966441-30260-1-git-send-email-trini@konsulko.com
Subject: [PATCHv2 1/3] cpan-base.bbclass: Move PERLVERSION and get_perl_version to a new file
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
X-List-Received-Date: Sun, 11 Jun 2017 12:36:15 -0000

It is possible for non-CPAN recipes to contain perl modules.  These perl
modules must reside in the versioned perl library directory in order to
work in normal circumstances..  Export this logic to a separate class so
that it can be reused without the rest of the cpan logic.

Without this, dpkg will not export its perl code to the correct location
and will not be found by utilities that expect to use it.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v2:
- Reword the commit message to emphasize get_perl_version as this is what other
  recipes need to make use of.

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


