Return-Path: <Qiang.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA7E56C76F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 08:50:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9I8oDqA027749
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 01:50:13 -0700 (PDT)
Received: from optiplex-780.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 18 Oct 2013 01:50:12 -0700
From: Qiang Chen <qiang.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Oct 2013 16:50:20 +0800
Message-ID: <1382086221-19473-1-git-send-email-qiang.chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] openssh: fix sshd status command error prompt
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
X-List-Received-Date: Fri, 18 Oct 2013 08:50:11 -0000
Content-Type: text/plain

sshd status command results in error prompt:

root@qemu0:~# /etc/init.d/sshd status
/usr/sbin/sshd (pid 1199) is running...
/etc/init.d/sshd: line 100: return: can only `return' from a
function or sourced script

"service --status-all" command also display wrong status for sshd.

This commit fix this error prompt and make service command display
right status for sshd.

Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
---
 .../openssh/openssh-6.2p2/init                     |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/init b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
index 266689c..e7f3971 100644
--- a/meta/recipes-connectivity/openssh/openssh-6.2p2/init
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
@@ -97,7 +97,7 @@ case "$1" in
 
   status)
 	status /usr/sbin/sshd
-	return $?
+	exit $?
   ;;
 
   *)
-- 
1.7.9.5


