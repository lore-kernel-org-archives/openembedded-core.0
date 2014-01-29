Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 350FB6EAB9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 21:03:41 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d17so1184432eek.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 13:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ZbEZAr4ff2za99Wz27RMydCfdtMUYeEBuwQrmMnpxC4=;
	b=zaWFfkTHLznHtlPwUYwVqR4Su25DgDoMHS/oy0dssgZCxhpZ49IWOavkrn8MdqMRPW
	vNTxJf0UjZD//SwbNZB3QPCMrZFmMz5aFSRAkSEW0bp3AmejOhT28X8T7nLexKjvpmzf
	rNIZV+D2B9vyUxZ0KKGBKuF0x5lQYI+7H2uAxMtTu5BLSShDKOhvNi6YQPW3fkc6HPzz
	ytKervam/1CbB0KS5las4m9473a3sRrZwNAjHLeO2ajFGOCDaDXT2UtqC+NFe/hqnJjJ
	4OQ5eHoC18lBUOjxMAIafKK48oSR8Q0yzbijmySKmbbNjDT1e7WLK9pCz7E3XUI1G4tJ
	W3ig==
X-Received: by 10.14.95.134 with SMTP id p6mr201266eef.73.1391029421896;
	Wed, 29 Jan 2014 13:03:41 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 8sm13635706eeq.15.2014.01.29.13.03.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jan 2014 13:03:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 22:03:41 +0100
Message-Id: <9885fd30185d78e858c606bdcf7b959a74acb2c2.1391027849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391027849.git.Martin.Jansa@gmail.com>
References: <cover.1391027849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391027849.git.Martin.Jansa@gmail.com>
References: <cover.1391027849.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/5] sstate-cache-management.sh: Show total number of files when showing how many will be deleted
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
X-List-Received-Date: Wed, 29 Jan 2014 21:03:41 -0000

* it's good to see some the ratio of delted files until now it was
  showing only when all or none files were to be removed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 30ba8c6..035bb25 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -95,7 +95,7 @@ do_nothing () {
 
 # Read the input "y"
 read_confirm () {
-  echo -n "$total_deleted files will be removed! "
+  echo -n "$total_deleted from $total_files files will be removed! "
   if [ "$confirm" != "y" ]; then
       echo -n "Do you want to continue (y/n)? "
       while read confirm; do
@@ -186,6 +186,8 @@ remove_duplicated () {
           | sed -e 's/-/_/g' -e 's/ /\n/g' | sort -u)
   echo "Done"
 
+  # Total number of files including sstate-, sigdata and .done files
+  total_files=`find $cache_dir -name 'sstate*' | wc -l`
   # Save all the sstate files in a file
   sstate_list=`mktemp` || exit 1
   find $cache_dir -name 'sstate:*:*:*:*:*:*:*.tgz' >$sstate_list
@@ -212,6 +214,8 @@ remove_duplicated () {
   local remove_listdir=`mktemp -d` || exit 1
 
   for suffix in $sstate_suffixes; do
+      # Total number of files including sigdata and .done files
+      total_files_suffix=`grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix.*" $sstate_list | wc -l 2>/dev/null`
       # Save the file list to a file, some suffix's file may not exist
       grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:_]*_$suffix.tgz" $sstate_list >$list_suffix 2>/dev/null
       local deleted=0
@@ -258,7 +262,7 @@ remove_duplicated () {
       done
       [ ! -s "$rm_list" ] || deleted=`cat $rm_list | wc -l`
       [ -s "$rm_list" -a $debug -gt 0 ] && cat $rm_list
-      echo "($deleted files will be removed)"
+      echo "($deleted from $total_files_suffix files for $suffix suffix will be removed)"
       let total_deleted=$total_deleted+$deleted
   done
   deleted=0
@@ -319,6 +323,8 @@ rm_by_stamps (){
   done
   echo "Done"
 
+  # Total number of files including sstate-, sigdata and .done files
+  total_files=`find $cache_dir -name 'sstate*' | wc -l`
   # Save all the state file list to a file
   find $cache_dir -name 'sstate*.tgz' | sort -u -o $cache_list
 
-- 
1.8.5.3


