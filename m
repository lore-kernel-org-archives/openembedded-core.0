Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4807771BC4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 01:57:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uB71vjFD011357
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2016 17:57:45 -0800
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 6 Dec 2016 17:57:44 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Dec 2016 09:57:41 +0800
Message-ID: <cef1e506813912154f9fddeedcdf332e732751bf.1481075716.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1481075716.git.dengke.du@windriver.com>
References: <cover.1481075716.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] archiver.bbclass: fix do_ar_recipe error for bonnie++ and libsigc++-2.0
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
X-List-Received-Date: Wed, 07 Dec 2016 01:57:45 -0000
Content-Type: text/plain

When recipes name contains regular expression special characters, such as "++",
in this case, the re.compile function in do_ar_recipe can't recognize it, so we
should associate with re.escape to recognize the special characters in pattern.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/classes/archiver.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index fe8877b..7d89e44 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -359,8 +359,9 @@ python do_ar_recipe () {
     bbappend_files = d.getVar('BBINCLUDED', True).split()
     # If recipe name is aa, we need to match files like aa.bbappend and aa_1.1.bbappend
     # Files like aa1.bbappend or aa1_1.1.bbappend must be excluded.
-    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" %pn)
-    bbappend_re1 = re.compile( r".*/%s\.bbappend$" %pn)
+    # If the "pn" contains regular expression special characters, we should use re.escape to recognize it.
+    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" % re.escape(pn))
+    bbappend_re1 = re.compile( r".*/%s\.bbappend$" % re.escape(pn))
     for file in bbappend_files:
         if bbappend_re.match(file) or bbappend_re1.match(file):
             shutil.copy(file, outdir)
-- 
2.7.4


