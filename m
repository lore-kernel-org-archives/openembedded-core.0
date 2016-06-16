Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 15360731D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 09:30:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5G9U8wQ025337
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 02:30:11 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 16 Jun 2016 02:30:05 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jun 2016 17:30:04 +0800
Message-ID: <18032fc6b17d21b4fcb431114a6000042b38e3d9.1466069361.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1466069361.git.Qi.Chen@windriver.com>
References: <cover.1466069361.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] recipetool/create.py: fix LICENSE value
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
X-List-Received-Date: Thu, 16 Jun 2016 09:30:14 -0000
Content-Type: text/plain

When there multiple license in a repo, the LICENSE value be created as
something like "LGPLv2.1 GPLv2", which causes the following warning.

LICENSE value "LGPLv2.1 GPLv2" has an invalid format - license names must
be separated by the following characters to indicate the license selection: &|()

Fix it by using '&' to join multiple licenses.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 1297428..b3fd78b 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -504,7 +504,7 @@ def create_recipe(args):
             licenses = [pkg_license]
         else:
             lines_before.append('# NOTE: Original package metadata indicates license is: %s' % pkg_license)
-    lines_before.append('LICENSE = "%s"' % ' '.join(licenses))
+    lines_before.append('LICENSE = "%s"' % ' & '.join(licenses))
     lines_before.append('LIC_FILES_CHKSUM = "%s"' % ' \\\n                    '.join(lic_files_chksum))
     lines_before.append('')
 
-- 
1.9.1


