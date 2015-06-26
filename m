Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6F9B8601E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 07:05:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5Q759uo004201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 00:05:09 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Fri, 26 Jun 2015 00:05:08 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jun 2015 14:57:21 +0800
Message-ID: <1435301841-15924-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] rpm-5.4.14: disable external key server
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
X-List-Received-Date: Fri, 26 Jun 2015 07:05:12 -0000
Content-Type: text/plain

From: yzhu1 <yanjun.zhu@windriver.com>

When rpm makes header verification, rpm will send request to the
extern server, this is a potential risk.

Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
---
 .../rpm-macros.in-disable-external-key-server.patch | 21 +++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb             |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch b/meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch
new file mode 100644
index 0000000..206f258
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch
@@ -0,0 +1,21 @@
+disable external key server
+
+Upstream-Status: Pending
+
+When rpm makes header verification, rpm will send request to the
+extern server, this is a potential risk.
+
+Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
+--- a/macros/macros.in
++++ b/macros/macros.in
+@@ -546,8 +546,8 @@ $_arbitrary_tags_tests	Foo:Bar
+ # Horowitz Key Protocol server configuration
+ #
+ #%_hkp_keyserver         hkp://keys.n3npq.net
+-%_hkp_keyserver         hkp://pool.sks-keyservers.net
+-%_hkp_keyserver_query   %{_hkp_keyserver}/pks/lookup?op=get&search=
++#%_hkp_keyserver         hkp://pool.sks-keyservers.net
++#%_hkp_keyserver_query   %{_hkp_keyserver}/pks/lookup?op=get&search=
+ 
+ 
+ %_nssdb_path	/etc/pki/nssdb
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 75b1ae2..666a68e 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -92,6 +92,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://rpm-realpath.patch \
 	   file://0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch \
 	   file://no-ldflags-in-pkgconfig.patch \
+	   file://rpm-macros.in-disable-external-key-server.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.9.1


