Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1TeWyl-0006Az-7m
	for Openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 21:14:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAUJYBj5003991
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 11:34:11 -0800 (PST)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 30 Nov 2012 11:34:10 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Fri, 30 Nov 2012 13:34:08 -0600
Message-ID: <1354304048-17216-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] populate_sdk_base.bbclass: make failure to find ld-linux.so a hard error
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
X-List-Received-Date: Fri, 30 Nov 2012 20:14:33 -0000
Content-Type: text/plain

The shell archive that populates the external SDK should fail if it
cannot find the ld-linux.so else it will corrupt all binaries because
a random path will be used from the list of executables when dl_path
is empty.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index ac34c32..73bd44d 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -176,6 +176,10 @@ done
 # fix dynamic loader paths in all ELF SDK binaries
 native_sysroot=$(cat $env_setup_script |grep OECORE_NATIVE_SYSROOT|cut -d'=' -f2|tr -d '"')
 dl_path=$(find $native_sysroot/lib -name "ld-linux*")
+if [ "$dl_path" = "" ] ; then
+	echo "SDK could not be set up. Relocate script to find ld-linux.so. Abort!"
+	exit 1
+fi
 executable_files=$(find $native_sysroot -type f -perm +111)
 ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files
 if [ $? -ne 0 ]; then
-- 
1.7.1



