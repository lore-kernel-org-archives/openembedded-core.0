Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1A3467752B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 22:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29MHiwU030282; Thu, 9 Mar 2017 22:17:44 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6g9pyqP54LO3; Thu,  9 Mar 2017 22:17:44 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29MHd6X030264
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Mar 2017 22:17:40 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cm6NP-00055d-EX; Thu, 09 Mar 2017 22:17:39 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 22:17:30 +0000
Message-Id: <1489097854-19523-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/5] toolchain-shar-extract.sh: Ensure sbin directories are in PATH in clean environment
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
X-List-Received-Date: Thu, 09 Mar 2017 22:17:45 -0000

For the PATH host tool whitelisting to work, the sbin directories need to be
in PATH. In the cleaned SDK environment on some distros, this isn't the case
and the SDK would then fail to setup there. This adds code to add such paths
if they do happen to be missing, ugly, but unblocks the PATH whitelisting
which I believe to be important.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/toolchain-shar-extract.sh | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 3f54c96..91804ec 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -8,6 +8,20 @@
 [ -f /etc/environment ] && . /etc/environment
 export PATH=`echo "$PATH" | sed -e 's/:\.//' -e 's/::/:/'`
 
+tweakpath () {
+    case ":${PATH}:" in
+        *:"$1":*)
+            ;;
+        *)
+            PATH=$PATH:$1
+    esac
+}
+
+# Some systems don't have /usr/sbin or /sbin in the cleaned environment PATH but we make need it 
+# for the system's host tooling checks
+tweakpath /usr/sbin
+tweakpath /sbin
+
 INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 
-- 
2.7.4


