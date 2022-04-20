Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB87C47081
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.3157.1650419977035762127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=HkOAos/+;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650419977; x=1681955977;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zJktuPd0DowSFxj417CinqIS1QxdiSoB4hJxZMvJY/A=;
  b=HkOAos/+bndQUvNeMO/Uhhf/r8bt59ZWexlOhocIlohdZGRS3ABIzTMj
   cwVol6AQs9uk6vCAz2M/OeLPqoxluN5JV7dCVqUlZDAra85oTI5i7Jiub
   P8++b17Jtj1XayUYLzzAswaOm0fdzp6S/+v+ymAirAEdtbP1T9MT49klb
   phWZitLU1vMsVkPjJLP/rBV1fJuRmh1wU1ISgyuCuYe0Brq+DODyoD7qB
   vaiRsWPIdC7HW5ICgNcsKO2B4a6rsvi1TvvycGOA7F2Qm6cYMOIHpzK12
   SiKDztbKEdlzLzvm9sfh/ll3EMlBcSDlvagD8nkkqxr/PCFYRyds15S15
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="261517095"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="261517095"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="531071523"
Received: from kchew4-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.150.151])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:34 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 06/11] xz: fix CVE-2022-1271
Date: Wed, 20 Apr 2022 09:59:11 +0800
Message-Id: 
 <dd6239a0f6173115968278cfd58a5efa228aee7d.1650378286.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650378286.git.anuj.mittal@intel.com>
References: <cover.1650378286.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164644

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Malicious filenames can make xzgrep to write to arbitrary files
or (with a GNU sed extension) lead to arbitrary code execution.

Upstream-Status: Backport [https://tukaani.org/xz/xzgrep-ZDI-CAN-16587.patch]
CVE: CVE-2022-1271

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 97bf86ccde4417daec8ef3945071a50a09134bc6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../xz/xz/CVE-2022-1271.patch                 | 96 +++++++++++++++++++
 meta/recipes-extended/xz/xz_5.2.5.bb          |  4 +-
 2 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2022-1271.patch

diff --git a/meta/recipes-extended/xz/xz/CVE-2022-1271.patch b/meta/recipes-extended/xz/xz/CVE-2022-1271.patch
new file mode 100644
index 0000000000..e43e73cf12
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/CVE-2022-1271.patch
@@ -0,0 +1,96 @@
+From dc932a1e9c0d9f1db71be11a9b82496e3a72f112 Mon Sep 17 00:00:00 2001
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Tue, 29 Mar 2022 19:19:12 +0300
+Subject: [PATCH] xzgrep: Fix escaping of malicious filenames (ZDI-CAN-16587).
+
+Malicious filenames can make xzgrep to write to arbitrary files
+or (with a GNU sed extension) lead to arbitrary code execution.
+
+xzgrep from XZ Utils versions up to and including 5.2.5 are
+affected. 5.3.1alpha and 5.3.2alpha are affected as well.
+This patch works for all of them.
+
+This bug was inherited from gzip's zgrep. gzip 1.12 includes
+a fix for zgrep.
+
+The issue with the old sed script is that with multiple newlines,
+the N-command will read the second line of input, then the
+s-commands will be skipped because it's not the end of the
+file yet, then a new sed cycle starts and the pattern space
+is printed and emptied. So only the last line or two get escaped.
+
+One way to fix this would be to read all lines into the pattern
+space first. However, the included fix is even simpler: All lines
+except the last line get a backslash appended at the end. To ensure
+that shell command substitution doesn't eat a possible trailing
+newline, a colon is appended to the filename before escaping.
+The colon is later used to separate the filename from the grep
+output so it is fine to add it here instead of a few lines later.
+
+The old code also wasn't POSIX compliant as it used \n in the
+replacement section of the s-command. Using \<newline> is the
+POSIX compatible method.
+
+LC_ALL=C was added to the two critical sed commands. POSIX sed
+manual recommends it when using sed to manipulate pathnames
+because in other locales invalid multibyte sequences might
+cause issues with some sed implementations. In case of GNU sed,
+these particular sed scripts wouldn't have such problems but some
+other scripts could have, see:
+
+    info '(sed)Locale Considerations'
+
+This vulnerability was discovered by:
+cleemy desu wayo working with Trend Micro Zero Day Initiative
+
+Thanks to Jim Meyering and Paul Eggert discussing the different
+ways to fix this and for coordinating the patch release schedule
+with gzip.
+
+Upstream-Status: Backport [https://tukaani.org/xz/xzgrep-ZDI-CAN-16587.patch]
+CVE: CVE-2022-1271
+
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+---
+ src/scripts/xzgrep.in | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/src/scripts/xzgrep.in b/src/scripts/xzgrep.in
+index 9db5c3a..f64dddb 100644
+--- a/src/scripts/xzgrep.in
++++ b/src/scripts/xzgrep.in
+@@ -179,22 +179,26 @@ for i; do
+          { test $# -eq 1 || test $no_filename -eq 1; }; then
+       eval "$grep"
+     else
++      # Append a colon so that the last character will never be a newline
++      # which would otherwise get lost in shell command substitution.
++      i="$i:"
++
++      # Escape & \ | and newlines only if such characters are present
++      # (speed optimization).
+       case $i in
+       (*'
+ '* | *'&'* | *'\'* | *'|'*)
+-        i=$(printf '%s\n' "$i" |
+-            sed '
+-              $!N
+-              $s/[&\|]/\\&/g
+-              $s/\n/\\n/g
+-            ');;
++        i=$(printf '%s\n' "$i" | LC_ALL=C sed 's/[&\|]/\\&/g; $!s/$/\\/');;
+       esac
+-      sed_script="s|^|$i:|"
++
++      # $i already ends with a colon so don't add it here.
++      sed_script="s|^|$i|"
+ 
+       # Fail if grep or sed fails.
+       r=$(
+         exec 4>&1
+-        (eval "$grep" 4>&-; echo $? >&4) 3>&- | sed "$sed_script" >&3 4>&-
++        (eval "$grep" 4>&-; echo $? >&4) 3>&- |
++            LC_ALL=C sed "$sed_script" >&3 4>&-
+       ) || r=2
+       exit $r
+     fi >&3 5>&-
diff --git a/meta/recipes-extended/xz/xz_5.2.5.bb b/meta/recipes-extended/xz/xz_5.2.5.bb
index 8021ebd9bc..200af0e672 100644
--- a/meta/recipes-extended/xz/xz_5.2.5.bb
+++ b/meta/recipes-extended/xz/xz_5.2.5.bb
@@ -23,7 +23,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
                     "
 
-SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
+SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz \
+           file://CVE-2022-1271.patch \
+           "
 SRC_URI[md5sum] = "0d270c997aff29708c74d53f599ef717"
 SRC_URI[sha256sum] = "f6f4910fd033078738bd82bfba4f49219d03b17eb0794eb91efbae419f4aba10"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.35.1


