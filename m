Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TIiNH-0002F2-7x
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 17:57:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q91FifWu021016
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Oct 2012 08:44:41 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Mon, 1 Oct 2012 08:44:40 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Oct 2012 10:50:21 -0500
Message-ID: <1349106622-28591-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 02/12 v2] populate_sdk_base: Update extraction script for multilibs
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
X-List-Received-Date: Mon, 01 Oct 2012 15:57:39 -0000
Content-Type: text/plain

When multilibs are enabled, there will be more then one environment
file created.  We need to be sure to process each environment file.
The next function can simply use the last environment file processed
to get the magic value(s) that it requires.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 6eb6726..8f062b3 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -158,8 +158,9 @@ echo "done"
 
 printf "Setting it up..."
 # fix environment paths
-env_setup_script=$(find $target_sdk_dir/ -name "environment-setup-${REAL_MULTIMACH_TARGET_SYS}")
-sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
+for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
+  sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
+done
 
 # fix dynamic loader paths in all ELF SDK binaries
 native_sysroot=$(cat $env_setup_script |grep OECORE_NATIVE_SYSROOT|cut -d'=' -f2|tr -d '"')
-- 
1.7.3.4



