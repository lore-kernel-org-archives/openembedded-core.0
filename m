Return-Path: <net147@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 81A1D6081A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 00:53:45 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rr4so6198252pbb.20
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 17:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=12Xm/rpEGMlaCLHS6oFb7YwvPLj/n/2A9ug7XCtoiso=;
	b=S0SxSX0fTO2l+HJOtj51DpJiPUY8qO8+rkm3oBzGa/fmfA5q1HMFu4I1MDlV3M2Y6f
	niWrA3ToDSCu57L1SPBhrMK2AMWbeUAcT8bKrxzkrCrawdpmk39lEW0kjC3ycdBNQ1ro
	zs8MQpTE9dCGUlP59EiBQxRWlYb+gCRjNEaJ2vLR0KwL77+Qpo/3L1KfKwWppmIl2O+0
	+UvCzk4nEUH3zzw0Eu+4Ps9CWmZNM2E2so7Nj1KZ54M3gnDQCnMfQ7G7blNKsjbA6AAo
	VY7jIk6+oX0tncW8DvhS31c5AcMRxgZbJY0eLUwEWhnGDASZAt3aoSWnTuEKyyRoGWq+
	bJWA==
X-Received: by 10.68.232.42 with SMTP id tl10mr27055075pbc.72.1369616026425;
	Sun, 26 May 2013 17:53:46 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	zs12sm28125617pab.0.2013.05.26.17.53.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 May 2013 17:53:45 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 May 2013 11:07:06 +1000
Message-Id: <1369616826-7870-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] findutils: backport fixes for documentation build errors
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
X-List-Received-Date: Mon, 27 May 2013 00:53:46 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../findutils-4.4.2/findutils_fix_doc.patch        | 50 ++++++++++++++++++++++
 meta/recipes-extended/findutils/findutils_4.4.2.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_doc.patch

diff --git a/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_doc.patch b/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_doc.patch
new file mode 100644
index 0000000..8469b8d
--- /dev/null
+++ b/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_doc.patch
@@ -0,0 +1,50 @@
+Fix documentation build errors
+
+This fixes the following errors building the findutils documentation:
+find.texi:53: misplaced {
+find.texi:53: misplaced }
+find.texi:1862: warning: node `Formatting Flags' is next for `Time Directives' in menu but not in sectioning
+find.texi:1975: warning: node `Formatting Flags' is next for `Combined Time Formats' in sectioning but not in menu
+find.texi:2004: warning: node prev `Formatting Flags' in menu `Time Directives' and in sectioning `Combined Time Formats' differ
+find.texi:2004: warning: node up `Formatting Flags' in menu `Format Directives' and in sectioning `Time Formats' differ
+find.texi:1893: node `Time Formats' lacks menu item for `Formatting Flags' despite being its Up target
+
+Upstream-Status: Backport
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+--- a/doc/find.texi
++++ b/doc/find.texi
+@@ -50,7 +50,7 @@ Texts.  A copy of the license is included in the section entitled
+
+ @page
+ @vskip 0pt plus 1filll
+-@insertcopying{}
++@insertcopying
+ @end titlepage
+
+ @contents
+@@ -1665,6 +1665,7 @@ no output is ever sent to it.
+ * Escapes::
+ * Format Directives::
+ * Time Formats::
++* Formatting Flags::
+ @end menu
+
+ @node Escapes
+@@ -1733,7 +1734,6 @@ from the novel you are reading.
+ * Size Directives::
+ * Location Directives::
+ * Time Directives::
+-* Formatting Flags::
+ @end menu
+
+ @node Name Directives
+@@ -2002,7 +2002,7 @@ seconds field includes a fractional part.
+ @end table
+
+ @node Formatting Flags
+-@subsubsection Formatting Flags
++@subsection Formatting Flags
+
+ The @samp{%m} and @samp{%d} directives support the @samp{#}, @samp{0}
+ and @samp{+} flags, but the other directives do not, even if they
diff --git a/meta/recipes-extended/findutils/findutils_4.4.2.bb b/meta/recipes-extended/findutils/findutils_4.4.2.bb
index 3f49300..ee91945 100644
--- a/meta/recipes-extended/findutils/findutils_4.4.2.bb
+++ b/meta/recipes-extended/findutils/findutils_4.4.2.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://01-27017.patch \
             file://03-28872.patch \
             file://findutils_fix_for_x32.patch \
             file://findutils_fix_for_automake-1.12.patch \
+            file://findutils_fix_doc.patch \
             "
 
 SRC_URI[md5sum] = "351cc4adb07d54877fa15f75fb77d39f"
-- 
1.8.2.3


