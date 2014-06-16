Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 122AC6FD52
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 06:46:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5G6k0v7022273
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Jun 2014 23:46:00 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 15 Jun 2014 23:46:00 -0700
From: <rongqing.li@windriver.com>
To: <laurentiu.palcu@intel.com>, <Yanjun.Zhu@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 14:46:11 +0800
Message-ID: <1402901171-14424-2-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402901171-14424-1-git-send-email-rongqing.li@windriver.com>
References: <1402901171-14424-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] Revert "populate_sdk: verify executable or dynamically linked library" This reverts commit c9d56308bfa9ee7f4a9b22eae86390626ddc1c35.
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
X-List-Received-Date: Mon, 16 Jun 2014 06:46:01 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

It is introduced a bug, since The return of "file ld-linux-x86-64.so.*"
does not include "dynamically linked" in redhat 5.9/6.0(32 bit), and lead
to that ld-linux-x86-64.so.* is not in executable file list.
---
 meta/classes/populate_sdk_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 10d04ed..35d837d 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -254,7 +254,7 @@ if [ "$dl_path" = "" ] ; then
 	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
 	exit 1
 fi
-executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111 -exec file '{}' \;| grep "\(executable\|dynamically linked\)" | cut -f 1 -d ':') 
+executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111)
 
 tdir=`mktemp -d`
 if [ x$tdir = x ] ; then
-- 
1.7.10.4


