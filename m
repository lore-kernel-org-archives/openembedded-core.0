Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UFfwU-0007id-Ho
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 08:17:51 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2D710l3027480
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 00:01:00 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 13 Mar 2013 00:01:00 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Mar 2013 15:01:33 +0800
Message-ID: <ab888a7abe849f3170d5386b577f8a92e8ff5385.1363156578.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363156578.git.Qi.Chen@windriver.com>
References: <cover.1363156578.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] rm_work.bbclass: inhibit rm_work per recipe
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
X-List-Received-Date: Wed, 13 Mar 2013 07:17:55 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Use RM_WORK_WHITELIST to inhibit rm_work per recipe. In this way,
one can use rm_work for the most of the recipes but still keep the
work area for the recipe(s) one is working on.

As an example, the following settings in local.conf will inhibit
rm_work for icu-native, icu and busybox.
    INHERIT += "rm_work"
    RM_WORK_WHITELIST += "icu-native icu busybox"

If we comment out the RM_WORK_WHITELIST line and do a rebuild, the
working area of these recipes will be cleaned up.

[YOCTO #3675]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/rm_work.bbclass |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index d3be0be..54287bf 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -5,6 +5,11 @@
 #
 # INHERIT += "rm_work"
 #
+# To inhibit rm_work for some recipes, specify them in RM_WORK_WHITELIST.
+# For example, in conf/local.conf:
+#
+# RM_WORK_WHITELIST += "icu-native icu busybox"
+#
 
 # Use the completion scheduler by default when rm_work is active
 # to try and reduce disk usage
@@ -14,6 +19,14 @@ RMWORK_ORIG_TASK := "${BB_DEFAULT_TASK}"
 BB_DEFAULT_TASK = "rm_work_all"
 
 do_rm_work () {
+    # If the recipe name is in the RM_WORK_WHITELIST, skip the recipe.
+    for p in ${RM_WORK_WHITELIST}; do
+        if [ "$p" = "${PN}" ]; then
+            bbnote "rm_work: Skipping ${PN} since it is in RM_WORK_WHITELIST"
+            exit 0
+        fi
+    done
+
     cd ${WORKDIR}
     for dir in *
     do
-- 
1.7.9.5



