Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U1Cij-0007fy-Ch
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 10:15:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r118xvYx015725
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Feb 2013 00:59:57 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 1 Feb 2013 00:59:56 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Feb 2013 17:00:22 +0800
Message-ID: <b2319aaf09ba1dccdcd58cf067a1b0b1dd4ada93.1359708915.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359708915.git.Qi.Chen@windriver.com>
References: <cover.1359708915.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] busybox: add config fragments
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
X-List-Received-Date: Fri, 01 Feb 2013 09:16:02 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add config fragments to busybox.

Both the implementation and the use case are similar to yocto kernel's
configuration fragments.

[YOCTO #3379]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc |   45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 972e7d0..66044f8 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -112,8 +112,53 @@ do_prepare_config () {
 	fi
 }
 
+# returns all the elements from the src uri that are .cfg files
+def find_cfgs(d):
+    sources=src_patches(d, True)
+    sources_list=[]
+    for s in sources:
+        if s.endswith('.cfg'):
+            sources_list.append(s)
+
+    return sources_list
+
+# Merge config fragments
+# All config fragments for busybox should end with .cfg
+do_merge_config() {
+        SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
+        MERGE_LIST="${@" ".join(find_cfgs(d))}"
+        if [ -n "$MERGE_LIST" ]; then
+                # Make a temp file, merge .config and .cfg files into it
+                TMP_FILE=`mktemp .tmp.config.XXXXXXXX`
+                cp .config $TMP_FILE
+                for MERGE_FILE in $MERGE_LIST; do
+                        CFG_LIST=`sed -n "${SED_CONFIG_EXP}" $MERGE_FILE`
+                        for CFG in $CFG_LIST ; do
+                                grep -q -w $CFG $TMP_FILE
+                                if [ $? -eq 0 ] ; then
+                                        PREV_VAL=`grep -w $CFG $TMP_FILE`
+                                        NEW_VAL=`grep -w $CFG $MERGE_FILE`
+                                        if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
+                                                echo Value of $CFG is redefined by fragment $MERGE_FILE:
+                                                echo Previous  value: $PREV_VAL
+                                                echo New value:       $NEW_VAL
+                                                echo
+                                        fi
+                                        sed -i "/$CFG[ =]/d" $TMP_FILE
+                                fi
+                        done
+                        echo >> $TMP_FILE
+                        cat $MERGE_FILE >> $TMP_FILE
+                done
+                # Copy the temp file to .config, do some cleanup
+		cp $TMP_FILE .config
+		rm $TMP_FILE
+        fi
+}
+
 do_configure () {
 	do_prepare_config
+	do_merge_config
 	cml1_do_configure
 }
 
-- 
1.7.9.5



