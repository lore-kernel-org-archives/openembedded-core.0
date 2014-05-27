Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7488B6FA74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 02:39:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4R2dTSn020736
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 19:39:29 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 26 May 2014 19:39:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 May 2014 22:15:15 -0400
Message-ID: <2f566f6e402b82c19a1aa0e822c4ebc5dccc2ca7.1401154976.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1401154976.git.liezhi.yang@windriver.com>
References: <cover.1401154976.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] rpm: Fix rpm -V usage
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
X-List-Received-Date: Tue, 27 May 2014 02:39:29 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

[YOCTO #6309]

It appears a logic issue has caused rpm -V to no longer
verify the files on the filesystem match what was installed.

(From OE-Core master rev: 117862cd0eebf6887c2ea6cc353432caee2653aa)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../rpm/rpm/rpm-verify-files.patch                 |   22 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch b/meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch
new file mode 100644
index 0000000..fddac7a
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch
@@ -0,0 +1,22 @@
+lib/verify.c: Fix rpm -V file processing
+
+rpm -V should verify the md5sum and other values on individual files.
+A logic error in the query for GHOST files prevented this from working.
+
+[ Upstream-Status: Submitted ]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm-5.4.9/lib/verify.c
+===================================================================
+--- rpm-5.4.9.orig/lib/verify.c
++++ rpm-5.4.9/lib/verify.c
+@@ -587,7 +587,7 @@ uint32_t fc = rpmfiFC(fi);
+ 
+ 	/* If not verifying %ghost, skip ghost files. */
+ 	/* XXX the broken!!! logic disables %ghost queries always. */
+-	if (!(FF_ISSET(qva->qva_fflags, GHOST) && FF_ISSET(fflags, GHOST)))
++	if (!(FF_ISSET(qva->qva_fflags, GHOST)) && FF_ISSET(fflags, GHOST))
+ 	    continue;
+ 
+ 	/* Gather per-file data into a carrier. */
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index c2f2279..702a142 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -89,6 +89,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://debugedit-valid-file-to-fix-segment-fault.patch \
 	   file://rpm-platform-file-fix.patch \
 	   file://rpm-lsb-compatibility.patch \
+	   file://rpm-verify-files.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.7.10.4


