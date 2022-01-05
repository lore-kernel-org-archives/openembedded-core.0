Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5E7C433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 15:19:52 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.1738.1641395992152460440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 07:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=M89TLf1d;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641395992; x=1672931992;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=scA/iai6nK8YnXAe1Re3DHbYmKWtOOr4RzJE9ysZKU0=;
  b=M89TLf1d+qeR3w+YkIDtDyrQfB9xhPFxj9XdHPhT3gKP3zQMtgxUsQyM
   WCbUQxjEtZu8icap8TtZXBnFqtWqTLP4mzt9vkfphqBoQJUKGJ3bscgeX
   tAHTrtM90qmkWtANQJVvwzskhkB4cZWwEr3w+kyoXm8Mnb7wYcCDvmgVJ
   BqZNEayw/DoK6+Py5Rre3ncvpzVqgmJPcWdJ43+Nn3FQcdn0KQl+ugLZ4
   QepToYiqVSjFXOmPHMXIV6iCcGEX+LsQhkdUqSXrkYSEyfeFQvW9h6oMG
   8SZpRg/B0zTlHRQYfI54ju6DUWJv+CxxHh2R3eHNQ6oT9ufn+m1h5UnAs
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="303215210"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="303215210"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="668128719"
Received: from hanwenlx-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.129.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:36 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 24/24] openssl: Add reproducibility fix
Date: Wed,  5 Jan 2022 23:18:44 +0800
Message-Id: 
 <8502242b5caa24fe1aeffa8bd5f048ebdb5f6610.1641395036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641395036.git.anuj.mittal@intel.com>
References: <cover.1641395036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 15:19:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160209

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When the date rolled from one year to another, it highlighted a reproducibility
issue in openssl. Patch a workaround for this to avoid autobuilder failures. Help
submitting upstream welcome.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8281e290737dba16a46d7ae937c66b3266e0fe8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../openssl/openssl/reproducibility.patch     | 22 +++++++++++++++++++
 .../openssl/openssl_1.1.1l.bb                 |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/reproducibility.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/reproducibility.patch b/meta/recipes-connectivity/openssl/openssl/reproducibility.patch
new file mode 100644
index 0000000000..8accbc9df2
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/reproducibility.patch
@@ -0,0 +1,22 @@
+Using localtime() means the output can depend on the timezone of the build machine.
+Using gmtime() is safer. For complete reproducibility use SOURCE_DATE_EPOCH if set.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending [should be suitable]
+
+Index: openssl-3.0.1/apps/progs.pl
+===================================================================
+--- openssl-3.0.1.orig/apps/progs.pl
++++ openssl-3.0.1/apps/progs.pl
+@@ -21,7 +21,10 @@ die "Unrecognised option, must be -C or
+ my %commands     = ();
+ my $cmdre        = qr/^\s*int\s+([a-z_][a-z0-9_]*)_main\(\s*int\s+argc\s*,/;
+ my $apps_openssl = shift @ARGV;
+-my $YEAR         = [localtime()]->[5] + 1900;
++my $YEAR         = [gmtime()]->[5] + 1900;
++if (defined($ENV{SOURCE_DATE_EPOCH}) && $ENV{SOURCE_DATE_EPOCH} !~ /\D/) {
++    $YEAR = [gmtime($ENV{SOURCE_DATE_EPOCH})]->[5] + 1900;
++}
+ 
+ # because the program apps/openssl has object files as sources, and
+ # they then have the corresponding C files as source, we need to chain
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
index 9ea5c4c81f..50500eebc2 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://reproducible.patch \
+           file://reproducibility.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.33.1


