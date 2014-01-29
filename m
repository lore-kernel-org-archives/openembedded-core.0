Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 644D86EAB9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 21:03:40 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id b57so1178599eek.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 13:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=QMCy8TeZF4IVuq+lJiqwXL9FDjwX3oWcWBqXKn+qoU4=;
	b=ptoe7tz2akjtNqPACaFTldIs00VfEmHEhVaQKqffUmycT0HPj4v0qcS5pc8Ah99BEk
	I/IC+rtk0XrWmZvn7D9YaUTE4zOQtMxzbu7uOab5x9gS7NjZ6JWAO2lu2xlFRWhwSicO
	ZDRiiXx2WHPSJd2eSm/1HeP7UsHBbBokObrqWLcvrc+2+fCGxqyQZycLc4wAjfvKOn73
	x3yp+EGKxDIgmUUJzrUEcY/V5s8e+kveSWEUJA4JbGlq6oeroFre85L1PsatMA1zMtLb
	HQYoohaLhbYt0k1EGfzpfOgI0riWmW77qOd8IP76gSjnNWOW9QmTDutefhCKASqr0A0u
	vChw==
X-Received: by 10.14.22.5 with SMTP id s5mr155442ees.85.1391029420897;
	Wed, 29 Jan 2014 13:03:40 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m9sm359831eeh.3.2014.01.29.13.03.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jan 2014 13:03:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 22:03:40 +0100
Message-Id: <6743a468ee4ec24dcbfad743aed12bafeb111b3e.1391027849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391027849.git.Martin.Jansa@gmail.com>
References: <cover.1391027849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391027849.git.Martin.Jansa@gmail.com>
References: <cover.1391027849.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/5] sstate-cache-management.sh: Fix rm_by_stamps() to work after SSTATE_SWSPEC change
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

* format of filenames for sstate archives was changed in:
  commit 6f823a23c5f1d0ffa0a27db1c1bc1907de788505
  Author: Richard Purdie <richard.purdie@linuxfoundation.org>
  Date:   Fri Dec 20 12:06:02 2013 +0000
  Subject: sstate: Convert to use ':' as a filename sperator and use SSTATE_SWSPEC globally
* this one doesn't need special care for old sstate- names
  they will be removed automatically as they don't match with
  any checksum in rigth format from stamps directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 21ca470..30ba8c6 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -320,11 +320,11 @@ rm_by_stamps (){
   echo "Done"
 
   # Save all the state file list to a file
-  find $cache_dir -name 'sstate-*.tgz' | sort -u -o $cache_list
+  find $cache_dir -name 'sstate*.tgz' | sort -u -o $cache_list
 
   echo -n "Figuring out the files which will be removed ... "
   for i in $all_sums; do
-      grep ".*-${i}_.*" $cache_list >>$keep_list
+      grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:${i}_.*" $cache_list >>$keep_list
   done
   echo "Done"
 
@@ -332,7 +332,7 @@ rm_by_stamps (){
       sort -u $keep_list -o $keep_list
       to_del=`comm -1 -3 $keep_list $cache_list`
       gen_rmlist $rm_list "$to_del"
-      let total_deleted=(`cat $rm_list | wc -w`)
+      let total_deleted=`cat $rm_list | wc -w`
       if [ $total_deleted -gt 0 ]; then
           [ $debug -gt 0 ] && cat $rm_list
           read_confirm
-- 
1.8.5.3


