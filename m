Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw58-0008KG-Nu
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:15:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0VRq008475
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:31 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:31 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:52 -0600
Message-ID: <0d97e14c48d2368ad4801994416eba990654254d.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 20/22] pkgconfig: Add a manual dependency of pkgconfig(pkg-config)
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
X-List-Received-Date: Tue, 04 Dec 2012 17:15:12 -0000
Content-Type: text/plain

The libtelepathy-glib-dev package contains a .pc file that has a requires
of pkgconfig(pkg-config) > 0.21 in it.  In order to satisfy this requirement
we add a manual RPROVIDE to the pkgconfig package.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig.inc     |    5 +++++
 meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb |    2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb  |    1 +
 3 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
index 83a9cdf..27d4071 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
@@ -37,3 +37,8 @@ BBCLASSEXTEND = "native nativesdk"
 # files.
 FILES_${PN}-dev = ""
 FILES_${PN} += "${datadir}/aclocal/pkg.m4"
+
+# When using the RPM generated automatic package dependencies, some packages
+# will end up requiring 'pkgconfig(pkg-config)'.  Allow this behavior by
+# specifying an appropriate provide.
+RPROVIDES_${PN} += "pkgconfig(pkg-config) (= ${PV})"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
index 1e60c54..d0a2b1f 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
@@ -1,6 +1,6 @@
 require pkgconfig.inc
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI[md5sum] = "a3270bab3f4b69b7dc6dbdacbcae9745"
 SRC_URI[sha256sum] = "3ba691ee2431f32ccb8efa131e59bf23e37f122dc66791309023ca6dcefcd10e"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 6271992..d5ec8fc 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -8,6 +8,7 @@ S = "${WORKDIR}/git/"
 
 SRCREV = "66d49f1375fec838bcd301bb4ca2ef76cee0e47c"
 PV = "0.23+git${SRCPV}"
+PR = "r1"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.3.4



