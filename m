Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CB7537318E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 16:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBFGY7pX004338; Tue, 15 Dec 2015 16:34:07 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NImhGYRt5Gfs; Tue, 15 Dec 2015 16:34:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBFGY4BJ004316
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 15 Dec 2015 16:34:05 GMT
Message-ID: <1450197244.13505.69.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Dec 2015 16:34:04 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] coreutils/procps: Revert priority change since coreutils > busybox
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
X-List-Received-Date: Tue, 15 Dec 2015 16:34:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In 2ce514a394e1e062172bb097aa92a1792a0f8eaf, "coreutils: fix
ALTERNATIVE_PRIORITY conflict with procps and mktemp" the priority was
lowered from 100 to 30. Unfortunately this lowered coreutils past
busybox which means busybox was ending up in our SDK images. This isn't
what users expect.

1c0cfffee21e99a7356c9046c86628bc0acf654c raises the priority of mktemp
to 200, do the same for procps and make the system consistent.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/coreutils/coreutils_8.24.bb b/meta/recipes-core/coreutils/coreutils_8.24.bb
index b6ecc05..f042346 100644
--- a/meta/recipes-core/coreutils/coreutils_8.24.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.24.bb
@@ -91,7 +91,7 @@ do_install_append_class-native(){
 
 inherit update-alternatives
 
-ALTERNATIVE_PRIORITY = "30"
+ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base64 mktemp df"
 ALTERNATIVE_${PN}-doc = "base64.1 mktemp.1 df.1 lbracket.1 groups.1 kill.1 uptime.1 stat.1"
 
diff --git a/meta/recipes-extended/procps/procps_3.3.10.bb b/meta/recipes-extended/procps/procps_3.3.10.bb
index dcfaba7..e474f5b 100644
--- a/meta/recipes-extended/procps/procps_3.3.10.bb
+++ b/meta/recipes-extended/procps/procps_3.3.10.bb
@@ -49,7 +49,7 @@ bindir_progs = "free pkill pmap pgrep pwdx skill snice top uptime"
 base_bindir_progs += "kill pidof ps watch"
 base_sbindir_progs += "sysctl"
 
-ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_PRIORITY = "200"
 
 ALTERNATIVE_${PN} = "${bindir_progs} ${base_bindir_progs} ${base_sbindir_progs}"
 



