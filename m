Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0D89860E68
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 10:34:15 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so4962367eek.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 03:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=QqMYZ397fCitJemCFgwnw+T2ZcldOvHfoBptEq3U/oU=;
	b=p6qnSTyRbgE010SDEhTzprmaFRkrIg2MKqwbjlcUV6pn97Lpjfg07ZYcokNod7L/aY
	3o//3QTyN026nDhMM57VzAmCsif2cOec6g2uW8bH8aOJ5l+r6oOz7OSd58i15aocqhuz
	sXiSSLSKCmvBJF+4EQ/cGuJ9oFYRKNmWRtE5CQYKK6bRjDEEkIc7xLrsKDI8wEUWZiGE
	9GIdZLQwFFXSoBua8lf3GiDm/Lb/nZD72QSF9EpU7WFIWRyKENTB/H6Wk1fQQ6ZazLWH
	2sLzCAIKDrCvTN/SXjEeU2EvPNY+hMAO4stDX2FbW3cprPgOb/2MgxGU5WL1ZUUU6a1B
	LMcg==
X-Received: by 10.15.54.137 with SMTP id t9mr16903501eew.39.1396089256511;
	Sat, 29 Mar 2014 03:34:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g3sm17806484eet.35.2014.03.29.03.34.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Mar 2014 03:34:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Mar 2014 11:34:11 +0100
Message-Id: <17fe85f43f57db17bab56627854c195b8c038f1c.1396089115.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1396089115.git.Martin.Jansa@gmail.com>
References: <cover.1396089115.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1396089115.git.Martin.Jansa@gmail.com>
References: <cover.1396089115.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/4] sstate-cache-management: rm_by_stamps - remove .siginfo and .done files
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
X-List-Received-Date: Sat, 29 Mar 2014 10:34:16 -0000

* it's possible that corresponding .tgz files were already removed
  (e.g. with -d option and older version of this script) and this
  won't find orphaned .siginfo or .done files to remove
* add sort -u to count files found multiple times only once

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 34bde01..ffda05e 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -341,9 +341,9 @@ rm_by_stamps (){
   echo "Done"
 
   # Total number of files including sstate-, .siginfo and .done files
-  total_files=`find $cache_dir -name 'sstate*' | wc -l`
+  total_files=`find $cache_dir -type f -name 'sstate*' | wc -l`
   # Save all the state file list to a file
-  find $cache_dir -name 'sstate*.tgz' | sort -u -o $cache_list
+  find $cache_dir -type f -name 'sstate*' | sort -u -o $cache_list
 
   echo "Figuring out the files which will be removed ... "
   for i in $all_sums; do
@@ -355,14 +355,14 @@ rm_by_stamps (){
       sort -u $keep_list -o $keep_list
       to_del=`comm -1 -3 $keep_list $cache_list`
       gen_rmlist $rm_list "$to_del"
-      let total_deleted=`cat $rm_list | wc -w`
+      let total_deleted=`cat $rm_list | sort -u | wc -w`
       if [ $total_deleted -gt 0 ]; then
-          [ $debug -gt 0 ] && cat $rm_list
+          [ $debug -gt 0 ] && cat $rm_list | sort -u
           read_confirm
           if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
               echo "Removing sstate cache files ... ($total_deleted files)"
               # Remove them one by one to avoid the argument list too long error
-              for i in `cat $rm_list`; do
+              for i in `cat $rm_list | sort -u`; do
                   rm -f $verbose $i
               done
               echo "$total_deleted files have been removed"
-- 
1.9.1


