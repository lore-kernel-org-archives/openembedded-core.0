Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7B475D3B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 03:30:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t683Uwxw005841
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jul 2015 20:30:59 -0700 (PDT)
Received: from LRQ.corp.ad.wrs.com (128.224.162.158) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 7 Jul 2015 20:30:58 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jul 2015 11:30:57 +0800
Message-ID: <1436326257-23047-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH][V2] rpm: disable external key server
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
X-List-Received-Date: Wed, 08 Jul 2015 03:31:02 -0000
Content-Type: text/plain

From: yzhu1 <yanjun.zhu@windriver.com>

When RPM experiences a signed package, with a signature that it does NOT know.
By default it will send the -fingerprint- (and only the 16 digit fingerprint)
to an external HKP server, trying to get the key down.

This is probably not a reasonable default behavior for the system to do,
instead it should simply fail the key lookup.  If someone wants to enable the
HKP server it's easy enough to do by enabling the necessary macros.

Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...rpm-macros.in-disable-external-key-server.patch | 27 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch b/meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch
new file mode 100644
index 0000000..07a0cfa
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch
@@ -0,0 +1,27 @@
+disable external key server
+
+Upstream-Status: Pending
+
+When RPM experiences a signed package, with a signature that it does NOT know.
+By default it will send the -fingerprint- (and only the 16 digit fingerprint) to
+an external HKP server, trying to get the key down.
+
+This is probably not a reasonable default behavior for the system to do, instead
+it should simply fail the key lookup.  If someone wants to enable the HKP server
+it's easy enough to do by enabling the necessary macros.
+
+Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
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
index 2e17a91..bff0687 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -94,6 +94,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://no-ldflags-in-pkgconfig.patch \
 	   file://rpm-lua-fix-print.patch \
 	   file://rpm-check-rootpath-reasonableness.patch \
+	   file://rpm-macros.in-disable-external-key-server.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
2.1.4


