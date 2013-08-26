Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 155A961013
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 23:38:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7QNckjO015114
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 16:38:46 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 26 Aug 2013 16:38:45 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Aug 2013 16:38:45 -0700
Message-ID: <1377560325-16082-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [v3][PATCH 1/1] dpkg: fix configuration issue for mips64
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
X-List-Received-Date: Mon, 26 Aug 2013 23:38:46 -0000
Content-Type: text/plain

CQID: 431771

configure cannot determine the proper cpu, os, or
architecture for mips64, and possibly other arch's,
because of faulty code added to Arch.pm in the latest
release from upstream.  We remove that code.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch |   22 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.1.bb     |    1 +
 2 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
new file mode 100644
index 0000000..cad4c0f
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
@@ -0,0 +1,22 @@
+configure cannot determine the proper cpu, os, or
+architecture for mips64, and possibly other arch's
+because of faulty code added to Arch.pm in the latest
+release from upstream.  We remove that code.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+
+--- a/scripts/Dpkg/Arch.pm
++++ b/scripts/Dpkg/Arch.pm
+@@ -233,9 +233,6 @@ sub read_triplettable()
+ 		    (my $dt = $debtriplet) =~ s/<cpu>/$_cpu/;
+ 		    (my $da = $debarch) =~ s/<cpu>/$_cpu/;
+ 
+-		    next if exists $debarch_to_debtriplet{$da}
+-		         or exists $debtriplet_to_debarch{$dt};
+-
+ 		    $debarch_to_debtriplet{$da} = $dt;
+ 		    $debtriplet_to_debarch{$dt} = $da;
+ 		}
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb
index 01027a0..525f759 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://noman.patch \
             file://fix-timestamps.patch \
             file://remove-tar-no-timestamp.patch \
             file://fix-abs-redefine.patch \
+            file://arch_pm.patch \
            "
 
 SRC_URI[md5sum] = "ece3ae87a099158c17bde95c0036c575"
-- 
1.7.3.4


