Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B9D7778411
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 03:11:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35461435"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jan 2018 11:11:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5467048AEA1C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 11:11:00 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 19 Jan 2018 11:11:00 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jan 2018 11:10:59 +0800
Message-ID: <1516331459-4093-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516331459-4093-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1516331459-4093-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 5467048AEA1C.A50EF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] bash: 4.4 -> 4.4.12
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
X-List-Received-Date: Fri, 19 Jan 2018 03:11:07 -0000
Content-Type: text/plain

1.Upgrade bash from 4.4 to 4.4.12.
2.Delete bash44-001, bash44-002, bash44-003, bash44-004, bash44-005, bash44-006, bash44-007,bash44-008, bash44-009, bash44-0010, bash44-0011, bash44-0012, since it is integrated upstream.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/bash/bash_4.4.12.bb | 24 +++++++++++++
 meta/recipes-extended/bash/bash_4.4.bb    | 60 -------------------------------
 2 files changed, 24 insertions(+), 60 deletions(-)
 create mode 100644 meta/recipes-extended/bash/bash_4.4.12.bb
 delete mode 100644 meta/recipes-extended/bash/bash_4.4.bb

diff --git a/meta/recipes-extended/bash/bash_4.4.12.bb b/meta/recipes-extended/bash/bash_4.4.12.bb
new file mode 100644
index 0000000..9382a77
--- /dev/null
+++ b/meta/recipes-extended/bash/bash_4.4.12.bb
@@ -0,0 +1,24 @@
+require bash.inc
+
+# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
+           file://execute_cmd.patch;striplevel=0 \
+           file://mkbuiltins_have_stringize.patch \
+           file://build-tests.patch \
+           file://test-output.patch \
+           file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
+           file://run-ptest \
+           file://fix-run-builtins.patch \
+           file://0001-help-fix-printf-format-security-warning.patch \
+           file://bash-memleak-bug-fix-for-builtin-command-read.patch \
+           file://pathexp-dep.patch \
+           "
+
+SRC_URI[tarball.md5sum] = "7c112970cbdcadfc331e10eeb5f6aa41"
+SRC_URI[tarball.sha256sum] = "57d8432be54541531a496fd4904fdc08c12542f43605a9202594fa5d5f9f2331"
+
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-extended/bash/bash_4.4.bb b/meta/recipes-extended/bash/bash_4.4.bb
deleted file mode 100644
index 8b989ed..0000000
--- a/meta/recipes-extended/bash/bash_4.4.bb
+++ /dev/null
@@ -1,60 +0,0 @@
-require bash.inc
-
-# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-001;apply=yes;striplevel=0;name=patch001 \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-002;apply=yes;striplevel=0;name=patch002 \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-003;apply=yes;striplevel=0;name=patch003 \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-004;apply=yes;striplevel=0;name=patch004 \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-005;apply=yes;striplevel=0;name=patch005 \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-006;apply=yes;striplevel=0;name=patch006 \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-007;apply=yes;striplevel=0;name=patch007 \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-008;apply=yes;striplevel=0;name=patch008 \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-009;apply=yes;striplevel=0;name=patch009 \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-010;apply=yes;striplevel=0;name=patch010 \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-011;apply=yes;striplevel=0;name=patch011 \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-012;apply=yes;striplevel=0;name=patch012 \
-           file://execute_cmd.patch;striplevel=0 \
-           file://mkbuiltins_have_stringize.patch \
-           file://build-tests.patch \
-           file://test-output.patch \
-           file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
-           file://run-ptest \
-           file://fix-run-builtins.patch \
-           file://0001-help-fix-printf-format-security-warning.patch \
-           file://bash-memleak-bug-fix-for-builtin-command-read.patch \
-           file://pathexp-dep.patch \
-           "
-
-SRC_URI[tarball.md5sum] = "148888a7c95ac23705559b6f477dfe25"
-SRC_URI[tarball.sha256sum] = "d86b3392c1202e8ff5a423b302e6284db7f8f435ea9f39b5b1b20fd3ac36dfcb"
-
-SRC_URI[patch001.md5sum] = "817d01a6c0af6f79308a8b7b649e53d8"
-SRC_URI[patch001.sha256sum] = "3e28d91531752df9a8cb167ad07cc542abaf944de9353fe8c6a535c9f1f17f0f"
-SRC_URI[patch002.md5sum] = "765e14cff12c7284009772e8e24f2fe0"
-SRC_URI[patch002.sha256sum] = "7020a0183e17a7233e665b979c78c184ea369cfaf3e8b4b11f5547ecb7c13c53"
-SRC_URI[patch003.md5sum] = "49e7da93bf07f510a2eb6bb43ac3e5a2"
-SRC_URI[patch003.sha256sum] = "51df5a9192fdefe0ddca4bdf290932f74be03ffd0503a3d112e4199905e718b2"
-SRC_URI[patch004.md5sum] = "4557d674ab5831a5fa98052ab19edaf4"
-SRC_URI[patch004.sha256sum] = "ad080a30a4ac6c1273373617f29628cc320a35c8cd06913894794293dc52c8b3"
-SRC_URI[patch005.md5sum] = "cce96dd77cdd1d293beec10848f6cbb5"
-SRC_URI[patch005.sha256sum] = "221e4b725b770ad0bb6924df3f8d04f89eeca4558f6e4c777dfa93e967090529"
-SRC_URI[patch006.md5sum] = "d3379f8d8abce5c6ee338f931ad008d5"
-SRC_URI[patch006.sha256sum] = "6a8e2e2a6180d0f1ce39dcd651622fb6d2fd05db7c459f64ae42d667f1e344b8"
-SRC_URI[patch007.md5sum] = "ec38c76ca439ca7f9c178e9baede84fc"
-SRC_URI[patch007.sha256sum] = "de1ccc07b7bfc9e25243ad854f3bbb5d3ebf9155b0477df16aaf00a7b0d5edaf"
-SRC_URI[patch008.md5sum] = "e0ba18c1e3b94f905da9b5bf9d38b58b"
-SRC_URI[patch008.sha256sum] = "86144700465933636d7b945e89b77df95d3620034725be161ca0ca5a42e239ba"
-SRC_URI[patch009.md5sum] = "e952d4f44e612048930c559d90eb99bb"
-SRC_URI[patch009.sha256sum] = "0b6bdd1a18a0d20e330cc3bc71e048864e4a13652e29dc0ebf3918bea729343c"
-SRC_URI[patch010.md5sum] = "57b5b35955d68f9a09dbef6b86d2c782"
-SRC_URI[patch010.sha256sum] = "8465c6f2c56afe559402265b39d9e94368954930f9aa7f3dfa6d36dd66868e06"
-SRC_URI[patch011.md5sum] = "cc896e1fa696b93ded568e557e2392d5"
-SRC_URI[patch011.sha256sum] = "dd56426ef7d7295e1107c0b3d06c192eb9298f4023c202ca2ba6266c613d170d"
-SRC_URI[patch012.md5sum] = "fa47fbfa56fb7e9e5367f19a9df5fc9e"
-SRC_URI[patch012.sha256sum] = "fac271d2bf6372c9903e3b353cb9eda044d7fe36b5aab52f21f3f21cd6a2063e"
-
-BBCLASSEXTEND = "nativesdk"
-- 
2.7.4




