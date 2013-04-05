Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UO8zD-0003vj-9M
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 17:55:31 +0200
Received: by mail-wg0-f44.google.com with SMTP id z12so3843818wgg.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 08:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=Fv96uZRqjgTRAOx2GAkLeQnl+234nhH9kGW2osvQzDs=;
	b=cMourfml3xQwFdEsWAcRzbwrUS9KwTZg9qRpW+O5AA78tVzYjSXpJqn305fsgzooX/
	F5mlVqaAIs+mrSyLS2GRjq4VWbwFiC/zFo+NmTLwCqLtSPfEX2XtSQBiPLxUU+FlX34P
	bHV6gPx9zeIumsHbhJXcm3dtWEz2diFiod5kHSrpJzgwSqvnl+Dqj+6WOvq0Nfx7T+ji
	J/GwOpPRm3KfCoejfpTnugIhDeD3+S89Qx8SDytr9mHxndBEakCfy3pOz02l3GGTxbMM
	IA77G8g85uVm5Yu7SHQ8pIgC8uCGg+Wip4CaiM1cVCL2aSOfYs/+O6jMkXLVVNBg1E/d
	ht3A==
X-Received: by 10.194.93.68 with SMTP id cs4mr17608702wjb.17.1365176296780;
	Fri, 05 Apr 2013 08:38:16 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id g4sm4950796wib.11.2013.04.05.08.38.15
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 08:38:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 16:35:29 +0100
Message-Id: <1365176132-17102-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmhXhdK3JZdn5/U7MDBlypoxXtVhVBIZkIQXXSE0XePUlmsCFASfOC7CMvlbZwht81klH8q
Subject: [PATCH 1/4] qemuimage-testlib: silence some key warnings
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
X-List-Received-Date: Fri, 05 Apr 2013 15:55:31 -0000

Set StrictHostKeyChecking to no to silence the fingerprint warnings, and instead
of creating a temporary file for the known hosts and then deleting it just use
/dev/null.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/qemuimage-testlib |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
index 22e2d41..daa1ac0 100755
--- a/scripts/qemuimage-testlib
+++ b/scripts/qemuimage-testlib
@@ -84,13 +84,12 @@ Test_SCP()
 	local ip_addr=$1
 	local src=$2
 	local des=$3
-	local tmpfile=`mktemp`
 	local time_out=60
 	local ret=0
 
 	# We use expect to interactive with target by ssh
 	local exp_cmd=`cat << EOF
-eval spawn scp -o UserKnownHostsFile=$tmpfile "$src" root@$ip_addr:"$des"
+eval spawn scp -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no "$src" root@$ip_addr:"$des"
 set timeout $time_out
 expect {
     "*assword:" { send "\r"; exp_continue}
@@ -107,7 +106,6 @@ EOF`
 
 	expect -c "$exp_cmd"
 	ret=$?
-	rm -rf $tmpfile
 	return $ret
 }
 
@@ -117,11 +115,10 @@ Test_SSH()
 	local ip_addr=$1
 	shift
 	local command=$@
-	local tmpfile=`mktemp`
 	local time_out=60
 	local ret=0
 	local exp_cmd=`cat << EOF
-eval spawn ssh -o UserKnownHostsFile=$tmpfile root@$ip_addr "$command"
+eval spawn ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@$ip_addr "$command"
 set timeout $time_out
 expect {
     "*assword:" { send "\r"; exp_continue}
@@ -138,7 +135,6 @@ EOF`
 
 	expect -c "$exp_cmd"
 	ret=$?
-	rm -rf $tmpfile
 	return $ret
 }
 
-- 
1.7.10.4



