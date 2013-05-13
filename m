Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1Ubjzh-0008B6-LZ
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 06:04:14 +0200
Received: by mail-da0-f52.google.com with SMTP id o9so2073305dan.39
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 20:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=cPLMAhJutbDgIe9pxb1GHBmBipgzh7T3SgeUIRlF070=;
	b=mK471i68kODjlzeQNBvsEia+sqs69UM3o9+JjZpTx7j8Cvrk7ukNm6BPwaYKpIRWE5
	EXBN7zNrh98iKyIdHRfKG4ZBWx5ImsS8yGDrsv9Qy9xx9cUt8LB+UygI4xCRxpvNAgvE
	/0EcwVoZMqqIQDoLz6TPIDyZAc6M4FaizQuLrNhsbj3g4NAZopkw4TjRavTuMWyGtHS2
	yZZDJ7OAnltsyGPEKjD8BEg8TcmuY/cKa5vOLC5HddFK222ahCsgfI5zLmo0kR5aod+d
	xDL/2a6yexAy040yMgtk+aHem6E4PO/d9Np4uywHh4/25E6mADK6Jy1jeuWzigPjG1LX
	Baig==
X-Received: by 10.68.225.100 with SMTP id rj4mr27316753pbc.109.1368416763808; 
	Sun, 12 May 2013 20:46:03 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	xl10sm13051093pac.15.2013.05.12.20.46.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 20:46:02 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2013 13:58:41 +1000
Message-Id: <1368417521-9219-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] base-files: add /run to dirs755 for systemd
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
X-List-Received-Date: Mon, 13 May 2013 04:04:14 -0000

The /run directory needs to exist when using systemd otherwise startup
fails with the following error:
systemd[1]: Failed to mount /run: No such file or directory

This affects directdisk and vmdk images but images using an initrd do
not appear to be affected.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index a56450d..7713564 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -34,7 +34,7 @@ docdir_append = "/${P}"
 dirs1777 = "/tmp ${localstatedir}/volatile/lock ${localstatedir}/volatile/tmp"
 dirs2775 = "/home ${prefix}/src ${localstatedir}/local"
 dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
-           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /sbin \
+           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /run /sbin \
            ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \
            ${libdir} ${sbindir} ${datadir} \
            ${datadir}/common-licenses ${datadir}/dict ${infodir} \
-- 
1.8.2.3



