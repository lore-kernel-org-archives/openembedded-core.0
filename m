Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SvbCK-0007hE-Ue
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Jul 2012 23:38:49 +0200
Received: by pbbrq2 with SMTP id rq2so7606095pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 14:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZuUCJQPxgjtvdDAGAcue0L2ECXtXTyT3qTUJnAyjRbI=;
	b=BaXavPjVOzJPylwc6ggiYC+u1lWY5tJKmQX4no+TmftE1Qu1+MDyJ85+ZXM7UhVflG
	Tv2LjxTM0rkzN3dcGVIVjKkh2ClY0j/u9PI+pddaCcBGlHJe39HKaJBTtbN8c2liHn1s
	p+WmlJ58flpHtnI0fatQfG2AOP+vOBvYUSoNTT7A+6w8nn4aHonvJfhZRVam/dv5JDpy
	pAp4NXNXg2LTAk/PncvEDMC5Kaim2pbm7tL9V4w52qIz6VTTGWY7QXYCBZGmWzxREepp
	/FaxaLNuPNUCXQo6UDOJf1VVWt6FQ8+hIp90K9xiuJ4fEjFn5mHDhAMnzaSFufLH+Oj9
	zBkQ==
Received: by 10.68.219.162 with SMTP id pp2mr30093833pbc.85.1343597232812;
	Sun, 29 Jul 2012 14:27:12 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id sh3sm6455778pbc.16.2012.07.29.14.27.11
	(version=SSLv3 cipher=OTHER); Sun, 29 Jul 2012 14:27:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Jul 2012 14:27:05 -0700
Message-Id: <1343597225-9805-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] package_rpm.bbclass: Accomodate dash when using arrays
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Jul 2012 21:38:49 -0000

we were assigning local variable to an array coming through
positional arguments. local is a non posix contruct thats
also supported by dash luckily but operates differently in this
case it exapnds the array before assignment. so

local pkgs="$@"

turns into pkgs=locale-base-en-us locale-base-en-gb

ant we see errors

run.do_rootfs.25593: 932: local: locale-base-en-gb: bad variable name

So lets not use defining and assigning local in one go
first define a local and then the assignment

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/package_rpm.bbclass |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index b4bc52e..50e9b31 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -200,7 +200,12 @@ rpm_update_pkg () {
 process_pkg_list_rpm() {
 	local insttype=$1
 	shift
-	local pkgs="$@"
+	# $@ is special POSIX linear array can not be assigned
+	# to a local variable directly in dash since its separated by
+	# space and dash expands it before assignment
+	# and local x=1 2 3 and not x="1 2 3"
+	local pkgs
+	pkgs="$@"
 	local confbase=${INSTALL_CONFBASE_RPM}
 
 	echo -n > ${target_rootfs}/install/base_archs.pkglist
-- 
1.7.9.5



