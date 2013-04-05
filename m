Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UO8zF-0003vp-My
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 17:55:35 +0200
Received: by mail-wi0-f172.google.com with SMTP id hr17so721122wib.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 08:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=Rzztj2zmBBNUcY/1Cfn8HZ0HidoWp2dtl30bsR5FZX0=;
	b=B4fSs2DKi5gpiuL3W4zwPDPhkiSXktb1tCDPLwIT98SWeKRolrb5Fm3PhPdzay1xs5
	GNoxH35HOCAVsXHcSdn45O3qbeTaVFSGNQD6a9oso9Wo9/RM9zm9ybJMlNmwIluU6TwR
	TKdoUUTMJ95mlWYJLmBInB9hrKk7O6KzXxfzFS00DZSFX4g0762he/GaeC2kUv+NoBWM
	fr/ac+EyKXUc0Xy+Fy8QNT4YO/niGWB9e8h0MWN/KjhKMzd2iMeQoJYvoOHn3wIsBJLB
	V/mFKc0WGPnLBzQJvf5i2isfEHdG54frx/FeEtoFwjXaGDferzn6IoAPNnvBUAd0UFuj
	MdgQ==
X-Received: by 10.194.87.229 with SMTP id bb5mr17461271wjb.32.1365176299443;
	Fri, 05 Apr 2013 08:38:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id g4sm4950796wib.11.2013.04.05.08.38.18
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 08:38:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 16:35:31 +0100
Message-Id: <1365176132-17102-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1365176132-17102-1-git-send-email-ross.burton@intel.com>
References: <1365176132-17102-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkiwhKlebOYZwI4VamnhtfXsOK/BeYdeYA0LaX0x6qEIRdHEb5buZ+Jkm81JGNcT9ZOhh9P
Subject: [PATCH 3/4] qemuimage-testlib: add function to fetch the remote syslog
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
X-List-Received-Date: Fri, 05 Apr 2013 15:55:35 -0000

Add a new function to scp from the target, and another to fetch
/var/log/messages and dump it to the console.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/qemuimage-testlib |   43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
index daa1ac0..051fee8 100755
--- a/scripts/qemuimage-testlib
+++ b/scripts/qemuimage-testlib
@@ -109,6 +109,40 @@ EOF`
 	return $ret
 }
 
+# function to copy files from target to host
+# $1 is the ip address of target
+# $2 is the files, which need to be copied into target
+# $3 is the path on target, where files are copied into
+Test_SCP_From()
+{
+	local ip_addr=$1
+	local src=$2
+	local des=$3
+	local time_out=60
+	local ret=0
+
+	# We use expect to interactive with target by ssh
+	local exp_cmd=`cat << EOF
+eval spawn scp -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no root@$ip_addr:"$src" "$des"
+set timeout $time_out
+expect {
+    "*assword:" { send "\r"; exp_continue}
+    "*(yes/no)?" { send "yes\r"; exp_continue }
+    eof          { exit [ lindex [wait] 3 ] }
+}
+EOF`
+
+	expect=`which expect`
+	if [ ! -x "$expect" ]; then
+		Test_Error "ERROR: Please install expect"
+		return 1
+	fi
+
+	expect -c "$exp_cmd"
+	ret=$?
+	return $ret
+}
+
 # function to run command in $ip_addr via ssh
 Test_SSH()
 {
@@ -709,3 +743,12 @@ Test_Toolchain()
 
 	return $ret
 }
+
+Test_Display_Syslog()
+{
+	local tmplog=`mktemp`
+        Test_SCP_From ${TARGET_IPADDR} /var/log/messages $tmplog
+        echo "System logs:"
+        cat $tmplog
+        rm -f $tmplog
+}
\ No newline at end of file
-- 
1.7.10.4



