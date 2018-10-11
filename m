Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F77E62134
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 00:30:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9B0US7s011070
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 17:30:39 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 10 Oct 2018 17:30:17 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Oct 2018 08:30:15 +0800
Message-ID: <1539217815-29904-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH] ltp: use 'ping -6' if ping6 is not avaliable in netns_helper.sh
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
X-List-Received-Date: Thu, 11 Oct 2018 00:30:49 -0000
Content-Type: text/plain

The iputils-ping6 was dropped since the 'ping6' command had been merged
into ping command. Backport patch from upstream to let both 'ping6' and
'ping -6' work.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...r.sh-use-ping-6-when-ping6-is-not-avaliab.patch | 45 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch b/meta/recipes-extended/ltp/ltp/0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch
new file mode 100644
index 0000000..32e7a0e
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch
@@ -0,0 +1,45 @@
+From 76d8343ad300f6507233abcdf97629290e35848a Mon Sep 17 00:00:00 2001
+From: Lei Yang <Lei.Yang@windriver.com>
+Date: Wed, 29 Aug 2018 11:51:24 +0800
+Subject: [PATCH] netns_helper.sh: use 'ping -6' when ping6 is not avaliable
+
+ping6 has been merged into ping since 2015 by using "ping -6"
+in some distributions (e.g. OpenEmbedded) they dropped ping6 completely
+this patch will let both "ping -6" and ping6 work.
+
+[pvorel: change was done in s20150815:
+ebad35f ("ping: merge `ping6` command into `ping`"),
+before that release switch '-6' didn't exist.
+Upstream leaves ping6 symlink to distributions.]
+
+Upstream-Status: Backport
+[https://github.com/linux-test-project/ltp/commit/76d8343ad300f6507233abcdf97629290e35848a]
+
+Signed-off-by: Lei Yang <Lei.Yang@windriver.com>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ testcases/kernel/containers/netns/netns_helper.sh | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/containers/netns/netns_helper.sh b/testcases/kernel/containers/netns/netns_helper.sh
+index 6aea10b..a9d0459 100755
+--- a/testcases/kernel/containers/netns/netns_helper.sh
++++ b/testcases/kernel/containers/netns/netns_helper.sh
+@@ -168,7 +168,12 @@ netns_setup()
+ 	ipv6)
+ 		IFCONF_IN6_ARG="inet6 add"
+ 		IP0=$6; IP1=$7;
+-		tping="ping6"; NETMASK=64
++		if which ping6 >/dev/null 2>&1; then
++		    tping="ping6"
++		else
++		    tping="ping -6"
++		fi
++		NETMASK=64
+ 		;;
+ 	*)
+ 		tst_brkm TBROK "second argument must be an ip version (ipv4|ipv6)"
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
index ba0e6a6..643239f 100644
--- a/meta/recipes-extended/ltp/ltp_20180515.bb
+++ b/meta/recipes-extended/ltp/ltp_20180515.bb
@@ -54,6 +54,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch \
            file://0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch \
            file://0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch \
+           file://0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


