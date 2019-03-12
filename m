Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 212627C6AB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 21:14:10 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 53079134F66;
	Tue, 12 Mar 2019 17:14:11 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id Rz9D8zxDw2Nd; Tue, 12 Mar 2019 17:14:11 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 02989134F62;
	Tue, 12 Mar 2019 17:14:11 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 02989134F62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552425251;
	bh=R6ls3jHF4t08WwwppVRlGeKdTrpizemu1/oiISkSfRI=;
	h=From:To:Date:Message-Id;
	b=eY5hDNH7jk5/eaEEq04HsY5k3h5hndiF7umppuW2t6dIZUUOJ8ZY1QHgkydgkb29P
	q9CnXk9FLWhrST+vs2CoFi2P0d+0QxEulzIthUXb+sYVvJZ1SWVO3CDgPGoS57NuL1
	tXDBzGaZjeoPMn9smPTuHekyDEpl/ESFc+pdHoF2gPJBJyEVfNafu4JtgalH+Q+8av
	tKd8F4IPz2Uecsb6qv5IfvbI3MBTlW2+jsffOiUDVAaDZjgC8lp8/MNYyN0SM7vtQ0
	dYpHvpSNhYth0nlgvBIDh38vrXhs1zEXZlWGqkz4C88BPWQ7LpuBdr5xx+NhuX6f4h
	T36RyRAvRtp4Q==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id ejSbQ33eA2He; Tue, 12 Mar 2019 17:14:10 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id D8543134F5D;
	Tue, 12 Mar 2019 17:14:10 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2019 21:14:05 +0000
Message-Id: <20190312211405.6569-1-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] lttng-ust: add python3-agent feature
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
X-List-Received-Date: Tue, 12 Mar 2019 21:14:10 -0000

Enable users to use lttng as an event sink for python3.

For more details: https://lttng.org/docs/v2.10/#doc-python-application

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
index b5c43200d6..c0f408eeec 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
@@ -8,7 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
                     file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
                     file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
 
-inherit autotools lib_package manpages
+PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
+                 am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
+                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
+"
+
+inherit autotools lib_package manpages python3native
 
 DEPENDS = "liburcu util-linux"
 RDEPENDS_${PN}-bin = "python3-core"
@@ -29,6 +34,11 @@ SRC_URI[sha256sum] = "9e8420f90d5f963f7aa32bc6d44adc1e491136f687c69ffb7a3075d33b
 CVE_PRODUCT = "ust"
 
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
+PACKAGECONFIG[python3-agent] = "--enable-python-agent ${PYTHON_OPTION}, --disable-python-agent, python3, python3"
+
+FILES_${PN} += " ${PYTHON_SITEPACKAGES_DIR}/*"
+FILES_${PN}-staticdev += " ${PYTHON_SITEPACKAGES_DIR}/*.a"
+FILES_${PN}-dev += " ${PYTHON_SITEPACKAGES_DIR}/*.la"
 
 do_install_append() {
         # Patch python tools to use Python 3; they should be source compatible, but
-- 
2.17.1


