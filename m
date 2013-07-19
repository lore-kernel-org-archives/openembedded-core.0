Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 26BE96B264
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 09:39:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6J9dIAR022486
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 02:39:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 19 Jul 2013 02:39:17 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jul 2013 17:39:27 +0800
Message-ID: <6c88ed5994aec47f5882e3a410f0884a37939e6b.1374226651.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374226651.git.Qi.Chen@windriver.com>
References: <cover.1374226651.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 3/3] run-postinsts: add more logging to the log file to make things clearer
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
X-List-Received-Date: Fri, 19 Jul 2013 09:39:17 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

When all postinsts scripts succeed at system startup, it's very possible
that the log file /var/log/postinstall.log is empty. This is kind of
confusing, as that file is supposed to hold information about the postinsts.

Add more logging to the log file to make things clearer.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../run-postinsts/run-postinsts/run-postinsts      |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index 2a8d1d6..c94c3e9 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -24,6 +24,7 @@ remove_pi_dir=1
 for i in `ls $pi_dir`; do
 	i=$pi_dir/$i
 	echo "Running postinst $i..."
+	[ "$POSTINST_LOGGING" = "1" ] && echo "Running postinst $i..." >> $LOGFILE
 	if [ -x $i ]; then
 		if [ "$POSTINST_LOGGING" = "1" ]; then
 			sh -c $i >>$LOGFILE 2>&1
@@ -33,6 +34,7 @@ for i in `ls $pi_dir`; do
 		rm $i
 	else
 		echo "ERROR: postinst $i failed."
+		[ "$POSTINST_LOGGING" = "1" ] && echo "ERROR: postinst $i failed." >> $LOGFILE
 		remove_pi_dir=0
 	fi
 done
-- 
1.7.9.5


