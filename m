Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1ScS90-0005HL-GN
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 04:08:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q571vkHl018606
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 18:57:46 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 6 Jun 2012 18:57:45 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jun 2012 10:01:55 +0800
Message-ID: <615f713aad3ee29122c279e380dac3de6a79846e.1339034063.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1339034063.git.xiaofeng.yan@windriver.com>
References: <cover.1339034063.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] archiver.bbclass: Reduce some duplication for function get_licenses
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
X-List-Received-Date: Thu, 07 Jun 2012 02:08:14 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The content to modify this bbclass is as follow:
- Use the existing functions to get license as a directory instead of
  rewriting it for avoiding code duplication.
- Use SPDXLICENSEMAP to map licenses

[YOCTO #2473]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/archiver.bbclass |   23 ++++++++++++-----------
 1 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index ed2dbe4..083bb1d 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -225,17 +225,18 @@ def archive_logs(d,logdir,bbinc=False):
 
 def get_licenses(d):
 	'''get licenses for running .bb file'''
-	licenses = d.getVar('LICENSE', 1).replace('&', '|')
-	licenses = licenses.replace('(', '').replace(')', '') 
-	clean_licenses = ""
-	for x in licenses.split():
-		if x.strip() == '' or x == 'CLOSED':
-			continue
-		if x != "|":
-			clean_licenses += x
-	if '|' in clean_licenses:
-		clean_licenses = clean_licenses.replace('|','')
-	return clean_licenses
+	import oe.license
+
+	licenses_type = d.getVar('LICENSE', True) or ""
+	lics = oe.license.is_included(licenses_type)[1:][0]
+	lice = ''
+	for lic in lics:
+		licens = d.getVarFlag('SPDXLICENSEMAP', lic)
+		if licens != None:
+			lice += licens
+		else:
+			lice += lic
+	return lice
 	
 
 def move_tarball_deploy(d,tarball_list):
-- 
1.7.0.4



