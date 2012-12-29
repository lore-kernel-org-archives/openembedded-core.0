Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Top4J-000774-OK
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Dec 2012 06:35:04 +0100
Received: by mail-da0-f41.google.com with SMTP id e20so5072354dak.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2012 21:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=sYNjJivJtmIMk8mlSWzuBuo9rmv5LxPzE4kRthhUvQU=;
	b=G663gfdVPY+rH7xO49YIN/vuKSz0lMsG8ibFob1SqT+iQPWH2pmtG1E99zrvFNjMCN
	wLcJBkAcPWs9zR5DvlaLA6/cP30h8Iy7hyNtdVMDbwaj1g7WMJyy/a5FyYOMun6Wikxu
	UjWzoE8gNsKFbN/uF2mtcOD7QKXgxt2xaEw2+GOCliZmhf9KaXZeNKlzXEjId9+n2jSQ
	0oxl8WhHnmG1sz3nf0fBxf3a3UwwVD10qp1otp7oqxgTurBGiSYq2OoLx78FalskIJok
	UYgqooob3Svdo9JG9RuWZNZBZO3pWuAKmAe2w2q1HESfa0lXWaXujif++nq3Rol4BVGF
	Bhxw==
X-Received: by 10.68.194.6 with SMTP id hs6mr110100193pbc.77.1356758390758;
	Fri, 28 Dec 2012 21:19:50 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id vs3sm20848581pbc.61.2012.12.28.21.19.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Dec 2012 21:19:49 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 22:19:28 -0700
Message-Id: <a755aa630c6d2095d5950ee00d396f3249e4a912.1356758000.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1356758000.git.chris_larson@mentor.com>
References: <cover.1356758000.git.chris_larson@mentor.com>
In-Reply-To: <cover.1356758000.git.chris_larson@mentor.com>
References: <cover.1356758000.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 6/6] chkconfig-alternatives-native-1.3.59: add recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Dec 2012 05:35:23 -0000

From: Christopher Larson <chris_larson@mentor.com>

This only builds alternatives, so avoids the libnewt and libpopt dependencies.

This uses 1.3.59 sources from git, with a couple commits of mine to add
--sysroot (and OPKG_OFFLINE_ROOT) support.

LIC_FILES_CHKSUM changed from 1.3.58 to 1.3.59, but only due to minor
formatting differences, not content/terms.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../chkconfig-alternatives-native_1.3.59.bb        | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb

diff --git a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb b/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
new file mode 100644
index 0000000..4c72410
--- /dev/null
+++ b/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
@@ -0,0 +1,43 @@
+require recipes-extended/chkconfig/chkconfig_1.3.58.bb
+
+SUMMARY = "${SUMMARY_chkconfig-alternatives}"
+DESCRIPTION = "${DESCRIPTION_chkconfig-alternatives}"
+DEPENDS = ""
+PROVIDES = "${PN} virtual/update-alternatives-native"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+# The sysroot branch is 1.3.59 + some git commits from master + --sysroot
+# support for alternatives.
+SRC_URI = "git://github.com/kergoth/chkconfig;branch=sysroot"
+S = "${WORKDIR}/git"
+
+SRCREV = "cd437ecbd8986c894442f8fce1e0061e20f04dee"
+PV = "1.3.59+${SRCPV}"
+
+inherit native
+
+# We want our native recipes to build using the target paths rather than paths
+# into the sysroot, as we may use them to construct the rootfs. As such, we
+# only adjust the paths to match the metadata for the target, not native.
+obey_variables () {
+	sed -i 's,ALTERNATIVES_ROOT,OPKG_OFFLINE_ROOT,' alternatives.c
+}
+
+do_compile () {
+	oe_runmake alternatives
+}
+
+do_install () {
+	install -d ${D}${sysconfdir}/alternatives \
+	           ${D}${localstatedir}/lib/alternatives
+
+	install -D -m 0755 alternatives ${D}${bindir}/alternatives
+	install -D -m 0644 alternatives.8 ${D}${mandir}/man8/alternatives.8
+
+	ln -s alternatives ${D}${bindir}/update-alternatives
+	ln -s alternatives.8 ${D}${mandir}/man8/update-alternatives.8
+}
+
+do_install_append_linuxstdbase() {
+	rm -rf ${D}${libdir}/lsb
+}
-- 
1.8.0



