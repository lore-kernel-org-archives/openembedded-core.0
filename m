Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0113B6B563
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 07:16:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7G7GaAi014520
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 00:16:37 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 16 Aug 2013 00:16:35 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2013 15:16:31 +0800
Message-ID: <cffa77f1984cc0f47d6fb1148da2d264a935a30d.1376637245.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1376637245.git.jackie.huang@windriver.com>
References: <cover.1376637245.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] texinfo: handle correctly @enumerate specification greater than 10
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
X-List-Received-Date: Fri, 16 Aug 2013 07:16:35 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Backport the patch to fix the error when @enumerate is greater than 10:
mpatrol.texi:6356: bad argument to @enumerate

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../texinfo-5.1/enumerate_greater_than_ten.patch   |   51 ++++++++++++++++++++
 meta/recipes-extended/texinfo/texinfo_5.1.bb       |    1 +
 2 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/texinfo/texinfo-5.1/enumerate_greater_than_ten.patch

diff --git a/meta/recipes-extended/texinfo/texinfo-5.1/enumerate_greater_than_ten.patch b/meta/recipes-extended/texinfo/texinfo-5.1/enumerate_greater_than_ten.patch
new file mode 100644
index 0000000..f07693e
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo-5.1/enumerate_greater_than_ten.patch
@@ -0,0 +1,51 @@
+From 0e70072ce655a0d053bb7433083ced5e6eac74d4 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 15 Aug 2013 23:49:47 -0700
+Subject: [PATCH] handle correctly @enumerate specification greater than 10
+
+Upstream-Status: Backport
+
+Revision: 5270
+          http://svn.sv.gnu.org/viewvc/?view=rev&root=texinfo&revision=5270
+Author:   pertusus
+Date:     2013-07-29 20:02:23 +0000 (Mon, 29 Jul 2013)
+Log Message:
+-----------
+        * tp/Common.pm (enumerate_item_representation), Texinfo/Parser.pm:
+        handle correctly @enumerate specification greater than 10.  Report
+        from Dmitry Shachnev.
+
+---
+ tp/Texinfo/Common.pm |    2 +-
+ tp/Texinfo/Parser.pm |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tp/Texinfo/Common.pm b/tp/Texinfo/Common.pm
+index 8aee9f7..bdffeee 100644
+--- a/tp/Texinfo/Common.pm
++++ b/tp/Texinfo/Common.pm
+@@ -1382,7 +1382,7 @@ sub enumerate_item_representation($$)
+   my $specification = shift;
+   my $number = shift;
+
+-  if ($specification =~ /^[0-9]$/) {
++  if ($specification =~ /^[0-9]+$/) {
+     return $specification + $number -1;
+   }
+
+diff --git a/tp/Texinfo/Parser.pm b/tp/Texinfo/Parser.pm
+index cf8fa72..8e845e9 100644
+--- a/tp/Texinfo/Parser.pm
++++ b/tp/Texinfo/Parser.pm
+@@ -2973,7 +2973,7 @@ sub _end_line($$$)
+                         $current->{'cmdname'});
+           }
+           my $arg = $current->{'extra'}->{'block_command_line_contents'}->[0]->[0];
+-          if (!defined($arg->{'text'}) or $arg->{'text'} !~ /^[[:alnum:]]$/) {
++          if (!defined($arg->{'text'}) or $arg->{'text'} !~ /^(([[:digit:]]+)|([[:alpha:]]+))$/) {
+             $self->_command_error($current, $line_nr,
+                         $self->__("bad argument to \@%s"),
+                         $current->{'cmdname'});
+--
+1.7.1
+
diff --git a/meta/recipes-extended/texinfo/texinfo_5.1.bb b/meta/recipes-extended/texinfo/texinfo_5.1.bb
index 0f4b4af..5b3d729 100644
--- a/meta/recipes-extended/texinfo/texinfo_5.1.bb
+++ b/meta/recipes-extended/texinfo/texinfo_5.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
            file://disable-native-tools.patch \
            file://link-zip.patch \
            file://dont-depend-on-help2man.patch \
+           file://enumerate_greater_than_ten.patch \
            ${TARGET_PATCH} \
           "
 
-- 
1.7.4.1


