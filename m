Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA836013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 06:27:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2K6Rn7f009806
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 23:27:49 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 19 Mar 2015 23:27:48 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Mar 2015 14:27:48 +0800
Message-ID: <90fb0fe5d4a4139729dbaf7ba39191bf8c9608a8.1426832653.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1426832653.git.Qi.Chen@windriver.com>
References: <cover.1426832653.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] populate-volatile.sh: detect the change of configuration files
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
X-List-Received-Date: Fri, 20 Mar 2015 06:27:49 -0000
Content-Type: text/plain

In case the configuration files are modified by user, the cached script,
/etc/volatile.cache should not be executed. Instead, the configuration
files should be parsed again and generate the new cache. Otherwise, the
user modifications take no effect which would obviously confuse users.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts/initscripts-1.0/populate-volatile.sh  | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 904037e..eaf0f1c 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -204,9 +204,25 @@ do
 done
 exec 9>&-
 
-if test -e ${ROOT_DIR}/etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" = "yes" -a "x$1" != "xupdate" -a "x$clearcache" = "x0"
+# Check whether configuration files have changed, if so, the cache needs to be removed
+# and generated again
+CACHE_MATCH="no"
+CACHE_DATA="${ROOT_DIR}/etc/.volatile.cache.data"
+CACHE_TMP="${ROOT_DIR}/etc/.volatile.cache.tmp"
+VOLATILE_CONFFILES="${ROOT_DIR}/etc/default/volatiles/*"
+if [ "$VOLATILE_ENABLE_CACHE" = "yes" ]; then
+	stat -c '%s %Y %n' $VOLATILE_CONFFILES | awk -F/ '{print $1 " " $NF;}' > $CACHE_TMP
+	if [ -e $CACHE_DATA ]; then
+		if cmp $CACHE_DATA $CACHE_TMP > /dev/null; then
+			CACHE_MATCH="yes"
+		fi
+	fi
+fi
+
+if test -e ${ROOT_DIR}/etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" = "yes" -a "x$1" != "xupdate" -a "x$clearcache" = "x0" -a "$CACHE_MATCH" = "yes"
 then
 	sh ${ROOT_DIR}/etc/volatile.cache
+	[ -e $CACHE_TMP ] && rm $CACHE_TMP
 else
 	rm -f ${ROOT_DIR}/etc/volatile.cache ${ROOT_DIR}/etc/volatile.cache.build
 	for file in `ls -1 "${CFGDIR}" | sort`; do
@@ -214,6 +230,7 @@ else
 	done
 
 	[ -e ${ROOT_DIR}/etc/volatile.cache.build ] && sync && mv ${ROOT_DIR}/etc/volatile.cache.build ${ROOT_DIR}/etc/volatile.cache
+	[ -e $CACHE_TMP ] && mv $CACHE_TMP $CACHE_DATA
 fi
 
 if [ -z "${ROOT_DIR}" ] && [ -f /etc/ld.so.cache ] && [ ! -f /var/run/ld.so.cache ]
-- 
1.9.1


