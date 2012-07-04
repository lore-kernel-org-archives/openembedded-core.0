Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SmMnW-0007Cl-TK
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 12:27:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q64AFwBJ015771
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jul 2012 03:15:58 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 4 Jul 2012 03:15:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Jul 2012 18:15:54 +0800
Message-ID: <bb2efe6415a880bcc733e2d30e3eb0ea3524b877.1341391695.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1341391695.git.liezhi.yang@windriver.com>
References: <cover.1341391695.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] dpkg 1.15.8.7: bad interpreter when long tmpdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2012 10:27:03 -0000
Content-Type: text/plain

When use PACKAGE_CLASSES = "package_deb", and the length of tmpdir is
longer than 177, the error occurs during the image generation:

/very/long/path/totmp/sysroots/x86_64-linux/usr/bin/dpkg-scanpackages:
bad interpreter: No such file or directory

The interpreter is perl, and it does exist, this is because the first
line:

  #!/very/long/path/to/perl

in the script can't be very long.

Create a wrapper for it would fix the problem.

[YOCTO #2640]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 09bfbbc..7f4f620 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Package maintenance system for Debian."
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
-INC_PR = "r16"
+INC_PR = "r17"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2 \
            file://ignore_extra_fields.patch"
@@ -56,6 +56,15 @@ do_install_append () {
 	fi
 }
 
+# Create a wrapper for the perl script to avoid the "bad interpreter"
+# error when the tmpdir is longer than 150.
+do_install_append_virtclass-native () {
+	tmp=`find ${D}${bindir} -type f -exec grep -m 1 -l '#!/.*/perl-native/perl' {} \;`
+	for i in $tmp; do
+		create_wrapper $i ${STAGING_BINDIR_NATIVE}/perl-native/perl
+	done
+}
+
 PROV = "virtual/update-alternatives"
 PROV_virtclass-native = ""
 
-- 
1.7.1



