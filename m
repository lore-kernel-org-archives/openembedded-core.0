Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	by mail.openembedded.org (Postfix) with ESMTP id 8120578A97
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 17:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2352; q=dns/txt; s=iport;
	t=1520358653; x=1521568253;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=txmjxN6J8upIiZqMwT55qqOjzoG5ZK5xQntw6ci5kK4=;
	b=YkNUAtVGPEIUOlKD+TDzwq0siQ3ZIdRDQ0tkzUKZ/rsWmul8lEVY4YBF
	bL8ZsQHXhib+vgw6W+LxWSTxYhYkRUJSwVKziQMj4KWkCEEpye0POpPnB
	NbKDZFS5CS4CT/kpp1Zz/w72n0yqgdJ9IpwcPJvbLpX4e2UrO19+i5JMC I=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BJAgCk055a/5xdJa1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNQZnAom3GDGJZJCh+FEQKDAyE3FQECAQEBAQEBAmsnhSQGeRB?=
	=?us-ascii?q?RVxmFG6s6hHKDdIImhTGCLoY0hUFihSEEjnGLdgmGVIMSAQWHEwKOdol9hywCE?=
	=?us-ascii?q?RkBgS40IoFSTSMVgn0JhGAfN4wlAQEB?=
X-IronPort-AV: E=Sophos;i="5.47,432,1515456000"; d="scan'208";a="146325668"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
	by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2018 17:50:52 +0000
Received: from kamensky-w541.cisco.com ([10.24.22.184]) (authenticated bits=0)
	by rcdn-core-5.cisco.com (8.14.5/8.14.5) with ESMTP id w26HofYp007528
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Tue, 6 Mar 2018 17:50:51 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2018 09:50:40 -0800
Message-Id: <1520358641-7062-5-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520358641-7062-1-git-send-email-kamensky@cisco.com>
References: <1520358641-7062-1-git-send-email-kamensky@cisco.com>
X-Authenticated-User: kamensky@cisco.com
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: [RFC PATCH 4/5] systemtap: introduce utils variant of systemtap package build
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
X-List-Received-Date: Tue, 06 Mar 2018 17:50:51 -0000

In case of small target images it is too expensive to include
full stap package into the image. Because default systemtap
package include SystemTap translater and have very deep dependencies
on variety of libraries. And in cross compiling environment
compilation of SystemTap kernel modules can happen on host for
a given target using --sysroot and other proper options.

In order to deploy resulting SystemTap .ko module, one need small
set of SystemTap runtime tools like staprun and stapio.

systemtap-utils introduces special "small" variant of systemtap
build where only SystemTap run-time utilties are built. As result
addition on target is quite small.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 .../systemtap/systemtap-utils_git.bb               | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap-utils_git.bb

diff --git a/meta/recipes-kernel/systemtap/systemtap-utils_git.bb b/meta/recipes-kernel/systemtap/systemtap-utils_git.bb
new file mode 100644
index 0000000..3359257
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap-utils_git.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Small set only runtime utilities for SystemTap"
+HOMEPAGE = "https://sourceware.org/systemtap/"
+
+require systemtap_git.inc
+
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemtap:"
+
+DEPENDS = "elfutils"
+
+# should not be used along with complete systemtap
+RCONFLICTS_${PN} = "systemtap"
+
+EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
+            --without-nss --without-avahi --without-dyninst \
+            --disable-server --disable-grapher --enable-prologues \
+            --with-python3 --without-python2-probes \
+            --disable-sdt-probes --disable-translator \
+            --disable-libvirt --disable-sqlite --disable-monitor \
+            --without-python3-probes \
+            --disable-docs --disable-publican --disable-refdocs \
+            ac_cv_prog_have_javac=no \
+            ac_cv_prog_have_jar=no "
+
+do_install_append () {
+            rm -rf ${D}${datadir}/systemtap
+            rm -rf ${D}${includedir}
+            # remove bash dependency we don't need it anyway
+            rm ${D}${libexecdir}/systemtap/stap-env
+}
+
+inherit autotools gettext
-- 
2.7.4


