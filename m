Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UZOV4-0004bR-Rf
	for openembedded-core@lists.openembedded.org;
	Mon, 06 May 2013 18:43:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r46GOprv009911
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 May 2013 09:24:51 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.136) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 6 May 2013 09:24:51 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 6 May 2013 09:24:38 -0700
Message-ID: <12f1f361a72cf543a8d6dbfcd3cabd53e8d0b608.1367857109.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1367857109.git.bruce.ashfield@windriver.com>
References: <cover.1367857109.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] kern-tools: anchor and delimit regexs
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
X-List-Received-Date: Mon, 06 May 2013 16:43:23 -0000
Content-Type: text/plain

Updating the kern-tools SRCREV with the following fix:

    Updateme is responsible for updating an existing meta-series with new patches,
    configs and tree manipulations. To do this, it first checks for an existing
    board description and generates one if required. It then searches for features
    and fragments to be applied for the tree.

    There were two problems:

     - A top level board description is detected via the presence of "define"
       directives that indicate the board name, the arch and kernel type. The
       test for define would match on patches or fragments with 'define' in their
       name, and would incorrectly use that file as the top level board description.

       This is fixed by ensuring that only defines at the start of a line, or preceded
       by whitepace match.

     - When searching for features that were indicated as 'addon' or 'optional', the
       search would find, and apply, any feature with the passed name as substring
       versus an exact match.

       This is fixed by ensuring that the matched feature name is /<feature name>
       versus <feature name>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index be58847..6620c4b 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "71ffb08c20022610363e68f9243350b7da020825"
+SRCREV = "9713c9ef7f6e178a0a2a5f2a9c74e3c123ae48dd"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.10.4



