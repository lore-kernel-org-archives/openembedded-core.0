Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.6764.1620369316366907140
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 23:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: iIG+pT7A6kXqZh13PrlYnDbEH8zm6whBqHt1ASpGWWS4RVSKiFThrJH9Gcl5/2KAgjnoyGyill
 H7szPkwz+A3Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198310460"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="198310460"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2021 23:35:15 -0700
IronPort-SDR: f31LwqBfxv0cPs15lVi6V7YDwM7MJ2s4UjlH6hcy+HnnClT57knjHc//xvyQaqPDBDsNJ5PERr
 OkK6H3ZYpdRg==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="389919654"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2021 23:35:12 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lsb-release: fix reproducibility failure
Date: Fri,  7 May 2021 14:35:07 +0800
Message-Id: <20210507063507.59889-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make sure help2man output is reproducible. Fixes:

| .\"·DO·NOT·MODIFY·THIS·FILE!··It·was·generated·by·help2man·1.022.	.\"·DO·NOT·MODIFY·THIS·FILE!··It·was·generated·by·help2man·1.022.
| .TH·FSG·"1"·"April·2021"·"FSG·lsb_release·v1.4"·FSG	.TH·FSG·"1"·"May·2021"·"FSG·lsb_release·v1.4"·FSG
| .SH·NAME	3 	.SH·NAME

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
2.30.2

