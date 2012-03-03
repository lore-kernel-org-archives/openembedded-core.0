Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S3t46-0000cJ-1Y
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 18:48:18 +0100
Received: by mail-yx0-f175.google.com with SMTP id m3so1171174yen.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2012 09:39:47 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.197.41 as permitted sender) client-ip=10.236.197.41; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.197.41 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.197.41])
	by 10.236.197.41 with SMTP id s29mr20319901yhn.7.1330796387830
	(num_hops = 1); Sat, 03 Mar 2012 09:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=cY7/BXJdVSnvj0/2QA/Aa3NiUNzYIEsEsC/p6Zrpyd0=;
	b=xn8y11eSuwa56Bp52M0HewVnrrmS9vapUzYZqm9Veokg17NP46wl5BvwSpKiE+MNRM
	m89+L0/iit24uZJu2ytDaHgCevqDliwIog42JLF26JeQRhdKIR7lSYNvzt/Ekp4X1D0K
	zx2OyHuM+hYhPBEIaHsVGsGsOqhxtfRo7cNGszMRIkUgQT6sye33Xg2JFdKPUk0U4ev7
	apfHIK765vWLMxZua2N1ld/l1/2uF7mUDKcX7fYjMPiLaBGKZetJT8yUwFvunznrj14c
	Tv+w+bfhupFCbdUhdWQcyDgkK1RJjTIKnNRke7tDbGTsG+J9eusJ3FwYjMGCZSAYkjMZ
	Ihyw==
Received: by 10.236.197.41 with SMTP id s29mr16123390yhn.7.1330796387785;
	Sat, 03 Mar 2012 09:39:47 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o11sm15284275anl.11.2012.03.03.09.39.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Mar 2012 09:39:47 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Mar 2012 17:39:33 +0000
Message-Id: <af77629ed96cb6c688540f19806558f6a8034771.1330796256.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330796256.git.otavio@ossystems.com.br>
References: <cover.1330796256.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1330796256.git.otavio@ossystems.com.br>
References: <cover.1330796256.git.otavio@ossystems.com.br>
Subject: [PATCH 3/4] rootfs_rpm.bbclass: rename postinst trigger script
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
X-List-Received-Date: Sat, 03 Mar 2012 17:48:18 -0000

Use 'run-postinsts' as trigger script name for consistency against
package managers.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/rootfs_rpm.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 48133f0..9039b21 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -112,7 +112,7 @@ EOF
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
 	# Stop $i getting expanded below...
 	i=\$i
-	cat > ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure << EOF
+	cat > ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << EOF
 #!/bin/sh
 for i in /etc/rpm-postinsts/*; do
 	echo "Running postinst $i..."
@@ -122,9 +122,9 @@ for i in /etc/rpm-postinsts/*; do
 		echo "ERROR: postinst $i failed."
 	fi
 done
-rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
+rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 EOF
-	chmod 0755 ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
+	chmod 0755 ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}
 	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
-- 
1.7.2.5



