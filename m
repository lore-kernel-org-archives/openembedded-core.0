Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 287127891B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 16:57:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jan 2018 08:57:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,326,1511856000"; 
   d="scan'208";a="9306095"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga006.jf.intel.com with ESMTP; 07 Jan 2018 08:57:41 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Jan 2018 08:57:40 -0800
Message-Id: <1515344260-81575-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515344260-81575-1-git-send-email-juro.bystricky@intel.com>
References: <1515344260-81575-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 2/2] groff-doc: improve reproducibility
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
X-List-Received-Date: Sun, 07 Jan 2018 16:57:41 -0000

Some examples used "random" numbers to generate random RGB colors.
This would break reproducible builds.
The issue was solved by a patch backported from Debian.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../groff-1.22.3/hdtbl-examples-less-random.patch  | 41 ++++++++++++++++++++++
 meta/recipes-extended/groff/groff_1.22.3.bb        |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/groff/groff-1.22.3/hdtbl-examples-less-random.patch

diff --git a/meta/recipes-extended/groff/groff-1.22.3/hdtbl-examples-less-random.patch b/meta/recipes-extended/groff/groff-1.22.3/hdtbl-examples-less-random.patch
new file mode 100644
index 0000000..f9b4b21
--- /dev/null
+++ b/meta/recipes-extended/groff/groff-1.22.3/hdtbl-examples-less-random.patch
@@ -0,0 +1,41 @@
+Patch backported from Debian.
+https://sources.debian.net/src/groff/1.22.3-9/debian/patches/hdtbl-examples-less-random.patch/
+
+From b78ead018666fbee30624359caa4a294efb0c517 Mon Sep 17 00:00:00 2001
+From: Colin Watson <cjwatson@debian.org>
+Date: Fri, 6 Nov 2015 11:06:04 +0000
+Subject: Remove unnecessary randomness from example output
+
+The hdtbl examples don't need good randomness, as they're only example
+output; removing the process ID from consideration allows better
+integration with reproducible builds.
+
+Forwarded: no
+Last-Update: 2015-11-06
+
+Patch-Name: hdtbl-examples-less-random.patch
+
+Upstream-Status: Backport
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+---
+ contrib/hdtbl/examples/common.roff | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/contrib/hdtbl/examples/common.roff b/contrib/hdtbl/examples/common.roff
+index ddb6d4ac..9bd9f901 100644
+--- a/contrib/hdtbl/examples/common.roff
++++ b/contrib/hdtbl/examples/common.roff
+@@ -231,7 +231,11 @@ along with this program. If not, see <http://www.gnu.org/licenses/>.
+ .af mo 00
+ .af dy 00
+ .
+-.ds random-s1 \n[minutes]\n[seconds]\n[$$]\n[hours]\"
++.\" Since this just generates example output, we don't need good randomness;
++.\" basing this purely on the time and not on the process ID allows better
++.\" integration with reproducible builds.
++.\" .ds random-s1 \n[minutes]\n[seconds]\n[$$]\n[hours]\"
++.ds random-s1 \n[minutes]\n[seconds]\n[hours]\"
+ .\" prevent overflow
+ .substring random-s1 0 8
+ .
diff --git a/meta/recipes-extended/groff/groff_1.22.3.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
index cce7a92..3a3633d 100644
--- a/meta/recipes-extended/groff/groff_1.22.3.bb
+++ b/meta/recipes-extended/groff/groff_1.22.3.bb
@@ -12,6 +12,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
 	file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
 	file://0001-replace-perl-w-with-use-warnings.patch \
 	file://source-date-epoch.patch \
+	file://hdtbl-examples-less-random.patch \
 "
 
 SRC_URI[md5sum] = "cc825fa64bc7306a885f2fb2268d3ec5"
-- 
2.7.4


