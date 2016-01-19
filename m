Return-Path: <Liam.Howlett@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 690AA6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 20:20:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0JKKL3P029505
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 12:20:21 -0800
Received: from yow-lhowlett-d0.wrs.com (128.224.56.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jan 2016 12:20:19 -0800
From: "Liam R. Howlett" <Liam.Howlett@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jan 2016 15:20:17 -0500
Message-ID: <1453234817-29076-2-git-send-email-Liam.Howlett@WindRiver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1453234817-29076-1-git-send-email-Liam.Howlett@WindRiver.com>
References: <1453234817-29076-1-git-send-email-Liam.Howlett@WindRiver.com>
MIME-Version: 1.0
Cc: Liam.Howlett@WindRiver.com
Subject: [PATCH] meta/files/toolchain-shar-relocate.sh: Detect different python binaries and select one that exists.
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
X-List-Received-Date: Tue, 19 Jan 2016 20:20:21 -0000
Content-Type: text/plain

Although the relocate_sdk.sh supports python3, fc23 does not symlink
/usr/bin/python3 to /usr/bin/python.  Using exec instead of a call to
the correct interpreter causes a failure on fc23 when python2 is not
present.  This uses 'which' to locate python, python2, then python3 and
uses the first one that's found.

Signed-off-by: Liam R. Howlett <Liam.Howlett@WindRiver.com>
---
 meta/files/toolchain-shar-relocate.sh | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index 4ef2927..4f34fb4 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -13,8 +13,23 @@ if [ x$tdir = x ] ; then
    echo "SDK relocate failed, could not create a temporary directory"
    exit 1
 fi
-echo "#!/bin/bash" > $tdir/relocate_sdk.sh
-echo exec ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files >> $tdir/relocate_sdk.sh
+cat <<EOF >> $tdir/relocate_sdk.sh
+#!/bin/bash
+for py in python python2 python3
+do
+	PYTHON=\`which \${py} 2>/dev/null\`
+	if [ \$? -eq 0 ]; then
+		break;
+	fi
+done
+
+if [ x\${PYTHON} = "x"  ]; then
+	echo "SDK could not be relocated.  No python found."
+	exit 1
+fi
+\${PYTHON} ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files
+EOF
+
 $SUDO_EXEC mv $tdir/relocate_sdk.sh ${env_setup_script%/*}/relocate_sdk.sh
 $SUDO_EXEC chmod 755 ${env_setup_script%/*}/relocate_sdk.sh
 rm -rf $tdir
-- 
2.1.4


