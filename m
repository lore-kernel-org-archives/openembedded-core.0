Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E418771DBA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 00:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0V0EbSx006142; Tue, 31 Jan 2017 00:14:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8WUJjnRsPCU3; Tue, 31 Jan 2017 00:14:37 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0V0EXSs006127
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 31 Jan 2017 00:14:34 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cYM5h-00079K-F1; Tue, 31 Jan 2017 00:14:33 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 00:14:23 +0000
Message-Id: <1485821667-27436-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/5] utils: Avoid need to relocate wrapper scripts
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
X-List-Received-Date: Tue, 31 Jan 2017 00:14:40 -0000

Whilst the path to the executable is dynamically determined, the passed in
environment variables or parameters are not relocatable and rely on the sstate
remapping code. In the recipe specific sysroot case this has become more costly.

This patch translates such paths into relocatable entries which means that
a sed replacement at final installation isn't needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/utils.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 549e4b8..16f42b4 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -264,10 +264,14 @@ create_cmdline_wrapper () {
 
 	mv $cmd $cmd.real
 	cmdname=`basename $cmd`
+	dirname=`dirname $cmd`
+	relpath=`python3 -c "import os; print(os.path.relpath('${D}${base_prefix}', '$dirname'))"`
+	cmdoptions=`echo $@ | sed -e "s:${base_prefix}:\\$realdir/$relpath:g"`
 	cat <<END >$cmd
 #!/bin/bash
 realpath=\`readlink -fn \$0\`
-exec -a \`dirname \$realpath\`/$cmdname \`dirname \$realpath\`/$cmdname.real $@ "\$@"
+realdir=\`dirname \$realpath\`
+exec -a \`dirname \$realpath\`/$cmdname \`dirname \$realpath\`/$cmdname.real $cmdoptions "\$@"
 END
 	chmod +x $cmd
 }
@@ -287,10 +291,14 @@ create_wrapper () {
 
 	mv $cmd $cmd.real
 	cmdname=`basename $cmd`
+	dirname=`dirname $cmd`
+	relpath=`python3 -c "import os; print(os.path.relpath('${D}${base_prefix}', '$dirname'))"`
+	exportstring=`echo $@ | sed -e "s:${base_prefix}:\\$realdir/$relpath:g"`
 	cat <<END >$cmd
 #!/bin/bash
 realpath=\`readlink -fn \$0\`
-export $@
+realdir=\`dirname \$realpath\`
+export $exportstring
 exec -a \`dirname \$realpath\`/$cmdname \`dirname \$realpath\`/$cmdname.real "\$@"
 END
 	chmod +x $cmd
-- 
2.7.4


