Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TKCjh-0005PN-Rw
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 20:34:59 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so2003609pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2012 11:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=WQIRHClHdHawOSjazQu613Wx7ctzEWJmpBfjzsGrvRI=;
	b=F5eDJDU94ZgPdKgSOBtaNb0z/IwL1XEJAdNshTC0s/xvPnskU9sWsqy9QDX7Wwy+Em
	/RAaMFUF4pgczZWBYm37r+MuQzmN3hTH7gbe3OmRaUTnvAnc7ICOKTgVItKWcRwWzfT5
	6VrRxqGyPqxGNlb6r1Z8hMnzBIjT+aSlH7K/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=WQIRHClHdHawOSjazQu613Wx7ctzEWJmpBfjzsGrvRI=;
	b=A8NJxCx8Il1fdwn9V4sMIFsochoX7u8VqfmBHByLLjPsSlYYlYmWDqqwZHXXHnI9Zv
	3GdYYIVGHJPEzXTG/EuuN3EGmkjL5aqFhtsKJ4XmgVP/U8YFlhDBQPHJf2bzy1MUGR3z
	Yho7v457OVBYQ+uiXQHorCWLzbspdrbYD6LZ/iVeO2pj5SucWC8thCQBs+yvsBtUyC6N
	efMgQ3XM+GP8zqWS8d3x4ZgeWAU6qNmZ01kXxJzpGIbB/sNkxTN1axaG/SSRcR6I+4kJ
	TS7OhvKdX4firedUOhpGGHIOKwiQzJ2PcXeOg1OOnGKSlaLri9yYnoLNLWxL4WV6OBt+
	q3WQ==
Received: by 10.68.135.196 with SMTP id pu4mr33047109pbb.11.1349461314491;
	Fri, 05 Oct 2012 11:21:54 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id n7sm3407359pav.26.2012.10.05.11.21.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 11:21:53 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2012 11:21:51 -0700
Message-Id: <1349461311-18446-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQk1/hZbkbxFLfBJsNPZC1KOkQZWcGmVHmcH0Lg7Vm1ZkxVG+0JIUwDa6jISZwoNwJV+9FxA
Subject: [PATCH] package_rpm.bbclass: Fix an issue where complementary installs fail
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
X-List-Received-Date: Fri, 05 Oct 2012 18:34:59 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Also ensure that we always cleanup the temporary install manifest files,
some of them will cause problems if they exist in multiple install
attempts.

Finally verify that the lists remain uniquely sorted otherwise the
complementary install may install the same files numerous times,
triggering a failure.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/package_rpm.bbclass |   14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index c491775..1ff92ce 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -324,11 +324,15 @@ package_install_internal_rpm () {
 				rm -f $m
 			fi
 		done
+		sort -u ${target_rootfs}/install/original_solution.manifest -o ${target_rootfs}/install/original_solution.manifest.new
+		mv ${target_rootfs}/install/original_solution.manifest.new ${target_rootfs}/install/original_solution.manifest
 	fi
 
 	# Setup manifest of packages to install...
 	mkdir -p ${target_rootfs}/install
 	rm -f ${target_rootfs}/install/install.manifest
+	rm -f ${target_rootfs}/install/install_multilib.manifest
+	rm -f ${target_rootfs}/install/install_attemptonly.manifest
 
 	# Uclibc builds don't provide this stuff...
 	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
@@ -428,7 +432,7 @@ package_install_internal_rpm () {
 	fi
 
 	# Now that we have a solution, pull out a list of what to install...
-	echo "Manifest: ${target_rootfs}/install/install.manifest"
+	echo "Manifest: ${target_rootfs}/install/install_solution.manifest"
 	${RPM} -D "_dbpath ${target_rootfs}/install" -qa --qf "%{packageorigin}\n" \
 		--root "${target_rootfs}/install" \
 		-D "__dbi_txn create nofsync private" \
@@ -459,8 +463,8 @@ package_install_internal_rpm () {
 
 	fi
 
-	cat ${target_rootfs}/install/install_solution.manifest > ${target_rootfs}/install/total_solution.manifest
-	cat ${target_rootfs}/install/install_multilib_solution.manifest >> ${target_rootfs}/install/total_solution.manifest
+	cat ${target_rootfs}/install/install_solution.manifest \
+	    ${target_rootfs}/install/install_multilib_solution.manifest | sort -u > ${target_rootfs}/install/total_solution.manifest
 
 	# Construct install scriptlet wrapper
 	cat << EOF > ${WORKDIR}/scriptlet_wrapper
@@ -521,8 +525,8 @@ EOF
 	if [ "${INSTALL_COMPLEMENTARY_RPM}" = "1" ] ; then
 		# Only install packages not already installed (dependency calculation will
 		# almost certainly have added some that have been)
-		sort ${target_rootfs}/install/original_solution.manifest > ${target_rootfs}/install/original_solution_sorted.manifest
-		sort ${target_rootfs}/install/total_solution.manifest > ${target_rootfs}/install/total_solution_sorted.manifest
+		sort -u ${target_rootfs}/install/original_solution.manifest > ${target_rootfs}/install/original_solution_sorted.manifest
+		sort -u ${target_rootfs}/install/total_solution.manifest > ${target_rootfs}/install/total_solution_sorted.manifest
 		comm -2 -3 ${target_rootfs}/install/total_solution_sorted.manifest \
 			${target_rootfs}/install/original_solution_sorted.manifest > \
 			${target_rootfs}/install/diff.manifest
-- 
1.7.9.5



