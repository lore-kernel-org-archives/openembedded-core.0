Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.4081.1620808568509855065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: fH3BuU7iOItAA0K0hc4/CnppmgAud6L+mDMAfJIjQUr7xipnWjI1nnSvcpffdIJTq5KP2IxMJK
 xYfus7ruhr3Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179917829"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179917829"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:20 -0700
IronPort-SDR: gA51m2UmuiwbIrhiYTMTXR8tqPQPT81Y7JzRfGjnp4qzRYKrWn/KBL58/gGRpgHJHy0LTvkw5i
 o82M4pdgUACQ==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="430645830"
Received: from tmustofa-mobl1.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.122])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:19 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/15] lsb-release: fix reproducibility failure
Date: Wed, 12 May 2021 16:35:45 +0800
Message-Id: <e73898b59eb79d20082963e629ce6f8cc75103c9.1620808329.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620808329.git.anuj.mittal@intel.com>
References: <cover.1620808329.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make sure help2man output is reproducible. Fixes:

| .\"·DO·NOT·MODIFY·THIS·FILE!··It·was·generated·by·help2man·1.022.	.\"·DO·NOT·MODIFY·THIS·FILE!··It·was·generated·by·help2man·1.022.
| .TH·FSG·"1"·"April·2021"·"FSG·lsb_release·v1.4"·FSG	.TH·FSG·"1"·"May·2021"·"FSG·lsb_release·v1.4"·FSG
| .SH·NAME	3 	.SH·NAME

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 49371207a7f1fe3d3feb7b8b9aabb62b43ae34d1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../help2man-reproducibility.patch            | 27 +++++++++++++++++++
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/lsb/lsb-release/help2man-reproducibility.patch

diff --git a/meta/recipes-extended/lsb/lsb-release/help2man-reproducibility.patch b/meta/recipes-extended/lsb/lsb-release/help2man-reproducibility.patch
new file mode 100644
index 0000000000..f32cd18370
--- /dev/null
+++ b/meta/recipes-extended/lsb/lsb-release/help2man-reproducibility.patch
@@ -0,0 +1,27 @@
+lsb-release maintains it's own copy of help2man. Include the support
+for specifying SOURCE_DATE_EPOCH from upstream.
+
+Upstream-Status: Pending
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+diff --git a/help2man b/help2man
+index 13015c2..63439db 100755
+--- a/help2man
++++ b/help2man
+@@ -173,7 +173,14 @@ my ($help_text, $version_text) = map {
+ 	or die "$this_program: can't get `--$_' info from $ARGV[0]\n"
+ } qw(help), $opt_version_key;
+ 
+-my $date = strftime "%B %Y", localtime;
++my $epoch_secs = time;
++if (exists $ENV{SOURCE_DATE_EPOCH} and $ENV{SOURCE_DATE_EPOCH} =~ /^(\d+)$/)
++{
++    $epoch_secs = $1;
++    $ENV{TZ} = 'UTC0';
++}
++
++my $date = strftime "%B %Y", localtime $epoch_secs;
+ (my $program = $ARGV[0]) =~ s!.*/!!;
+ my $package = $program;
+ my $version;
diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
index 3e8f7a13ec..bafc18fcc0 100644
--- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar.gz \
            file://0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch \
            file://0001-Remove-timestamp-from-manpage.patch \
+           file://help2man-reproducibility.patch \
            "
 
 SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
-- 
2.31.1

